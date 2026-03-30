import React, { useEffect, useMemo, useState } from "react";
import "../CSS-ek/GraveSites.css";

const API_BASE = "http://127.0.0.1:8000"; // Laravel backend címe

const GraveSites = () => {
  const [elhunytak, setElhunytak] = useState([]);
  const [sirhelyek, setSirhelyek] = useState([]);
  const [loading, setLoading] = useState(true);
  const [hiba, setHiba] = useState("");

  const [kereses, setKereses] = useState("");
  const [kivalasztott, setKivalasztott] = useState(null);

  const [zoomOpen, setZoomOpen] = useState(false);
  const [zoomSrc, setZoomSrc] = useState("");
  const [zoomAlt, setZoomAlt] = useState("Kép");

  useEffect(() => {
    const fetchJson = async (url, headers) => {
      const resp = await fetch(url, { headers });

      const text = await resp.text();
      let json = null;
      try {
        json = text ? JSON.parse(text) : null;
      } catch {}

      if (!resp.ok) {
        throw new Error(
          `[${url}] HTTP ${resp.status} ${resp.statusText}\n${text || "(üres válasz)"}`
        );
      }

      return json;
    };

    const parseArray = (body, fallbackKeys = []) => {
      if (Array.isArray(body)) return body;
      if (Array.isArray(body?.data)) return body.data;
      for (const key of fallbackKeys) {
        if (Array.isArray(body?.[key])) return body[key];
      }
      return [];
    };

    const fetchAdatok = async () => {
      try {
        setLoading(true);
        setHiba("");

        const token = localStorage.getItem("token");
        const headers = {
          Accept: "application/json",
          ...(token ? { Authorization: `Bearer ${token}` } : {}),
        };

        const [elhunytBody, sirhelyBody] = await Promise.all([
          fetchJson(`${API_BASE}/api/elhunytMindenAdata`, headers),
          fetchJson(`${API_BASE}/api/sirhelyek`, headers),
        ]);

        const elhunytLista = parseArray(elhunytBody, ["elhunytak", "elhunyt"]);
        const sirhelyLista = parseArray(sirhelyBody, ["sirhelyek", "sirhely"]);

        setElhunytak(elhunytLista);
        setSirhelyek(sirhelyLista);
      } catch (err) {
        setHiba(err.message || "Nem sikerült betölteni az adatokat az API-ból.");
      } finally {
        setLoading(false);
      }
    };

    fetchAdatok();
  }, []);

  // Esc bezárja a zoomot
  useEffect(() => {
    if (!zoomOpen) return;

    const onKeyDown = (e) => {
      if (e.key === "Escape") setZoomOpen(false);
    };

    window.addEventListener("keydown", onKeyDown);
    return () => window.removeEventListener("keydown", onKeyDown);
  }, [zoomOpen]);

  // ha új kiválasztott lesz, zárjuk a zoomot (ne maradjon nyitva másik képre)
  useEffect(() => {
    setZoomOpen(false);
  }, [kivalasztott]);

  const normalize = (text) =>
    (text || "")
      .toString()
      .normalize("NFD")
      .replace(/[\u0300-\u036f]/g, "")
      .toLowerCase()
      .trim();

  const formatDate = (dateStr) => {
    if (!dateStr) return "-";
    const d = new Date(dateStr);
    if (Number.isNaN(d.getTime())) return String(dateStr);
    return d.toLocaleDateString("hu-HU");
  };

  const getNev = (e) => e?.nev ?? "";
  const getSzul = (e) => e?.szul_datum ?? null;
  const getHalal = (e) => e?.halal_datuma ?? null;
  const getSirhelyId = (e) => e?.sirhely_id ?? null;
  const getEntityId = (e, i) => e?.id ?? `${getNev(e)}-${i}`;

  const talalatok = useMemo(() => {
    const q = normalize(kereses);
    if (!q) return [];
    return elhunytak.filter((e) => normalize(getNev(e)).includes(q));
  }, [kereses, elhunytak]);

  const kivalasztottSirhely = useMemo(() => {
    const sid = getSirhelyId(kivalasztott);
    if (!sid) return null;
    return sirhelyek.find((s) => String(s?.id) === String(sid)) || null;
  }, [kivalasztott, sirhelyek]);

  const azonosSirhelyenFekvok = useMemo(() => {
    const sid = getSirhelyId(kivalasztott);
    if (!sid) return [];
    return elhunytak.filter((e) => String(getSirhelyId(e)) === String(sid));
  }, [kivalasztott, elhunytak]);

  const getSirhelyFotoUrl = (sirhely) => {
    const raw = sirhely?.foto ? String(sirhely.foto).trim() : "";
    if (!raw) return "";
    if (/^https?:\/\//i.test(raw)) return raw;
    if (raw.startsWith("/")) return `${API_BASE}${raw}`;
    return `${API_BASE}/${raw}`;
  };

  const isSelectedRow = (e) =>
    String(getEntityId(e, 0)) === String(getEntityId(kivalasztott, 0)) &&
    String(getSirhelyId(e)) === String(getSirhelyId(kivalasztott));

  const onRowActivate = (e) => {
    setKivalasztott(e);
  };

  const openZoom = (src, alt) => {
    if (!src) return;
    setZoomSrc(src);
    setZoomAlt(alt || "Kép");
    setZoomOpen(true);
  };

 if (loading) {
  return (
    <div className="deceasedpage-wrapper loading-center">
      <div className="spinner" role="status" aria-label="Betöltés" />
    </div>
  );
}

  const fotoSrc = getSirhelyFotoUrl(kivalasztottSirhely);
  const fotoAlt =
    kivalasztottSirhely?.sirkod ? `Sírhely: ${kivalasztottSirhely.sirkod}` : "S��rhely fotó";

  return (
    <div className="gravesites-wrapper">
      <div className="gravesites-inner">
        <div className="gravesites-header">
          <h1 className="gravesites-header__title">Sírhely-nyilvántartás</h1>
          <p className="gravesites-header__subtitle">
            Keress elhunytat név alapján, majd kattints egy sorra a részletek megjelenítéséhez.
          </p>
        </div>

        {hiba && <div className="gravesites-error">{hiba}</div>}

        <div className="gravesites-search-bar">
          <input
            className="gravesites-search-input"
            type="text"
            value={kereses}
            onChange={(ev) => {
              setKereses(ev.target.value);
              setKivalasztott(null);
            }}
            placeholder="Pl.: Kiss, Imre, Mária..."
          />
        </div>

        <div className="gravesites-layout">
          {/* BAL: Találatok */}
          <div className="gravesites-table-wrapper">
            <table className="gravesites-table">
              <thead>
                <tr>
                  <th className="gravesites-col-name">Név</th>
                  <th className="gravesites-col-birth">Születési dátum</th>
                  <th className="gravesites-col-death">Halálozási dátum</th>
                </tr>
              </thead>

              <tbody>
                {kereses.trim() === "" ? (
                  <tr className="gravesites-empty-row">
                    <td colSpan={3}>Kezdj el gépelni a keresőbe.</td>
                  </tr>
                ) : talalatok.length === 0 ? (
                  <tr className="gravesites-empty-row">
                    <td colSpan={3}>Nincs találat.</td>
                  </tr>
                ) : (
                  talalatok.map((e, i) => {
                    const selected = isSelectedRow(e);
                    return (
                      <tr
                        key={getEntityId(e, i)}
                        className={
                          "gravesites-row-clickable" + (selected ? " gravesites-row-selected" : "")
                        }
                        role="button"
                        tabIndex={0}
                        onClick={() => onRowActivate(e)}
                        onKeyDown={(evt) => {
                          if (evt.key === "Enter" || evt.key === " ") {
                            evt.preventDefault();
                            onRowActivate(e);
                          }
                        }}
                        title="Kattints a részletekhez"
                      >
                        <td data-label="Név">{getNev(e)}</td>
                        <td data-label="Születés">{formatDate(getSzul(e))}</td>
                        <td data-label="Halál">{formatDate(getHalal(e))}</td>
                      </tr>
                    );
                  })
                )}
              </tbody>
            </table>
          </div>

          {/* JOBB: Részletek */}
          <div className="gravesites-panel">
            <div className="gravesites-panel__header">
              <h2>Részletek</h2>
            </div>

            {!kivalasztott ? (
              <div className="gravesites-empty">Válassz ki egy elhunytat a bal oldali táblából.</div>
            ) : (
              <div className="gravesites-details">
                <div className="gravesites-photo">
                  {fotoSrc ? (
                    <button
                      type="button"
                      className="gravesites-photo__btn"
                      onClick={() => openZoom(fotoSrc, fotoAlt)}
                      title="Kattints a nagyításhoz"
                    >
                      <img
                        src={fotoSrc}
                        alt={fotoAlt}
                        className="gravesites-photo__img"
                        loading="lazy"
                        onError={(e2) => {
                          e2.currentTarget.style.display = "none";
                          const parent = e2.currentTarget.parentElement;
                          if (parent) parent.classList.add("is-missing");
                        }}
                      />
                      <span className="gravesites-photo__zoomhint">🔍 Kattints a nagyításhoz</span>
                    </button>
                  ) : null}

                  <div className={"gravesites-photo__missing" + (fotoSrc ? "" : " is-visible")}>
                    Nincs kép ehhez a sírhelyhez.
                  </div>

                  <div className="gravesites-photo__meta">
                    <strong>{kivalasztottSirhely?.sirkod ?? "Nincs sírkód"}</strong>
                    {kivalasztottSirhely?.tipus ? ` • ${kivalasztottSirhely.tipus}` : ""}
                    
                  </div>
                </div>

                <div className="gravesites-detail-row">
                  <div className="gravesites-detail-label">Név</div>
                  <div className="gravesites-detail-value">{getNev(kivalasztott)}</div>
                </div>

                <div className="gravesites-detail-row">
                  <div className="gravesites-detail-label">Születési dátum</div>
                  <div className="gravesites-detail-value">{formatDate(getSzul(kivalasztott))}</div>
                </div>

                <div className="gravesites-detail-row">
                  <div className="gravesites-detail-label">Halálozási dátum</div>
                  <div className="gravesites-detail-value">{formatDate(getHalal(kivalasztott))}</div>
                </div>

                <div className="gravesites-detail-row">
                  <div className="gravesites-detail-label">Sírhely</div>
                  <div className="gravesites-detail-value">
                    {kivalasztottSirhely?.sirkod ?? "Nincs hozzárendelve"}
                  </div>
                </div>

                <h3 className="gravesites-section-title">Azonos sírhelyen fekvők</h3>
                {azonosSirhelyenFekvok.length === 0 ? (
                  <div className="gravesites-empty">Nincs adat.</div>
                ) : (
                  <ul className="gravesites-list">
                    {azonosSirhelyenFekvok.map((sz, i) => (
                      <li className="gravesites-list-item" key={getEntityId(sz, i)}>
                        <span className="gravesites-list-item__name">{getNev(sz)}</span>
                        <span className="gravesites-list-item__dates">
                          {formatDate(getSzul(sz))} – {formatDate(getHalal(sz))}
                        </span>
                      </li>
                    ))}
                  </ul>
                )}
              </div>
            )}
          </div>
        </div>

        {/* ===== Zoom modal ===== */}
        {zoomOpen && (
          <div
            className="gravesites-zoom"
            role="dialog"
            aria-modal="true"
            aria-label="Kép nagyítása"
            onMouseDown={(e) => {
              // csak a háttérre kattintva zárjon
              if (e.target === e.currentTarget) setZoomOpen(false);
            }}
          >
            <div className="gravesites-zoom__content">
              <div className="gravesites-zoom__header">
                <div className="gravesites-zoom__title">{zoomAlt}</div>
                <button
                  type="button"
                  className="gravesites-zoom__close"
                  onClick={() => setZoomOpen(false)}
                  aria-label="Bezárás"
                  title="Bezárás (Esc)"
                >
                  ×
                </button>
              </div>

              <div className="gravesites-zoom__body">
                <img className="gravesites-zoom__img" src={zoomSrc} alt={zoomAlt} />
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default GraveSites;