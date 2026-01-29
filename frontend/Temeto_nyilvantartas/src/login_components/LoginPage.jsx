import React, { useState } from "react";
import "./LoginPage.css";
import { API_BASE } from "../api";

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
                if (data.user?.role) {
                    localStorage.setItem("role", data.user.role);
                } else {
                    localStorage.removeItem("role");
                }

                const role = data.user?.role;
                if (role === "admin") {
                    window.location.replace("/admin/dashboard");
                } else if (role === "user") {
                    window.location.replace("/");
                } else {
                    window.location.replace("/admin/dashboard"); // fallback, ha nincs role
                }

                setInfo("Sikeres bejelentkezés!");
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
        </div>
    );
};

export default LoginPage;