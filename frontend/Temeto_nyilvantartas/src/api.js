const API_BASE = import.meta.env.VITE_API_BASE || "http://127.0.0.1:8000";

async function apiFetch(path, options = {}) {
    const token = localStorage.getItem("token");

    const headers = {
        "Content-Type": "application/json",
        ...(options.headers || {}),
        ...(token ? { Authorization: `Bearer ${token}` } : {}),
    };

    const res = await fetch(`${API_BASE}${path}`, {
        ...options,
        headers,
    });

    if (res.status === 401) {
        localStorage.removeItem("token");
        throw new Error("Nincs jogosultság vagy lejárt token (401)");
    }

    if (!res.ok) {
        const err = await res.json().catch(() => ({}));
        throw new Error(err.message || `Hiba: ${res.status}`);
    }

    return res.json();
}

export { apiFetch, API_BASE };