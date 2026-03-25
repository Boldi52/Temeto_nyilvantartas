import React, { useEffect, useState } from "react";
import "../../CSS-ek/AdminGraveTenant.css";
import AdminBackLink from "../../AdminBackLink";

const API_BASE = "http://localhost:8000/api";

export default function AdminGraveTenant() {
    const emptyForm = {
        id: null,
        nev: "",
        email_cim: "",
        telefonszam: "",
        kozterulet_neve: "",
        hazszam: "",
        kozterulet_tipus_id: "",
        telepules_ir_szam: "",
        telepules_nev: "",
    };

    const [tenants, setTenants] = useState([]);
    const [kozteruletTipusok, setKozteruletTipusok] = useState([]);
    const [telepulesek, setTelepulesek] = useState([]);
    const [form, setForm] = useState(emptyForm);
    const [loading, setLoading] = useState(false);
    const [saving, setSaving] = useState(false);
    const [error, setError] = useState("");
    const [fieldErrors, setFieldErrors] = useState({});

    const getAuthHeaders = () => {
        const token = localStorage.getItem('token');
        return {
            'Content-Type': 'application/json',
            'Authorization': token ? `Bearer ${token}` : '',
        };
    };

    const loadData = async () => {
        setLoading(true);
        setError("");
        try {
            const headers = getAuthHeaders();

            const [tenantsRes, kozteruletRes, telepulesRes] = await Promise.all([
                fetch(`${API_BASE}/sirberlok`, { headers }),
                fetch(`${API_BASE}/kozteuletTipusok`, { headers }),
                fetch(`${API_BASE}/telepulesek`, { headers })
            ]);

            if (!tenantsRes.ok) {
                throw new Error(`Sírbérlők betöltése sikertelen (${tenantsRes.status})`);
            }
            if (!kozteruletRes.ok) {
                throw new Error(`Közterület típusok betöltése sikertelen (${kozteruletRes.status})`);
            }
            if (!telepulesRes.ok) {
                throw new Error(`Települések betöltése sikertelen (${telepulesRes.status})`);
            }

            const [tenantsData, kozteruletData, telepulesData] = await Promise.all([
                tenantsRes.json(),
                kozteruletRes.json(),
                telepulesRes.json()
            ]);

            setTenants(Array.isArray(tenantsData) ? tenantsData : []);
            setKozteruletTipusok(Array.isArray(kozteruletData) ? kozteruletData : []);
            setTelepulesek(Array.isArray(telepulesData) ? telepulesData : []);
        } catch (err) {
            console.error("Betöltési hiba:", err);
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
            setFieldErrors(prev => {
                const newErrors = { ...prev };
                delete newErrors[name];
                return newErrors;
            });
        }
    };

    const handleEdit = (t) => {
        const telepules = telepulesek.find(tp => tp.id === t.telepules_id);

        setForm({
            id: t.id,
            nev: t.nev || "",
            email_cim: t.email_cim || "",
            telefonszam: t.telefonszam || "",
            kozterulet_neve: t.kozterulet_neve || "",
            hazszam: t.hazszam || "",
            kozterulet_tipus_id: t.kozterulet_tipus_id || "",
            telepules_ir_szam: telepules ? String(telepules.ir_szam) : "",
            telepules_nev: telepules ? telepules.nev : "",
        });
        setFieldErrors({});
        setError("");
        window.scrollTo({ top: 0, behavior: 'smooth' });
    };

    const handleDelete = async (id) => {
        if (!window.confirm("Biztosan törlöd ezt a sírbérlőt?")) return;
        setSaving(true);
        setError("");
        try {
            const res = await fetch(`${API_BASE}/sirberlok/${id}`, {
                method: "DELETE",
                headers: getAuthHeaders()
            });

            if (!res.ok) {
                const body = await res.json().catch(() => ({}));
                throw new Error(body.message || `Törlés sikertelen (${res.status})`);
            }

            await loadData();
            if (form.id === id) {
                setForm(emptyForm);
            }
        } catch (err) {
            console.error("Törlési hiba:", err);
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
        const url = form.id
            ? `${API_BASE}/sirberlok/${form.id}`
            : `${API_BASE}/sirberlok`;

        const payload = {
            nev: form.nev,
            email_cim: form.email_cim || null,
            telefonszam: form.telefonszam || null,
            kozterulet_neve: form.kozterulet_neve,
            hazszam: form.hazszam,
            kozterulet_tipus_id: form.kozterulet_tipus_id || null,
            telepules_ir_szam: parseInt(form.telepules_ir_szam, 10),
            telepules_nev: form.telepules_nev,
        };

        try {
            const res = await fetch(url, {
                method,
                headers: getAuthHeaders(),
                body: JSON.stringify(payload),
            });

            if (res.status === 422) {
                const body = await res.json();
                setFieldErrors(body.errors || {});
                throw new Error(body.message || "Validációs hiba történt.");
            }

            if (!res.ok) {
                const body = await res.json().catch(() => ({}));
                throw new Error(body.message || `Mentés sikertelen (${res.status})`);
            }

            await loadData();
            setForm(emptyForm);
            setError("");
        } catch (err) {
            console.error("Mentési hiba:", err);
            if (!err.message.includes("Validációs")) {
                setError(err.message || "Ismeretlen hiba történt.");
            }
        } finally {
            setSaving(false);
        }
    };

    const isEditing = !!form.id;

    const getKozteruletTipusNev = (id) => {
        if (!id) return "";
        const tipus = kozteruletTipusok.find(k => k.id === parseInt(id));
        return tipus ? tipus.nev : "";
    };

    const getTelepulesNev = (telepulesId) => {
        if (!telepulesId) return "—";
        const telepules = telepulesek.find(t => t.id === telepulesId);
        return telepules ? `${telepules.nev} (${telepules.ir_szam})` : "—";
    };

    const formatCim = (tenant) => {
        const parts = [];
        if (tenant.kozterulet_neve) parts.push(tenant.kozterulet_neve);
        const tipus = getKozteruletTipusNev(tenant.kozterulet_tipus_id);
        if (tipus) parts.push(tipus);
        if (tenant.hazszam) parts.push(tenant.hazszam);
        return parts.length > 0 ? parts.join(' ') : "—";
    };

    return (
        <div className="admin-gravetenant-page">
            <AdminBackLink />
            <div className="admin-gravetenant-header">
                <h2 className="admin-gravetenant-title">Sírbérlők kezelése</h2>
                <p className="admin-gravetenant-subtitle">Itt kezelheted a sírbérlők adatait - hozzáadás, módosítás és törlés.</p>
            </div>

            <div className="admin-gravetenant-grid">
                {/* Bal oldali űrlap kártya */}
                <div className="admin-gravetenant-card">
                    <h3 className="admin-gravetenant-section-title">
                        {isEditing ? "Sírbérlő szerkesztése" : "Új sírbérlő hozzáadása"}
                    </h3>

                    {error && <div className="admin-gravetenant-alert admin-gravetenant-alert--error">{error}</div>}

                    <form className="admin-gravetenant-form" onSubmit={handleSubmit}>
                        <label>
                            Név *
                            <input
                                name="nev"
                                value={form.nev}
                                onChange={handleChange}
                                required
                                placeholder="Teljes név"
                                disabled={saving}
                            />
                            {fieldErrors.nev && (
                                <div className="admin-gravetenant-field-error">
                                    {Array.isArray(fieldErrors.nev) ? fieldErrors.nev[0] : fieldErrors.nev}
                                </div>
                            )}
                        </label>

                        <label>
                            E-mail cím
                            <input
                                type="email"
                                name="email_cim"
                                value={form.email_cim}
                                onChange={handleChange}
                                placeholder="pelda@email.com"
                                disabled={saving}
                            />
                            {fieldErrors.email_cim && (
                                <div className="admin-gravetenant-field-error">
                                    {Array.isArray(fieldErrors.email_cim) ? fieldErrors.email_cim[0] : fieldErrors.email_cim}
                                </div>
                            )}
                        </label>

                        <label>
                            Telefonszám
                            <input
                                name="telefonszam"
                                value={form.telefonszam}
                                onChange={handleChange}
                                placeholder="+36 30 123 4567"
                                disabled={saving}
                            />
                            {fieldErrors.telefonszam && (
                                <div className="admin-gravetenant-field-error">
                                    {Array.isArray(fieldErrors.telefonszam) ? fieldErrors.telefonszam[0] : fieldErrors.telefonszam}
                                </div>
                            )}
                        </label>

                        <label>
                            Közterület neve *
                            <input
                                name="kozterulet_neve"
                                value={form.kozterulet_neve}
                                onChange={handleChange}
                                required
                                placeholder="Pl. Petőfi Sándor"
                                disabled={saving}
                            />
                            {fieldErrors.kozterulet_neve && (
                                <div className="admin-gravetenant-field-error">
                                    {Array.isArray(fieldErrors.kozterulet_neve) ? fieldErrors.kozterulet_neve[0] : fieldErrors.kozterulet_neve}
                                </div>
                            )}
                        </label>

                        <label>
                            Házszám *
                            <input
                                name="hazszam"
                                value={form.hazszam}
                                onChange={handleChange}
                                required
                                placeholder="Pl. 23"
                                disabled={saving}
                            />
                            {fieldErrors.hazszam && (
                                <div className="admin-gravetenant-field-error">
                                    {Array.isArray(fieldErrors.hazszam) ? fieldErrors.hazszam[0] : fieldErrors.hazszam}
                                </div>
                            )}
                        </label>

                        <label>
                            Közterület típusa
                            <select
                                name="kozterulet_tipus_id"
                                value={form.kozterulet_tipus_id}
                                onChange={handleChange}
                                disabled={saving}
                            >
                                <option value="">-- Válassz típust --</option>
                                {kozteruletTipusok.map(kt => (
                                    <option key={kt.id} value={kt.id}>{kt.nev}</option>
                                ))}
                            </select>
                            {fieldErrors.kozterulet_tipus_id && (
                                <div className="admin-gravetenant-field-error">
                                    {Array.isArray(fieldErrors.kozterulet_tipus_id) ? fieldErrors.kozterulet_tipus_id[0] : fieldErrors.kozterulet_tipus_id}
                                </div>
                            )}
                        </label>

                        <label>
                            Irányítószám *
                            <input
                                name="telepules_ir_szam"
                                value={form.telepules_ir_szam}
                                onChange={handleChange}
                                required
                                placeholder="Pl. 1100"
                                disabled={saving}
                            />
                            {fieldErrors.telepules_ir_szam && (
                                <div className="admin-gravetenant-field-error">
                                    {Array.isArray(fieldErrors.telepules_ir_szam) ? fieldErrors.telepules_ir_szam[0] : fieldErrors.telepules_ir_szam}
                                </div>
                            )}
                        </label>

                        <label>
                            Település neve *
                            <input
                                name="telepules_nev"
                                value={form.telepules_nev}
                                onChange={handleChange}
                                required
                                placeholder="Pl. Budapest"
                                disabled={saving}
                            />
                            {fieldErrors.telepules_nev && (
                                <div className="admin-gravetenant-field-error">
                                    {Array.isArray(fieldErrors.telepules_nev) ? fieldErrors.telepules_nev[0] : fieldErrors.telepules_nev}
                                </div>
                            )}
                        </label>

                        <div className="admin-gravetenant-form-actions">
                            <button type="submit" disabled={saving}>
                                {saving ? "Mentés..." : (isEditing ? "Módosítások mentése" : "Hozzáadás")}
                            </button>
                            {isEditing && (
                                <button
                                    type="button"
                                    className="admin-gravetenant-btn--ghost"
                                    onClick={() => {
                                        setForm(emptyForm);
                                        setFieldErrors({});
                                        setError("");
                                    }}
                                    disabled={saving}
                                >
                                    Mégse
                                </button>
                            )}
                        </div>
                    </form>
                </div>

                {/* Jobb oldali lista kártya */}
                <div className="admin-gravetenant-card">
                    <div className="admin-gravetenant-list-header">
                        <h3 className="admin-gravetenant-section-title">
                            Sírbérlők listája ({Math.min(tenants.length, 5)}/{tenants.length})
                        </h3>
                        <button onClick={loadData} disabled={loading || saving}>
                            {loading ? "Betöltés..." : "🔄 Frissítés"}
                        </button>
                    </div>

                    {loading ? (
                        <div className="admin-gravetenant-alert">⏳ Adatok betöltése folyamatban...</div>
                    ) : (
                        <div className="admin-gravetenant-table-wrapper">
                            <table className="admin-gravetenant-table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Név</th>
                                        <th>E-mail</th>
                                        <th>Telefon</th>
                                        <th>Cím</th>
                                        <th>Település</th>
                                        <th>Műveletek</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {tenants.length === 0 && (
                                        <tr>
                                            <td colSpan="7" className="empty">
                                                Még nincs egyetlen sírbérlő sem.
                                            </td>
                                        </tr>
                                    )}

                                    {tenants.slice(0, 5).map((t) => (
                                        <tr key={t.id}>
                                            <td data-label="ID">{t.id}</td>
                                            <td data-label="Név"><strong>{t.nev}</strong></td>
                                            <td data-label="E-mail" className="admin-gravetenant-mono">{t.email_cim || "—"}</td>

                                            <td data-label="Telefon" className="admin-gravetenant-phone">
                                                {t.telefonszam || "—"}
                                            </td>

                                            <td data-label="Cím">{formatCim(t)}</td>
                                            <td data-label="Település">{getTelepulesNev(t.telepules_id)}</td>
                                            <td data-label="Műveletek" className="admin-gravetenant-actions">
                                                <button
                                                    onClick={() => handleEdit(t)}
                                                    disabled={saving}
                                                    title="Szerkesztés"
                                                >
                                                    ✏️ Szerk.
                                                </button>
                                                <button
                                                    className="danger"
                                                    onClick={() => handleDelete(t.id)}
                                                    disabled={saving}
                                                    title="Törlés"
                                                >
                                                    🗑️ Törlés
                                                </button>
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>

                            {tenants.length > 5 && (
                                <div className="admin-gravetenant-alert">
                                    Csak az első 5 sírbérlő van megjelenítve. Összesen: {tenants.length}.
                                </div>
                            )}
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}