import React, { useState, useMemo } from "react";
import "../Layouts/Layout.css";
import "../CSS-ek/DeceasedPage.css";

export default function DeceasedPage() {
  const [filters, setFilters] = useState({
    name: "",
    parcella: "",
    sor: "",
    sirhely: "",
  });

  // Példa adatok a megjelenítéshez — cseréld le a backendről jövő adatokra
  const sampleData = [
    {
      id: 1,
      name: "Kovács János",
      birthDate: "1940-03-12",
      deathDate: "2020-05-01",
      parcella: "A",
      sor: "3",
      sirhely: "12",
    },
    {
      id: 2,
      name: "Nagy Éva",
      birthDate: "1955-07-20",
      deathDate: "2018-11-15",
      parcella: "B",
      sor: "1",
      sirhely: "5",
    },
  ];

  const [deceasedList] = useState(sampleData);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFilters((prev) => ({ ...prev, [name]: value }));
  };

  const handleSearch = (e) => {
    e.preventDefault();
    // Jelenleg a szűrés helyben történik a sampleData alapján.
    // Ha backend endpoint áll rendelkezésre, itt küldd el a kérésedet.
  };

  const filteredList = useMemo(() => {
    const normalize = (s = "") => s.toString().toLowerCase().trim();
    return deceasedList.filter((d) => {
      if (
        filters.name &&
        !normalize(d.name).includes(normalize(filters.name))
      )
        return false;
      if (
        filters.parcella &&
        !normalize(d.parcella).includes(normalize(filters.parcella))
      )
        return false;
      if (filters.sor && !normalize(d.sor).includes(normalize(filters.sor)))
        return false;
      if (
        filters.sirhely &&
        !normalize(d.sirhely).includes(normalize(filters.sirhely))
      )
        return false;
      return true;
    });
  }, [deceasedList, filters]);

  return (
    <div className="deceased-page">
      <div className="deceased-header">
        <h1 className="title">Elhunytak</h1>
        <p className="subtitle">Nyilvántartott elhunytak listája</p>
      </div>

      <form className="search-bar" onSubmit={handleSearch}>
        <input
          className="search-input"
          name="name"
          placeholder="Név"
          value={filters.name}
          onChange={handleChange}
        />
        <input
          className="search-input"
          name="parcella"
          placeholder="Parcella"
          value={filters.parcella}
          onChange={handleChange}
        />
        <input
          className="search-input"
          name="sor"
          placeholder="Sor"
          value={filters.sor}
          onChange={handleChange}
        />
        <input
          className="search-input"
          name="sirhely"
          placeholder="Sírhely"
          value={filters.sirhely}
          onChange={handleChange}
        />
        <button className="search-button" type="submit">
          Keresés
        </button>
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
              filteredList.map((d) => (
                <tr key={d.id}>
                  <td>{d.name}</td>
                  <td>{d.birthDate}</td>
                  <td>{d.deathDate}</td>
                  <td>{d.parcella}</td>
                  <td>{d.sor}</td>
                  <td>{d.sirhely}</td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}