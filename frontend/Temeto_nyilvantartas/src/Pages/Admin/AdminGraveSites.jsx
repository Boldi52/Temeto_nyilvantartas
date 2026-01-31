import React, { useEffect, useState } from "react";
import "../../CSS-ek/AdminGraveSites.css";

const API_BASE = "http://localhost:8000"; // igazítsd a backend host/portra

export default function AdminGraveSites() {
    const emptyForm = {
        id: null,
        sor_id: "",
        sirkod: "",
        allapot: "",
        foto: "",
        sirberlo_id: "",
    };

    const [graves, setGraves] = useState([]);
    const [sorok, setSorok] = useState([]);
    const [berlok, setBerlok] = useState([]);
    const [form, setForm] = useState(emptyForm);
    const [loading, setLoading] = useState(false);
    const [saving, setSaving] = useState(false);
    const [error, setError] = useState("");
    const [fieldErrors, setFieldErrors] = useState({});

    const loadData = async () => {
        setLoading(true);
        setError("");
        try {
            const [grRes, sorRes, berRes] = await Promise.all([
                fetch(`${API_BASE}/api/sirhelyek`),
                fetch(`${API_BASE}/api/sorok`),
                fetch(`${API_BASE}/api/sirberlok`),
            ]);

            if (!grRes.ok) throw new Error("Sírhelyek betöltése sikertelen");
            if (!sorRes.ok) throw new Error("Sorok betöltése sikertelen");
            if (!berRes.ok) throw new Error("Sírbérlők betöltése sikertelen");

            const [grData, sorData, berData] = await Promise.all([
                grRes.json(),
                sorRes.json(),
                berRes.json(),
            ]);

            setGraves(grData);
            setSorok(sorData);
            setBerlok(berData);
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
            sor_id: item.sor_id ?? "",
            sirkod: item.sirkod ?? "",
            allapot: item.allapot ?? "",
            foto: item.foto ?? "",
            sirberlo_id: item.sirberlo_id ?? "",
        });
        setFieldErrors({});
        setError("");
    };

    const handleDelete = async (id) => {
        if (!window.confirm("Biztosan törlöd ezt a sírhelyet?")) return;
        setSaving(true);
        setError("");
        try {
            const res = await fetch(`${API_BASE}/api/sirhelyek/${id}`, {
                method: "DELETE",
            });
            if (!res.ok) {
                const body = await res.json().catch(() => ({}));
                throw new Error(body.message || "Törlés sikertelen.");
            }
            await loadData();
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
        const url = form.id
            ? `${API_BASE}/api/sirhelyek/${form.id}`
            : `${API_BASE}/api/sirhelyek`;

        // Üres stringek helyett null küldése az opcionális mezőkre
        const payload = {
            sor_id: form.sor_id ? Number(form.sor_id) : null,
            sirkod: form.sirkod || null,
            allapot: form.allapot || null,
            foto: form.foto || null,
            sirberlo_id: form.sirberlo_id ? Number(form.sirberlo_id) : null,
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
                <h2 className="admin-title">Sírhelyek kezelése</h2>
                <p className="admin-text">
                    Itt hozhatsz létre, módosíthatsz vagy törölhetsz sírhelyeket.
                </p>
            </div>

            <div className="graves-grid">
                <div className="graves-card">
                    <h3 className="section-title">{isEditing ? "Szerkesztés" : "Új sírhely"}</h3>
                    {error && <div className="alert alert-error">{error}</div>}
                    <form className="graves-form" onSubmit={handleSubmit}>
                        <label>
                            Sor
                            <select
                                name="sor_id"
                                value={form.sor_id}
                                onChange={handleChange}
                                required
                            >
                                <option value="">Válassz sort…</option>
                                {sorok.map((s) => (
                                    <option key={s.id} value={s.id}>
                                        {s.nev} (#{s.id})
                                    </option>
                                ))}
                            </select>
                            {fieldErrors.sor_id && <div className="field-error">{fieldErrors.sor_id}</div>}
                        </label>

                        <label>
                            Sírkód
                            <input
                                name="sirkod"
                                value={form.sirkod}
                                onChange={handleChange}
                                placeholder="pl. S011"
                            />
                            {fieldErrors.sirkod && <div className="field-error">{fieldErrors.sirkod}</div>}
                        </label>

                        <label>
                            Állapot
                            <input
                                name="allapot"
                                value={form.allapot}
                                onChange={handleChange}
                                placeholder="szabad / foglalva / stb."
                            />
                            {fieldErrors.allapot && <div className="field-error">{fieldErrors.allapot}</div>}
                        </label>

                        <label>
                            Fotó (URL vagy elérési út)
                            <input
                                name="foto"
                                value={form.foto}
                                onChange={handleChange}
                                placeholder="pl. /uploads/sirhely.jpg"
                            />
                            {fieldErrors.foto && <div className="field-error">{fieldErrors.foto}</div>}
                        </label>

                        <label>
                            Sírbérlő (opcionális)
                            <select
                                name="sirberlo_id"
                                value={form.sirberlo_id}
                                onChange={handleChange}
                            >
                                <option value="">— nincs hozzárendelve —</option>
                                {berlok.map((b) => (
                                    <option key={b.id} value={b.id}>
                                        {b.nev} (#{b.id})
                                    </option>
                                ))}
                            </select>
                            {fieldErrors.sirberlo_id && (
                                <div className="field-error">{fieldErrors.sirberlo_id}</div>
                            )}
                        </label>

                        <div className="form-actions">
                            <button type="submit" disabled={saving}>
                                {isEditing ? "Mentés" : "Hozzáadás"}
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

                <div className="graves-card">
                    <div className="list-header">
                        <h3 className="section-title">Sírhelyek listája</h3>
                        <button onClick={loadData} disabled={loading || saving}>
                            Frissítés
                        </button>
                    </div>
                    {loading ? (
                        <div className="alert">Betöltés…</div>
                    ) : (
                        <div className="table-wrapper">
                            <table className="graves-table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Sor</th>
                                        <th>Sírkód</th>
                                        <th>Állapot</th>
                                        <th>Fotó</th>
                                        <th>Bérlő</th>
                                        <th>Műveletek</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {graves.length === 0 && (
                                        <tr>
                                            <td colSpan="7" className="empty">
                                                Nincs adat.
                                            </td>
                                        </tr>
                                    )}
                                    {graves.map((g) => (
                                        <tr key={g.id}>
                                            <td>{g.id}</td>
                                            <td>{g.sor_id ?? "—"}</td>
                                            <td>{g.sirkod ?? "—"}</td>
                                            <td>{g.allapot ?? "—"}</td>
                                            <td className="mono">{g.foto ?? "—"}</td>
                                            <td>{g.sirberlo_id ?? "—"}</td>
                                            <td className="actions">
                                                <button onClick={() => handleEdit(g)}>Szerk.</button>
                                                <button
                                                    className="danger"
                                                    onClick={() => handleDelete(g.id)}
                                                    disabled={saving}
                                                >
                                                    Törlés
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