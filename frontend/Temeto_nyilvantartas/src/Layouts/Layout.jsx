import React, { useEffect, useState } from "react";
import "./Layout.css";
import { Outlet, Link, useNavigate } from "react-router-dom";

const menuItems = [
  { icon: <img src="/img/icons/kezdolap-removebg-preview.png" alt="home_logo" />, label: "Főoldal", path: "/" },
  { icon: <img src="/img/icons/galambfeher.png" alt="elhunyt_logo" />, label: "Elhunytak", path: "/elhunytak" },
  { icon: <img src="/img/icons/sirfeher.png" alt="sirhely_logo" />, label: "Sírhelyek", path: "/sirhelyek" },
  { icon: <img src="/img/icons/terkepfeher.png" alt="terkep_logo" />, label: "Térkép", path: "/terkep" },
  { icon: <img src="/img/icons/adminfeher.png" alt="admin_logo" />, label: "Admin", path: "/admin" },
];

export default function Layout() {
  const [isAdmin, setIsAdmin] = useState(false);
  const navigate = useNavigate();

  // Minden mountnál olvassuk a localStorage-t
  useEffect(() => {
    const token = localStorage.getItem("token");
    const role = localStorage.getItem("role");
    setIsAdmin(!!token && role === "admin");
  }, []);

  const handleLogout = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("role");
    setIsAdmin(false);
    navigate("/", { replace: true });
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
              <button className="logout-btn" onClick={handleLogout}>
                Kijelentkezés
              </button>
            )}
          </header>

          <div className="content">
            <Outlet />
          </div>
        </main>
      </div>
    </div>
  );
}