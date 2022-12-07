/*
  UNION Operator

1) iki sorgu(query) sonucunu birlestirmek icin kullanilir.
2) Tekrarsiz(Unique) record(satir)'lari verir.
3) Tek bir sutuna cok sutun koyabiliriz.
4) Tek bir sutuna cok sutun koyarken mevcut data durumuna dikkat etmek gerekir.!
*/
CREATE TABLE workers(
  	id CHAR(9),	
	name VARCHAR(50), 
	state VARCHAR(50),
	salary SMALLINT,
	company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM workers;


--TASK-1 : salary değeri 3000'den yüksek olan state değerlerini ve salary 2000'den küçük olan name değerlerini tekrarsız olarak bulun.
SELECT state AS "NAME And STATE",salary
FROM workers
WHERE salary>3000

UNION

SELECT name,salary
FROM workers
WHERE salary<2000;


--TASK-2 : salary değeri 3000'den yüksek olan state değerlerini ve 2000'den küçük olan name değerlerini tekrarlı olarak bulun.
SELECT state AS "NAME And STATE",salary
FROM workers
WHERE salary>3000

UNION ALL --> Union ile ayni isi yapar ancak tekrarli degerleri de verir.

SELECT name,salary
FROM workers
WHERE salary<2000;



--TASK-3 : salary değeri 1000'den yüksek, 2000'den az olan "ortak" name değerlerini bulun.
SELECT name
FROM workers
WHERE salary > 1000

INTERSECT --> INTERSECT Operator: İki sorgu (query) sonucunun ortak(common) değerlerini verir. Unique(tekrarsız) recordları verir.

SELECT name
FROM workers
WHERE salary < 2000;



--TASK-4 : salary değeri 2000'den az olan ve company değeri  IBM, APPLE yada MICROSOFT olan ortak "name" değerlerini bulun.
SELECT name
FROM workers
WHERE salary < 2000

INTERSECT

SELECT name
FROM workers
WHERE company IN('IBM', 'APPLE', 'MICROSOFT');



--TASK-5 : salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.
SELECT name
FROM workers
WHERE salary<3000  -- burdakileri ver.

EXCEPT --> EXCEPT Operator => Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır. Unique(tekrarsız) recordları verir.

SELECT name
FROM workers
WHERE company = 'GOOGLE'; -- bunlar haric 

