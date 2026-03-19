import React, { useEffect, useState } from "react";
import "./LoginPage.css";
import { API_BASE } from "../api";
import { useNavigate } from "react-router-dom";

const LoginPage = () => {
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState("");
    const [info, setInfo] = useState("");
    const navigate = useNavigate();

    useEffect(() => {
        const token = localStorage.getItem("token");
        const role = localStorage.getItem("role");
        if (token && role === "admin") {
            navigate("/admin/dashboard", { replace: true });
        }
    }, [navigate]);

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError("");
        setInfo("");
        setLoading(true);

        try {
            const res = await fetch(`${API_BASE}/api/login`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Accept": "application/json",
                },
                body: JSON.stringify({ username, password }),
            });

            if (!res.ok) {
                const err = await res.json().catch(() => ({}));
                throw new Error(err.message || "Sikertelen bejelentkezés");
            }

            const data = await res.json();

            if (data.token) {
                localStorage.setItem("token", data.token);
            }

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
                            <label htmlFor="username" className="loginpage-form-group__label">
                                felhasználónév
                            </label>
                            <input
                                id="username"
                                type="text"
                                className="loginpage-form-group__input"
                                value={username}
                                onChange={(e) => setUsername(e.target.value)}
                                required
                                placeholder="pl. admin"
                            />
                        </div>

                        <div className="loginpage-form-group">
                            <label htmlFor="password" className="loginpage-form-group__label">
                                jelszó
                            </label>
                            <input
                                id="password"
                                type="password"
                                className="loginpage-form-group__input"
                                value={password}
                                onChange={(e) => setPassword(e.target.value)}
                                required
                                placeholder="••••••••"
                            />
                        </div>

                        <button className="loginpage-btn" type="submit" disabled={loading}>
                            {loading ? "Bejelentkezés..." : "Belépés"}
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