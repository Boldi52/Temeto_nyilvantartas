import React, { useEffect, useState } from "react";
import "../../CSS-ek/AdminPayment.css";

const API_BASE = "http://localhost:8000";

export default function AdminPayment() {
    const emptyForm = {
        id: null,
        sirberlo_id: "",
        osszeg: "",
        befizetesi_datum: "",
        befizetesi_mod: "készpénz",
        megjegyzes: "",
    };

    const [payments, setPayments] = useState([]);
    const [tenants, setTenants] = useState([]);
    const [form, setForm] = useState(emptyForm);
    const [loading, setLoading] = useState(false);
    const [saving, setSaving] = useState(false);
    const [error, setError] = useState("");
    const [fieldErrors, setFieldErrors] = useState({});
    const [filterStatus, setFilterStatus] = useState("all");
    const [searchTerm, setSearchTerm] = useState("");

    const loadData = async () => {
        setLoading(true);
        setError("");
        try {
            const [payRes, tenRes] = await Promise.all([
                fetch(`${API_BASE}/api/befizetesek`),
                fetch(`${API_BASE}/api/sirberlok`),
            ]);

            if (!payRes.ok) throw new Error("Befizetések betöltése sikertelen");
            if (!tenRes.ok) throw new Error("Sírbérlők betöltése sikertelen");

            const [payData, tenData] = await Promise.all([
                payRes.json(),
                tenRes.json(),
            ]);

            setPayments(payData);
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

    const handleEdit = (item) => {
        setForm({
            id: item.id,
            sirberlo_id: item.sirberlo_id ?? "",
            osszeg: item.osszeg ?? "",
            befizetesi_datum: item.befizetesi_datum ?? "",
            befizetesi_mod: item.befizetesi_mod ?? "készpénz",
            megjegyzes: item.megjegyzes ?? "",
        });
        setFieldErrors({});
        setError("");
    };

    const handleDelete = async (id) => {
        if (!window.confirm("Biztosan törlöd ezt a befizetést?")) return;
        setSaving(true);
        setError("");
        try {
            const res = await fetch(`${API_BASE}/api/befizetesek/${id}`, {
                method: "DELETE",
            });
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
        const url = form.id ? `${API_BASE}/api/befizetesek/${form.id}` : `${API_BASE}/api/befizetesek`;

        const payload = {
            sirberlo_id: form.sirberlo_id || null,
            osszeg: form.osszeg ? parseFloat(form.osszeg) : null,
            befizetesi_datum: form.befizetesi_datum || null,
            befizetesi_mod: form.befizetesi_mod || "készpénz",
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
                return;
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

    const handleReset = () => {
        setForm(emptyForm);
        setFieldErrors({});
        setError("");
    };

    const filteredPayments = payments.filter((p) => {
        const tenantName = tenants.find((t) => t.id === p.sirberlo_id)?.nev || "";
        const searchLower = searchTerm.toLowerCase();
        return tenantName.toLowerCase().includes(searchLower);
    });

    const getTenantName = (tenantId) => {
        return tenants.find((t) => t.id === tenantId)?.nev || "Ismeretlen";
    };

    return (
        <div className="admin-page admin-payment">
            <h2 className="admin-title">Befizetések Menedzselése</h2>

            {error && <div className="alert alert-error">{error}</div>}

            <div className="payment-container">
                {/* Form Panel */}
                <div className="payment-form-section">
                    <h3 className="section-title">{form.id ? "Befizetés Szerkesztése" : "Új Befizetés"}</h3>
                    <form onSubmit={handleSubmit} className="payment-form">
                        <div className="form-group">
                            <label htmlFor="sirberlo_id">Sírbérlő *</label>
                            <select
                                id="sirberlo_id"
                                name="sirberlo_id"
                                value={form.sirberlo_id}
                                onChange={handleChange}
                                required
                                className={fieldErrors.sirberlo_id ? "input-error" : ""}
                            >
                                <option value="">-- Válassz sírbérlőt --</option>
                                {tenants.map((t) => (
                                    <option key={t.id} value={t.id}>
                                        {t.nev}
                                    </option>
                                ))}
                            </select>
                            {fieldErrors.sirberlo_id && <span className="error-text">{fieldErrors.sirberlo_id}</span>}
                        </div>

                        <div className="form-group">
                            <label htmlFor="osszeg">Összeg (Ft) *</label>
                            <input
                                type="number"
                                id="osszeg"
                                name="osszeg"
                                value={form.osszeg}
                                onChange={handleChange}
                                placeholder="0"
                                step="0.01"
                                required
                                className={fieldErrors.osszeg ? "input-error" : ""}
                            />
                            {fieldErrors.osszeg && <span className="error-text">{fieldErrors.osszeg}</span>}
                        </div>

                        <div className="form-group">
                            <label htmlFor="befizetesi_datum">Befizetés Dátuma *</label>
                            <input
                                type="date"
                                id="befizetesi_datum"
                                name="befizetesi_datum"
                                value={form.befizetesi_datum}
                                onChange={handleChange}
                                required
                                className={fieldErrors.befizetesi_datum ? "input-error" : ""}
                            />
                            {fieldErrors.befizetesi_datum && <span className="error-text">{fieldErrors.befizetesi_datum}</span>}
                        </div>

                        <div className="form-group">
                            <label htmlFor="befizetesi_mod">Befizetési Mód</label>
                            <select
                                id="befizetesi_mod"
                                name="befizetesi_mod"
                                value={form.befizetesi_mod}
                                onChange={handleChange}
                                className={fieldErrors.befizetesi_mod ? "input-error" : ""}
                            >
                                <option value="készpénz">Készpénz</option>
                                <option value="átutalás">Átutalás</option>
                                <option value="kártya">Kártya</option>
                                <option value="csekkbefizet">Csekk</option>
                            </select>
                            {fieldErrors.befizetesi_mod && <span className="error-text">{fieldErrors.befizetesi_mod}</span>}
                        </div>

                        <div className="form-group">
                            <label htmlFor="megjegyzes">Megjegyzés</label>
                            <textarea
                                id="megjegyzes"
                                name="megjegyzes"
                                value={form.megjegyzes}
                                onChange={handleChange}
                                placeholder="Opcionális megjegyzés..."
                                rows="3"
                                className={fieldErrors.megjegyzes ? "input-error" : ""}
                            ></textarea>
                            {fieldErrors.megjegyzes && <span className="error-text">{fieldErrors.megjegyzes}</span>}
                        </div>

                        <div className="form-actions">
                            <button type="submit" disabled={saving} className="btn btn-primary">
                                {saving ? "Mentés..." : form.id ? "Frissítés" : "Hozzáadás"}
                            </button>
                            <button type="button" onClick={handleReset} disabled={saving} className="btn btn-secondary">
                                Mégsem
                            </button>
                        </div>
                    </form>
                </div>

                {/* List Panel */}
                <div className="payment-list-section">
                    <h3 className="section-title">Befizetések Listája</h3>
                    
                    <div className="payment-filters">
                        <input
                            type="text"
                            placeholder="Keresés sírbérlő nevében..."
                            value={searchTerm}
                            onChange={(e) => setSearchTerm(e.target.value)}
                            className="search-input"
                        />
                    </div>

                    {loading ? (
                        <div className="loading">Betöltés...</div>
                    ) : filteredPayments.length === 0 ? (
                        <div className="no-data">Nincsenek befizetések.</div>
                    ) : (
                        <div className="table-wrapper">
                            <table className="payment-table">
                                <thead>
                                    <tr>
                                        <th>Sírbérlő</th>
                                        <th>Összeg (Ft)</th>
                                        <th>Dátum</th>
                                        <th>Befizetési Mód</th>
                                        <th>Megjegyzés</th>
                                        <th>Műveletek</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {filteredPayments.map((p) => (
                                        <tr key={p.id}>
                                            <td>{getTenantName(p.sirberlo_id)}</td>
                                            <td className="amount">{parseFloat(p.osszeg).toLocaleString("hu-HU")} Ft</td>
                                            <td>{p.befizetesi_datum}</td>
                                            <td>{p.befizetesi_mod}</td>
                                            <td className="memo">{p.megjegyzes || "—"}</td>
                                            <td className="actions">
                                                <button
                                                    onClick={() => handleEdit(p)}
                                                    disabled={saving}
                                                    className="btn-icon btn-edit"
                                                    title="Szerkesztés"
                                                >
                                                    ✎
                                                </button>
                                                <button
                                                    onClick={() => handleDelete(p.id)}
                                                    disabled={saving}
                                                    className="btn-icon btn-delete"
                                                    title="Törlés"
                                                >
                                                    🗑
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