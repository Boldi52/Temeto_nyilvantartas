import React, { useEffect, useState } from "react";
import "../../CSS-ek/AdminDocument.css";

const API_BASE = "http://localhost:8000";

export default function AdminDocument() {
    const emptyForm = {
        id: null,
        nev: "",
        fajl_tipo: "",
        leiras: "",
        sirberlo_id: "",
        feltoltve: new Date().toISOString().split('T')[0],
    };

    const [documents, setDocuments] = useState([]);
    const [tenants, setTenants] = useState([]);
    const [form, setForm] = useState(emptyForm);
    const [loading, setLoading] = useState(false);
    const [saving, setSaving] = useState(false);
    const [error, setError] = useState("");
    const [fieldErrors, setFieldErrors] = useState({});
    const [filterType, setFilterType] = useState("all");
    const [searchTerm, setSearchTerm] = useState("");
    const [file, setFile] = useState(null);

    const loadData = async () => {
        setLoading(true);
        setError("");
        try {
            const [docRes, tenRes] = await Promise.all([
                fetch(`${API_BASE}/api/dokumentumok`),
                fetch(`${API_BASE}/api/sirberlok`),
            ]);

            if (!docRes.ok) throw new Error("Dokumentumok betöltése sikertelen");
            if (!tenRes.ok) throw new Error("Sírbérlők betöltése sikertelen");

            const [docData, tenData] = await Promise.all([
                docRes.json(),
                tenRes.json(),
            ]);

            setDocuments(docData);
            setTenants(tenData);
        } catch (err) {
            setError(err.message || "Ismeretlen hiba történt.");
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        loadData();
    }, []);

    const handleChange = (e) => {
        const { name, value } = e.target;
        setForm((f) => ({ ...f, [name]: value }));
    };

    const handleFileChange = (e) => {
        const selectedFile = e.target.files[0];
        if (selectedFile) {
            setFile(selectedFile);
            setForm((f) => ({ ...f, fajl_tipo: selectedFile.type }));
        }
    };

    const handleEdit = (item) => {
        setForm({
            id: item.id,
            nev: item.nev ?? "",
            fajl_tipo: item.fajl_tipo ?? "",
            leiras: item.leiras ?? "",
            sirberlo_id: item.sirberlo_id ?? "",
            feltoltve: item.feltoltve ?? "",
        });
        setFile(null);
        setFieldErrors({});
        setError("");
    };

    const handleDelete = async (id) => {
        if (!window.confirm("Biztosan törlöd ezt a dokumentumot?")) return;
        setSaving(true);
        setError("");
        try {
            const res = await fetch(`${API_BASE}/api/dokumentumok/${id}`, {
                method: "DELETE",
            });
            if (!res.ok) {
                const body = await res.json().catch(() => ({}));
                throw new Error(body.message || "Törlés sikertelen.");
            }
            await loadData();
            setForm(emptyForm);
            setFile(null);
        } catch (err) {
            setError(err.message || "Ismeretlen hiba történt.");
        } finally {
            setSaving(false);
        }
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setSaving(true);
        setError("");
        setFieldErrors({});

        // Validáció
        const errors = {};
        if (!form.nev.trim()) errors.nev = "A dokumentum neve kötelező";
        if (!form.fajl_tipo && !file) errors.fajl_tipo = "A fájltípus vagy fájl kötelező";
        if (!form.sirberlo_id) errors.sirberlo_id = "A sírbérlő kiválasztása kötelező";

        if (Object.keys(errors).length > 0) {
            setFieldErrors(errors);
            setSaving(false);
            return;
        }

        try {
            const method = form.id ? "PUT" : "POST";
            const url = form.id
                ? `${API_BASE}/api/dokumentumok/${form.id}`
                : `${API_BASE}/api/dokumentumok`;

            const formData = new FormData();
            formData.append("nev", form.nev);
            formData.append("leiras", form.leiras);
            formData.append("sirberlo_id", form.sirberlo_id);
            formData.append("feltoltve", form.feltoltve);
            if (file) formData.append("file", file);

            const res = await fetch(url, {
                method,
                body: formData,
            });

            if (!res.ok) {
                const body = await res.json().catch(() => ({}));
                throw new Error(body.message || "Mentés sikertelen.");
            }

            await loadData();
            setForm(emptyForm);
            setFile(null);
        } catch (err) {
            setError(err.message || "Ismeretlen hiba történt.");
        } finally {
            setSaving(false);
        }
    };

    const handleClear = () => {
        setForm(emptyForm);
        setFile(null);
        setFieldErrors({});
        setError("");
    };

    const getTenantName = (tenantId) => {
        const tenant = tenants.find((t) => t.id === parseInt(tenantId));
        return tenant ? tenant.nev : "Ismeretlen";
    };

    const filteredDocuments = documents.filter((doc) => {
        const matchesType = filterType === "all" || doc.fajl_tipo === filterType;
        const matchesSearch =
            doc.nev.toLowerCase().includes(searchTerm.toLowerCase()) ||
            getTenantName(doc.sirberlo_id)
                .toLowerCase()
                .includes(searchTerm.toLowerCase());
        return matchesType && matchesSearch;
    });

    const documentTypes = [...new Set(documents.map((d) => d.fajl_tipo))];

    return (
        <div className="admin-document-page">
            <h1 className="admin-document-title">Dokumentumok kezelése</h1>
            <p className="admin-document-subtitle">Sírbérlőkhöz tartozó dokumentumok feltöltése és kezelése</p>

            <div className="admin-document-container">
                {/* FORM SECTION */}
                <div className="admin-document-form-section">
                    <h2 className="admin-document-section-title">
                        {form.id ? "Dokumentum szerkesztése" : "Új dokumentum"}
                    </h2>

                    {error && <div className="admin-document-alert admin-document-alert--error">{error}</div>}

                    <form onSubmit={handleSubmit} className="admin-document-form">
                        <div className="admin-document-form-group">
                            <label htmlFor="nev">Dokumentum neve *</label>
                            <input
                                id="nev"
                                type="text"
                                name="nev"
                                placeholder="pl. Halotti levél"
                                value={form.nev}
                                onChange={handleChange}
                                className={fieldErrors.nev ? "error" : ""}
                            />
                            {fieldErrors.nev && (
                                <div className="admin-document-field-error">{fieldErrors.nev}</div>
                            )}
                        </div>

                        <div className="admin-document-form-group">
                            <label htmlFor="sirberlo_id">Sírbérlő *</label>
                            <select
                                id="sirberlo_id"
                                name="sirberlo_id"
                                value={form.sirberlo_id}
                                onChange={handleChange}
                                className={fieldErrors.sirberlo_id ? "error" : ""}
                            >
                                <option value="">-- Válassz sírbérlőt --</option>
                                {tenants.map((tenant) => (
                                    <option key={tenant.id} value={tenant.id}>
                                        {tenant.nev}
                                    </option>
                                ))}
                            </select>
                            {fieldErrors.sirberlo_id && (
                                <div className="admin-document-field-error">{fieldErrors.sirberlo_id}</div>
                            )}
                        </div>

                        <div className="admin-document-form-group">
                            <label htmlFor="file">Fájl feltöltése *</label>
                            <div className="admin-document-file-wrapper">
                                <input
                                    id="file"
                                    type="file"
                                    name="file"
                                    onChange={handleFileChange}
                                    accept=".pdf,.doc,.docx,.jpg,.jpeg,.png,.xlsx,.xls"
                                    className={fieldErrors.fajl_tipo ? "error" : ""}
                                />
                                <span className="admin-document-file-label">
                                    {file ? file.name : "Fájl kiválasztása..."}
                                </span>
                            </div>
                            {fieldErrors.fajl_tipo && (
                                <div className="admin-document-field-error">{fieldErrors.fajl_tipo}</div>
                            )}
                        </div>

                        <div className="admin-document-form-group">
                            <label htmlFor="leiras">Leírás</label>
                            <textarea
                                id="leiras"
                                name="leiras"
                                placeholder="Dokumentum leírása..."
                                value={form.leiras}
                                onChange={handleChange}
                                rows="3"
                            />
                        </div>

                        <div className="admin-document-form-group">
                            <label htmlFor="feltoltve">Feltöltés dátuma</label>
                            <input
                                id="feltoltve"
                                type="date"
                                name="feltoltve"
                                value={form.feltoltve}
                                onChange={handleChange}
                            />
                        </div>

                        <div className="admin-document-button-group">
                            <button type="submit" className="admin-document-btn admin-document-btn--primary" disabled={saving}>
                                {saving
                                    ? "Mentés..."
                                    : form.id
                                        ? "Dokumentum frissítése"
                                        : "Dokumentum hozzáadása"}
                            </button>
                            <button
                                type="button"
                                className="admin-document-btn admin-document-btn--secondary"
                                onClick={handleClear}
                                disabled={saving}
                            >
                                Törlés
                            </button>
                        </div>
                    </form>
                </div>

                {/* LIST SECTION */}
                <div className="admin-document-list-section">
                    <h2 className="admin-document-section-title">Dokumentumok ({filteredDocuments.length})</h2>

                    <div className="admin-document-filter-bar">
                        <input
                            type="text"
                            placeholder="Keresés név vagy sírbérlő alapján..."
                            value={searchTerm}
                            onChange={(e) => setSearchTerm(e.target.value)}
                            className="admin-document-search-input"
                        />
                        <select
                            value={filterType}
                            onChange={(e) => setFilterType(e.target.value)}
                            className="admin-document-filter-select"
                        >
                            <option value="all">Összes típus</option>
                            {documentTypes.map((type) => (
                                <option key={type} value={type}>
                                    {type}
                                </option>
                            ))}
                        </select>
                    </div>

                    {loading ? (
                        <div className="admin-document-loading">Betöltés...</div>
                    ) : filteredDocuments.length === 0 ? (
                        <div className="admin-document-no-data">Nincsenek dokumentumok.</div>
                    ) : (
                        <div className="admin-document-grid">
                            {filteredDocuments.map((doc) => (
                                <div key={doc.id} className="admin-document-card">
                                    <div className="admin-document-card-header">
                                        <h3 className="admin-document-card-title">{doc.nev}</h3>
                                        <span className="admin-document-card-type">{doc.fajl_tipo}</span>
                                    </div>
                                    <div className="admin-document-card-body">
                                        <p className="admin-document-card-tenant">
                                            <strong>Sírbérlő:</strong> {getTenantName(doc.sirberlo_id)}
                                        </p>
                                        {doc.leiras && (
                                            <p className="admin-document-card-description">{doc.leiras}</p>
                                        )}
                                        <p className="admin-document-card-date">
                                            <strong>Feltöltve:</strong> {doc.feltoltve}
                                        </p>
                                    </div>
                                    <div className="admin-document-card-actions">
                                        <button
                                            onClick={() => handleEdit(doc)}
                                            className="admin-document-btn admin-document-btn--small admin-document-btn--edit"
                                        >
                                            Szerkesztés
                                        </button>
                                        <button
                                            onClick={() => handleDelete(doc.id)}
                                            className="admin-document-btn admin-document-btn--small admin-document-btn--delete"
                                            disabled={saving}
                                        >
                                            Törlés
                                        </button>
                                    </div>
                                </div>
                            ))}
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}