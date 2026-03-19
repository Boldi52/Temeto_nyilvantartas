import React, { useEffect, useMemo, useState } from "react";

const API_BASE = "http://127.0.0.1:8000"; // Laravel backend címe

const GraveSites = () => {
  const [elhunytak, setElhunytak] = useState([]);
  const [sirhelyek, setSirhelyek] = useState([]);
  const [loading, setLoading] = useState(true);
  const [hiba, setHiba] = useState("");

  const [kereses, setKereses] = useState("");
  const [kivalasztott, setKivalasztott] = useState(null);

  useEffect(() => {
    const fetchJson = async (url, headers) => {
      const resp = await fetch(url, { headers });

      const text = await resp.text();
      let json = null;
      try {
        json = text ? JSON.parse(text) : null;
      } catch {}

      if (!resp.ok) {
        throw new Error(`[${url}] HTTP ${resp.status} ${resp.statusText}\n${text || "(üres válasz)"}`);
      }

      return json;
    };

    const parseArray = (body, fallbackKeys = []) => {
      if (Array.isArray(body)) return body;
      if (Array.isArray(body?.data)) return body.data;
      for (const key of fallbackKeys) {
        if (Array.isArray(body?.[key])) return body[key];
      }
      return [];
    };

    const fetchAdatok = async () => {
      try {
        setLoading(true);
        setHiba("");

        const token = localStorage.getItem("token");
        const headers = {
          Accept: "application/json",
          ...(token ? { Authorization: `Bearer ${token}` } : {}),
        };

        const [elhunytBody, sirhelyBody] = await Promise.all([
          fetchJson(`${API_BASE}/api/elhunytMindenAdata`, headers),
          fetchJson(`${API_BASE}/api/sirhelyek`, headers),
        ]);

        const elhunytLista = parseArray(elhunytBody, ["elhunytak", "elhunyt"]);
        const sirhelyLista = parseArray(sirhelyBody, ["sirhelyek", "sirhely"]);

        setElhunytak(elhunytLista);
        setSirhelyek(sirhelyLista);
      } catch (err) {
        setHiba(err.message || "Nem sikerült betölteni az adatokat az API-ból.");
      } finally {
        setLoading(false);
      }
    };

    fetchAdatok();
  }, []);

  const normalize = (text) =>
    (text || "")
      .toString()
      .normalize("NFD")
      .replace(/[\u0300-\u036f]/g, "")
      .toLowerCase()
      .trim();

  const formatDate = (dateStr) => {
    if (!dateStr) return "-";
    const d = new Date(dateStr);
    if (Number.isNaN(d.getTime())) return String(dateStr);
    return d.toLocaleDateString("hu-HU");
  };

  const getNev = (e) => e?.nev ?? "";
  const getSzul = (e) => e?.szul_datum ?? null;
  const getHalal = (e) => e?.halal_datuma ?? null;
  const getSirhelyId = (e) => e?.sirhely_id ?? null;
  const getEntityId = (e, i) => e?.id ?? `${getNev(e)}-${i}`;

  const talalatok = useMemo(() => {
    const q = normalize(kereses);
    if (!q) return [];
    return elhunytak.filter((e) => normalize(getNev(e)).includes(q));
  }, [kereses, elhunytak]);

  const kivalasztottSirhely = useMemo(() => {
    const sid = getSirhelyId(kivalasztott);
    if (!sid) return null;
    return sirhelyek.find((s) => String(s?.id) === String(sid)) || null;
  }, [kivalasztott, sirhelyek]);

  const azonosSirhelyenFekvok = useMemo(() => {
    const sid = getSirhelyId(kivalasztott);
    if (!sid) return [];
    return elhunytak.filter((e) => String(getSirhelyId(e)) === String(sid));
  }, [kivalasztott, elhunytak]);

  if (loading) return <div style={{ padding: 16 }}>Betöltés...</div>;

  return (
    <div style={{ padding: 16 }}>
      {hiba && <div style={{ marginBottom: 12, color: "crimson", whiteSpace: "pre-wrap" }}>{hiba}</div>}

      <h2>Elhunyt keresése név alapján</h2>

      <input
        type="text"
        value={kereses}
        onChange={(e) => {
          setKereses(e.target.value);
          setKivalasztott(null);
        }}
        placeholder="Pl.: Kiss, Imre, Mária..."
      />

      {kereses.trim() !== "" && (
        <div>
          {talalatok.length === 0 ? (
            <div>Nincs találat.</div>
          ) : (
            talalatok.map((e, i) => (
              <button key={getEntityId(e, i)} type="button" onClick={() => setKivalasztott(e)}>
                {getNev(e)} ({formatDate(getSzul(e))} – {formatDate(getHalal(e))})
              </button>
            ))
          )}
        </div>
      )}

      {kivalasztott && (
        <div style={{ marginTop: 12 }}>
          <div><strong>Név:</strong> {getNev(kivalasztott)}</div>
          <div><strong>Születési dátum:</strong> {formatDate(getSzul(kivalasztott))}</div>
          <div><strong>Halálozási dátum:</strong> {formatDate(getHalal(kivalasztott))}</div>
          <div><strong>Sírhely:</strong> {kivalasztottSirhely?.sirkod ?? "Nincs hozzárendelve"}</div>

          <h4>Azonos sírhelyen fekvők</h4>
          <ul>
            {azonosSirhelyenFekvok.map((sz, i) => (
              <li key={getEntityId(sz, i)}>
                {getNev(sz)} — {formatDate(getSzul(sz))} – {formatDate(getHalal(sz))}
              </li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
};

export default GraveSites;