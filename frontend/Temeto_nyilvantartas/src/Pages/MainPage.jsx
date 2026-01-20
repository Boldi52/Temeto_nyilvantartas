import React from "react";
import '../CSS-ek/MainPage.css';

const MainPage = () => {
  // példa adatok; később cserélhetők API-ról érkező értékekre
  const stats = { dead: 567, graves: 667, free: 23 };
  const recent = new Array(7).fill("Nagy János").map((n, i) => ({
    name: n,
    date: "2025.12.30",
    id: i,
  }));

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
                <li>Ügyfélfogadási idő: Hétfő–Péntek: 08:00–16:00</li>
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