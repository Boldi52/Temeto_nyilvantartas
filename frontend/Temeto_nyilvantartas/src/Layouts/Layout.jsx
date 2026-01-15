import React, { useState } from "react";
import { Link, Outlet } from "react-router-dom";
import "../CSS-ek/MainPage.css";

const menuItems = [
  { icon: <img src="/img/icons/kezdolap-removebg-preview.png" alt="kezdolap_logo" />, label: "Kezdőlap", path: "/" },
  { icon: <img src="/img/icons/galambfeher.png" alt="galamb_logo" />, label: "Elhunytak", path: "/elhunytak" },
  { icon: <img src="/img/icons/sirfeher.png" alt="kereszt_logo" />, label: "Sírhelyek", path: "/sirhelyek" },
  { icon: <img src="/img/icons/terkepfeher.png" alt="terkep_logo" />, label: "Térkép", path: "/terkep" },
  { icon: <img src="/img/icons/adminfeher.png" alt="admin_logo" />, label: "Admin", path: "/admin" },
];

export default function Layout() {
  const [open, setOpen] = useState(false);

  return (
    <div className="app">
      <div className="frame">
        <aside className="sidebar">
          <div className="logo">
            <img className="zala_logo_css" src="/img/icons/logo.png" alt="Zala logo" />
          </div>
          <nav className="menu">
            {menuItems.map((item) => (
              <div key={item.label} className="menu-item">
                <Link to={item.path} className="menu-link">
                  <span className="icon">{item.icon}</span>
                  <span className="label">{item.label}</span>
                </Link>
              </div>
            ))}
          </nav>
        </aside>

        <main className="main">
          <header className="topbar">
            <div className="title">Zala Temető</div>
            <div className="user" onClick={() => setOpen((v) => !v)}>
              <div className="avatar" />
              <span className="username">felhasználó név</span>
              <span className={`caret ${open ? "open" : ""}`}>▾</span>
              {open && (
                <div className="dropdown">
                  <button className="dropdown-item">Kijelentkezés</button>
                  <button className="dropdown-item">Profil adatok</button>
                </div>
              )}
            </div>
          </header>

          <section className="content">
            <Outlet /> {/* ide jön az aktuális oldal */}
          </section>
        </main>
      </div>
    </div>
  );
}