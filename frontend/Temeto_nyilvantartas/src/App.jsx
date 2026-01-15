import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Layout from "./Layouts/Layout.jsx";
import MainPage from "./Pages/MainPage";
import DeceasedPage from "./Pages/DeceasedPage";
import GraveSitesPage from "./Pages/GraveSitesPage";
import MapPage from "./Pages/MapPage";
import AdminPage from "./Login_components/LoginPage.jsx";

export default function App() {
  return (

      <Routes>
        <Route element={<Layout />}>
          <Route path="/" element={<MainPage />} />
          <Route path="/elhunytak" element={<DeceasedPage />} />
          <Route path="/sirhelyek" element={<GraveSitesPage />} />
          <Route path="/terkep" element={<MapPage />} />
          <Route path="/admin" element={<AdminPage />} />
        </Route>
      </Routes>

  );
}