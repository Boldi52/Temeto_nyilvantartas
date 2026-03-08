import './CSS-ek/admin-dashboard.css';
import { Routes, Route } from "react-router-dom";
import Layout from "./Layouts/Layout.jsx";
import MainPage from "./Pages/MainPage";
import DeceasedPage from "./Pages/DeceasedPage";
import GraveSitesPage from "./Pages/GraveSitesPage";
import MapPage from "./Pages/MapPage";
import AdminPage from "./Login_components/LoginPage.jsx";
import AdminDashboard from "./Pages/Admin/Dashboard.jsx";
import AdminGraveSites from "./Pages/Admin/AdminGraveSites.jsx";
import AdminGraveTenant from "./Pages/Admin/AdminGraveTenant.jsx";
import AdminPayment from './Pages/Admin/AdminPayment.jsx';
import AdminDocument from './Pages/Admin/AdminDocument.jsx';
import AdminDeceades from './Pages/Admin/AdminDeceades.jsx';
import RequireAdmin from "./RequireAdmin.jsx";

export default function App() {
  return (
    <Routes>
      <Route element={<Layout />}>
        <Route index element={<MainPage />} />
        <Route path="elhunytak" element={<DeceasedPage />} />
        <Route path="sirhelyek" element={<GraveSitesPage />} />
        <Route path="terkep" element={<MapPage />} />
        <Route path="admin" element={<AdminPage />} />

        {/* VÉDETT ADMIN ÚTVONALAK */}
        <Route
          path="admin/dashboard"
          element={
            <RequireAdmin>
              <AdminDashboard />
            </RequireAdmin>
          }
        />
        <Route
          path="admin/sirhelyek"
          element={
            <RequireAdmin>
              <AdminGraveSites />
            </RequireAdmin>
          }
        />
        <Route
          path="admin/sirberlok"
          element={
            <RequireAdmin>
              <AdminGraveTenant />
            </RequireAdmin>
          }
        />
        <Route
          path="admin/befizetesek"
          element={
            <RequireAdmin>
              <AdminPayment />
            </RequireAdmin>
          }
        />
        <Route
          path="admin/dokumentumok"
          element={
            <RequireAdmin>
              <AdminDocument />
            </RequireAdmin>
          }
        />
        <Route
          path="admin/elhunytak"
          element={
            <RequireAdmin>
              <AdminDeceades />
            </RequireAdmin>
          }
        />
      </Route>
    </Routes>
  );
}