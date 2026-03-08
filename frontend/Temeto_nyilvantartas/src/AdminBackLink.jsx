import React from "react";
import { Link } from "react-router-dom";
import "./CSS-ek/admin-dashboard.css";

export default function AdminBackLink() {
  return (
    <Link to="/admin/dashboard" className="admin-back-link" aria-label="Vissza a vezérlőpultra">
      <span className="admin-back-icon">←</span>
      <span className="admin-back-text">Vissza a vezérlőpultra</span>
    </Link>
  );
}