import React, { useEffect, useState } from "react";
import "../../CSS-ek/AdminGraveTenant.css";

const API_BASE = "http://localhost:8000/api";

export default function AdminGraveTenant() {
    const emptyForm = {
        id: null,
        nev: "",
        email_cim: "",
        telefonszam: "",
        kozterulet_neve: "",
        kozterulet_tipus_id: "",
        ir_szam: "",
    };

    const [tenants, setTenants] = useState([]);
    const [kozteruletTipusok, setKozteruletTipusok] = useState([]);
    const [telepulesek, setTelepulesek] = useState([]);
    const [form, setForm] = useState(emptyForm);
    const [loading, setLoading] = useState(false);
    const [saving, setSaving] = useState(false);
    const [error, setError] = useState("");
    const [fieldErrors, setFieldErrors] = useState({});

    // Token lekérése
    const getAuthHeaders = () => {
        const token = localStorage.getItem('token');
        return {
            'Content-Type': 'application/json',
            'Authorization': token ? `Bearer ${token}` : '',
        };
    };

    // Adatok betöltése
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
        // Töröljük az adott mező hibáját amikor kezd el írni a user
        if (fieldErrors[name]) {
            setFieldErrors(prev => {
                const newErrors = { ...prev };
                delete newErrors[name];
                return newErrors;
            });
        }
    };

    const handleEdit = (t) => {
        setForm({
            id: t.id,
            nev: t.nev || "",
            email_cim: t.email_cim || "",
            telefonszam: t.telefonszam || "",
            kozterulet_neve: t.kozterulet_neve || "",
            kozterulet_tipus_id: t.kozterulet_tipus_id || "",
            ir_szam: t.ir_szam || "",
        });
        setFieldErrors({});
        setError("");
        // Scroll az űrlaphoz
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
            kozterulet_tipus_id: form.kozterulet_tipus_id || null,
            ir_szam: parseInt(form.ir_szam),
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

    // Segédfüggvények
    const getKozteruletTipusNev = (id) => {
        if (!id) return "";
        const tipus = kozteruletTipusok.find(k => k.id === parseInt(id));
        return tipus ? tipus.nev : "";
    };

    const getTelepulesNev = (irSzam) => {
        if (!irSzam) return "—";
        const telepules = telepulesek.find(t => t.ir_szam === parseInt(irSzam));
        return telepules ? `${telepules.nev} (${irSzam})` : String(irSzam);
    };

    const formatCim = (tenant) => {
        const parts = [];
        if (tenant.kozterulet_neve) parts.push(tenant.kozterulet_neve);
        const tipus = getKozteruletTipusNev(tenant.kozterulet_tipus_id);
        if (tipus) parts.push(tipus);
        return parts.length > 0 ? parts.join(' ') : "—";
    };

    return (
        <div className="admin-page tenant-page">
            <div className="tenant-header">
                <h2 className="admin-title">Sírbérlők kezelése</h2>
                <p className="admin-text">Itt kezelheted a sírbérlők adatait - hozzáadás, módosítás és törlés.</p>
            </div>

            <div className="tenant-grid">
                {/* Bal oldali űrlap kártya */}
                <div className="tenant-card">
                    <h3 className="section-title">
                        {isEditing ? "Sírbérlő szerkesztése" : "Új sírbérlő hozzáadása"}
                    </h3>
                    
                    {error && <div className="alert alert-error">{error}</div>}
                    
                    <form className="tenant-form" onSubmit={handleSubmit}>
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
                                <div className="field-error">
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
                                <div className="field-error">
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
                                <div className="field-error">
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
                                placeholder="Pl: Petőfi"
                                disabled={saving}
                            />
                            {fieldErrors.kozterulet_neve && (
                                <div className="field-error">
                                    {Array.isArray(fieldErrors.kozterulet_neve) ? fieldErrors.kozterulet_neve[0] : fieldErrors.kozterulet_neve}
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
                                <div className="field-error">
                                    {Array.isArray(fieldErrors.kozterulet_tipus_id) ? fieldErrors.kozterulet_tipus_id[0] : fieldErrors.kozterulet_tipus_id}
                                </div>
                            )}
                        </label>

                        <label>
                            Település *
                            <select 
                                name="ir_szam" 
                                value={form.ir_szam} 
                                onChange={handleChange}
                                required
                                disabled={saving}
                            >
                                <option value="">-- Válassz települést --</option>
                                {telepulesek.map(t => (
                                    <option key={t.ir_szam} value={t.ir_szam}>
                                        {t.nev} ({t.ir_szam})
                                    </option>
                                ))}
                            </select>
                            {fieldErrors.ir_szam && (
                                <div className="field-error">
                                    {Array.isArray(fieldErrors.ir_szam) ? fieldErrors.ir_szam[0] : fieldErrors.ir_szam}
                                </div>
                            )}
                        </label>

                        <div className="form-actions">
                            <button type="submit" disabled={saving}>
                                {saving ? "Mentés..." : (isEditing ? "Módosítások mentése" : "Hozzáadás")}
                            </button>
                            {isEditing && (
                                <button
                                    type="button"
                                    className="ghost"
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

               
                <div className="tenant-card">
                    <div className="list-header">
                        <h3 className="section-title">Sírbérlők listája ({tenants.length})</h3>
                        <button onClick={loadData} disabled={loading || saving}>
                            {loading ? "Betöltés..." : "🔄 Frissítés"}
                        </button>
                    </div>

                    {loading ? (
                        <div className="alert">⏳ Adatok betöltése folyamatban...</div>
                    ) : (
                        <div className="table-wrapper">
                            <table className="tenant-table">
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

                                    {tenants.map((t) => (
                                        <tr key={t.id}>
                                            <td>{t.id}</td>
                                            <td><strong>{t.nev}</strong></td>
                                            <td className="mono">{t.email_cim || "—"}</td>
                                            <td>{t.telefonszam || "—"}</td>
                                            <td>{formatCim(t)}</td>
                                            <td>{getTelepulesNev(t.ir_szam)}</td>
                                            <td className="actions">
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
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}