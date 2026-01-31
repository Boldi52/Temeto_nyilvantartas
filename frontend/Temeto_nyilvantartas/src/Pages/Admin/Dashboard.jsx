import React from 'react';

export default function AdminDashboard({ stats = {} }) {
    return (
        <div className="admin-page">
            <h2 className="admin-title">Admin vezérlőpult</h2>

            <div className="admin-card">
                <h3 className="admin-subtitle">Üdv, admin!</h3>
                <p className="admin-text">
                    Itt menedzselheted a temető nyilvántartás admin funkcióit.
                </p>

                <div className="admin-grid">
                    <Card title="Sírbérlők" value={stats.tenants ?? '—'} to="/admin/sirberlok" desc="Sírbérlők kezelése" />
                    <Card title="Sírhelyek" value={stats.graves ?? '—'} to="/admin/sirhelyek" desc="Sírhelyek kezelése" />
                    <Card title="Befizetések" value={stats.payments ?? '—'} to="/admin/befizetesek" desc="Befizetések áttekintése" />
                    <Card title="Dokumentumok" value={stats.documents ?? '—'} to="/admin/dokumentumok" desc="Dokumentumkezelés" />
                    <Card title="Felhasználók" value={stats.users ?? '—'} to="/admin/users" desc="Felhasználói jogosultságok" />
                    <Card title="Napló / Audit" value={stats.logs ?? '—'} to="/admin/logs" desc="Eseménynapló megtekintése" />
                </div>
            </div>
        </div>
    );
}

function Card({ title, value, desc, to }) {
    return (
        <a href={to} className="admin-card-link">
            <div className="admin-card-body">
                <div className="admin-card-texts">
                    <div className="admin-card-title">{title}</div>
                    <div className="admin-card-value">{value}</div>
                    <div className="admin-card-desc">{desc}</div>
                </div>
                <span className="admin-card-arrow">Tovább</span>
            </div>
        </a>
    );
}