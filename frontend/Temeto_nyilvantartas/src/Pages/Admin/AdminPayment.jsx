import React, { useEffect, useMemo, useState } from "react";
import "../../CSS-ek/AdminPayment.css";

const API_BASE = "http://localhost:8000";

// 1 év = 35 000 Ft
const YEAR_PRICE_FT = 35000;
const MONTH_PRICE_FT = YEAR_PRICE_FT / 12;

export default function AdminPayment() {
  const emptyForm = {
    id: null,
    sirberlo_id: "",
    osszeg: "",
    datum: "",
  };

  const [payments, setPayments] = useState([]);
  const [tenants, setTenants] = useState([]);
  const [form, setForm] = useState(emptyForm);
  const [loading, setLoading] = useState(false);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");
  const [fieldErrors, setFieldErrors] = useState({});
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

      const [payData, tenData] = await Promise.all([payRes.json(), tenRes.json()]);

      setPayments(Array.isArray(payData) ? payData : []);
      setTenants(Array.isArray(tenData) ? tenData : []);
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

  // Hossz (hónap) számítása az űrlapon beírt összegből (kerekítve)
  const computedMonths = useMemo(() => {
    const amount = Number(form.osszeg);
    if (!Number.isFinite(amount) || amount <= 0) return null;
    return Math.round(amount / MONTH_PRICE_FT);
  }, [form.osszeg]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setSaving(true);
    setError("");
    setFieldErrors({});

    const url = `${API_BASE}/api/befizetesek`;
    const payload = {
      sirberlo_id: form.sirberlo_id ? Number(form.sirberlo_id) : null,
      osszeg: form.osszeg ? parseFloat(form.osszeg) : null,
      datum: form.datum || null,
      // backend mező: hossza (hónap) -> itt küldjük a számolt értéket
      hossza: computedMonths,
    };

    try {
      const res = await fetch(url, {
        method: "POST",
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

  const getTenantName = (sirberlo_id) => {
    const t = tenants.find((x) => x.id === Number(sirberlo_id));
    return t ? t.nev : sirberlo_id ? `#${sirberlo_id}` : "—";
  };

  const filteredPayments = payments.filter((p) => {
    const tenantName = getTenantName(p.sirberlo_id) || "";
    return tenantName.toLowerCase().includes(searchTerm.toLowerCase());
  });

  const formatAmount = (osszeg) => {
    const n = Number(osszeg);
    if (Number.isNaN(n)) return "—";
    return `${n.toLocaleString("hu-HU")} Ft`;
  };

  return (
    <div className="admin-page admin-payment">
      <h2 className="admin-title">Befizetések</h2>

      {error && <div className="alert alert-error">{error}</div>}

      <div className="payment-container">
        {/* Form Panel */}
        <div className="payment-form-section">
          <h3 className="section-title">Új befizetés</h3>

          <form onSubmit={handleSubmit} className="payment-form">
            <div className="form-group">
              <label htmlFor="sirberlo_id">Sírbérlő *</label>
              <select
                id="sirberlo_id"
                name="sirberlo_id"
                value={form.sirberlo_id}
                onChange={handleChange}
                required
                disabled={saving}
                className={fieldErrors.sirberlo_id ? "input-error" : ""}
              >
                <option value="">-- Válassz sírbérlőt --</option>
                {tenants.map((t) => (
                  <option key={t.id} value={t.id}>
                    {t.nev}
                  </option>
                ))}
              </select>
              {fieldErrors.sirberlo_id && (
                <span className="error-text">{fieldErrors.sirberlo_id}</span>
              )}
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
                disabled={saving}
                className={fieldErrors.osszeg ? "input-error" : ""}
              />
              {fieldErrors.osszeg && <span className="error-text">{fieldErrors.osszeg}</span>}

              <div style={{ marginTop: 6, fontSize: 13, opacity: 0.85 }}>
                Számolt hossz:{" "}
                <strong>{computedMonths === null ? "—" : `${computedMonths} hónap`}</strong>{" "}
                <span>
                  (35 000 Ft/év alapján, ~{MONTH_PRICE_FT.toFixed(2)} Ft/hó)
                </span>
              </div>
            </div>

            <div className="form-group">
              <label htmlFor="datum">Dátum *</label>
              <input
                type="date"
                id="datum"
                name="datum"
                value={form.datum}
                onChange={handleChange}
                required
                disabled={saving}
                className={fieldErrors.datum ? "input-error" : ""}
              />
              {fieldErrors.datum && <span className="error-text">{fieldErrors.datum}</span>}
            </div>

            <div className="form-actions">
              <button type="submit" disabled={saving} className="btn btn-primary">
                {saving ? "Mentés..." : "Hozzáadás"}
              </button>
              <button
                type="button"
                onClick={handleReset}
                disabled={saving}
                className="btn btn-secondary"
              >
                Mégsem
              </button>
            </div>
          </form>
        </div>

        {/* List Panel */}
        <div className="payment-list-section">
          <h3 className="section-title">Befizetések listája</h3>

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
                    <th>Hossz (hónap)</th>
                  </tr>
                </thead>
                <tbody>
                  {filteredPayments.map((p) => (
                    <tr key={p.id}>
                      <td>{getTenantName(p.sirberlo_id)}</td>
                      <td className="amount">{formatAmount(p.osszeg)}</td>
                      <td>{p.datum || "—"}</td>
                      <td>{p.hossza ?? "—"}</td>
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