import React, { useEffect, useState, useRef } from "react";
import "../CSS-ek/MapPage.css";

const API_BASE = "http://localhost:8000";
const droneImg1 = "/img/dronkepek/DJI_0746.JPG";
const droneImg2 = "/img/dronkepek/DJI_0739.JPG";

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
  
  // Zoom state para image 1
  const [zoomOpen1, setZoomOpen1] = useState(false);
  const [zoomLevel1, setZoomLevel1] = useState(1);
  const [offset1, setOffset1] = useState({ x: 0, y: 0 });
  const [mousePos1, setMousePos1] = useState({ x: 0, y: 0 });
  const [isDragging1, setIsDragging1] = useState(false);
  const [dragStart1, setDragStart1] = useState({ x: 0, y: 0 });
  const zoomWrapperRef1 = useRef(null);
  const zoomImageRef1 = useRef(null);

  // Zoom state para image 2
  const [zoomOpen2, setZoomOpen2] = useState(false);
  const [zoomLevel2, setZoomLevel2] = useState(1);
  const [offset2, setOffset2] = useState({ x: 0, y: 0 });
  const [mousePos2, setMousePos2] = useState({ x: 0, y: 0 });
  const [isDragging2, setIsDragging2] = useState(false);
  const [dragStart2, setDragStart2] = useState({ x: 0, y: 0 });
  const zoomWrapperRef2 = useRef(null);
  const zoomImageRef2 = useRef(null);

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

  // ============ IMAGE 1 HANDLERS ============
  const handleZoomIn1 = () => {
    setZoomLevel1((prev) => {
      const newZoom = Math.min(prev + 0.2, 4);
      calculateOffsetForZoom1(newZoom);
      return newZoom;
    });
  };

  const handleZoomOut1 = () => {
    setZoomLevel1((prev) => {
      const newZoom = Math.max(prev - 0.2, 1);
      calculateOffsetForZoom1(newZoom);
      return newZoom;
    });
  };

  const handleReset1 = () => {
    setZoomLevel1(1);
    setOffset1({ x: 0, y: 0 });
  };

  const calculateOffsetForZoom1 = (newZoom) => {
    if (!zoomWrapperRef1.current || !zoomImageRef1.current) return;

    const wrapper = zoomWrapperRef1.current;
    const wrapperRect = wrapper.getBoundingClientRect();
    
    const cursorX = mousePos1.x - wrapperRect.left;
    const cursorY = mousePos1.y - wrapperRect.top;

    const newOffsetX = cursorX - (cursorX - offset1.x) / zoomLevel1 * newZoom;
    const newOffsetY = cursorY - (cursorY - offset1.y) / zoomLevel1 * newZoom;

    setOffset1({
      x: Math.max(
        -(zoomImageRef1.current.naturalWidth * newZoom - wrapperRect.width) / 2,
        Math.min(newOffsetX, (zoomImageRef1.current.naturalWidth * newZoom - wrapperRect.width) / 2)
      ),
      y: Math.max(
        -(zoomImageRef1.current.naturalHeight * newZoom - wrapperRect.height) / 2,
        Math.min(newOffsetY, (zoomImageRef1.current.naturalHeight * newZoom - wrapperRect.height) / 2)
      ),
    });
  };

  const handleMouseMove1 = (e) => {
    setMousePos1({ x: e.clientX, y: e.clientY });

    if (isDragging1) {
      const deltaX = e.clientX - dragStart1.x;
      const deltaY = e.clientY - dragStart1.y;

      setOffset1((prev) => ({
        x: prev.x + deltaX,
        y: prev.y + deltaY,
      }));

      setDragStart1({ x: e.clientX, y: e.clientY });
    }
  };

  const handleMouseDown1 = (e) => {
    setIsDragging1(true);
    setDragStart1({ x: e.clientX, y: e.clientY });
  };

  const handleMouseUp1 = () => {
    setIsDragging1(false);
  };

  const handleWheel1 = (e) => {
    e.preventDefault();
    if (e.deltaY > 0) {
      handleZoomOut1();
    } else {
      handleZoomIn1();
    }
  };

  const handleZoomImageClick1 = (e) => {
    if (isDragging1) return;
    
    const wrapper = zoomWrapperRef1.current;
    const rect = wrapper.getBoundingClientRect();
    const clickX = e.clientX - rect.left;
    const clickY = e.clientY - rect.top;

    const imageX = (clickX - offset1.x) / zoomLevel1;
    const imageY = (clickY - offset1.y) / zoomLevel1;

    const posX = (imageX / zoomImageRef1.current.naturalWidth) * 100;
    const posY = (imageY / zoomImageRef1.current.naturalHeight) * 100;

    const clickedSite = sites.find(
      (s) =>
        s.pos_x !== null &&
        s.pos_y !== null &&
        Math.abs(Number(s.pos_x) - posX) < 5 &&
        Math.abs(Number(s.pos_y) - posY) < 5
    );

    if (clickedSite) {
      setSelected(clickedSite);
    }
  };

  // ============ IMAGE 2 HANDLERS ============
  const handleZoomIn2 = () => {
    setZoomLevel2((prev) => {
      const newZoom = Math.min(prev + 0.2, 4);
      calculateOffsetForZoom2(newZoom);
      return newZoom;
    });
  };

  const handleZoomOut2 = () => {
    setZoomLevel2((prev) => {
      const newZoom = Math.max(prev - 0.2, 1);
      calculateOffsetForZoom2(newZoom);
      return newZoom;
    });
  };

  const handleReset2 = () => {
    setZoomLevel2(1);
    setOffset2({ x: 0, y: 0 });
  };

  const calculateOffsetForZoom2 = (newZoom) => {
    if (!zoomWrapperRef2.current || !zoomImageRef2.current) return;

    const wrapper = zoomWrapperRef2.current;
    const wrapperRect = wrapper.getBoundingClientRect();
    
    const cursorX = mousePos2.x - wrapperRect.left;
    const cursorY = mousePos2.y - wrapperRect.top;

    const newOffsetX = cursorX - (cursorX - offset2.x) / zoomLevel2 * newZoom;
    const newOffsetY = cursorY - (cursorY - offset2.y) / zoomLevel2 * newZoom;

    setOffset2({
      x: Math.max(
        -(zoomImageRef2.current.naturalWidth * newZoom - wrapperRect.width) / 2,
        Math.min(newOffsetX, (zoomImageRef2.current.naturalWidth * newZoom - wrapperRect.width) / 2)
      ),
      y: Math.max(
        -(zoomImageRef2.current.naturalHeight * newZoom - wrapperRect.height) / 2,
        Math.min(newOffsetY, (zoomImageRef2.current.naturalHeight * newZoom - wrapperRect.height) / 2)
      ),
    });
  };

  const handleMouseMove2 = (e) => {
    setMousePos2({ x: e.clientX, y: e.clientY });

    if (isDragging2) {
      const deltaX = e.clientX - dragStart2.x;
      const deltaY = e.clientY - dragStart2.y;

      setOffset2((prev) => ({
        x: prev.x + deltaX,
        y: prev.y + deltaY,
      }));

      setDragStart2({ x: e.clientX, y: e.clientY });
    }
  };

  const handleMouseDown2 = (e) => {
    setIsDragging2(true);
    setDragStart2({ x: e.clientX, y: e.clientY });
  };

  const handleMouseUp2 = () => {
    setIsDragging2(false);
  };

  const handleWheel2 = (e) => {
    e.preventDefault();
    if (e.deltaY > 0) {
      handleZoomOut2();
    } else {
      handleZoomIn2();
    }
  };

  const handleZoomImageClick2 = (e) => {
    if (isDragging2) return;
    
    const wrapper = zoomWrapperRef2.current;
    const rect = wrapper.getBoundingClientRect();
    const clickX = e.clientX - rect.left;
    const clickY = e.clientY - rect.top;

    const imageX = (clickX - offset2.x) / zoomLevel2;
    const imageY = (clickY - offset2.y) / zoomLevel2;

    const posX = (imageX / zoomImageRef2.current.naturalWidth) * 100;
    const posY = (imageY / zoomImageRef2.current.naturalHeight) * 100;

    const clickedSite = sites.find(
      (s) =>
        s.pos_x !== null &&
        s.pos_y !== null &&
        Math.abs(Number(s.pos_x) - posX) < 5 &&
        Math.abs(Number(s.pos_y) - posY) < 5
    );

    if (clickedSite) {
      setSelected(clickedSite);
    }
  };

  return (
    <div className="page-wrapper map-page">
      <h1>Temető térkép</h1>

      <div className="maps-container">
        <div className="map-grid">
          {/* IMAGE 1 */}
          <div className="map-wrapper">
            <h2>Térképnézet 1</h2>
            <div className="svg-container" role="img" aria-label="Temető drónkép 1">
              <svg 
                viewBox="0 0 100 100" 
                preserveAspectRatio="xMidYMid meet" 
                className="map-svg"
                onClick={() => setZoomOpen1(true)}
                style={{ cursor: "zoom-in" }}
              >
                <image 
                  href={droneImg1} 
                  x="0" 
                  y="0" 
                  width="100" 
                  height="100" 
                  preserveAspectRatio="xMidYMid slice"
                  style={{ opacity: 0.9 }}
                />
              </svg>
            </div>
          </div>

          {/* IMAGE 2 */}
          <div className="map-wrapper">
            <h2>Térképnézet 2</h2>
            <div className="svg-container" role="img" aria-label="Temető drónkép 2">
              <svg 
                viewBox="0 0 100 100" 
                preserveAspectRatio="xMidYMid meet" 
                className="map-svg"
                onClick={() => setZoomOpen2(true)}
                style={{ cursor: "zoom-in" }}
              >
                <image 
                  href={droneImg2} 
                  x="0" 
                  y="0" 
                  width="100" 
                  height="100" 
                  preserveAspectRatio="xMidYMid slice"
                  style={{ opacity: 0.9 }}
                />
              </svg>
            </div>
          </div>
        </div>

        {/* Info panel - mostmár teljes szélesség */}
        <div className="info-panel">
          {loading && <div className="info-empty">Betöltés...</div>}
          {!loading && error && <div className="info-empty error">{error}</div>}
          {!loading && !selected && !error && <div className="info-empty">Kattints egy térképre a nagyításhoz, majd válassz ki egy sírt.</div>}

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

      {/* Zoom Modal IMAGE 1 */}
      {zoomOpen1 && (
        <div className="zoom-modal" onClick={() => setZoomOpen1(false)}>
          <div className="zoom-container" onClick={(e) => e.stopPropagation()}>
            <div className="zoom-header">
              <h2>Temető térkép 1 - Nagyítás</h2>
              <button className="zoom-close" onClick={() => setZoomOpen1(false)}>✕</button>
            </div>
            
            <div className="zoom-controls">
              <button onClick={handleZoomOut1} className="zoom-btn">−</button>
              <span className="zoom-level">{(zoomLevel1 * 100).toFixed(0)}%</span>
              <button onClick={handleZoomIn1} className="zoom-btn">+</button>
              <button onClick={handleReset1} className="zoom-btn reset">Alaphelyzet</button>
            </div>

            <div 
              className="zoom-image-wrapper"
              ref={zoomWrapperRef1}
              onWheel={handleWheel1}
              onMouseMove={handleMouseMove1}
              onMouseDown={handleMouseDown1}
              onMouseUp={handleMouseUp1}
              onMouseLeave={handleMouseUp1}
              onClick={handleZoomImageClick1}
              style={{ cursor: isDragging1 ? "grabbing" : zoomLevel1 > 1 ? "grab" : "crosshair" }}
            >
              <img 
                ref={zoomImageRef1}
                src={droneImg1} 
                alt="Temető drónkép 1 - nagyítva"
                className="zoom-image"
                style={{ 
                  transform: `translate(${offset1.x}px, ${offset1.y}px) scale(${zoomLevel1})`,
                  cursor: isDragging1 ? "grabbing" : "grab"
                }}
                draggable={false}
              />
            </div>

            <div className="zoom-info">
              <small>💡 Körgörgővel nagyíthatsz/kicsinyíthetsz | Húzz az egérrel a mozgatáshoz | Kattints egy sírhely szimbólumra a kiválasztásához | Kattints az X-re a bezáráshoz</small>
            </div>

            {selected && (
              <div className="zoom-selected-info">
                <h3>{selected.sirkod}</h3>
                <p>Kiválasztott sírhely</p>
              </div>
            )}
          </div>
        </div>
      )}

      {/* Zoom Modal IMAGE 2 */}
      {zoomOpen2 && (
        <div className="zoom-modal" onClick={() => setZoomOpen2(false)}>
          <div className="zoom-container" onClick={(e) => e.stopPropagation()}>
            <div className="zoom-header">
              <h2>Temető térkép 2 - Nagyítás</h2>
              <button className="zoom-close" onClick={() => setZoomOpen2(false)}>✕</button>
            </div>
            
            <div className="zoom-controls">
              <button onClick={handleZoomOut2} className="zoom-btn">−</button>
              <span className="zoom-level">{(zoomLevel2 * 100).toFixed(0)}%</span>
              <button onClick={handleZoomIn2} className="zoom-btn">+</button>
              <button onClick={handleReset2} className="zoom-btn reset">Alaphelyzet</button>
            </div>

            <div 
              className="zoom-image-wrapper"
              ref={zoomWrapperRef2}
              onWheel={handleWheel2}
              onMouseMove={handleMouseMove2}
              onMouseDown={handleMouseDown2}
              onMouseUp={handleMouseUp2}
              onMouseLeave={handleMouseUp2}
              onClick={handleZoomImageClick2}
              style={{ cursor: isDragging2 ? "grabbing" : zoomLevel2 > 1 ? "grab" : "crosshair" }}
            >
              <img 
                ref={zoomImageRef2}
                src={droneImg2} 
                alt="Temető drónkép 2 - nagyítva"
                className="zoom-image"
                style={{ 
                  transform: `translate(${offset2.x}px, ${offset2.y}px) scale(${zoomLevel2})`,
                  cursor: isDragging2 ? "grabbing" : "grab"
                }}
                draggable={false}
              />
            </div>

            <div className="zoom-info">
              <small>💡 Körgörgővel nagyíthatsz/kicsinyíthetsz | Húzz az egérrel a mozgatáshoz | Kattints egy sírhely szimbólumra a kiválasztásához | Kattints az X-re a bezáráshoz</small>
            </div>

            {selected && (
              <div className="zoom-selected-info">
                <h3>{selected.sirkod}</h3>
                <p>Kiválasztott sírhely</p>
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  );
}