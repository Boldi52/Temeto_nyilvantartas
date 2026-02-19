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
        <div className="admin-document">
            <h1 className="admin-title">Dokumentumok kezelése</h1>
            <p className="admin-text">Sírbérlőkhöz tartozó dokumentumok feltöltése és kezelése</p>

            <div className="document-container">
                {/* FORM SECTION */}
                <div className="document-form-section">
                    <h2 className="section-title">
                        {form.id ? "Dokumentum szerkesztése" : "Új dokumentum"}
                    </h2>

                    {error && <div className="alert alert-error">{error}</div>}

                    <form onSubmit={handleSubmit} className="document-form">
                        <div className="form-group">
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
                                <div className="field-error">{fieldErrors.nev}</div>
                            )}
                        </div>

                        <div className="form-group">
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
                                <div className="field-error">{fieldErrors.sirberlo_id}</div>
                            )}
                        </div>

                        <div className="form-group">
                            <label htmlFor="file">Fájl feltöltése *</label>
                            <div className="file-input-wrapper">
                                <input
                                    id="file"
                                    type="file"
                                    name="file"
                                    onChange={handleFileChange}
                                    accept=".pdf,.doc,.docx,.jpg,.jpeg,.png,.xlsx,.xls"
                                    className={fieldErrors.fajl_tipo ? "error" : ""}
                                />
                                <span className="file-label">
                                    {file ? file.name : "Fájl kiválasztása..."}
                                </span>
                            </div>
                            {fieldErrors.fajl_tipo && (
                                <div className="field-error">{fieldErrors.fajl_tipo}</div>
                            )}
                        </div>

                        <div className="form-group">
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

                        <div className="form-group">
                            <label htmlFor="feltoltve">Feltöltés dátuma</label>
                            <input
                                id="feltoltve"
                                type="date"
                                name="feltoltve"
                                value={form.feltoltve}
                                onChange={handleChange}
                            />
                        </div>

                        <div className="button-group">
                            <button type="submit" className="btn btn-primary" disabled={saving}>
                                {saving
                                    ? "Mentés..."
                                    : form.id
                                        ? "Dokumentum frissítése"
                                        : "Dokumentum hozzáadása"}
                            </button>
                            <button
                                type="button"
                                className="btn btn-secondary"
                                onClick={handleClear}
                                disabled={saving}
                            >
                                Törlés
                            </button>
                        </div>
                    </form>
                </div>

                {/* LIST SECTION */}
                <div className="document-list-section">
                    <h2 className="section-title">Dokumentumok ({filteredDocuments.length})</h2>

                    <div className="filter-bar">
                        <input
                            type="text"
                            placeholder="Keresés név vagy sírbérlő alapján..."
                            value={searchTerm}
                            onChange={(e) => setSearchTerm(e.target.value)}
                            className="search-input"
                        />
                        <select
                            value={filterType}
                            onChange={(e) => setFilterType(e.target.value)}
                            className="filter-select"
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
                        <div className="loading">Betöltés...</div>
                    ) : filteredDocuments.length === 0 ? (
                        <div className="no-data">Nincsenek dokumentumok.</div>
                    ) : (
                        <div className="documents-grid">
                            {filteredDocuments.map((doc) => (
                                <div key={doc.id} className="document-card">
                                    <div className="card-header">
                                        <h3 className="card-title">{doc.nev}</h3>
                                        <span className="card-type">{doc.fajl_tipo}</span>
                                    </div>
                                    <div className="card-body">
                                        <p className="card-tenant">
                                            <strong>Sírbérlő:</strong> {getTenantName(doc.sirberlo_id)}
                                        </p>
                                        {doc.leiras && (
                                            <p className="card-description">{doc.leiras}</p>
                                        )}
                                        <p className="card-date">
                                            <strong>Feltöltve:</strong> {doc.feltoltve}
                                        </p>
                                    </div>
                                    <div className="card-actions">
                                        <button
                                            onClick={() => handleEdit(doc)}
                                            className="btn btn-sm btn-edit"
                                        >
                                            Szerkesztés
                                        </button>
                                        <button
                                            onClick={() => handleDelete(doc.id)}
                                            className="btn btn-sm btn-delete"
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