import React, { useEffect, useRef, useState } from "react";
import "../../CSS-ek/AdminGraveSites.css";
import AdminBackLink from "../../AdminBackLink";

const API_BASE = "http://localhost:8000";
const ITEMS_PER_PAGE = 5;
const MOBILE_BREAKPOINT = 768;

export default function AdminGraveSites() {
  const emptyForm = {
    id: null,
    parcella_id: "",
    sor_id: "",
    sorszam: "",
    sirhely_tipus_id: "",
    allapot: "",
    foto: "",
    sirberlo_id: "",
  };

  const [graves, setGraves] = useState([]);
  const [parcellak, setParcellak] = useState([]);
  const [sorok, setSorok] = useState([]);
  const [berlok, setBerlok] = useState([]);
  const [sirhelyTipusok, setSirhelyTipusok] = useState([]);
  const [form, setForm] = useState(emptyForm);

  const [loading, setLoading] = useState(false);
  const [saving, setSaving] = useState(false);

  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");
  const [fieldErrors, setFieldErrors] = useState({});

  const [currentPage, setCurrentPage] = useState(1);
  const listTopRef = useRef(null);

  const scrollListToTopOnMobile = () => {
    if (window.innerWidth <= MOBILE_BREAKPOINT) {
      listTopRef.current?.scrollIntoView({
        behavior: "smooth",
        block: "start",
      });
    }
  };

  const goToPrevPage = () => {
    setCurrentPage((prev) => Math.max(1, prev - 1));
    scrollListToTopOnMobile();
  };

  const goToNextPage = () => {
    setCurrentPage((prev) => {
      const max = Math.max(1, Math.ceil(graves.length / ITEMS_PER_PAGE));
      return Math.min(max, prev + 1);
    });
    scrollListToTopOnMobile();
  };

  const normalizeFieldErrors = (errorsObj = {}) => {
    const normalized = {};
    Object.entries(errorsObj).forEach(([key, value]) => {
      if (Array.isArray(value)) normalized[key] = value[0];
      else normalized[key] = value;
    });
    return normalized;
  };

  const loadData = async () => {
    setLoading(true);
    setError("");
    try {
      const [grRes, parRes, sorRes, berRes, tipusRes] = await Promise.all([
        fetch(`${API_BASE}/api/sirhelyek`),
        fetch(`${API_BASE}/api/parcellak`),
        fetch(`${API_BASE}/api/sorok`),
        fetch(`${API_BASE}/api/sirberlok`),
        fetch(`${API_BASE}/api/sirhelytipusok`),
      ]);

      if (!grRes.ok) throw new Error("Sírhelyek betöltése sikertelen.");
      if (!parRes.ok) throw new Error("Parcellák betöltése sikertelen.");
      if (!sorRes.ok) throw new Error("Sorok betöltése sikertelen.");
      if (!berRes.ok) throw new Error("Sírbérlők betöltése sikertelen.");
      if (!tipusRes.ok) throw new Error("Sírhely típusok betöltése sikertelen.");

      const [grData, parData, sorData, berData, tipusData] = await Promise.all([
        grRes.json(),
        parRes.json(),
        sorRes.json(),
        berRes.json(),
        tipusRes.json(),
      ]);

      const safeGraves = Array.isArray(grData) ? grData : [];
      setGraves(safeGraves);
      setParcellak(Array.isArray(parData) ? parData : []);
      setSorok(Array.isArray(sorData) ? sorData : []);
      setBerlok(Array.isArray(berData) ? berData : []);
      setSirhelyTipusok(Array.isArray(tipusData) ? tipusData : []);

      const maxPage = Math.max(1, Math.ceil(safeGraves.length / ITEMS_PER_PAGE));
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
    setForm((f) => ({ ...f, [name]: value }));

    if (fieldErrors[name]) {
      setFieldErrors((prev) => {
        const next = { ...prev };
        delete next[name];
        return next;
      });
    }

    if (error) setError("");
    if (success) setSuccess("");
  };

  const handleEdit = (item) => {
    const selectedSor = sorok.find((s) => Number(s.id) === Number(item.sor_id));

    setForm({
      id: item.id,
      parcella_id: selectedSor?.parcella_id ? String(selectedSor.parcella_id) : "",
      sor_id: item.sor_id ? String(item.sor_id) : "",
      sorszam: item.sorszam ?? "",
      sirhely_tipus_id: item.sirhely_tipus_id ? String(item.sirhely_tipus_id) : "",
      allapot: item.allapot ?? "",
      foto: item.foto ?? "",
      sirberlo_id: item.sirberlo_id ? String(item.sirberlo_id) : "",
    });

    setFieldErrors({});
    setError("");
    setSuccess("");
  };

  const handleDelete = async (id) => {
    if (!window.confirm("Biztosan törlöd ezt a sírhelyet?")) return;

    setSaving(true);
    setError("");
    setSuccess("");

    try {
      const res = await fetch(`${API_BASE}/api/sirhelyek/${id}`, {
        method: "DELETE",
      });

      if (!res.ok) {
        const body = await res.json().catch(() => ({}));
        throw new Error(body.message || "Törlés sikertelen.");
      }

      await loadData();
      setCurrentPage(1);
      setSuccess("Sikeres törlés.");
      scrollListToTopOnMobile();
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

    const method = form.id ? "PUT" : "POST";
    const url = form.id
      ? `${API_BASE}/api/sirhelyek/${form.id}`
      : `${API_BASE}/api/sirhelyek`;

    const payload = {
      sor_id: form.sor_id ? Number(form.sor_id) : null,
      sorszam: form.sorszam ? Number(form.sorszam) : null,
      sirhely_tipus_id: form.sirhely_tipus_id ? Number(form.sirhely_tipus_id) : null,
      allapot: form.allapot?.trim() || null,
      foto: form.foto?.trim() || null,
      sirberlo_id: form.sirberlo_id ? Number(form.sirberlo_id) : null,
    };

    try {
      const res = await fetch(url, {
        method,
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload),
      });

      const body = await res.json().catch(() => ({}));

      if (res.status === 422) {
        setFieldErrors(normalizeFieldErrors(body.errors || {}));
        setError(body.message || "Kérlek javítsd a hibás mezőket.");
        return;
      }

      if (!res.ok) {
        throw new Error(body.message || "Mentés sikertelen.");
      }

      await loadData();
      setForm(emptyForm);
      setCurrentPage(1);
      setSuccess("Sikeres mentés.");
      scrollListToTopOnMobile();
    } catch (err) {
      setError(err.message || "Ismeretlen hiba történt.");
    } finally {
      setSaving(false);
    }
  };

  const filteredSorok = form.parcella_id
    ? sorok.filter((s) => Number(s.parcella_id) === Number(form.parcella_id))
    : [];

  const getTenantName = (sirberlo_id) => {
    if (!sirberlo_id) return "—";
    const tenant = berlok.find((b) => Number(b.id) === Number(sirberlo_id));
    return tenant?.nev ?? "—";
  };

  const getParcellaNameFromSorId = (sor_id) => {
    if (!sor_id) return "—";
    const sor = sorok.find((s) => Number(s.id) === Number(sor_id));
    if (!sor) return "—";
    const parcella = parcellak.find((p) => Number(p.id) === Number(sor.parcella_id));
    return parcella?.nev ?? "—";
  };

  const getSirhelyTipusNev = (sirhely_tipus_id) => {
    if (!sirhely_tipus_id) return "—";
    const tipus = sirhelyTipusok.find((t) => Number(t.id) === Number(sirhely_tipus_id));
    return tipus?.tipus_nev ?? tipus?.nev ?? tipus?.megnevezes ?? "—";
  };

  const isEditing = !!form.id;
  const totalPages = Math.max(1, Math.ceil(graves.length / ITEMS_PER_PAGE));

  const sortedGraves = [...graves].sort((a, b) => Number(b.id) - Number(a.id));
  const startIndex = (currentPage - 1) * ITEMS_PER_PAGE;
  const paginatedGraves = sortedGraves.slice(startIndex, startIndex + ITEMS_PER_PAGE);

  return (
    <div className="admin-gravesites-page">
      <AdminBackLink />

      <div className="admin-gravesites-header">
        <h2 className="admin-gravesites-section-title admin-gravesites-main-title">
          Sírhelyek kezelése
        </h2>
        <p className="admin-gravesites-subtitle">
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

          {success && (
            <div className="admin-gravesites-alert admin-gravesites-alert--success">
              {success}
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
                disabled={saving}
              >
                <option value="">Válassz parcellát…</option>
                {parcellak.map((p) => (
                  <option key={p.id} value={p.id}>
                    {p.nev}
                  </option>
                ))}
              </select>
            </label>

            <label>
              Sor
              <select
                name="sor_id"
                value={form.sor_id}
                onChange={handleChange}
                required
                disabled={!form.parcella_id || saving}
              >
                <option value="">Válassz sort…</option>
                {filteredSorok.map((s) => (
                  <option key={s.id} value={s.id}>
                    {s.nev}
                  </option>
                ))}
              </select>
              {fieldErrors.sor_id && (
                <div className="admin-gravesites-field-error">{fieldErrors.sor_id}</div>
              )}
            </label>

            <label>
              Sorszám
              <input
                name="sorszam"
                value={form.sorszam}
                onChange={handleChange}
                placeholder="pl. 3"
                disabled={saving}
              />
              {fieldErrors.sorszam && (
                <div className="admin-gravesites-field-error">{fieldErrors.sorszam}</div>
              )}
            </label>

            <label>
              Típus
              <select
                name="sirhely_tipus_id"
                value={form.sirhely_tipus_id}
                onChange={handleChange}
                required
                disabled={saving}
              >
                <option value="">Válassz típust…</option>
                {sirhelyTipusok.map((t) => (
                  <option key={t.id} value={t.id}>
                    {t.tipus_nev ?? t.nev ?? t.megnevezes ?? `Típus #${t.id}`}
                  </option>
                ))}
              </select>
              {fieldErrors.sirhely_tipus_id && (
                <div className="admin-gravesites-field-error">{fieldErrors.sirhely_tipus_id}</div>
              )}
            </label>

            <label>
              Állapot
              <input
                name="allapot"
                value={form.allapot}
                onChange={handleChange}
                placeholder="elhanyagolt, rendben tartott stb."
                disabled={saving}
              />
              {fieldErrors.allapot && (
                <div className="admin-gravesites-field-error">{fieldErrors.allapot}</div>
              )}
            </label>

            <label>
              Fotó (URL vagy elérési út)
              <input
                name="foto"
                value={form.foto}
                onChange={handleChange}
                placeholder="pl. asd.jpg"
                disabled={saving}
              />
              {fieldErrors.foto && (
                <div className="admin-gravesites-field-error">{fieldErrors.foto}</div>
              )}
            </label>

            <label>
              Sírbérlő (opcionális)
              <select
                name="sirberlo_id"
                value={form.sirberlo_id}
                onChange={handleChange}
                disabled={saving}
              >
                <option value="">--válassz sírbérlőt--</option>
                {berlok.map((b) => (
                  <option key={b.id} value={b.id}>
                    {b.nev}
                  </option>
                ))}
              </select>
              {fieldErrors.sirberlo_id && (
                <div className="admin-gravesites-field-error">{fieldErrors.sirberlo_id}</div>
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
                    setSuccess("");
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
          <div className="admin-gravesites-list-header" ref={listTopRef}>
            <h3 className="admin-gravesites-section-title">Sírhelyek listája</h3>
            <button onClick={loadData} disabled={loading || saving}>
              Frissítés
            </button>
          </div>

          {loading ? (
            <div className="admin-gravesites-alert">Betöltés…</div>
          ) : (
            <>
              <div className="admin-gravesites-table-wrapper">
                <table className="admin-gravesites-table">
                  <thead>
                    <tr>
                      <th>Parcella</th>
                      <th>Sor</th>
                      <th>Sorszám</th>
                      <th>Típus</th>
                      <th>Állapot</th>
                      <th>Fotó</th>
                      <th>Bérlő</th>
                      <th>Műveletek</th>
                    </tr>
                  </thead>
                  <tbody>
                    {paginatedGraves.length === 0 && (
                      <tr>
                        <td colSpan="8" className="empty">
                          Nincs adat.
                        </td>
                      </tr>
                    )}

                    {paginatedGraves.map((g) => (
                      <tr key={g.id}>
                        <td>{getParcellaNameFromSorId(g.sor_id)}</td>
                        <td>{g.sor_id ?? "—"}</td>
                        <td>{g.sorszam ?? "—"}</td>
                        <td>{getSirhelyTipusNev(g.sirhely_tipus_id)}</td>
                        <td>{g.allapot ?? "—"}</td>
                        <td className="mono">{g.foto ?? "—"}</td>
                        <td>{getTenantName(g.sirberlo_id)}</td>
                        <td className="admin-gravesites-actions">
                          <button onClick={() => handleEdit(g)}>Szerk.</button>
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

                <div className="admin-gravesites-mobile-list">
                  {paginatedGraves.length === 0 && (
                    <div className="admin-gravesites-mobile-empty">Nincs adat.</div>
                  )}

                  {paginatedGraves.map((g) => (
                    <div className="admin-gravesites-mobile-card" key={`m-${g.id}`}>
                      <div><strong>Parcella:</strong> {getParcellaNameFromSorId(g.sor_id)}</div>
                      <div><strong>Sor:</strong> {g.sor_id ?? "—"}</div>
                      <div><strong>Sorszám:</strong> {g.sorszam ?? "—"}</div>
                      <div><strong>Típus:</strong> {getSirhelyTipusNev(g.sirhely_tipus_id)}</div>
                      <div><strong>Állapot:</strong> {g.allapot ?? "—"}</div>
                      <div><strong>Fotó:</strong> <span className="mono">{g.foto ?? "—"}</span></div>
                      <div><strong>Bérlő:</strong> {getTenantName(g.sirberlo_id)}</div>

                      <div className="admin-gravesites-actions">
                        <button onClick={() => handleEdit(g)}>Szerk.</button>
                        <button
                          className="admin-gravesites-btn--danger"
                          onClick={() => handleDelete(g.id)}
                          disabled={saving}
                        >
                          Törlés
                        </button>
                      </div>
                    </div>
                  ))}
                </div>
              </div>

              <div className="admin-gravesites-pagination-container">
                <div className="admin-gravesites-pagination-info">
                  Oldal <strong>{currentPage}</strong> / <strong>{totalPages}</strong> ({graves.length} sírhely összesen)
                </div>

                <div className="admin-gravesites-pagination-buttons">
                  <button
                    className="admin-gravesites-btn"
                    onClick={goToPrevPage}
                    disabled={currentPage === 1}
                  >
                    ← Előző
                  </button>

                  <button
                    className="admin-gravesites-btn"
                    onClick={goToNextPage}
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