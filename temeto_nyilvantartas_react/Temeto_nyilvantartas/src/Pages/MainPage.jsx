import React, { useState } from "react";
import "../CSS-ek/MainPage.css";

const menuItems = [
    { icon: "🏠", label: "Kezdőlap", active: true },
    { icon: "🕊️", label: "Elhunytak" },
    { icon: "✝️", label: "Sírhelyek" },
    { icon: "🔍", label: "Keresés" },
    { icon: "📍", label: "Térkép" },
    { icon: "👤", label: "Admin" },
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
                        <img src="/img/zala_logo.png" alt="Zala logo" />
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