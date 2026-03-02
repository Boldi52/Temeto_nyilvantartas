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
                    window.location.replace("/admin/dashboard");
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
        <div className="loginpage-wrapper">
            <div className="loginpage-frame">
                <div className="loginpage-panel">
                    <h2 className="loginpage-panel__title">Bejelentkezés</h2>
                    <form className="loginpage-form" onSubmit={handleSubmit}>
                        <div className="loginpage-form-group">
                            <label htmlFor="email" className="loginpage-form-group__label">
                                e-mail cím
                            </label>
                            <input
                                id="email"
                                type="email"
                                placeholder="email@example.com"
                                className="loginpage-form-group__input"
                                value={email}
                                onChange={(e) => setEmail(e.target.value)}
                                required
                            />
                        </div>
                        <div className="loginpage-form-group">
                            <label htmlFor="password" className="loginpage-form-group__label">
                                jelszó
                            </label>
                            <input
                                id="password"
                                type="password"
                                placeholder="••••••••"
                                className="loginpage-form-group__input"
                                value={password}
                                onChange={(e) => setPassword(e.target.value)}
                                required
                            />
                        </div>
                        <button
                            type="submit"
                            className="loginpage-btn"
                            disabled={loading}
                        >
                            {loading ? "Belépés..." : "Bejelentkezés"}
                        </button>
                        {error && (
                            <div className="loginpage-message loginpage-message--error">
                                {error}
                            </div>
                        )}
                        {info && (
                            <div className="loginpage-message loginpage-message--success">
                                {info}
                            </div>
                        )}
                    </form>
                </div>

                <div className="loginpage-logo-panel">
                    <img
                        src="/img/zala_logo.png"
                        alt="Zala temető logó"
                        className="loginpage-logo-panel__img"
                    />
                </div>
            </div>
        </div>
    );
};

export default LoginPage;