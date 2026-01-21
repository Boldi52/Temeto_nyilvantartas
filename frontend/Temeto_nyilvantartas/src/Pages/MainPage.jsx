import React, { useEffect, useState } from "react";
import "../CSS-ek/MainPage.css";

const API_BASE = "http://localhost:8000"; // állítsd a saját backend host/portra

const MainPage = () => {
  const [stats, setStats] = useState({ dead: 0, graves: 0, free: 0 });
  const [recent, setRecent] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    const loadData = async () => {
      try {
        const [elhunytCountRes, sirhelyCountRes, recentRes] = await Promise.all([
          fetch(`${API_BASE}/api/elhunytak/count`),
          fetch(`${API_BASE}/api/sirhelyek/count`),
          fetch(`${API_BASE}/api/elhunytak/recent`),
        ]);

        if (!elhunytCountRes.ok) throw new Error(`/elhunytak/count hiba: ${elhunytCountRes.status} ${elhunytCountRes.statusText}`);
        if (!sirhelyCountRes.ok) throw new Error(`/sirhelyek/count hiba: ${sirhelyCountRes.status} ${sirhelyCountRes.statusText}`);
        if (!recentRes.ok) throw new Error(`/elhunytak/recent hiba: ${recentRes.status} ${recentRes.statusText}`);

        const elhunytCount = await elhunytCountRes.json(); // pl. { osszes: 123, free: 23 }
        const sirhelyCount = await sirhelyCountRes.json(); // pl. { graves: 456 }
        const recentJson = await recentRes.json();         // pl. [ { id, name, date }, ... ]

        setStats({
          dead: elhunytCount.osszes ?? 0,
          graves: sirhelyCount.graves ?? 0,
          free: elhunytCount.free ?? stats.free, // ha a backend adja; különben marad a korábbi érték
        });
        setRecent(Array.isArray(recentJson) ? recentJson : []);
      } catch (err) {
        setError(err.message || "Ismeretlen hiba");
      } finally {
        setLoading(false);
      }
    };

    loadData();
  }, []);

  if (loading) return <div className="page-wrapper">Betöltés...</div>;
  if (error) return <div className="page-wrapper">Hiba: {error}</div>;

  return (
    <div className="page-wrapper">
      <header className="site-header">
        <div className="header-inner">
          <h1>Zala temető - nyilvántartási rendszere</h1>
          <p className="subtitle">Sirhelyek, elhunytak és temetői adatok áttekintése</p>
        </div>
      </header>

      <main className="mainpage">
        <section className="stats">
          <h2>Statisztika</h2>
          <div className="stat-cards">
            <div className="card">
              <div className="card-num">{stats.dead}</div>
              <div className="card-label">Elhunytak:</div>
            </div>
            <div className="card">
              <div className="card-num">{stats.graves}</div>
              <div className="card-label">Sírhelyek:</div>
            </div>
            <div className="card">
              <div className="card-num">{stats.free}</div>
              <div className="card-label">Szabad sírhely:</div>
            </div>
          </div>
        </section>

        <section className="content-row">
          <div className="left panel">
            <h3>Frissen elhunytak</h3>
            <ul className="recent-list">
              {recent.map((r) => (
                <li key={r.id}>
                  <span className="name">{r.name}</span>
                  <span className="date">{r.date}</span>
                </li>
              ))}
            </ul>
          </div>

          <aside className="right panel">
            <h3>Elérhetőségek</h3>
            <div className="contact">
              <strong>Ügyfélszolgálat</strong>
              <ul>
                <li>Telefon: +36 1 234 5678</li>
                <li>Email: ugyfelszolgalat@zalatemeto.hu</li>
                <li>Ügyfélfogadási idő: Hétfő-Péntek: 08:00-16:00</li>
              </ul>
            </div>

            <div className="docs">
              <strong>Dokumentumok és letöltések</strong>
              <ul>
                <li>GYIK</li>
                <li>Felhasználói kézikönyv PDF</li>
                <li>Adatvédelmi tájékoztató</li>
              </ul>
            </div>
          </aside>
        </section>
      </main>
    </div>
  );
};

export default MainPage;