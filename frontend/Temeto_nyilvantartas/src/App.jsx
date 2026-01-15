import React from "react";
import "./App.css";
import MainPage from "./Pages/MainPage";
import LoginPage from "./login_components/LoginPage";
import { Routes, Route } from "react-router-dom";

function App() {
  return (
    <Routes>
      <Route path="/" element={<LoginPage />} />
      <Route path="/main" element={<MainPage />} />
    </Routes>
  );
}

export default App;
