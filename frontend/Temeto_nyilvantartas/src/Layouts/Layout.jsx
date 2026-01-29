import React, { useState, useEffect } from "react";
import { Link, Outlet, useNavigate } from "react-router-dom";
import "../Layouts/Layout.css";

const menuItems = [
  { icon: <img src="/img/icons/kezdolap-removebg-preview.png" alt="kezdolap_logo" />, label: "Kezdőlap", path: "/" },
  { icon: <img src="/img/icons/galambfeher.png" alt="galamb_logo" />, label: "Elhunytak", path: "/elhunytak" },
  { icon: <img src="/img/icons/sirfeher.png" alt="kereszt_logo" />, label: "Sírhelyek", path: "/sirhelyek" },
  { icon: <img src="/img/icons/terkepfeher.png" alt="terkep_logo" />, label: "Térkép", path: "/terkep" },
  { icon: <img src="/img/icons/adminfeher.png" alt="admin_logo" />, label: "Admin", path: "/admin" },
];

export default function Layout() {
  const [open, setOpen] = useState(false);
  const [isAdmin, setIsAdmin] = useState(false);
  const navigate = useNavigate();

  // Minden mountnál olvassuk ki a localStorage-ból
  useEffect(() => {
    const token = localStorage.getItem("token");
    const role = localStorage.getItem("role");
    setIsAdmin(!!token && role === "admin");
  }, []);

  const handleLogout = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("role");
    setOpen(false);
    setIsAdmin(false);
    navigate("/admin", { replace: true });
  };

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

            {isAdmin && (
              <div className="user" onClick={() => setOpen((v) => !v)}>
                <div className="avatar" />
                <span className="username">admin</span>
                <span className={`caret ${open ? "open" : ""}`}>▾</span>
                {open && (
                  <div className="dropdown">
                    <button className="dropdown-item" onClick={handleLogout}>Kijelentkezés</button>
                    <button className="dropdown-item" onClick={() => setOpen(false)}>Profil adatok</button>
                  </div>
                )}
              </div>
            )}
          </header>

          <section className="content">
            <Outlet />
          </section>
        </main>
      </div>
    </div>
  );
}