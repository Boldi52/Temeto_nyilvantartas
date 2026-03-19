import React, { useEffect, useRef, useState } from "react";
import "../../CSS-ek/AdminDeceades.css";
import "../../CSS-ek/AdminDocument.css";
import AdminBackLink from "../../AdminBackLink";

const API_BASE = "http://localhost:8000";

export default function AdminDeceades() {
    const emptyForm = {
        id: null,
        nev: "",
        szul_datum: "",
        halal_datuma: "",
        anyja_neve: "",
        sirhely_id: "",
    };

    const [form, setForm] = useState(emptyForm);
    const [sirhelyek, setSirhelyek] = useState([]);
    const [elhunytak, setElhunytak] = useState([]);
    const [file, setFile] = useState(null);
    const [loading, setLoading] = useState(false);
    const [saving, setSaving] = useState(false);
    const [error, setError] = useState("");
    const [success, setSuccess] = useState("");
    const [fieldErrors, setFieldErrors] = useState({});

    const fileInputRef = useRef(null);

    const openFilePicker = () => {
        // Biztosabb: natív click létrehozása (egyes böngészők / css-ek mellett stabilabb)
        const input = fileInputRef.current;
        if (!input) return;
        input.dispatchEvent(new MouseEvent("click", { bubbles: true }));
    };

    const loadData = async () => {
        setLoading(true);
        setError("");
        try {
            const [sirhelyRes, elhunytRes] = await Promise.all([
                fetch(`${API_BASE}/api/sirhelyek`),
                fetch(`${API_BASE}/api/elhunytMindenAdata`),
            ]);

            if (!sirhelyRes.ok) throw new Error("Sírhelyek betöltése sikertelen.");
            if (!elhunytRes.ok) throw new Error("Elhunytak betöltése sikertelen.");

            const [sirhelyData, elhunytData] = await Promise.all([
                sirhelyRes.json(),
                elhunytRes.json(),
            ]);

            setSirhelyek(Array.isArray(sirhelyData) ? sirhelyData : []);
            setElhunytak(Array.isArray(elhunytData) ? elhunytData : []);
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
        if (fieldErrors[name]) {
            setFieldErrors((prev) => {
                const next = { ...prev };
                delete next[name];
                return next;
            });
        }
    };

    const handleFileChange = (e) => {
        const selected = e.target.files?.[0] || null;
        setFile(selected);
    };

    const handleReset = () => {
        setForm(emptyForm);
        setFile(null);
        setFieldErrors({});
        setError("");
        setSuccess("");
        if (fileInputRef.current) fileInputRef.current.value = "";
    };

    const handleEdit = (item) => {
        setForm({
            id: item.id,
            nev: item.nev || "",
            szul_datum: item.szul_datum || "",
            halal_datuma: item.halal_datuma || "",
            anyja_neve: item.anyja_neve || "",
            sirhely_id: item.sirhely_id || "",
        });
        setFile(null);
        setFieldErrors({});
        setError("");
        setSuccess("");
        if (fileInputRef.current) fileInputRef.current.value = "";
        window.scrollTo({ top: 0, behavior: "smooth" });
    };

    const handleDelete = async (id) => {
        if (!window.confirm("Biztosan törlöd ezt az elhunytat?")) return;
        setSaving(true);
        setError("");
        try {
            const res = await fetch(`${API_BASE}/api/elhunytak/${id}`, {
                method: "DELETE",
            });
            if (!res.ok) {
                const body = await res.json().catch(() => ({}));
                throw new Error(body.message || "Törlés sikertelen.");
            }
            await loadData();
            if (form.id === id) handleReset();
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
        setSuccess("");
        setFieldErrors({});

        const formData = new FormData();
        formData.append("nev", form.nev);
        if (form.szul_datum) formData.append("szul_datum", form.szul_datum);
        if (form.halal_datuma) formData.append("halal_datuma", form.halal_datuma);
        if (form.anyja_neve) formData.append("anyja_neve", form.anyja_neve);
        if (form.sirhely_id) formData.append("sirhely_id", form.sirhely_id);
        if (file) formData.append("halotti_anyakonyvi_kiv", file);

        const isEditing = !!form.id;
        const url = isEditing ? `${API_BASE}/api/elhunytak/${form.id}` : `${API_BASE}/api/elhunytak`;

        if (isEditing) {
            formData.append("_method", "PUT");
        }

        try {
            const res = await fetch(url, {
                method: "POST",
                body: formData,
            });

            if (res.status === 422) {
                const body = await res.json();
                setFieldErrors(body.errors || {});
                return;
            }

            if (!res.ok) {
                const body = await res.json().catch(() => ({}));
                throw new Error(body.message || "Mentés sikertelen.");
            }

            setSuccess(isEditing ? "Elhunyt frissítve." : "Elhunyt hozzáadva.");
            handleReset();
            await loadData();
        } catch (err) {
            setError(err.message || "Ismeretlen hiba történt.");
        } finally {
            setSaving(false);
        }
    };

    const isEditing = !!form.id;

    return (
        <div className="admin-deceades-page">
            <AdminBackLink />
            <div className="admin-deceades-header">
                <h2 className="admin-deceades-title">Elhunytak kezelése</h2>
                <p className="admin-deceades-subtitle">Elhunyt hozzáadása, szerkesztése és törlése.</p>
            </div>

            <div className="admin-deceades-grid">
                {/* FORM */}
                <div className="admin-deceades-card">
                    <h3 className="admin-deceades-section-title">
                        {isEditing ? "Elhunyt szerkesztése" : "Új elhunyt hozzáadása"}
                    </h3>

                    {error && <div className="admin-deceades-message error">{error}</div>}
                    {success && <div className="admin-deceades-message success">{success}</div>}

                    <form className="admin-deceades-form" onSubmit={handleSubmit}>
                        <label>
                            Név *
                            <input
                                type="text"
                                name="nev"
                                value={form.nev}
                                onChange={handleChange}
                                required
                                placeholder="Pl. Kovács János"
                            />
                            {fieldErrors.nev && <div className="admin-deceades-error">{fieldErrors.nev}</div>}
                        </label>

                        <label>
                            Születési dátum
                            <input type="date" name="szul_datum" value={form.szul_datum} onChange={handleChange} />
                            {fieldErrors.szul_datum && <div className="admin-deceades-error">{fieldErrors.szul_datum}</div>}
                        </label>

                        <label>
                            Halál dátuma
                            <input type="date" name="halal_datuma" value={form.halal_datuma} onChange={handleChange} />
                            {fieldErrors.halal_datuma && <div className="admin-deceades-error">{fieldErrors.halal_datuma}</div>}
                        </label>

                        <label>
                            Anyja neve
                            <input
                                type="text"
                                name="anyja_neve"
                                value={form.anyja_neve}
                                onChange={handleChange}
                                placeholder="Pl. Nagy Anna"
                            />
                            {fieldErrors.anyja_neve && <div className="admin-deceades-error">{fieldErrors.anyja_neve}</div>}
                        </label>

                        <label>
                            Sírhely
                            <select name="sirhely_id" value={form.sirhely_id} onChange={handleChange}>
                                <option value="">Nincs megadva</option>
                                {sirhelyek.map((s) => (
                                    <option key={s.id} value={s.id}>
                                        {s.sirkod || `Sírhely #${s.id}`}
                                    </option>
                                ))}
                            </select>
                            {fieldErrors.sirhely_id && <div className="admin-deceades-error">{fieldErrors.sirhely_id}</div>}
                        </label>

                        <label>
                            Halotti anyakönyvi kivonat
                            <div
                                className="admin-document-file-wrapper"
                                role="button"
                                tabIndex={0}
                                onMouseDown={(e) => {
                                    // fontos: mousedown-nál nyitjuk, így a böngésző biztosan user gesture-nek veszi
                                    e.preventDefault();
                                    e.stopPropagation();
                                    openFilePicker();
                                }}
                                onKeyDown={(e) => {
                                    if (e.key === "Enter" || e.key === " ") {
                                        e.preventDefault();
                                        e.stopPropagation();
                                        openFilePicker();
                                    }
                                }}
                                aria-label="Fájl kiválasztása"
                            >
                                <input
                                    ref={fileInputRef}
                                    type="file"
                                    name="halotti_anyakonyvi_kiv"
                                    onChange={handleFileChange}
                                    accept=".pdf,.png,.jpg,.jpeg"
                                    className="admin-document-hidden-file-input"
                                />
                                <span className="admin-document-file-label">
                                    {file ? file.name : "Fájl kiválasztása..."}
                                </span>
                            </div>

                            {fieldErrors.halotti_anyakonyvi_kiv && (
                                <div className="admin-deceades-error">{fieldErrors.halotti_anyakonyvi_kiv}</div>
                            )}
                        </label>

                        <div className="admin-deceades-form-actions">
                            <button type="submit" disabled={saving}>
                                {saving ? "Mentés..." : isEditing ? "Módosítás mentése" : "Elhunyt mentése"}
                            </button>
                            {isEditing && (
                                <button type="button" className="ghost" onClick={handleReset}>
                                    Mégse
                                </button>
                            )}
                        </div>
                    </form>
                </div>

                {/* LIST */}
                <div className="admin-deceades-card">
                    <div className="admin-deceades-list-header">
                        <h3 className="admin-deceades-section-title">Elhunytak listája</h3>
                        <button onClick={loadData} disabled={loading || saving}>
                            {loading ? "Betöltés..." : "Frissítés"}
                        </button>
                    </div>

                    {loading ? (
                        <div className="admin-deceades-message">Betöltés...</div>
                    ) : (
                        <div className="admin-deceades-table-wrapper">
                            <table className="admin-deceades-table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Név</th>
                                        <th>Születés</th>
                                        <th>Halál</th>
                                        <th>Anyja neve</th>
                                        <th>Sírhely</th>
                                        <th>Műveletek</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {elhunytak.length === 0 && (
                                        <tr>
                                            <td colSpan="7" className="empty">Nincs adat.</td>
                                        </tr>
                                    )}
                                    {elhunytak.map((e) => (
                                        <tr key={e.id}>
                                            <td data-label="ID">{e.id}</td>
                                            <td data-label="Név"><strong>{e.nev}</strong></td>
                                            <td data-label="Születés">{e.szul_datum || "—"}</td>
                                            <td data-label="Halál">{e.halal_datuma || "—"}</td>
                                            <td data-label="Anyja neve">{e.anyja_neve || "—"}</td>
                                            <td data-label="Sírhely">{e.sirhely_id || "—"}</td>
                                            <td data-label="Műveletek">
                                                <div className="admin-deceades-actions">
                                                    <button onClick={() => handleEdit(e)}>Szerk.</button>
                                                    <button className="danger" onClick={() => handleDelete(e.id)} disabled={saving}>
                                                        Törlés
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}