import React, { useEffect, useMemo, useState } from "react";
import "../../CSS-ek/AdminPayment.css";
import AdminBackLink from "../../AdminBackLink";

const API_BASE = "http://localhost:8000";

// 1 év = 12 000 Ft
const YEAR_PRICE_FT = 12000;
const MONTH_PRICE_FT = YEAR_PRICE_FT / 12;
const ITEMS_PER_PAGE = 10;

export default function AdminPayment() {
  const emptyForm = {
    id: null,
    sirberlo_id: "",
    elhunyt_id: "",
    osszeg: "",
    datum: "",
  };

  const [payments, setPayments] = useState([]);
  const [tenants, setTenants] = useState([]);
  const [deceased, setDeceased] = useState([]);
  const [form, setForm] = useState(emptyForm);
  const [loading, setLoading] = useState(false);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");
  const [fieldErrors, setFieldErrors] = useState({});
  const [searchTerm, setSearchTerm] = useState("");
  const [currentPage, setCurrentPage] = useState(1);

  const loadData = async () => {
    setLoading(true);
    setError("");
    try {
      const [payRes, tenRes, decRes] = await Promise.all([
        fetch(`${API_BASE}/api/befizetesek`),
        fetch(`${API_BASE}/api/sirberlok`),
        fetch(`${API_BASE}/api/elhunytMindenAdata`),
      ]);

      if (!payRes.ok) throw new Error("Befizetések betöltése sikertelen");
      if (!tenRes.ok) throw new Error("Sírbérlők betöltése sikertelen");
      if (!decRes.ok) throw new Error("Elhunytak betöltése sikertelen");

      const [payData, tenData, decData] = await Promise.all([
        payRes.json(),
        tenRes.json(),
        decRes.json(),
      ]);

      setPayments(Array.isArray(payData) ? payData : []);
      setTenants(Array.isArray(tenData) ? tenData : []);
      setDeceased(Array.isArray(decData) ? decData : []);
    } catch (err) {
      setError(err.message || "Ismeretlen hiba történt.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadData();
  }, []);

  // Success üzenet eltüntetése 3 másodperc után
  useEffect(() => {
    if (success) {
      const timer = setTimeout(() => setSuccess(""), 3000);
      return () => clearTimeout(timer);
    }
  }, [success]);

  const handleChange = (e) => {
    const { name, value } = e.target;

    if (name === "sirberlo_id") {
      setForm((f) => ({ ...f, sirberlo_id: value, elhunyt_id: "" }));
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

  // Összegből számolt hossz (hónap)
  const computedMonths = useMemo(() => {
    const amount = Number(form.osszeg);
    if (!Number.isFinite(amount) || amount <= 0) return null;
    return Math.round(amount / MONTH_PRICE_FT);
  }, [form.osszeg]);

  // Dátum + hónap => lejárat
  const addMonths = (dateStr, months) => {
    if (!dateStr || !months || months <= 0) return null;
    const d = new Date(dateStr);
    if (Number.isNaN(d.getTime())) return null;

    const result = new Date(d);
    result.setMonth(result.getMonth() + Number(months));
    return result;
  };

  const formatDate = (dateValue) => {
    if (!dateValue) return "—";
    const d = new Date(dateValue);
    if (Number.isNaN(d.getTime())) return "—";
    return d.toLocaleDateString("hu-HU");
  };

  // Ha backend nem ad lejarat_datum-ot, kiszámoljuk datum + hossza alapján
  const getExpiryDateText = (payment) => {
    if (payment.lejarat_datum) return formatDate(payment.lejarat_datum);

    const calc = addMonths(payment.datum, Number(payment.hossza));
    return calc ? formatDate(calc) : "—";
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setSaving(true);
    setError("");
    setSuccess("");
    setFieldErrors({});

    const url = `${API_BASE}/api/befizetesek`;
    const payload = {
      sirberlo_id: form.sirberlo_id ? Number(form.sirberlo_id) : null,
      elhunyt_id: form.elhunyt_id ? Number(form.elhunyt_id) : null,
      osszeg: form.osszeg ? parseFloat(form.osszeg) : null,
      datum: form.datum || null,
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
      setCurrentPage(1);
      setSuccess("Befizetés sikeresen hozzáadva!");
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
    setSuccess("");
  };

  const getTenantName = (sirberlo_id) => {
    const t = tenants.find((x) => x.id === Number(sirberlo_id));
    return t ? t.nev : sirberlo_id ? `#${sirberlo_id}` : "—";
  };

  const getDeceasedName = (elhunyt_id) => {
    const d = deceased.find((x) => x.id === Number(elhunyt_id));
    return d ? d.nev : elhunyt_id ? `#${elhunyt_id}` : "—";
  };

  const filteredPayments = payments.filter((p) => {
    if (p.sirberlo_id) {
      const tenantName = getTenantName(p.sirberlo_id) || "";
      return tenantName.toLowerCase().includes(searchTerm.toLowerCase());
    }
    if (p.elhunyt_id) {
      const deceasedName = getDeceasedName(p.elhunyt_id) || "";
      return deceasedName.toLowerCase().includes(searchTerm.toLowerCase());
    }
    return false;
  });

  // Legfrissebb elöl
  const sortedPayments = [...filteredPayments].sort(
    (a, b) => Number(b.id) - Number(a.id)
  );

  const totalPages = Math.max(1, Math.ceil(sortedPayments.length / ITEMS_PER_PAGE));
  const startIndex = (currentPage - 1) * ITEMS_PER_PAGE;
  const endIndex = startIndex + ITEMS_PER_PAGE;
  const paginatedPayments = sortedPayments.slice(startIndex, endIndex);

  const handleSearch = (value) => {
    setSearchTerm(value);
    setCurrentPage(1);
  };

  const formatAmount = (osszeg) => {
    const n = Number(osszeg);
    if (Number.isNaN(n)) return "—";
    return `${n.toLocaleString("hu-HU")} Ft`;
  };

  // Form preview: ha admin tölti az űrlapot, azonnal lássa a várható lejáratot
  const formExpiryPreview = useMemo(() => {
    const calc = addMonths(form.datum, computedMonths);
    return calc ? formatDate(calc) : "—";
  }, [form.datum, computedMonths]);

  return (
    <div className="admin-payment">
      <AdminBackLink />
      <h2 className="admin-title">Befizetések</h2>

      {error && <div className="admin-payment-alert admin-payment-alert--error">{error}</div>}
      {success && <div className="admin-payment-alert admin-payment-alert--success">{success}</div>}

      <div className="admin-payment-container">
        {/* Form Panel */}
        <div className="admin-payment-form-section">
          <h3 className="admin-payment-section-title">Új befizetés</h3>

          <form onSubmit={handleSubmit} className="admin-payment-form">
            <div className="admin-payment-form-group">
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
                <span className="admin-payment-field-error">{fieldErrors.sirberlo_id}</span>
              )}
            </div>

            <div className="admin-payment-form-group">
              <label htmlFor="elhunyt_id">Elhunyt</label>
              <select
                id="elhunyt_id"
                name="elhunyt_id"
                value={form.elhunyt_id}
                onChange={handleChange}
                disabled={saving}
                className={fieldErrors.elhunyt_id ? "input-error" : ""}
              >
                <option value="">-- Válassz elhunytakat --</option>
                {deceased.map((d) => (
                  <option key={d.id} value={d.id}>
                    {d.nev}
                  </option>
                ))}
              </select>
              {fieldErrors.elhunyt_id && (
                <span className="admin-payment-field-error">{fieldErrors.elhunyt_id}</span>
              )}
            </div>

            <div className="admin-payment-form-group">
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
              {fieldErrors.osszeg && (
                <span className="admin-payment-field-error">{fieldErrors.osszeg}</span>
              )}

              <div style={{ marginTop: 6, fontSize: 13, opacity: 0.85 }}>
                Számolt hossz:{" "}
                <strong>{computedMonths === null ? "—" : `${computedMonths} hónap`}</strong>{" "}
                <span>
                  (12 000 Ft/év alapján, ~{MONTH_PRICE_FT.toFixed(2)} Ft/hó)
                </span>
              </div>

              <div style={{ marginTop: 4, fontSize: 13, opacity: 0.85 }}>
                Várható lejárat: <strong>{formExpiryPreview}</strong>
              </div>
            </div>

            <div className="admin-payment-form-group">
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
              {fieldErrors.datum && (
                <span className="admin-payment-field-error">{fieldErrors.datum}</span>
              )}
            </div>

            <div className="admin-payment-form-actions">
              <button type="submit" disabled={saving} className="admin-payment-btn">
                {saving ? "Mentés..." : "Hozzáadás"}
              </button>
              <button
                type="button"
                onClick={handleReset}
                disabled={saving}
                className="admin-payment-btn admin-payment-btn--secondary"
              >
                Mégsem
              </button>
            </div>
          </form>
        </div>

        {/* List Panel */}
        <div className="admin-payment-list-section">
          <h3 className="admin-payment-section-title">Befizetések listája</h3>

          <div className="admin-payment-filters">
            <input
              type="text"
              placeholder="Keresés sírbérlő vagy elhunyt nevében..."
              value={searchTerm}
              onChange={(e) => handleSearch(e.target.value)}
              className="admin-payment-search-input"
            />
          </div>

          {loading ? (
            <div className="admin-payment-loading">Betöltés...</div>
          ) : sortedPayments.length === 0 ? (
            <div className="admin-payment-no-data">Nincsenek befizetések.</div>
          ) : (
            <>
              <div className="admin-payment-table-wrapper">
                <table className="admin-payment-table">
                  <thead>
                    <tr>
                      <th>Sírbérlő</th>
                      <th>Elhunyt</th>
                      <th>Összeg (Ft)</th>
                      <th>Dátum</th>
                      <th>Hossz (hónap)</th>
                      <th>Lejárati dátum</th>
                    </tr>
                  </thead>
                  <tbody>
                    {paginatedPayments.map((p) => (
                      <tr key={p.id}>
                        <td>{getTenantName(p.sirberlo_id)}</td>
                        <td>{p.elhunyt_id ? getDeceasedName(p.elhunyt_id) : "—"}</td>
                        <td className="amount">{formatAmount(p.osszeg)}</td>
                        <td>{formatDate(p.datum)}</td>
                        <td>{p.hossza ?? "—"}</td>
                        <td>{getExpiryDateText(p)}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>

              <div className="admin-payment-pagination-container">
                <div className="admin-payment-pagination-info">
                  Oldal <strong>{currentPage}</strong> / <strong>{totalPages}</strong>{" "}
                  ({sortedPayments.length} befizetés összesen)
                </div>

                <div className="admin-payment-pagination-buttons">
                  <button
                    className="admin-payment-btn"
                    onClick={() => setCurrentPage((p) => Math.max(1, p - 1))}
                    disabled={currentPage === 1}
                  >
                    ← Előző
                  </button>

                  <button
                    className="admin-payment-btn"
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