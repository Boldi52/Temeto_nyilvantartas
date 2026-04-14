import React, { useState, useMemo, useEffect } from "react";
import "../Layouts/Layout.css";
import "../CSS-ek/DeceasedPage.css";
import { apiFetch } from "../api";
import LoadingOverlay from "../Layouts/LoadingOverlay";

export default function DeceasedPage() {
  const [filters, setFilters] = useState({
    name: "",
    parcella: "",
    sor: "",
    sirhely: "",
  });
  const [deceasedList, setDeceasedList] = useState([]);
  const [parcellaMap, setParcellaMap] = useState({});
  const [sorMap, setSorMap] = useState({});
  const [sirhelyMap, setSirhelyMap] = useState({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

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
          parcMap[p.id] =
            p.nev ||
            p.name ||
            p.parcella ||
            p.parcella_azonosito ||
            p.parcela ||
            "";
        });

        const sorokMap = {};
        (sorok || []).forEach((s) => {
          sorokMap[s.id] = s.nev || s.name || s.sor || s.sor_azonosito || "";
        });

        const sirMap = {};
        (sirhelyek || []).forEach((s) => {
          // >>> JAVÍTVA: ID helyett sorszám előnyben
          sirMap[s.id] =
            (s.sorszam != null && String(s.sorszam).trim() !== "" ? String(s.sorszam) : "") ||
            s.sirkod ||
            s.nev ||
            s.name ||
            s.sir ||
            s.sir_azonosito ||
            "";
        });

        // gyors kereséshez id -> object map
        const sorById = {};
        (sorok || []).forEach((s) => {
          sorById[s.id] = s;
        });

        const sirhelyById = {};
        (sirhelyek || []).forEach((s) => {
          sirhelyById[s.id] = s;
        });

        setParcellaMap(parcMap);
        setSorMap(sorokMap);
        setSirhelyMap(sirMap);

        const normalized = Array.isArray(elhunytak)
          ? elhunytak.map((item) => {
              const sirhelyId = item.sirhely_id ?? item.sirhely?.id ?? "";

              const sorId =
                item.sor_id ??
                item.sor?.id ??
                sirhelyById[sirhelyId]?.sor_id ??
                item.sirhely?.sor_id ??
                item.sirhely?.sor?.id ??
                "";

              const parcellaId =
                item.parcella_id ??
                item.parcella?.id ??
                item.sor?.parcella_id ??
                sorById[sorId]?.parcella_id ??
                item.sirhely?.sor?.parcella_id ??
                "";

              return {
                id: item.id,
                name: item.nev || "",
                birthDate: item.szul_datum || "",
                deathDate: item.halal_datuma || "",
                parcellaId,
                sorId,
                sirhelyId,
                parcella: item.parcella ?? null,
                sor: item.sor ?? item.sirhely?.sor ?? null,
                sirhely: item.sirhely ?? null,
              };
            })
          : [];
        setDeceasedList(normalized);
      } catch (err) {
        setError(err.message || "Ismeretlen hiba");
      } finally {
        setLoading(false);
      }
    };
    loadAll();
  }, []);

  const handleFilterChange = (e) => {
    const { name, value } = e.target;
    setFilters((f) => ({ ...f, [name]: value }));
  };

  const filtered = useMemo(() => {
    return deceasedList.filter((item) => {
      const nameMatch = item.name.toLowerCase().includes(filters.name.toLowerCase());

      const parcellaLabel =
        parcellaMap[item.parcellaId] ||
        item.parcella?.nev ||
        item.parcella?.parcella_azonosito ||
        String(item.parcellaId || "");

      const sorLabel =
        sorMap[item.sorId] ||
        item.sor?.nev ||
        item.sor?.sor_azonosito ||
        String(item.sorId || "");

      const sirhelyLabel =
        // >>> JAVÍTVA: sorszám előnyben
        (item.sirhely?.sorszam != null && String(item.sirhely.sorszam).trim() !== ""
          ? String(item.sirhely.sorszam)
          : "") ||
        item.sirhely?.sirkod ||
        sirhelyMap[item.sirhelyId] ||
        String(item.sirhelyId || "");

      const parcellaMatch =
        !filters.parcella ||
        parcellaLabel.toLowerCase().includes(filters.parcella.toLowerCase());
      const sorMatch =
        !filters.sor ||
        sorLabel.toLowerCase().includes(filters.sor.toLowerCase());
      const sirhelyMatch =
        !filters.sirhely ||
        sirhelyLabel.toLowerCase().includes(filters.sirhely.toLowerCase());

      return nameMatch && parcellaMatch && sorMatch && sirhelyMatch;
    });
  }, [deceasedList, filters, parcellaMap, sorMap, sirhelyMap]);

  const limitedFiltered = useMemo(() => filtered.slice(0, 6), [filtered]);

  if (loading) {
    return (
      <div className="deceasedpage-wrapper loading-center">
        <div className="spinner" role="status" aria-label="Betöltés" />
      </div>
    );
  }
  if (error) return <div className="deceasedpage-wrapper">Hiba: {error}</div>;

  return (
    <div className="deceasedpage-wrapper">
      <div className="deceasedpage-header">
        <h1 className="deceasedpage-header__title">Elhunytak</h1>
        <p className="deceasedpage-header__subtitle">Keresés az elhunytak között</p>
      </div>

      <div className="deceasedpage-search-bar">
        <input
          type="text"
          name="name"
          placeholder="Keresés név szerint..."
          value={filters.name}
          onChange={handleFilterChange}
          className="deceasedpage-search-input"
        />
        <input
          type="text"
          name="parcella"
          placeholder="Parcella..."
          value={filters.parcella}
          onChange={handleFilterChange}
          className="deceasedpage-search-input"
        />
        <input
          type="text"
          name="sor"
          placeholder="Sor..."
          value={filters.sor}
          onChange={handleFilterChange}
          className="deceasedpage-search-input"
        />
        <input
          type="text"
          name="sirhely"
          placeholder="Sírhely..."
          value={filters.sirhely}
          onChange={handleFilterChange}
          className="deceasedpage-search-input"
        />
      </div>

      <div className="deceasedpage-table-wrapper">
        <table className="deceasedpage-table">
          <thead>
            <tr>
              <th className="deceasedpage-col-name">Név</th>
              <th className="deceasedpage-col-birth">Születési dátum</th>
              <th className="deceasedpage-col-death">Halál dátuma</th>
              <th className="deceasedpage-col-parcella">Parcella</th>
              <th className="deceasedpage-col-sor">Sor</th>
              <th className="deceasedpage-col-sirhely">Sírhely</th>
            </tr>
          </thead>
          <tbody>
            {limitedFiltered.length > 0 ? (
              limitedFiltered.map((item) => (
                <tr key={item.id}>
                  <td className="deceasedpage-col-name" data-label="Név">
                    {item.name}
                  </td>
                  <td className="deceasedpage-col-birth" data-label="Születési dátum">
                    {item.birthDate}
                  </td>
                  <td className="deceasedpage-col-death" data-label="Halál dátuma">
                    {item.deathDate}
                  </td>
                  <td className="deceasedpage-col-parcella" data-label="Parcella">
                    {parcellaMap[item.parcellaId] ||
                      item.parcella?.nev ||
                      item.parcella?.parcella_azonosito ||
                      item.parcellaId ||
                      "—"}
                  </td>
                  <td className="deceasedpage-col-sor" data-label="Sor">
                    {sorMap[item.sorId] ||
                      item.sor?.nev ||
                      item.sor?.sor_azonosito ||
                      item.sorId ||
                      "—"}
                  </td>
                  <td className="deceasedpage-col-sirhely" data-label="Sírhely">
                    {(item.sirhely?.sorszam != null && String(item.sirhely.sorszam).trim() !== ""
                      ? String(item.sirhely.sorszam)
                      : "") ||
                      item.sirhely?.sirkod ||
                      sirhelyMap[item.sirhelyId] ||
                      "—"}
                  </td>
                </tr>
              ))
            ) : (
              <tr className="deceasedpage-empty-row">
                <td colSpan="6">Nincs találat</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}