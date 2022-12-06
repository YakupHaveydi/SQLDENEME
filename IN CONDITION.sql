--IN CONDITION
DROP TABLE if exists musteriler

CREATE TABLE musteriler 
(
urun_id int, 
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

select * from musteriler

--Musteriler tablosundan urun ismi orange, apple veya apricot olan tum  verileri listeleyiniz.
SELECT * FROM musteriler WHERE urun_isim= 'Orange' OR urun_isim='Apple' OR urun_isim ='Apricot';
 
 
--IN CONDITION 
SELECT * FROM musteriler WHERE urun_isim IN ('Orange', 'Apple','Apricot');


--NOT IN --yazdigimiz verilerin disindakileri getirir
SELECT * FROM musteriler WHERE urun_isim NOT IN ('Orange', 'Apple','Apricot');



--AND ILE KULLANMA YOLU
SELECT * FROM  musteriler WHERE urun_isim='Orange' and urun_id=10

--BETWEEN CONDITION -- 
--musteriler tablosundan id si 20 ile 40 arasinda olan verileri listeleyiniz.
SELECT * FROM musteriler WHERE urun_id>= 20 and urun_id<=40;

--BETWEEN--
SELECT * FROM musteriler WHERE urun_id BETWEEN 20 and 40;

--NOT BETWEEN CONDITION
SELECT * FROM musteriler WHERE urun_id  NOT BETWEEN 20 and 40;

--SUBQUERIES--

CREATE TABLE calisanlar2 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO markalar VALUES(104, 'Nike', 19000);

select * from calisanlar2
select * from markalar

--calisan sayisi 15.000 den cok olan markalarin isimlerini maaslarini
--ve bu markalarin isimlerini ve maaslarini listeleyin.

SELECT isim,maas, isyeri FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);


--marka id si 101 den buyuk olan marka calisanlarinin isim, maas ve sehirlerini listeleyin.
SELECT isim, maas, sehir FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE marka_id>101);

--AGGREGATE METOT KULLANIMI 
--calisanlar tablosundan maksimum maasi listeleyelim.

SELECT MAX(maas) AS maksimum_maas FROM calisanlar2;
/*
eger bir sutuna gecici olarak bir isim vermek istersek AS komutunu yazdiktan sonra vermek istedigimiz ismi yazariz.
*/

--calisanlar tablosundan en dusuk maasi minimum maasi listeyelim.
SELECT MIN(maas) AS minimum_maas FROM calisanlar2


--calisanlar tabliosundaki maaslarin toplamini listeyeleyin.
SELECT sum(maas) FROM calisanlar2


--calisanlar tabliosundaki maaslarin ortalamasini listeyeleyin.
SELECT avg(maas) FROM calisanlar2
SELECT round(avg(maas)) FROM calisanlar2--kusuratsiz ortalamasini verir.


--calisanlar tabliosundaki maaslarin sayisini listeyeleyin.
SELECT count(maas) FROM calisanlar2

--AGGREGATE METHODLARDA SUBQUERY
--her markanin id'sini, ismini ve toplam kac sehirde bulundugunu listeleyen bir sorgu yaziniz.
select * from calisanlar2
select * from markalar

SELECT marka_id,marka_isim,
(SELECT count(sehir) From calisanlar2 WHERE marka_isim=isyeri)
FROM markalar;

--her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maasini listeleyiniz.
SELECT marka_isim,calisan_sayisi,(SELECT sum (maas) FROM calisanlar2 WHERE isyeri=marka_isim) AS toplam_maas
From markalar

--Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minimum maasini listeleyen bir sorgu yaziniz.
SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 Where isyeri=marka_isim) as enyuksekmaas,
(SELECT min(maas) FROM calisanlar2 Where isyeri=marka_isim) as endusukmaas
FROM markalar


--VIEW KULLANIMI
/*yaptigimiz sorgulari hafizaya alir ve tekrar bizden sorgulama yerine view e atadigimiz ismi
SELECT komutuyla cagiririz.
*/

CREATE VIEW maxminmaas
AS
SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 Where isyeri=marka_isim) as enyuksekmaas,
(SELECT min(maas) FROM calisanlar2 Where isyeri=marka_isim) as endusukmaas
FROM markalar

SELECT * FROM maxminmaas;
SELECT * FROM summaas;



--EXISTS CONDITION
CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart;
select * from nisan;

/*
--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.

*/
 SELECT urun_id,musteri_isim FROM mart
 WHERE exists (SELECT urun_id FROM nisan WHERE mart.urun_id = nisan.urun_id)
 
 
 /*
 --Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/
 
 SELECT urun_isim,musteri_isim FROM nisan
 WHERE exists (SELECT urun_isim FROM mart WHERE mart.urun_isim = nisan.urun_isim)
 
 
 --DML -- UPDATE--
 --TABLODAKI DATA NASIL UPDATE EDILIR? (UPDATE SET)
 
 CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler1 -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) 
REFERENCES tedarikciler(vergi_no)
on delete cascade
); 

INSERT INTO urunler1 VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler1 VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler1 VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler1 VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler1 VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler1 VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler1 VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from tedarikciler
select * from urunler1

/*
-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
*/

--UPDATE tablo _adi
--SET sutun_ismi = 'istenen veri' WHERE sutun_ismi = 'istenen veri'
UPDATE tedarikciler
SET firma_ismi = 'Vestel' WHERE vergi_no = 102;

--vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.

UPDATE tedarikciler
SET firma_ismi = 'Casper', irtibat_ismi ='Ali Veli' Where vergi_no=101


-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.

UPDATE urunler1 
SET urun_id = urun_id +1 WHERE urun_id>1004;


-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
UPDATE urunler1
SET urun_isim = 'Telefon' WHERE urun_isim='Phone';


-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak guncelleyiniz.
UPDATE urunler1
SET urun_id = urun_id + ted_vergino;

DELETE FROM urunler1
--urunler tablosundan Ali Bak in aldigi urunun ismini tedarikci tablosunda irtibat_ismi 'Adem Eve' olan firmanin ismi (firma_ismi)
--ile degistiriniz.

UPDATE urunler1
SET urun_isim =(SELECT firma_ismi FROM tedarikciler WHERE irtibat_ismi = 'Adem Eve')
Where musteri_isim='Ali Bak';

-- Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.
UPDATE urunler1
SET musteri_isim = (select irtibat_ismi from tedarikciler WHERE firma_ismi = 'Apple')
WHERE urun_isim = 'Laptop'

select * from tedarikciler
select * from urunler1