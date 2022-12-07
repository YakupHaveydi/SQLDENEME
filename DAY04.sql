--ALIASES--

CREATE TABLE calisanlar5 
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50) );

INSERT INTO calisanlar5 VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO calisanlar5 VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO calisanlar5 VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisanlar5

--eger iki sutunun verilerini birlestirmek istersek concet sembolu || kullniriz.
SELECT calisan_id as id, calisan_isim ||' '|| calisan_dogdugu_sehir as calisan_bilgisi from calisanlar5


--IS NULL CONDITION

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50), 
adres varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir'); 
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar

--SORU --isim sutununda null olan degerleri listeleyelim.

SELECT isim 
FROM insanlar 
WHERE isim 
IS NULL

--SORU --Insanlar tablosunda null sadece null olmayan degerleri listeleyiniz.

SELECT isim
FROM insanlar
WHERE isim
IS NOT NULL

--SORU--Insanlar tablosunda NULL deger almis verileri no isim olarak degistiriniz.

UPDATE insanlar 
SET isim ='No Name'
WHERE isim is null;

--ORDER BY CLAUSE KOMUTU --
/*tablolardaki verileri siralamk icin order by komutu kullaniriz
Buyukten kucuge yada kucukten buyuge siralama yapariz.Default olarak kucukten buyuge siralama yapar, Eger buyukten kucuge siralamk
istersek ORDER BY komutundan sonra DESC komutu kullaniriz.
*/

CREATE TABLE insanlar1
(
ssn char(9),
isim varchar(50),
soyisim varchar(50), adres
varchar(50)
);

INSERT INTO insanlar1 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar1 VALUES(234567890, 'Veli','Cem', 'Ankara'); 
INSERT INTO insanlar1 VALUES(345678901, 'Mine','Bulut', 'Ankara'); 
INSERT INTO insanlar1 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar1 VALUES (344678901, 'Mine','Yasa', 'Ankara'); 
INSERT INTO insanlar1 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar1

--SORU--Insanlar tablosundaki datalari adres’e gore siralayin.
SELECT * FROM insanlar1
ORDER BY adres;

--mesela soyisimlerine gore yapalim;
SELECT * FROM insanlar1
ORDER BY soyisim;

--Insanlar tablosundaki ismi Mine olanlari SSN(kucukten buyuge) sirali olarak listeleyiniz.
SELECT * FROM insanlar1
WHERE isim ='Mine'
ORDER BY ssn

--NOT : Order By komtundan sonra field ismi yerine field(sutun) numarasi da kullanilabilir
--SORU -- Insanlar tablosundaki soyismi Bulut olaNLARI isim sirali olarak listeleyin.

SELECT * FROM insanlar1
WHERE soyisim='Bulut'
ORDER BY 4 -- (bu 4 field numarasina gore)

SELECT * FROM insanlar1
WHERE soyisim='Bulut'
ORDER BY 2 --(isme gore yaparsak)


--ORDER BY fiel_name DESC CLAUSE

--SORU -- Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin.
SELECT * FROM insanlar1
ORDER BY ssn DESC;

--SORU--Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin.
SELECT * FROM insanlar1
ORDER BY isim ASC, soyisim DESC;

--SORU --İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız.
/*
Eger sutun uzunluguna gore siralamak istersek LENGTH komutu kullaniriz ve yine uzunlugu buyukten kucuge siralamak istersek
sonuna DESC komutunu ekleriz.
*/
SELECT isim, soyisim --ne getir
FROM insanlar1       --nerden
ORDER BY LENGTH (soyisim); --neye gore


--SORU--Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız.
SELECT isim|| ' ' ||soyisim AS isim_soyisim 
FROM insanlar1
ORDER BY LENGTH (isim || soyisim);



--GROUP BY CLAUSE (KULLANIMI) --
--Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT komutuyla birlikte kullanılır.

CREATE TABLE manav
(
isim varchar(50), 
Urun_adi varchar(50), 
Urun_miktar int);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2); 
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4); 
INSERT INTO manav VALUES( 'Ali', 'Armut', 2); 
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3); 
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5); 
INSERT INTO manav VALUES( 'Ali', 'Armut', 2); 
INSERT INTO manav VALUES( 'Veli', 'Elma', 3); 
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav

-- SORU -- Isme gore alinan toplam urunleri listeleyiniz. 
SELECT isim, SUM(urun_miktar) AS Alinan_Toplam_Meyve 
FROM manav
GROUP BY isim;


-- SORU --  Urun ismine gore urunu alan toplam kisi sayisini lsteleyelim.
SELECT urun_adi,count(isim) FROM manav
GROUP BY urun_adi;
