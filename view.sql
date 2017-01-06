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