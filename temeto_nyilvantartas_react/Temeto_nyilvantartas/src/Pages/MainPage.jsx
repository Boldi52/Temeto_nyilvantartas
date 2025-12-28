import React, { useState } from "react";
import "../CSS-ek/MainPage.css";

const menuItems = [
    { icon: <img src="/img/icons/kezdolap-removebg-preview.png" alt="kezdolap_logo" />, label: "Kezdőlap", active: true },
    { icon: <img src="/img/icons/galambfeher.png" alt="galamb_logo" />, label: "Elhunytak" },
    { icon: <img src="/img/icons/sirfeher.png" alt="kereszt_logo" />, label: "Sírhelyek" },
    { icon: <img src="/img/icons/keresesfeher.png" alt="nagyito_logo" />, label: "Keresés" },
    { icon: <img src="/img/icons/terkepfeher.png" alt="terkep_logo" />, label: "Térkép" },
    { icon: <img src="/img/icons/adminfeher.png" alt="admin_log" />, label: "Admin" },
];

export default function MainPage() {
    // Lenyíló állapot
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
                            <div
                                key={item.label}
                                className={`menu-item ${item.active ? "active" : ""}`}
                            >
                                <span className="icon">{item.icon}</span>
                                <span className="label">{item.label}</span>
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

                    {/* Üres tartalmi terület – ide jön majd az oldalad */}
                    <section className="content" />
                </main>
            </div>
        </div>
    );
}