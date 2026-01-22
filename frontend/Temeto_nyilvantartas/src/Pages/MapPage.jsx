import React, { useEffect, useState } from "react";
import "../CSS-ek/MapPage.css";

const API_BASE = "http://localhost:8000"; // állítsd a backendre szükség szerint
const droneImg = "/img/drone/temeto-drone.jpg"; // legyen a public mappában

function formatDate(d) {
  if (!d) return "—";
  try {
    return new Date(d).toLocaleDateString();
  } catch {
    return d;
  }
}

export default function MapPage() {
  const [sites, setSites] = useState([]);
  const [selected, setSelected] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    const load = async () => {
      try {
        const res = await fetch(`${API_BASE}/api/sirhelyek`);
        if (!res.ok) throw new Error(`sirhelyek hiba: ${res.status}`);
        const json = await res.json();
        setSites(json);
      } catch (e) {
        console.error(e);
        setError("Nem sikerült betölteni a sírhelyeket.");
      } finally {
        setLoading(false);
      }
    };
    load();
  }, []);

  return (
    <div className="page-wrapper map-page">
      <h1>Temető térkép</h1>

      <div className="map-panel">
        <div className="svg-container" role="img" aria-label="Temető drónkép">
          <svg viewBox="0 0 100 100" preserveAspectRatio="xMidYMid meet" className="map-svg">
            <image href={droneImg} x="0" y="0" width="100" height="100" preserveAspectRatio="xMidYMid slice" />
            {sites
              .filter((s) => s.pos_x !== null && s.pos_y !== null)
              .map((s) => {
                const cx = Number(s.pos_x);
                const cy = Number(s.pos_y);
                const isSelected = selected && selected.id === s.id;
                return (
                  <g
                    key={s.id}
                    transform={`translate(${cx}, ${cy})`}
                    className="map-pin"
                    onClick={() => setSelected(s)}
                    role="button"
                    tabIndex={0}
                    onKeyDown={(e) => e.key === "Enter" && setSelected(s)}
                    aria-label={`Sírhely ${s.sirkod}`}
                  >
                    <circle r={isSelected ? 2.8 : 2} className={`pin-circle ${isSelected ? "selected" : ""}`} />
                    <circle r={6} className="pin-hitbox" />
                  </g>
                );
              })}
          </svg>
        </div>

        <div className="info-panel">
          {loading && <div className="info-empty">Betöltés...</div>}
          {!loading && error && <div className="info-empty error">{error}</div>}
          {!loading && !selected && !error && <div className="info-empty">Kattints egy sírhelyre a képen a részletekhez.</div>}

          {selected && (
            <article className="info-card" aria-live="polite">
              <header className="info-header">
                <div>
                  <h2 className="sirkod">{selected.sirkod}</h2>
                  <div className="meta">
                    <span className="muted">ID: {selected.id}</span>
                    <span className={`status-badge ${selected.allapot ? selected.allapot.toLowerCase() : ""}`}>
                      {selected.allapot ?? "ismeretlen"}
                    </span>
                  </div>
                </div>
                <div className="coords">
                  <div className="coord">X: {selected.pos_x ?? "—"}%</div>
                  <div className="coord">Y: {selected.pos_y ?? "—"}%</div>
                </div>
              </header>

              <section className="details-grid">
                <div className="detail">
                  <div className="detail-label">Sírkód</div>
                  <div className="detail-value">{selected.sirkod}</div>
                </div>

                <div className="detail">
                  <div className="detail-label">Állapot</div>
                  <div className="detail-value">{selected.allapot ?? "—"}</div>
                </div>

                <div className="detail full">
                  <div className="detail-label">Elhunyt(ak)</div>
                  <div className="detail-value">
                    {selected.elhunytak && selected.elhunytak.length > 0 ? (
                      <ul className="elhunyt-list">
                        {selected.elhunytak.map((e) => (
                          <li key={e.id} className="elhunyt-item">
                            <div className="elhunyt-avatar">{(e.nev || " ? ").split(" ").map(n => n[0]).join("").slice(0,2).toUpperCase()}</div>
                            <div className="elhunyt-meta">
                              <div className="elhunyt-name">{e.nev}</div>
                              <div className="elhunyt-date">{formatDate(e.halal_datuma)}</div>
                            </div>
                          </li>
                        ))}
                      </ul>
                    ) : (
                      <div className="muted">Nincs hozzárendelt elhunyt.</div>
                    )}
                  </div>
                </div>
              </section>

              <footer className="info-actions">
                <button className="btn" onClick={() => setSelected(null)}>Bezár</button>
                <a className="btn btn-outline" href={`/sirhelyek?id=${selected.id}`}>Részletes oldal</a>
              </footer>
            </article>
          )}
        </div>
      </div>
    </div>
  );
}