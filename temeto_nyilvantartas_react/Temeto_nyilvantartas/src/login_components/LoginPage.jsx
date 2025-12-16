import React from "react";
import "./LoginPage.css";

const LoginPage = () => {
    return (
        <div className="login-wrapper">
            <div className="login-frame">
                <div className="login-panel">
                    <h2>Bejelentkezés</h2>
                    <form>
                        <div className="form-group">
                            <label htmlFor="email">e-mail cím</label>
                            <input id="email" type="email" placeholder="email@example.com" />
                        </div>
                        <div className="form-group">
                            <label htmlFor="password">jelszó</label>
                            <input id="password" type="password" placeholder="••••••••" />
                        </div>
                        <button type="submit" className="login-btn">
                            Bejelentkezés
                        </button>
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