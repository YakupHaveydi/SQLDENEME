                                                  -- JOINS KULLANIMI --
												  
--1 INNER JOINS KULLANIMI-	(INNER JOIN iki Tablodaki ortak datalari gosterir)

CREATE TABLE sirketler 
(
sirket_id int, 
sirket_isim varchar(20)
);

INSERT INTO sirketler VALUES(100, 'Toyota'); 
INSERT INTO sirketler VALUES(101, 'Honda'); 
INSERT INTO sirketler VALUES(102, 'Ford'); 
INSERT INTO sirketler VALUES(103, 'Hyundai');

CREATE TABLE siparisler 
(
siparis_id int, 
sirket_id int, 
siparis_tarihi date
);

INSERT INTO siparisler VALUES(11, 101, '17-Apr-2020');
INSERT INTO siparisler VALUES(22, 102, '18-Apr-2020');
INSERT INTO siparisler VALUES(33, 103, '19-Apr-2020');
INSERT INTO siparisler VALUES(44, 104, '20-Apr-2020');
INSERT INTO siparisler VALUES(55, 105, '21-Apr-2020');

select * from sirketler
select * from siparisler

--SORU) -- Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
        -- siparis_tarihleri ile yeni bir tablo olusturun.

SELECT sirketler.sirket_isim, siparisler. siparis_id, siparisler. siparis_tarihi 
FROM sirketler
INNER JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id;

/*
NOT :
1) Select’ten sonra tabloda gormek istediginiz sutunlari yazarken Tablo_adi.field_adi seklinde yazin
2) From’dan sonra tablo ismi yazarken 1.Tablo ismi + INNER JOIN + 2.Tablo ismi yazmaliyiz
3) Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimiz yazilmali
*/

-- LEFT JOIN -- LEFT JOIN Ilk datada olan tum recordlari gosterir

-- SORU) -- Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
         -- siparis_tarihleri ile yeni bir tablo olusturun.
SELECT sirketler.sirket_isim, siparisler. siparis_id, siparisler. siparis_tarihi 
FROM sirketler
LEFT JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id;		 

select * from sirketler
select * from siparisler


-- RIGHT JOINS -- RIGHT JOIN Ikinci tabloda olan tum recordlari gosterir. bu genelde kullanilmaz.

-- SORU) -- Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
         -- siparis_tarihleri ile yeni bir tablo olusturun.
		 
SELECT sirketler.sirket_isim, siparisler. siparis_id, siparisler. siparis_tarihi 
FROM sirketler
RIGHT JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id;		 

-- FULL JOIN -- Iki tablodaki tum recordlari gosterir.
-- NOT -- FULL Join’de iki tabloda var olan tum record’lar gosterilir.
-- Bir tabloda olup otekinde olmayan data’lar bos kalir.

SELECT sirketler.sirket_isim, siparisler. siparis_id, siparisler. siparis_tarihi 
FROM sirketler 
FULL JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id;
	
select * from sirketler
select * from siparisler	

-- SELF JOINS --) SELF JOIN Bir tablonun kendi icinde Join edilmesi ile olusur.
drop table personel cascade

CREATE TABLE personel 
(
id int,
isim varchar(20), 
title varchar(60), 
yonetici_id int
);

INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);

select * from personel
-- her personelin yanina yonetici ismini yazdiran br tablo olusturun. 
SELECT isim FROM personel

SELECT p1.isim AS personel_isim,p2.isim AS yonetici_isim 
FROM personel p1 INNER JOIN personel p2 ON p1.yonetici_id=p2.id


                                             -- LIKE Condition--

   --LIKE condition WHERE ile kullanilarak SELECT, INSERT, UPDATE, veya DELETEstatement ile calisan wildcards’a(özel sembol)
   --izin verir.. Ve bize pattern matching yapma imkani verir.
   drop table musteriler cascade
   
   CREATE TABLE musteriler 
(
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
   
INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1006, 'ahmet', 82000);

  -- 1) % => 0 veya birden fazla karakter belirtir
  -- SORU : Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin.
  -- LIKE kullaniminda buyuk kucuk harf gozetmeksizin sonuc almak istersek ILIKE kullaniriz.
  -- LIKE yerine -- sembollerini kullanabiliriz.
  
SELECT * FROM musteriler
WHERE isim LIKE 'A%';   --LIKE (gibi manasi tasir)(sadece ismi buyuk A ile baslayanlari getir )

SELECT  * FROM musteriler WHERE isim ILIKE -- de kullabirsak kucuk buyuk harf gozetmez.
      
	  
	                      --LIKE Condition KULLANIMI--

-- SORU --Ismi 'e' harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin. sadece e ile biten  harf demek.
SELECT isim,gelir 
FROM musteriler 
WHERE isim LIKE '%e';

-- SORU -- Isminin icinde 'er' olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin 
SELECT isim,gelir 
FROM musteriler
WHERE isim LIKE '%er%';

--2)--=> sadece bir karakteri gosterir.
    --   SORU -- Ismi 5 harfli olup son 4 harfi 'atma' olan musterilerin tum bilgilerini yazdiran QUERY yazin.
SELECT * FROM musteriler
WHERE isim LIKE '_atma';

-- SORU : Ikinci harfi 'a' olan musterilerin tum bilgilerini yazdiran QUERY yazin.
SELECT * FROM musteriler 
WHERE isim LIKE '_a%';

-- SORU : Ucuncu harfi 's' olan musterilerin tum bilgilerini yazdiran QUERY yazin.
SELECT * FROM musteriler
WHERE isim LIKE '__s%';

-- SORU : Ucuncu harfi 's' olan ismi 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin.
SELECT * FROM musteriler 
WHERE isim LIKE '__s_';

-- SORU : Ilk harfi 'F' olan en az 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin.
SELECT * FROM musteriler
WHERE isim LIKE 'F___%';

-- SORU : Ikinci harfi a,4.harfi m olan musterilerin tum bilgilerini yazdiran QUERY yazin.
SELECT * FROM musteriler
WHERE isim LIKE '_a_m%';

-- REGEXP_LIKE KULLANIMI 
--=>Daha karmaşık sorgular için herhangi bir kod, metin icerisinde istenilen yaziveya kod parcasinin aranip bulunmasini saglayan
--kendine ait soz dizimi olan bir yapidir.(REGEXP_LIKE) PostgreSQL de ‘’ ~ ‘’ karekteri ile kullanilir.

CREATE TABLE kelimeler 
(
id int UNIQUE,
kelime varchar(50) NOT NULL, 
Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3); 
INSERT INTO kelimeler VALUES (1002, 'hat', 3); 
INSERT INTO kelimeler VALUES (1003, 'hit', 3); 
INSERT INTO kelimeler VALUES (1004, 'hbt', 3); 
INSERT INTO kelimeler VALUES (1008, 'hct', 3); 
INSERT INTO kelimeler VALUES (1005, 'adem', 4); 
INSERT INTO kelimeler VALUES (1006, 'selim', 5); 
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);

--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran QUERY yazin.
SELECT * FROM kelimeler
WHERE kelime ~ 'h[ai]t';

-- SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini yazdiran QUERY yazin.
SELECT * FROM kelimeler
WHERE kelime ~ 'h[a-k]t';

--SORU : Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin.
SELECT * FROM kelimeler
WHERE kelime ~ '[mi]';

--SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin.
SELECT * FROM kelimeler
WHERE kelime ~ '^[as]';

-- SORU : m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin.
SELECT * FROM kelimeler
WHERE kelime ~ '[mf]$';

                             --NOT LIKE Condition KULLANIMI --
--SORU 1 : ilk harfi 'h' olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin.
SELECT * FROM kelimeler
WHERE kelime NOT LIKE 'h%';


--SORU 2 : a harfi icermeyen kelimelerin tum bilgilerini yazdiran QUERY yazin.
SELECT * FROM kelimeler
WHERE kelime NOT LIKE '%a%';


--SORU 3 : ikinci ve ucuncu harfi ‘de’ olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler
WHERE kelime NOT LIKE '_de%';

--SORU 4 : 2. harfi e,i veya o olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin.
SELECT * FROM kelimeler
WHERE kelime !~ '[_eio]';

                        -- UPPER -- LOWER -- INITCAP
--Kelimeler tablosundaki kelime sutunundaki verileri once hepsi buyuk harf, sonra kucuk harf ve ilk harfleri buyuk harf olacak sekil
--de yazdrialim
SELECT UPPER (kelime) FROM kelimeler
SELECT LOWER (kelime) FROM kelimeler 
SELECT INITCAP (kelime) FROM kelimeler

--musteriler tablosundan butun isimleri buyuk harf yapiniz.
SELECT UPPER(isim) FROM musteriler

/*
eger birden fazla sutundaki verileri buyuk kucuk harf yapmak istersek select lower(title),UPPER(isim)from personel 
sekilde yapabiliriz
*/
