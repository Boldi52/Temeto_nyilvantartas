import React, { useState } from "react";
import { Link, Routes, Route } from "react-router-dom";
import "../CSS-ek/MainPage.css";


// Egyes menüelemekhez adott a path, ami az adott oldalhoz navigál.
const menuItems = [
    { icon: <img src="/img/icons/kezdolap-removebg-preview.png" alt="kezdolap_logo" />, label: "Kezdőlap", path: "/" },
    { icon: <img src="/img/icons/galambfeher.png" alt="galamb_logo" />, label: "Elhunytak", path: "/elhunytak" },
    { icon: <img src="/img/icons/sirfeher.png" alt="kereszt_logo" />, label: "Sírhelyek", path: "/sirhelyek" },
    { icon: <img src="/img/icons/terkepfeher.png" alt="terkep_logo" />, label: "Térkép", path: "/terkep" },
    { icon: <img src="/img/icons/adminfeher.png" alt="admin_logo" />, label: "Admin", path: "/admin" },
];

export default function MainPage() {
    // Lenyíló állapota
    const [open, setOpen] = useState(false);

    return (
        <div className="app">
            <div className="frame">
                {/* Bal oldali menü + logó */}
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

                {/* Fő tartalmi rész */}
                <main className="main">
                    <header className="topbar">
                        <div className="title">Zala Temető</div>

                        {/* Jobb felső user / lenyíló */}
                        <div className="user" onClick={() => setOpen((v) => !v)}>
                            <div className="avatar" />
                            <span className="username">felhasználó név</span>
                            <span className={`caret ${open ? "open" : ""}`}>▾</span>

                            {/* Lenyíló menü */}
                            {open && (
                                <div className="dropdown">
                                    <button className="dropdown-item">Kijelentkezés</button>
                                    <button className="dropdown-item">Profil adatok</button>
                                </div>
                            )}
                        </div>
                    </header>

                    {/* Route-ok megjelenítése */}
                    <section className="content">
                        <Routes>
                            <Route path="/" element={<h1>Kezdőlap</h1>} />
                            <Route path="/elhunytak" element={<h1>Elhunytak</h1>} />
                            <Route path="/sirhelyek" element={<h1>Sírhelyek</h1>} />
                            <Route path="/terkep" element={<h1>Térkép</h1>} />
                            <Route path="/admin" element={<h1>Admin oldal</h1>} />
                        </Routes>
                    </section>
                </main>
            </div>
        </div>
    );
}