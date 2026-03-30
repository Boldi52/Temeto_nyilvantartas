import React, { useEffect, useState } from "react";
import "../../CSS-ek/AdminGraveSites.css";
import AdminBackLink from "../../AdminBackLink";

const API_BASE = "http://localhost:8000";

export default function AdminGraveSites() {
    const emptyForm = {
        id: null,
        parcella_id: "",
        sor_id: "",
        sirkod: "",
        allapot: "",
        foto: "",
        sirberlo_id: "",
    };

    const [graves, setGraves] = useState([]);
    const [parcellak, setParcellak] = useState([]);
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
            const [grRes, parRes, sorRes, berRes] = await Promise.all([
                fetch(`${API_BASE}/api/sirhelyek`),
                fetch(`${API_BASE}/api/parcellak`),
                fetch(`${API_BASE}/api/sorok`),
                fetch(`${API_BASE}/api/sirberlok`),
            ]);

            if (!grRes.ok) throw new Error("Sírhelyek betöltése sikertelen");
            if (!parRes.ok) throw new Error("Parcellák betöltése sikertelen");
            if (!sorRes.ok) throw new Error("Sorok betöltése sikertelen");
            if (!berRes.ok) throw new Error("Sírbérlők betöltése sikertelen");

            const [grData, parData, sorData, berData] = await Promise.all([
                grRes.json(),
                parRes.json(),
                sorRes.json(),
                berRes.json(),
            ]);

            setGraves(grData);
            setParcellak(parData);
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
            parcella_id: item.parcella_id ?? "",
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

        const payload = {
            parcella_id: form.parcella_id ? Number(form.parcella_id) : null,
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

    // Csak a kiválasztott parcellához tartozó sorok
    const filteredSorok = form.parcella_id
        ? sorok.filter((s) => Number(s.parcella_id) === Number(form.parcella_id))
        : [];

    const isEditing = !!form.id;

    return (
        <div className="admin-gravesites-page">
            <AdminBackLink />
            <div className="admin-gravesites-header">
                <h2 className="admin-gravesites-section-title" style={{ fontSize: "1.5rem", marginBottom: "0.5rem" }}>
                    Sírhelyek kezelése
                </h2>
                <p style={{ color: "#6b7280", fontSize: "0.95rem" }}>
                    Itt hozhatsz létre, módosíthatsz vagy törölhetsz sírhelyeket.
                </p>
            </div>

            <div className="admin-gravesites-grid">
                <div className="admin-gravesites-card">
                    <h3 className="admin-gravesites-section-title">
                        {isEditing ? "Szerkesztés" : "Új sírhely"}
                    </h3>
                    {error && (
                        <div className="admin-gravesites-alert admin-gravesites-alert--error">
                            {error}
                        </div>
                    )}
                    <form className="admin-gravesites-form" onSubmit={handleSubmit}>
                        <label>
                            Parcella
                            <select
                                name="parcella_id"
                                value={form.parcella_id}
                                onChange={handleChange}
                                required
                            >
                                <option value="">Válassz parcelláját…</option>
                                {parcellak.map((p) => (
                                    <option key={p.id} value={p.id}>
                                        {p.nev} (#{p.id})
                                    </option>
                                ))}
                            </select>
                            {fieldErrors.parcella_id && (
                                <div className="admin-gravesites-field-error">
                                    {fieldErrors.parcella_id}
                                </div>
                            )}
                        </label>

                        <label>
                            Sor
                            <select
                                name="sor_id"
                                value={form.sor_id}
                                onChange={handleChange}
                                required
                                disabled={!form.parcella_id}
                            >
                                <option value="">Válassz sort…</option>
                                {filteredSorok.map((s) => (
                                    <option key={s.id} value={s.id}>
                                        {s.nev} (#{s.id})
                                    </option>
                                ))}
                            </select>
                            {fieldErrors.sor_id && (
                                <div className="admin-gravesites-field-error">
                                    {fieldErrors.sor_id}
                                </div>
                            )}
                        </label>

                        <label>
                            Sírkód
                            <input
                                name="sirkod"
                                value={form.sirkod}
                                onChange={handleChange}
                                placeholder="pl. S011"
                            />
                            {fieldErrors.sirkod && (
                                <div className="admin-gravesites-field-error">
                                    {fieldErrors.sirkod}
                                </div>
                            )}
                        </label>

                        <label>
                            Állapot
                            <input
                                name="allapot"
                                value={form.allapot}
                                onChange={handleChange}
                                placeholder="szabad / foglalva / stb."
                            />
                            {fieldErrors.allapot && (
                                <div className="admin-gravesites-field-error">
                                    {fieldErrors.allapot}
                                </div>
                            )}
                        </label>

                        <label>
                            Fotó (URL vagy elérési út)
                            <input
                                name="foto"
                                value={form.foto}
                                onChange={handleChange}
                                placeholder="pl. /uploads/sirhely.jpg"
                            />
                            {fieldErrors.foto && (
                                <div className="admin-gravesites-field-error">
                                    {fieldErrors.foto}
                                </div>
                            )}
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
                                <div className="admin-gravesites-field-error">
                                    {fieldErrors.sirberlo_id}
                                </div>
                            )}
                        </label>

                        <div className="admin-gravesites-form-actions">
                            <button type="submit" disabled={saving}>
                                {isEditing ? "Mentés" : "Hozzáadás"}
                            </button>
                            {isEditing && (
                                <button
                                    type="button"
                                    className="admin-gravesites-btn--ghost"
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

                <div className="admin-gravesites-card">
                    <div className="admin-gravesites-list-header">
                        <h3 className="admin-gravesites-section-title">
                            Sírhelyek listája
                        </h3>
                        <button
                            onClick={loadData}
                            disabled={loading || saving}
                        >
                            Frissítés
                        </button>
                    </div>
                    {loading ? (
                        <div className="admin-gravesites-alert">Betöltés…</div>
                    ) : (
                        <div className="admin-gravesites-table-wrapper">
                            <table className="admin-gravesites-table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Parcella</th>
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
                                            <td colSpan="8" className="empty">
                                                Nincs adat.
                                            </td>
                                        </tr>
                                    )}
                                    {graves.map((g) => (
                                        <tr key={g.id}>
                                            <td>{g.id}</td>
                                            <td>{g.parcella_id ?? "—"}</td>
                                            <td>{g.sor_id ?? "—"}</td>
                                            <td>{g.sirkod ?? "—"}</td>
                                            <td>{g.allapot ?? "—"}</td>
                                            <td className="mono">{g.foto ?? "—"}</td>
                                            <td>{g.sirberlo_id ?? "—"}</td>
                                            <td className="admin-gravesites-actions">
                                                <button onClick={() => handleEdit(g)}>
                                                    Szerk.
                                                </button>
                                                <button
                                                    className="admin-gravesites-btn--danger"
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