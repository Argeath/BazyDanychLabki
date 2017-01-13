CREATE TABLE producenci(
	id int not null primary key,
	nazwa_firmy varchar(50) not null,
	panstwo varchar(2) not null
);

CREATE TABLE modele(
	id int not null primary key,
	seria varchar(10) not null,
	model varchar(10) not null,
	rok_wydania int not null,
	producent_id int not null references producenci
);

CREATE TABLE linie_lotnicze(
	id int not null primary key,
	nazwa varchar(50) not null,
	adres_siedziby varchar(255),
	kapital float,
	kwota_ubezpieczenia float,
	nr_tel_awaryjny varchar(13)
);

CREATE TABLE samoloty(
	id int not null primary key,
	data_kupna date not null,
	przelatane_godziny int default 0,
	model_id int not null references modele,
	linia_lotnicza_id int not null references linie_lotnicze
);

CREATE TABLE awarie(
	id int not null primary key,
	czas_wystapienia datetime not null,
	rodzaj_awarii int not null,
	czy_naprawiono bit not null default 0,
	samolot_id int not null references samoloty
);

CREATE TABLE serwisy(
	id int not null primary key,
	data_oddania_do_naprawy date default GETDATE(),
	data_konca_naprawy date default null,
	samolot_id int not null references samoloty,
	awaria_id int not null references awarie
);

CREATE TABLE loty(
	id int not null primary key,
	skad varchar(4) not null,
	dokad varchar(4) not null,
	czas_startu datetime not null,
	czas_ladowania datetime default null,
	linia_lotnicza_id int not null references linie_lotnicze,
	samolot_id int not null references samoloty
);

CREATE TABLE osoby(
	nr_paszportu varchar(20) not null primary key,
	imie varchar(20) not null,
	nazwisko varchar(30) not null,
	data_urodzenia date not null,
	obywatelstwo varchar(2) not null
);

CREATE TABLE miejsca(
	id int not null primary key,
	rzad_numer int not null check(rzad_numer > 0),
	rzad_miejsce char(1) not null check(rzad_miejsce LIKE '[A-Z]'),
	klasa varchar(15) not null check (klasa IN('biznesowa', 'ekonomiczna', 'pierwsza')),
	lot_id int not null references loty,
	osoba_id varchar(20) references osoby
);

CREATE TABLE pracownicy(
	osoba_id varchar(20) not null references osoby primary key,
	klasa varchar(15) not null check (klasa IN('pilot', 'steward')),
	linia_lotnicza_id int not null references linie_lotnicze
);

CREATE TABLE zaloga(
	osoba_id varchar(20) not null references osoby,
	lot_id int not null references loty,
	stanowisko varchar(30) not null check (stanowisko IN('I pilot', 'II pilot', 'kierownik stewardow', 'steward')),
	PRIMARY KEY(osoba_id, lot_id)
);
