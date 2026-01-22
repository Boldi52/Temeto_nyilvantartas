import React, { useState, useMemo, useEffect } from "react";
import "../Layouts/Layout.css";
import "../CSS-ek/DeceasedPage.css";
import { apiFetch } from "../api";

export default function DeceasedPage() {
  const [filters, setFilters] = useState({ name: "", parcella: "", sor: "", sirhely: "" });
  const [deceasedList, setDeceasedList] = useState([]);
  const [parcellaMap, setParcellaMap] = useState({});
  const [sorMap, setSorMap] = useState({});
  const [sirhelyMap, setSirhelyMap] = useState({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  // Segédfüggvény: endpoint neve + hívás
  const safeFetch = async (label, path) => {
    try {
      return await apiFetch(path);
    } catch (e) {
      console.error(`${label} hiba`, e);
      throw new Error(`${label} hiba: ${e.message || e}`);
    }
  };

  useEffect(() => {
    const loadAll = async () => {
      setLoading(true);
      setError("");
      try {
        const elhunytak = await safeFetch("Elhunytak", "/api/elhunytMindenAdata");

        // A kapcsolódó táblák külön hibakezeléssel: ha valamelyik nem jön, a többivel továbbmegyünk
        let parcellak = [];
        let sorok = [];
        let sirhelyek = [];

        try {
          parcellak = await safeFetch("Parcellák", "/api/parcellak");
        } catch (e) {
          console.warn(e.message);
        }

        try {
          sorok = await safeFetch("Sorok", "/api/sorok");
        } catch (e) {
          console.warn(e.message);
        }

        try {
          sirhelyek = await safeFetch("Sírhelyek", "/api/sirhelyek");
        } catch (e) {
          console.warn(e.message);
        }

        const parcMap = {};
        (parcellak || []).forEach((p) => {
          parcMap[p.id] = p.nev || p.name || p.parcella || p.parcella_azonosito || p.parcela || "";
        });

        const sorokMap = {};
        (sorok || []).forEach((s) => {
          sorokMap[s.id] = s.nev || s.name || s.sor || s.sor_azonosito || "";
        });

        const sirMap = {};
        (sirhelyek || []).forEach((s) => {
          sirMap[s.id] = s.sirkod || s.nev || s.name || s.sir || s.sir_azonosito || "";
        });

        setParcellaMap(parcMap);
        setSorMap(sorokMap);
        setSirhelyMap(sirMap);

        const normalized = Array.isArray(elhunytak)
          ? elhunytak.map((item) => ({
              id: item.id,
              name: item.nev || "",
              birthDate: item.szul_datum || "",
              deathDate:item.halal_datuma || "",
              parcellaId: item.id,
              sorId: item.id,
              sirhelyId: item.sirhely_id,
              parcella: item.parcella_id,
              sor: item.sor || item.sor_azonosito || "",
              sirhely: item.sirhely_id,
            }))
          : [];
        setDeceasedList(normalized);
      } catch (e) {
        setError(e.message || "Hiba történt az adatok betöltésekor.");
      } finally {
        setLoading(false);
      }
    };

    loadAll();
  }, []);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFilters((prev) => ({ ...prev, [name]: value }));
  };

  const handleSearch = (e) => {
    e.preventDefault();
    // Ha szerveroldali név-szűrést szeretnél:
    // apiFetch(`/api/elhunytak/nev/${encodeURIComponent(filters.name)}`)
  };

  const filteredList = useMemo(() => {
    const normalize = (s = "") => s.toString().toLowerCase().trim();
    return deceasedList.filter((d) => {
      const displayParcella = d.parcella || parcellaMap[d.parcellaId] || "";
      const displaySor = d.sor || sorMap[d.sorId] || "";
      const displaySirhely = d.sirhely || sirhelyMap[d.sirhelyId] || "";

      if (filters.name && !normalize(d.name).includes(normalize(filters.name))) return false;
      if (filters.parcella && !normalize(displayParcella).includes(normalize(filters.parcella))) return false;
      if (filters.sor && !normalize(displaySor).includes(normalize(filters.sor))) return false;
      if (filters.sirhely && !normalize(displaySirhely).includes(normalize(filters.sirhely))) return false;
      return true;
    });
  }, [deceasedList, filters, parcellaMap, sorMap, sirhelyMap]);

  if (loading) return <div className="deceased-page">Betöltés...</div>;
  if (error) return <div className="deceased-page">Hiba: {error}</div>;

  return (
    <div className="deceased-page">
      <div className="deceased-header">
        <h1 className="title">Elhunytak</h1>
        <p className="subtitle">Nyilvántartott elhunytak listája</p>
      </div>

      <form className="search-bar" onSubmit={handleSearch}>
        <input className="search-input" name="name" placeholder="Név" value={filters.name} onChange={handleChange} />
        <input className="search-input" name="parcella" placeholder="Parcella" value={filters.parcella} onChange={handleChange} />
        <input className="search-input" name="sor" placeholder="Sor" value={filters.sor} onChange={handleChange} />
        <input className="search-input" name="sirhely" placeholder="Sírhely" value={filters.sirhely} onChange={handleChange} />
        <button className="search-button" type="submit">Keresés</button>
      </form>

      <div className="table-wrapper">
        <table className="deceased-table" cellSpacing="0">
          <thead>
            <tr>
              <th className="col-name">Név</th>
              <th className="col-birth">Születési<br />dátum</th>
              <th className="col-death">Halálozási<br />dátum</th>
              <th className="col-parcella">Parcella</th>
              <th className="col-sor">Sor</th>
              <th className="col-sirhely">Sírhely</th>
            </tr>
          </thead>
          <tbody>
            {filteredList.length === 0 ? (
              <tr className="empty-row">
                <td colSpan="6">Nincs találat</td>
              </tr>
            ) : (
              filteredList.map((d) => {
                const displayParcella = d.parcella || parcellaMap[d.parcellaId] || "—";
                const displaySor = d.sor || sorMap[d.sorId] || "—";
                const displaySirhely = d.sirhely || sirhelyMap[d.sirhelyId] || "—";
                return (
                  <tr key={d.id}>
                    <td>{d.name || "—"}</td>
                    <td>{d.birthDate || "—"}</td>
                    <td>{d.deathDate || "—"}</td>
                    <td>{displayParcella}</td>
                    <td>{displaySor}</td>
                    <td>{displaySirhely}</td>
                  </tr>
                );
              })
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}