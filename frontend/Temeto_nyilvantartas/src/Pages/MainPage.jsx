import React, { useEffect, useState } from "react";
import "../CSS-ek/MainPage.css";
import LoadingOverlay from "../Layouts/LoadingOverlay";

const API_BASE = "http://localhost:8000";

const MainPage = () => {
  const [stats, setStats] = useState({ dead: 0, graves: 0, free: 5 });
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

        const elhunytCount = await elhunytCountRes.json(); 
        const sirhelyCount = await sirhelyCountRes.json(); 
        const recentJson = await recentRes.json();
        setStats({
          dead: elhunytCount.osszes ?? 0,
          graves: sirhelyCount.graves ?? 0,
          free: elhunytCount.free ?? stats.free,
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

 if (loading) {
  return (
    <div className="deceasedpage-wrapper loading-center">
      <div className="spinner" role="status" aria-label="Betöltés" />
    </div>
  );
}
  if (error) return <div className="mainpage-wrapper">Hiba: {error}</div>;

  return (
    <div className="mainpage-wrapper">
      <header className="mainpage-header">
        <div className="mainpage-header__inner">
          <h1>Zala temető - nyilvántartási rendszere</h1>
          <p className="mainpage-header__subtitle">Sirhelyek, elhunytak és temetői adatok áttekintése</p>
        </div>
      </header>

      <main className="mainpage">
        <section className="mainpage-stats">
          <h2>Statisztika</h2>
          <div className="mainpage-stat-cards">
            <div className="mainpage-stat-card">
              <div className="mainpage-stat-card__label">Elhunytak:</div>
              <div className="mainpage-stat-card__number">{stats.dead}</div>
            </div>
            <div className="mainpage-stat-card">
              <div className="mainpage-stat-card__label">Sírhelyek:</div>
              <div className="mainpage-stat-card__number">{stats.graves}</div>
            </div>
            <div className="mainpage-stat-card">
              <div className="mainpage-stat-card__label">Szabad sírhely:</div>
              <div className="mainpage-stat-card__number">{stats.free}</div>
            </div>
          </div>
        </section>

        <section className="mainpage-content-row">
          <div className="mainpage-panel mainpage-panel--left">
            <h3>Legutóbbi elhunytak</h3>
            <ul className="mainpage-recent-list">
              {recent.map((r) => (
                <li key={r.id}>
                  <span className="mainpage-recent-list__name">{r.name}</span>
                  <span className="mainpage-recent-list__date">{r.date}</span>
                </li>
              ))}
            </ul>
          </div>

          <aside className="mainpage-panel mainpage-panel--right">
            <h3>Elérhetőségek</h3>
            <div className="mainpage-contact">
              <strong>Ügyfélszolgálat</strong>
              <ul>
                <li>Telefon: +36 1 234 5678</li>
                <li>Email: ugyfelszolgalat@zalatemeto.hu</li>
                <li>Ügyfélfogadási idő: Hétfő-Péntek: 08:00-16:00</li>
              </ul>
            </div>
          </aside>
        </section>
      </main>
    </div>
  );
};

export default MainPage;