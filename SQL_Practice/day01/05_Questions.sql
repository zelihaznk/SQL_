CREATE TABLE personel6(
	id int, 
	isim varchar(50), 
	sehir varchar(50), 
	maas int, 
	sirket varchar(20)
);
INSERT INTO personel6 VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500, 'IBM');
INSERT INTO personel6 VALUES(234567891, 'Brian Pitt', 'Florida', 1500, 'LINUX');
INSERT INTO personel6 VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLS FARGO');
INSERT INTO personel6 VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000, 'GOOGLE');  
INSERT INTO personel6 VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT');
INSERT INTO personel6 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK');
INSERT INTO personel6 VALUES(123456719, 'Adem Stone', 'New Jersey', 2500, 'IBM');

SELECT * FROM personel6;

CREATE TABLE isciler (
	id int,
	isim varchar(50), 
	sehir varchar(50), 
	maas int, 
	sirket varchar(20)
);
INSERT INTO isciler VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO isciler VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO isciler VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO isciler VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO isciler VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO isciler VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO isciler VALUES(123456710, 'Mark Stone', 'texas', 2500, 'IBM');

SELECT * FROM isciler;

-- TASK-1 : Her iki tablodaki ortak id’leri ve personel6 tablosunda bu id’ye sahip isimleri
-- isme gore sirali olarak listeleyen query yaziniz
SELECT id,isim FROM personel6 
WHERE Exists(Select id From isciler Where isciler.id=personel6.id) 
Order BY isim;


-- 2) Personel6 tablosunda kac tane kayit oldugunu gosteren query yazin
SELECT Count(id) As Kayit_Sayisi
FROM personel6;


-- 3)Isciler tablosunda en yuksek maasi alan kisinin tum bilgilerini gosteren query yazin
SELECT * FROM isciler
WHERE maas=(SELECT Max(maas) FROM isciler);


-- 4) Isciler tablosunda ikinci en yuksek maasi maasi gosteren query yazin
SELECT Max(maas) As "En Yuksek 2. Maas" 
FROM isciler 
WHERE maas<(SELECT Max(maas) FROM isciler);


--5) Isciler tablosunda ikinci en yuksek maasi alan kisinin tum bilgilerini listeleyen sorgu yaziniz
SELECT * FROM isciler
WHERE maas<(SELECT max(maas) FROM isciler)
Order By maas Desc Limit 1;

