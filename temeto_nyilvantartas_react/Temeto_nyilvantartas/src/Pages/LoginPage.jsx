import React, { useState } from "react";
import "../CSS-ek/LoginPage.css";
import { API_BASE } from "../api";
import { Routes, Route } from "react-router-dom";


const menuItems = [
    { icon: <img src="/img/icons/adminfeher.png" alt="admin_logo" />, label: "Admin", path: "/admin" },
];


const LoginPage = () => {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState("");
    const [info, setInfo] = useState("");

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError("");
        setInfo("");
        setLoading(true);

        try {
            const res = await fetch(`${API_BASE}/api/login`, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ email, password }),
            });

            if (!res.ok) {
                const err = await res.json().catch(() => ({}));
                throw new Error(err.message || "Sikertelen bejelentkezés");
            }

            const data = await res.json();

            if (data.token) {
                localStorage.setItem("token", data.token);
                setInfo("Sikeres bejelentkezés!");
                // Nincs reload: az App a token alapján újrarenderel, és eltűnik a login form
            }
        } catch (err) {
            setError(err.message);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="login-wrapper">
            <div className="login-frame">
                <div className="login-panel">
                    <h2>Bejelentkezés</h2>
                    <form onSubmit={handleSubmit}>
                        <div className="form-group">
                            <label htmlFor="email">e-mail cím</label>
                            <input
                                id="email"
                                type="email"
                                placeholder="email@example.com"
                                value={email}
                                onChange={(e) => setEmail(e.target.value)}
                                required
                            />
                        </div>
                        <div className="form-group">
                            <label htmlFor="password">jelszó</label>
                            <input
                                id="password"
                                type="password"
                                placeholder="••••••••"
                                value={password}
                                onChange={(e) => setPassword(e.target.value)}
                                required
                            />
                        </div>
                        <button type="submit" className="login-btn" disabled={loading}>
                            {loading ? "Belépés..." : "Bejelentkezés"}
                        </button>
                        {error && <div style={{ color: "red", marginTop: "0.5rem" }}>{error}</div>}
                        {info && <div style={{ color: "green", marginTop: "0.5rem" }}>{info}</div>}
                    </form>
                </div>

                <div className="logo-panel">
                    <img src="/img/zala_logo.png" alt="Logo" />
                </div>
            </div>
            <section className="content">
                <Routes>
                    <Route path="/admin" element={<h1>Admin oldal</h1>} />
                </Routes>
            </section>
        </div>
    );
};

export default LoginPage;