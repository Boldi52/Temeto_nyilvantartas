import React from 'react';
import '../../CSS-ek/admin-dashboard.css';

export default function AdminDashboard({ stats = {} }) {
    return (
        <div className="admin-dashboard-page">
            <h2 className="admin-dashboard-title">Admin vezérlőpult</h2>

            <div className="admin-dashboard-card">
                <h3 className="admin-dashboard-card__subtitle">Üdv, admin!</h3>
                <p className="admin-dashboard-card__text">
                    Itt menedzselheted a temető nyilvántartás admin funkcióit.
                </p>

                <div className="admin-dashboard-grid">
                    <DashboardCard 
                        title="Sírbérlők" 
                        value={stats.tenants ?? '—'} 
                        to="/admin/sirberlok" 
                        desc="Sírbérlők kezelése" 
                    />
                    <DashboardCard 
                        title="Sírhelyek" 
                        value={stats.graves ?? '—'} 
                        to="/admin/sirhelyek" 
                        desc="Sírhelyek kezelése" 
                    />
                    <DashboardCard 
                        title="Befizetések" 
                        value={stats.payments ?? '—'} 
                        to="/admin/befizetesek" 
                        desc="Befizetések áttekintése" 
                    />
                    <DashboardCard 
                        title="Dokumentumok" 
                        value={stats.documents ?? '—'} 
                        to="/admin/dokumentumok" 
                        desc="Dokumentumkezelés" 
                    />
                    <DashboardCard 
                        title="Felhasználók" 
                        value={stats.users ?? '—'} 
                        to="/admin/users" 
                        desc="Felhasználói jogosultságok" 
                    />
                    <DashboardCard 
                        title="Napló / Audit" 
                        value={stats.logs ?? '—'} 
                        to="/admin/logs" 
                        desc="Eseménynapló megtekintése" 
                    />
                </div>
            </div>
        </div>
    );
}

function DashboardCard({ title, value, desc, to }) {
    return (
        <a href={to} className="admin-dashboard-card-link">
            <div className="admin-dashboard-card-body">
                <div className="admin-dashboard-card-texts">
                    <div className="admin-dashboard-card-title">{title}</div>
                    <div className="admin-dashboard-card-value">{value}</div>
                    <div className="admin-dashboard-card-desc">{desc}</div>
                </div>
                <span className="admin-dashboard-card-arrow">Tovább</span>
            </div>
        </a>
    );
}