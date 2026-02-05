import React, { useEffect, useState } from "react";
import "../../CSS-ek/AdminGraveTenant.css";



const API_BASE = "http://localhost:8000"; // igazítsd a backend host/portra

export default function AdminGraveDigger() {
    const emptyForm = {
        id: null,
        nev: "",
        cim: "",
        telefon: "",
        megjegyzes: "",
    };

    const [tenants, setTenants] = useState([]);
    const [form, setForm] = useState(emptyForm);
    const [loading, setLoading] = useState(false);
    const [saving, setSaving] = useState(false);
    const [error, setError] = useState("");
    const [fieldErrors, setFieldErrors] = useState({});

    const loadData = async () => {
        setLoading(true);
        setError("");
        try {
            const res = await fetch(`${API_BASE}/api/sirberlok`);
            if (!res.ok) throw new Error("Sírbérlők betöltése sikertelen");
            const data = await res.json();
            setTenants(data);
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

    const handleEdit = (t) => {
        setForm({
            id: t.id,
            nev: t.nev || "",
            cim: t.cim || "",
            telefon: t.telefon || "",
            megjegyzes: t.megjegyzes || "",
        });
        setFieldErrors({});
        setError("");
    };

    const handleDelete = async (id) => {
        if (!window.confirm("Biztosan törlöd a sírbérlőt?")) return;
        setSaving(true);
        setError("");
        try {
            const res = await fetch(`${API_BASE}/api/sirberlok/${id}`, { method: "DELETE" });
            if (!res.ok) {
                const body = await res.json().catch(() => ({}));
                throw new Error(body.message || "Törlés sikertelen.");
            }
            await loadData();
            setForm(emptyForm);
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

        const method = form.id ? "PUT" : "POST";
        const url = form.id ? `${API_BASE}/api/sirberlok/${form.id}` : `${API_BASE}/api/sirberlok`;

        const payload = {
            nev: form.nev || null,
            cim: form.cim || null,
            telefon: form.telefon || null,
            megjegyzes: form.megjegyzes || null,
        };

        try {
            const res = await fetch(url, {
                method,
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(payload),
            });

            if (res.status === 422) {
                const body = await res.json();
                setFieldErrors(body.errors || {});
                throw new Error(body.message || "Validációs hiba.");
            }

            if (!res.ok) {
                const body = await res.json().catch(() => ({}));
                throw new Error(body.message || "Mentés sikertelen.");
            }

            await loadData();
            setForm(emptyForm);
        } catch (err) {
            setError(err.message || "Ismeretlen hiba történt.");
        } finally {
            setSaving(false);
        }
    };

    const isEditing = !!form.id;

    return (
        <div className="admin-page graves-page">
            <div className="graves-header">
                <h2 className="admin-title">Sírbérlők kezelése</h2>
                <p className="admin-text">Itt nézheted és szerkesztheted a sírbérlők adatait.</p>
            </div>

            <div className="graves-grid">
                <div className="graves-card">
                    <h3 className="section-title">{isEditing ? "Szerkesztés" : "Új sírbérlő"}</h3>
                    {error && <div className="alert alert-error">{error}</div>}
                    <form className="graves-form" onSubmit={handleSubmit}>
                        <label>
                            Név
                            <input name="nev" value={form.nev} onChange={handleChange} required />
                            {fieldErrors.nev && <div className="field-error">{fieldErrors.nev}</div>}
                        </label>

                        <label>
                            Cím
                            <input name="cim" value={form.cim} onChange={handleChange} />
                            {fieldErrors.cim && <div className="field-error">{fieldErrors.cim}</div>}
                        </label>

                        <label>
                            Telefon
                            <input name="telefon" value={form.telefon} onChange={handleChange} />
                            {fieldErrors.telefon && <div className="field-error">{fieldErrors.telefon}</div>}
                        </label>

                        <label>
                            Megjegyzés
                            <textarea name="megjegyzes" value={form.megjegyzes} onChange={handleChange} />
                            {fieldErrors.megjegyzes && <div className="field-error">{fieldErrors.megjegyzes}</div>}
                        </label>

                        <div className="form-actions">
                            <button type="submit" disabled={saving}>{isEditing ? "Mentés" : "Hozzáadás"}</button>
                            {isEditing && (
                                <button
                                    type="button"
                                    className="ghost"
                                    onClick={() => { setForm(emptyForm); setFieldErrors({}); setError(""); }}
                                    disabled={saving}
                                >
                                    Mégse
                                </button>
                            )}
                        </div>
                    </form>
                </div>

                <div className="graves-card">
                    <div className="list-header">
                        <h3 className="section-title">Sírbérlők listája</h3>
                        <button onClick={loadData} disabled={loading || saving}>Frissítés</button>
                    </div>

                    {loading ? (
                        <div className="alert">Betöltés…</div>
                    ) : (
                        <div className="table-wrapper">
                            <table className="graves-table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Név</th>
                                        <th>Cím</th>
                                        <th>Telefon</th>
                                        <th>Megjegyzés</th>
                                        <th>Műveletek</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {tenants.length === 0 && (
                                        <tr>
                                            <td colSpan="6" className="empty">Nincs adat.</td>
                                        </tr>
                                    )}

                                    {tenants.map((t) => (
                                        <tr key={t.id}>
                                            <td>{t.id}</td>
                                            <td>{t.nev ?? "—"}</td>
                                            <td className="mono">{t.cim ?? "—"}</td>
                                            <td>{t.telefon ?? "—"}</td>
                                            <td>{t.megjegyzes ?? "—"}</td>
                                            <td className="actions">
                                                <button onClick={() => handleEdit(t)}>Szerk.</button>
                                                <button className="danger" onClick={() => handleDelete(t.id)} disabled={saving}>Törlés</button>
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