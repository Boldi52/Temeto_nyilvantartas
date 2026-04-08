import React, { useEffect, useRef, useState } from "react";
import "../../CSS-ek/AdminDeceades.css";
import "../../CSS-ek/AdminDocument.css";
import AdminBackLink from "../../AdminBackLink";

const API_BASE = "http://localhost:8000";
const ITEMS_PER_PAGE = 11;

export default function AdminDeceades() {
    const emptyForm = {
        id: null,
        nev: "",
        szul_datum: "",
        halal_datuma: "",
        anyja_neve: "",
        parcella_id: "",
        sor_id: "",
        sirhely_id: "",
    };

    const [form, setForm] = useState(emptyForm);
    const [parcellak, setParcellak] = useState([]);
    const [sorok, setSorok] = useState([]);
    const [sirhelyek, setSirhelyek] = useState([]);
    const [elhunytak, setElhunytak] = useState([]);
    const [file, setFile] = useState(null);
    const [loading, setLoading] = useState(false);
    const [saving, setSaving] = useState(false);
    const [error, setError] = useState("");
    const [success, setSuccess] = useState("");
    const [fieldErrors, setFieldErrors] = useState({});
    const [currentPage, setCurrentPage] = useState(1);

    const fileInputRef = useRef(null);

    const openFilePicker = () => {
        const input = fileInputRef.current;
        if (!input) return;
        input.click();
    };

    const loadData = async () => {
        setLoading(true);
        setError("");
        try {
            const [parcellaRes, sorRes, sirhelyRes, elhunytRes] = await Promise.all([
                fetch(`${API_BASE}/api/parcellak`),
                fetch(`${API_BASE}/api/sorok`),
                fetch(`${API_BASE}/api/sirhelyek`),
                fetch(`${API_BASE}/api/elhunytMindenAdata`),
            ]);

            if (!parcellaRes.ok) throw new Error("Parcellák betöltése sikertelen.");
            if (!sorRes.ok) throw new Error("Sorok betöltése sikertelen.");
            if (!sirhelyRes.ok) throw new Error("Sírhelyek betöltése sikertelen.");
            if (!elhunytRes.ok) throw new Error("Elhunytak betöltése sikertelen.");

            const [parcellaData, sorData, sirhelyData, elhunytData] = await Promise.all([
                parcellaRes.json(),
                sorRes.json(),
                sirhelyRes.json(),
                elhunytRes.json(),
            ]);

            setParcellak(Array.isArray(parcellaData) ? parcellaData : []);
            setSorok(Array.isArray(sorData) ? sorData : []);
            setSirhelyek(Array.isArray(sirhelyData) ? sirhelyData : []);

            const safeElhunytak = Array.isArray(elhunytData) ? elhunytData : [];
            setElhunytak(safeElhunytak);

            const maxPage = Math.max(1, Math.ceil(safeElhunytak.length / ITEMS_PER_PAGE));
            setCurrentPage((prev) => Math.min(prev, maxPage));
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

        if (name === "parcella_id") {
            setForm((f) => ({
                ...f,
                parcella_id: value,
                sor_id: "",
                sirhely_id: "",
            }));
        } else if (name === "sor_id") {
            setForm((f) => ({
                ...f,
                sor_id: value,
                sirhely_id: "",
            }));
        } else {
            setForm((f) => ({ ...f, [name]: value }));
        }

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
        const selectedSirhely = sirhelyek.find((s) => Number(s.id) === Number(item.sirhely_id));
        const selectedSor = selectedSirhely
            ? sorok.find((s) => Number(s.id) === Number(selectedSirhely.sor_id))
            : null;

        setForm({
            id: item.id,
            nev: item.nev || "",
            szul_datum: item.szul_datum || "",
            halal_datuma: item.halal_datuma || "",
            anyja_neve: item.anyja_neve || "",
            parcella_id: selectedSor?.parcella_id ? String(selectedSor.parcella_id) : "",
            sor_id: selectedSirhely?.sor_id ? String(selectedSirhely.sor_id) : "",
            sirhely_id: item.sirhely_id ? String(item.sirhely_id) : "",
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
            setCurrentPage(1);
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

        if (isEditing) formData.append("_method", "PUT");

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
            setCurrentPage(1);
        } catch (err) {
            setError(err.message || "Ismeretlen hiba történt.");
        } finally {
            setSaving(false);
        }
    };

    const isEditing = !!form.id;

    const filteredSorok = form.parcella_id
        ? sorok.filter((s) => Number(s.parcella_id) === Number(form.parcella_id))
        : [];

    const filteredSirhelyek = form.sor_id
        ? sirhelyek.filter((s) => Number(s.sor_id) === Number(form.sor_id))
        : [];

    const getSorNameFromSirhelyId = (sirhelyId) => {
        const sirhely = sirhelyek.find((s) => Number(s.id) === Number(sirhelyId));
        if (!sirhely) return "—";
        const sor = sorok.find((r) => Number(r.id) === Number(sirhely.sor_id));
        return sor?.nev || sor?.sor || `#${sirhely.sor_id}` || "—";
    };

    const getParcellaNameFromSirhelyId = (sirhelyId) => {
        const sirhely = sirhelyek.find((s) => Number(s.id) === Number(sirhelyId));
        if (!sirhely) return "—";
        const sor = sorok.find((r) => Number(r.id) === Number(sirhely.sor_id));
        if (!sor) return "—";
        const parcella = parcellak.find((p) => Number(p.id) === Number(sor.parcella_id));
        return parcella?.nev || `#${sor.parcella_id}` || "—";
    };

    const sortedElhunytak = [...elhunytak].sort((a, b) => Number(b.id) - Number(a.id));

    const totalPages = Math.max(1, Math.ceil(sortedElhunytak.length / ITEMS_PER_PAGE));
    const startIndex = (currentPage - 1) * ITEMS_PER_PAGE;
    const paginatedElhunytak = sortedElhunytak.slice(startIndex, startIndex + ITEMS_PER_PAGE);

    return (
        <div className="admin-deceades-page">
            <AdminBackLink />
            <div className="admin-deceades-header">
                <h2 className="admin-deceades-title">Elhunytak kezelése</h2>
                <p className="admin-deceades-subtitle">Elhunyt hozzáadása, szerkesztése és törlése.</p>
            </div>

            <div className="admin-deceades-grid">
                <div className="admin-deceades-card">
                    <h3 className="admin-deceades-section-title">
                        {isEditing ? "Elhunyt szerkesztése" : "Új elhunyt hozzáadása"}
                    </h3>

                    {error && <div className="admin-deceades-message error">{error}</div>}
                    {success && <div className="admin-deceades-message success">{success}</div>}

                    <form className="admin-deceades-form" onSubmit={handleSubmit}>
                        <label>
                            Név *
                            <input type="text" name="nev" value={form.nev} onChange={handleChange} required placeholder="Pl. Kovács János" />
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
                            <input type="text" name="anyja_neve" value={form.anyja_neve} onChange={handleChange} placeholder="Pl. Nagy Anna" />
                            {fieldErrors.anyja_neve && <div className="admin-deceades-error">{fieldErrors.anyja_neve}</div>}
                        </label>

                        <label>
                            Parcella
                            <select name="parcella_id" value={form.parcella_id} onChange={handleChange}>
                                <option value="">Válassz parcellát</option>
                                {parcellak.map((p) => (
                                    <option key={p.id} value={p.id}>{p.nev}</option>
                                ))}
                            </select>
                            {fieldErrors.parcella_id && <div className="admin-deceades-error">{fieldErrors.parcella_id}</div>}
                        </label>

                        <label>
                            Sor
                            <select name="sor_id" value={form.sor_id} onChange={handleChange} disabled={!form.parcella_id}>
                                <option value="">Válassz sort</option>
                                {filteredSorok.map((s) => (
                                    <option key={s.id} value={s.id}>{s.nev || s.sor || `Sor #${s.id}`}</option>
                                ))}
                            </select>
                            {fieldErrors.sor_id && <div className="admin-deceades-error">{fieldErrors.sor_id}</div>}
                        </label>

                        <label>
                            Sírhely
                            <select name="sirhely_id" value={form.sirhely_id} onChange={handleChange} disabled={!form.sor_id}>
                                <option value="">Nincs megadva</option>
                                {filteredSirhelyek.map((s) => (
                                    <option key={s.id} value={s.id}>{s.sirkod || `Sírhely #${s.id}`}</option>
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
                                onClick={(e) => {
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
                                    onClick={(e) => e.stopPropagation()}
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
                        <>
                            <div className="admin-deceades-table-wrapper">
                                <table className="admin-deceades-table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Név</th>
                                            <th>Születés</th>
                                            <th>Halál</th>
                                            <th>Anyja neve</th>
                                            <th>Parcella</th>
                                            <th>Sor</th>
                                            <th>Sírhely</th>
                                            <th>Kivonat</th>
                                            <th>Műveletek</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {paginatedElhunytak.length === 0 && (
                                            <tr>
                                                <td colSpan="10" className="empty">Nincs adat.</td>
                                            </tr>
                                        )}
                                        {paginatedElhunytak.map((e) => (
                                            <tr key={e.id}>
                                                <td data-label="ID">{e.id}</td>
                                                <td data-label="Név"><strong>{e.nev}</strong></td>
                                                <td data-label="Születés">{e.szul_datum || "—"}</td>
                                                <td data-label="Halál">{e.halal_datuma || "—"}</td>
                                                <td data-label="Anyja neve">{e.anyja_neve || "—"}</td>
                                                <td data-label="Parcella">{e.sirhely_id ? getParcellaNameFromSirhelyId(e.sirhely_id) : "—"}</td>
                                                <td data-label="Sor">{e.sirhely_id ? getSorNameFromSirhelyId(e.sirhely_id) : "—"}</td>
                                                <td data-label="Sírhely">{e.sirhely_id || "—"}</td>

                                                <td data-label="Kivonat">
                                                    {e.halotti_anyakonyvi_kiv ? (
                                                        <div className="admin-deceades-file-actions">
                                                            <a
                                                                className="admin-deceades-file-btn admin-deceades-file-btn--open"
                                                                href={`${API_BASE}/dok-megnyit/${e.halotti_anyakonyvi_kiv}`}
                                                                target="_blank"
                                                                rel="noreferrer"
                                                            >
                                                                Megnyitás
                                                            </a>
                                                            <a
                                                                className="admin-deceades-file-btn admin-deceades-file-btn--download"
                                                                href={`${API_BASE}/dok-letoltes/${e.halotti_anyakonyvi_kiv}`}
                                                            >
                                                                Letöltés
                                                            </a>
                                                        </div>
                                                    ) : (
                                                        "—"
                                                    )}
                                                </td>

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

                            <div className="admin-deceades-pagination-container">
                                <div className="admin-deceades-pagination-info">
                                    Oldal <strong>{currentPage}</strong> / <strong>{totalPages}</strong>{" "}
                                    ({sortedElhunytak.length} elhunyt összesen)
                                </div>

                                <div className="admin-deceades-pagination-buttons">
                                    <button
                                        onClick={() => setCurrentPage((p) => Math.max(1, p - 1))}
                                        disabled={currentPage === 1}
                                    >
                                        ← Előző
                                    </button>

                                    <button
                                        onClick={() => setCurrentPage((p) => Math.min(totalPages, p + 1))}
                                        disabled={currentPage === totalPages}
                                    >
                                        Következő →
                                    </button>
                                </div>
                            </div>
                        </>
                    )}
                </div>
            </div>
        </div>
    );
}