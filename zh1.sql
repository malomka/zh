SELECT *
FROM szallashely
WHERE month(rogz_ido)=3 and hely like '%Balaton%'
ORDER BY csillagok_szama DESC



SELECT szh.SZALLAS_ID, szh.SZALLAS_NEV, count(sz.szoba_id) as 'klimas_szobak_szama'
FROM Szallashely szh JOIN Szoba sz ON szh.szallas_id = sz.szallas_fk
WHERE sz.klimas='i'
GROUP BY szh.SZALLAS_ID, szh.SZALLAS_NEV



SELECT COUNT(*) as 'foglalásszám',
CASE
    WHEN left(v.szul_dat, 4)<1970 THEN 'idős'
    WHEN left(v.szul_dat, 4)>1985 THEN 'fiatal'
    ELSE 'középkorú'
END as 'kategória'
FROM vendeg v JOIN foglalas f ON v.usernev = f.ugyfel_fk
WHERE FELNOTT_SZAM+GYERMEK_SZAM>=2
GROUP BY CASE
    WHEN left(v.szul_dat, 4)<1970 THEN 'idős'
    WHEN left(v.szul_dat, 4)>1985 THEN 'fiatal'
    ELSE 'középkorú'
END 