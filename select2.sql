create view DaneLotu
	as select loty.*, pilot.imie, pilot.nazwisko, pilot.obywatelstwo
		from loty
			join (
				SELECT lot_id, osoba_id, stanowisko, osoby.imie, osoby.nazwisko, osoby.obywatelstwo
				FROM zaloga 
				JOIN osoby ON osoby.nr_paszportu = zaloga.osoba_id
				WHERE stanowisko = 'I pilot'
			) pilot
				on pilot.lot_id = loty.id
	with check option

/*
	Select1
	Boeing poinformowa³ o wadzie produkcyjnej pewnej czêœci(rodzaj awarii = 36), u¿ytej w modelach 737-900(id=2). 
	Nale¿y skontrolowæ Linie lotnicze posiadaj¹ce ten model czy naprawi³y samolot.

	Z³¹czenie
	Porz¹dkowanie
*/

SELECT samoloty.id AS 'samolot_id', nazwa AS 'Linia lotnicza', nr_tel_awaryjny,
	case when czy_naprawiono = 1 then 'tak'
       else 'nie'
       end as 'Czy naprawiono awarie'
FROM samoloty
JOIN(select id, nazwa, nr_tel_awaryjny from linie_lotnicze) l
	ON l.id = samoloty.linia_lotnicza_id
LEFT JOIN(select id, samolot_id, czy_naprawiono from awarie WHERE rodzaj_awarii = 36) a
	ON a.samolot_id = samoloty.id
WHERE samoloty.model_id = 2
ORDER BY samoloty.linia_lotnicza_id

/*
	Select2
	Lista pracowników linii lotniczej(id = 1) z liczb¹ odbytych lotów.

	Agregacja
	Porzadkowanie
	Podzapytanie
	Z³¹czenie
*/

SELECT osoby.*, (
	SELECT COUNT(loty.id) FROM loty
	JOIN zaloga ON zaloga.lot_id = loty.id AND zaloga.osoba_id = pracownicy.osoba_id
	) as 'odbyte loty'
FROM pracownicy, osoby
WHERE osoby.nr_paszportu = pracownicy.osoba_id
ORDER BY [odbyte loty] DESC;


/*
	Select3
	Iloœæ osób i za³ogi, którzy wsiedli lub wysiedli na lotnisku w Gdañsku pomiêdzy 2007-02-06 10:00:00 i 2007-02-06 20:00:00

	Agregacja
	Podzapytanie
*/

SELECT loty.id, loty.skad, loty.dokad, loty.czas_startu, loty.czas_ladowania,
(SELECT COUNT(osoba_id) FROM zaloga WHERE zaloga.lot_id = loty.id) as 'ilosc zalogi',
(SELECT COUNT(osoba_id) FROM miejsca WHERE miejsca.lot_id = loty.id) as 'ilosc pasazerow'
FROM osoby, zaloga, miejsca, loty
WHERE ((loty.skad = 'EPGD' AND loty.czas_startu > '2007-02-06 10:00:00'	   AND loty.czas_startu    < '2007-02-06 20:00:00')
   OR (loty.dokad = 'EPGD' AND loty.czas_ladowania > '2007-02-06 10:00:00' AND loty.czas_ladowania < '2007-02-06 20:00:00'))
GROUP BY loty.id, loty.skad, loty.dokad, loty.czas_startu, loty.czas_ladowania;


/*
	Select4
	Ilosc samolotow danej linii lotniczej

	Grupowanie
*/

SELECT linie_lotnicze.nazwa, COUNT(samoloty.id) as 'il. samolotow'
FROM samoloty, linie_lotnicze
WHERE linie_lotnicze.id = samoloty.linia_lotnicza_id
GROUP BY linie_lotnicze.nazwa;

/*
	Select5
	Loty w powietrzu, ich zaloga i il. pasazerow

	Agregacja
	Grupowanie
	Z³¹czenia
*/

SELECT loty.skad, loty.dokad, loty.czas_startu, COUNT(miejsca.id) as 'il. pasazerow', osoby.imie, osoby.nazwisko, zaloga.stanowisko
FROM loty
LEFT JOIN zaloga ON zaloga.lot_id = loty.id
JOIN osoby ON osoby.nr_paszportu = zaloga.osoba_id
LEFT JOIN miejsca ON miejsca.lot_id = loty.id
WHERE loty.czas_ladowania IS NULL
GROUP BY loty.id, loty.skad, loty.dokad, loty.czas_startu, loty.czas_ladowania, osoby.imie, osoby.nazwisko, zaloga.stanowisko
ORDER BY loty.id, zaloga.stanowisko;

/*
	Select6
	Lista linii lotniczych i iloœci¹ posiadanych przez nie modeli samolotów

	Agregacja
	Grupowanie
	Z³¹czenia
*/

SELECT linie_lotnicze.nazwa AS 'linia lotnicza', CONCAT(producenci.nazwa_firmy, ' ', modele.seria, '-', modele.model) AS 'model samolotu', COUNT(modele.id) AS 'ilosc'
FROM linie_lotnicze
LEFT JOIN samoloty ON samoloty.linia_lotnicza_id = linie_lotnicze.id
JOIN modele ON modele.id = samoloty.model_id
JOIN producenci ON modele.producent_id = producenci.id
GROUP BY linie_lotnicze.nazwa, producenci.nazwa_firmy, modele.seria, modele.model;

/*
	Select7
	Lista lotów samolotu(id = 2) z informacj¹ o kapitanie lotu.
	
	Widok
*/

SELECT * FROM DaneLotu
WHERE samolot_id = 2;