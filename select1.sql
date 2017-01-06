/*
	Boeing poinformowa³ o wadzie produkcyjnej pewnej czêœci(rodzaj awarii = 36), u¿ytej w modelach 737-900(id=2). 
	Nale¿y skontrolowaæ Linie lotnicze posiadaj¹ce ten model czy naprawi³y samolot.

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
