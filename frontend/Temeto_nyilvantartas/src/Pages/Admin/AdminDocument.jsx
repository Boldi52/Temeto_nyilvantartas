import React, { useEffect, useMemo, useRef, useState } from "react";
import "../../CSS-ek/AdminDocument.css";
import AdminBackLink from "../../AdminBackLink";
import { apiFetch, API_BASE } from "../../api";

export default function AdminDocument() {
    const emptyForm = useMemo(
        () => ({
            id: null,
            nev: "",
            fajl_tipo: "",
            leiras: "",
            sirberlo_id: "",
            dokumentum_tipus_id: "",
            feltoltve: new Date().toISOString().split("T")[0],
        }),
        []
    );

    const [documents, setDocuments] = useState([]);
    const [tenants, setTenants] = useState([]);
    const [dokumentumTipusok, setDokumentumTipusok] = useState([]);
    const [form, setForm] = useState(emptyForm);
    const [loading, setLoading] = useState(true);
    const [saving, setSaving] = useState(false);
    const [error, setError] = useState("");
    const [fieldErrors, setFieldErrors] = useState({});
    const [filterType, setFilterType] = useState("all");
    const [searchTerm, setSearchTerm] = useState("");
    const [file, setFile] = useState(null);

    const fileInputRef = useRef(null);

    const openFilePicker = () => {
        fileInputRef.current?.click();
    };

    const getDokTipusLabel = (tipus) =>
        tipus?.tipus_elnevezese || `Típus #${tipus?.id ?? "?"}`;

    const getDokTipusNameById = (tipusId) => {
        const parsed = parseInt(tipusId, 10);
        const tipus = dokumentumTipusok.find((t) => t.id === parsed);
        return tipus ? getDokTipusLabel(tipus) : "";
    };

    const loadData = async () => {
        setLoading(true);
        setError("");

        try {
            const [docData, tenData, tipusData] = await Promise.all([
                apiFetch("/api/dokumentumok"),
                apiFetch("/api/sirberlok"),
                apiFetch("/api/dokumentumtipusok"),
            ]);

            setDocuments(Array.isArray(docData) ? docData : []);
            setTenants(Array.isArray(tenData) ? tenData : []);
            setDokumentumTipusok(Array.isArray(tipusData) ? tipusData : []);
        } catch (err) {
            setError(err?.message || "Ismeretlen hiba történt.");
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        loadData();
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, []);

    const handleChange = (e) => {
        const { name, value } = e.target;
        setForm((f) => ({ ...f, [name]: value }));

        if (fieldErrors[name]) {
            setFieldErrors((prev) => {
                const copy = { ...prev };
                delete copy[name];
                return copy;
            });
        }
    };

    const handleFileChange = (e) => {
        const selectedFile = e.target.files?.[0];
        if (selectedFile) {
            setFile(selectedFile);
            setForm((f) => ({ ...f, fajl_tipo: selectedFile.type }));

            if (fieldErrors.fajl_tipo) {
                setFieldErrors((prev) => {
                    const copy = { ...prev };
                    delete copy.fajl_tipo;
                    return copy;
                });
            }
        } else {
            setFile(null);
        }
    };

    const handleEdit = (item) => {
        setForm({
            id: item.id,
            nev: item.nev ?? item.tipus ?? "",
            fajl_tipo: item.fajl_tipo ?? item.mime_type ?? "",
            leiras: item.leiras ?? "",
            sirberlo_id: item.sirberlo_id ? String(item.sirberlo_id) : "",
            dokumentum_tipus_id: item.dokumentum_tipus_id
                ? String(item.dokumentum_tipus_id)
                : "",
            feltoltve: item.feltoltve ?? item.datum ?? "",
        });

        setFile(null);
        setFieldErrors({});
        setError("");
        if (fileInputRef.current) fileInputRef.current.value = "";
        window.scrollTo({ top: 0, behavior: "smooth" });
    };

    const handleDelete = async (id) => {
        if (!window.confirm("Biztosan törlöd ezt a dokumentumot?")) return;

        setSaving(true);
        setError("");

        try {
            const token = localStorage.getItem("token");

            const res = await fetch(`${API_BASE}/api/dokumentumok/${id}`, {
                method: "DELETE",
                headers: token ? { Authorization: `Bearer ${token}` } : {},
            });

            if (res.status === 401) {
                localStorage.removeItem("token");
                throw new Error("Nincs jogosultság vagy lejárt token (401)");
            }

            if (!res.ok) {
                const body = await res.json().catch(() => ({}));
                throw new Error(body.message || "Törlés sikertelen.");
            }

            await loadData();
            if (form.id === id) {
                setForm(emptyForm);
                setFile(null);
                if (fileInputRef.current) fileInputRef.current.value = "";
            }
        } catch (err) {
            setError(err?.message || "Ismeretlen hiba történt.");
        } finally {
            setSaving(false);
        }
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setSaving(true);
        setError("");
        setFieldErrors({});

        const errors = {};
        if (!form.nev.trim()) errors.nev = "A dokumentum neve kötelező.";
        if (!form.sirberlo_id) errors.sirberlo_id = "A sírbérlő kiválasztása kötelező.";
        if (!form.dokumentum_tipus_id)
            errors.dokumentum_tipus_id = "A dokumentum típusa kötelező.";
        if (!form.id && !file) errors.fajl_tipo = "Új dokumentumnál a fájl kötelező.";

        if (Object.keys(errors).length > 0) {
            setFieldErrors(errors);
            setSaving(false);
            return;
        }

        try {
            const isEdit = !!form.id;
            const url = isEdit
                ? `${API_BASE}/api/dokumentumok/${form.id}`
                : `${API_BASE}/api/dokumentumok`;

            const formData = new FormData();

            formData.append("tipus", form.nev);
            formData.append("dokumentum_tipus_id", form.dokumentum_tipus_id);
            formData.append("datum", form.feltoltve || "");
            formData.append("leiras", form.leiras || "");
            formData.append("sirberlo_id", form.sirberlo_id);

            if (file) formData.append("file", file);
            if (isEdit) formData.append("_method", "PUT");

            const token = localStorage.getItem("token");

            const res = await fetch(url, {
                method: "POST",
                headers: {
                    ...(token ? { Authorization: `Bearer ${token}` } : {}),
                    Accept: "application/json",
                },
                body: formData,
            });

            const body = await res.json().catch(() => ({}));

            if (res.status === 401) {
                localStorage.removeItem("token");
                throw new Error("Nincs jogosultság vagy lejárt token (401)");
            }

            if (!res.ok) {
                if (res.status === 422 && body?.errors) {
                    const mapped = {};

                    if (body.errors.tipus) mapped.nev = body.errors.tipus[0];
                    if (body.errors.sirberlo_id) mapped.sirberlo_id = body.errors.sirberlo_id[0];
                    if (body.errors.dokumentum_tipus_id) {
                        mapped.dokumentum_tipus_id = body.errors.dokumentum_tipus_id[0];
                    }
                    if (body.errors.file) mapped.fajl_tipo = body.errors.file[0];
                    if (body.errors.datum) mapped.feltoltve = body.errors.datum[0];
                    if (body.errors.leiras) mapped.leiras = body.errors.leiras[0];

                    setFieldErrors(mapped);
                }

                throw new Error(body.message || "Mentés sikertelen.");
            }

            await loadData();
            setForm(emptyForm);
            setFile(null);
            setFieldErrors({});
            setError("");
            if (fileInputRef.current) fileInputRef.current.value = "";
        } catch (err) {
            setError(err?.message || "Ismeretlen hiba történt.");
        } finally {
            setSaving(false);
        }
    };

    const handleClear = () => {
        setForm(emptyForm);
        setFile(null);
        setFieldErrors({});
        setError("");
        if (fileInputRef.current) fileInputRef.current.value = "";
    };

    const getTenantName = (tenantId) => {
        const parsed = parseInt(tenantId, 10);
        const tenant = tenants.find((t) => t.id === parsed);
        return tenant ? tenant.nev : "Ismeretlen";
    };

    const formatDate = (value) => {
        if (!value) return "—";
        const d = new Date(value);
        if (Number.isNaN(d.getTime())) return String(value);
        return d.toLocaleDateString("hu-HU");
    };

    // LIMIT: maximum 3 dokumentum jelenjen meg a listában
    const filteredDocuments = documents
        .filter((doc) => {
            const typeValue = getDokTipusNameById(doc.dokumentum_tipus_id) || doc.tipus || "";
            const nameValue = doc.nev ?? doc.tipus ?? "";

            const matchesType = filterType === "all" || typeValue === filterType;
            const matchesSearch =
                String(nameValue).toLowerCase().includes(searchTerm.toLowerCase()) ||
                getTenantName(doc.sirberlo_id).toLowerCase().includes(searchTerm.toLowerCase());

            return matchesType && matchesSearch;
        })
        .slice(0, 3);

    const documentTypes = [
        ...new Set(
            documents
                .map((d) => getDokTipusNameById(d.dokumentum_tipus_id) || d.tipus)
                .filter(Boolean)
        ),
    ];

    return (
        <div className="admin-document-page">
            <AdminBackLink />
            <h1 className="admin-document-title">Dokumentumok kezelése</h1>
            <p className="admin-document-subtitle">
                Sírbérlőkhöz tartozó dokumentumok feltöltése és kezelése
            </p>

            <div className="admin-document-container">
                <div className="admin-document-form-section">
                    <h2 className="admin-document-section-title">
                        {form.id ? "Dokumentum szerkesztése" : "Új dokumentum"}
                    </h2>

                    {error && (
                        <div className="admin-document-alert admin-document-alert--error">
                            {error}
                        </div>
                    )}

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
                                disabled={saving}
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
                                disabled={saving}
                            >
                                <option value="">-- Válassz sírbérlőt --</option>
                                {tenants.map((tenant) => (
                                    <option key={tenant.id} value={tenant.id}>
                                        {tenant.nev}
                                    </option>
                                ))}
                            </select>
                            {fieldErrors.sirberlo_id && (
                                <div className="admin-document-field-error">
                                    {fieldErrors.sirberlo_id}
                                </div>
                            )}
                        </div>

                        <div className="admin-document-form-group">
                            <label htmlFor="dokumentum_tipus_id">Dokumentum típusa *</label>
                            <select
                                id="dokumentum_tipus_id"
                                name="dokumentum_tipus_id"
                                value={form.dokumentum_tipus_id}
                                onChange={handleChange}
                                className={fieldErrors.dokumentum_tipus_id ? "error" : ""}
                                disabled={saving}
                            >
                                <option value="">-- Válassz dokumentum típust --</option>
                                {dokumentumTipusok.map((tipus) => (
                                    <option key={tipus.id} value={tipus.id}>
                                        {getDokTipusLabel(tipus)}
                                    </option>
                                ))}
                            </select>
                            {fieldErrors.dokumentum_tipus_id && (
                                <div className="admin-document-field-error">
                                    {fieldErrors.dokumentum_tipus_id}
                                </div>
                            )}
                        </div>

                        <div className="admin-document-form-group">
                            <label htmlFor="file">Fájl feltöltése *</label>
                            <div
                                className="admin-document-file-wrapper"
                                role="button"
                                tabIndex={0}
                                onClick={openFilePicker}
                                onKeyDown={(e) => {
                                    if (e.key === "Enter" || e.key === " ") {
                                        e.preventDefault();
                                        openFilePicker();
                                    }
                                }}
                                aria-label="Fájl kiválasztása"
                            >
                                <input
                                    ref={fileInputRef}
                                    id="file"
                                    type="file"
                                    name="file"
                                    onChange={handleFileChange}
                                    accept=".pdf,.doc,.docx,.jpg,.jpeg,.png"
                                    className={fieldErrors.fajl_tipo ? "error" : ""}
                                    disabled={saving}
                                />
                                <span className="admin-document-file-label">
                                    {file ? file.name : "Fájl kiválasztása..."}
                                </span>
                            </div>
                            {fieldErrors.fajl_tipo && (
                                <div className="admin-document-field-error">
                                    {fieldErrors.fajl_tipo}
                                </div>
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
                                className={fieldErrors.leiras ? "error" : ""}
                                disabled={saving}
                            />
                            {fieldErrors.leiras && (
                                <div className="admin-document-field-error">{fieldErrors.leiras}</div>
                            )}
                        </div>

                        <div className="admin-document-form-group">
                            <label htmlFor="feltoltve">Feltöltés dátuma</label>
                            <input
                                id="feltoltve"
                                type="date"
                                name="feltoltve"
                                value={form.feltoltve}
                                onChange={handleChange}
                                className={fieldErrors.feltoltve ? "error" : ""}
                                disabled={saving}
                            />
                            {fieldErrors.feltoltve && (
                                <div className="admin-document-field-error">{fieldErrors.feltoltve}</div>
                            )}
                        </div>

                        <div className="admin-document-button-group">
                            <button
                                type="submit"
                                className="admin-document-btn admin-document-btn--primary"
                                disabled={saving}
                            >
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

                <div className="admin-document-list-section">
                    <h2 className="admin-document-section-title">
                        Dokumentumok ({filteredDocuments.length})
                    </h2>

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
                            {filteredDocuments.map((doc) => {
                                const displayName = doc.nev ?? doc.tipus ?? "Név nélkül";
                                const displayType =
                                    getDokTipusNameById(doc.dokumentum_tipus_id) ||
                                    doc.tipus ||
                                    "Ismeretlen típus";
                                const displayDate = doc.feltoltve ?? doc.datum;
                                const filePath = doc.fajl_utvonal ?? "";
                                const encodedPath = encodeURIComponent(filePath);

                                const openUrl = `${API_BASE}/dok-megnyit/${encodedPath}`;
                                const downloadUrl = `${API_BASE}/dok-letoltes/${encodedPath}`;

                                return (
                                    <div key={doc.id} className="admin-document-card">
                                        <div className="admin-document-card-header">
                                            <h3 className="admin-document-card-title">{displayName}</h3>
                                            <span className="admin-document-card-type">{displayType}</span>
                                        </div>

                                        <div className="admin-document-card-body">
                                            <p className="admin-document-card-tenant">
                                                <strong>Sírbérlő:</strong> {getTenantName(doc.sirberlo_id)}
                                            </p>

                                            {doc.leiras && (
                                                <p className="admin-document-card-description">{doc.leiras}</p>
                                            )}

                                            <p className="admin-document-card-date">
                                                <strong>Feltöltve:</strong>{" "}
                                                <span>{formatDate(displayDate)}</span>
                                            </p>
                                        </div>

                                        <div className="admin-document-card-actions">
                                            {filePath ? (
                                                <>
                                                    <a
                                                        href={openUrl}
                                                        className="admin-document-btn admin-document-btn--small"
                                                        target="_blank"
                                                        rel="noopener noreferrer"
                                                    >
                                                        Megnyitás
                                                    </a>

                                                    <a
                                                        href={downloadUrl}
                                                        className="admin-document-btn admin-document-btn--small"
                                                    >
                                                        Letöltés
                                                    </a>
                                                </>
                                            ) : (
                                                <button
                                                    type="button"
                                                    className="admin-document-btn admin-document-btn--small"
                                                    disabled
                                                >
                                                    Nincs fájl
                                                </button>
                                            )}

                                            <button
                                                onClick={() => handleEdit(doc)}
                                                className="admin-document-btn admin-document-btn--small admin-document-btn--edit"
                                                disabled={saving}
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
                                );
                            })}
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}