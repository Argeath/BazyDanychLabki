INSERT INTO producenci VALUES
(1, 'Boeing', 'US'),
(2, 'Airbus', 'FR');

/* id, seria, model, rok_wydania, producent_id */
INSERT INTO modele VALUES
(1, '737', '700', 1997, 1),
(2, '737', '900', 2000, 1),
(3, 'A380', '800', 2005, 2);

/* id, nazwa, siedziba, kapital, kwota_ubezpieczenia, nr_tel_awaryjny */
INSERT INTO linie_lotnicze VALUES
(1, 'Deutsche Lufthansa AG', 'Kolonia, Niemcy', 100000000, 500000000, '0048987654321'),
(2, 'RyanAir', 'Swords, Dublin, Irlandia', 20000000, 100000000, '0048123456789');

/* id, data_kupna, przelatane_godziny, model_id, linia_id */
INSERT INTO samoloty VALUES
(1, '2002-03-15', 2500, 2, 1),
(2, '2007-05-11', 800, 3, 2),
(3, '2003-07-18', 1800, 1, 1),
(4, '2003-03-15', 2200, 2, 1),
(5, '2004-05-12', 1800, 2, 2),
(6, '2005-04-11', 1500, 2, 1);

/* id, czas, rodzaj, czy_naprawiono, samolot_id */
INSERT INTO awarie VALUES
(1, '2004-07-21', 65, 1, 1),
(2, '2008-02-12', 54, 1, 2),
(3, '2005-03-14', 44, 1, 1),
(4, '2006-06-07', 36, 1, 1),
(5, '2009-05-16', 74, 1, 2);

/* id, czas_oddania, czas_naprawy, samolot_id, awaria_id */
INSERT INTO serwisy VALUES
(1, '2004-07-23', '2004-07-29', 1, 1),
(2, '2008-02-13', '2008-03-03', 2, 2),
(3, '2005-03-15', '2005-03-28', 1, 3),
(4, '2006-06-07', '2006-06-22', 1, 4),
(5, '2009-05-16', '2009-06-03', 2, 5);

INSERT INTO osoby VALUES
('PL 55051843456', 'Grzegorz', 'Zawadzki', '1955-05-18', 'PL'),
('PL 95012467985', 'Apolonia', 'Król', '1962-12-08', 'PL'),
('PL 83100508092', 'Mariusz', 'Pawłowski', '1966-11-03', 'PL'),
('PL 42112597452', 'Iwo', 'Walczak', '1986-05-06', 'PL'),
('PL 96112680575', 'Janek', 'Kowalski', '1991-12-11', 'PL'),
('PL 94011611258', 'Tomasz', 'Stasiak', '1989-02-22', 'PL'),
('PL 41080711455', 'Adam', 'Kowalski', '1977-01-03', 'PL'),
('PL 56100610333', 'Jan', 'Nowak', '1984-05-11', 'PL'),
('PL 46120650356', 'Tomasz', 'Trzewik', '1970-02-17', 'PL');

/*id, skad, dokad, start, ladowanie, linia_id, samolot_id  */
INSERT INTO loty VALUES
(1, 'EPWA', 'EPGD', '2007-02-06 12:33:10', '2007-02-06 14:12:22', 1, 1),
(2, 'EPGD', 'EPKR', '2007-02-06 14:48:20', '2007-02-06 18:33:32', 1, 1),
(3, 'EPKR', 'EPWA', '2007-02-06 19:12:30', '2007-02-06 23:15:42', 1, 1),
(4, 'EPWA', 'EPGD', '2007-05-15 07:12:16', '2007-05-15 09:25:47', 2, 2),
(5, 'EPGD', 'EPWR', '2007-05-15 14:10:32', '2007-05-15 16:21:37', 2, 2),
(6, 'EPWR', 'EPWA', '2007-05-15 20:11:19', null, 2, 2);

/* id, rzad, miejsce, klasa, lot_id, osoba_id */
INSERT INTO miejsca VALUES
(1, 1, 'A', 'biznesowa', 1, 'PL 55051843456'),
(2, 2, 'B', 'pierwsza', 2, 'PL 95012467985'),
(3, 3, 'C', 'biznesowa', 1, 'PL 83100508092'),
(4, 2, 'A', 'ekonomiczna', 1, 'PL 42112597452'),
(5, 5, 'D', 'ekonomiczna', 4, 'PL 95012467985'),
(6, 6, 'B', 'ekonomiczna', 2, 'PL 55051843456'),
(7, 1, 'A', 'biznesowa', 5, 'PL 55051843456'),
(8, 2, 'B', 'pierwsza', 5, 'PL 95012467985'),
(9, 3, 'C', 'biznesowa', 6, 'PL 83100508092'),
(10, 2, 'A', 'ekonomiczna', 5, 'PL 42112597452'),
(11, 5, 'D', 'ekonomiczna', 6, 'PL 95012467985'),
(12, 6, 'B', 'ekonomiczna', 4, 'PL 55051843456');

INSERT INTO pracownicy VALUES
('PL 56100610333', 'pilot', 1),
('PL 41080711455', 'steward', 1),
('PL 94011611258', 'pilot', 2),
('PL 46120650356', 'steward', 2);

INSERT INTO zaloga VALUES
('PL 56100610333', 1, 'I pilot'),
('PL 56100610333', 2, 'I pilot'),
('PL 94011611258', 2, 'II pilot'),
('PL 56100610333', 3, 'I pilot'),
('PL 94011611258', 3, 'II pilot'),
('PL 41080711455', 1, 'kierownik stewardow'),
('PL 41080711455', 3, 'kierownik stewardow'),
('PL 94011611258', 4, 'I pilot'),
('PL 46120650356', 4, 'kierownik stewardow'),
('PL 94011611258', 5, 'I pilot'),
('PL 46120650356', 5, 'kierownik stewardow'),
('PL 94011611258', 6, 'I pilot'),
('PL 46120650356', 6, 'kierownik stewardow');
