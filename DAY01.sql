--DATABASE (Veritabani olusturma) Olusturma
CREATE database yakup;

--DDL - DATA DEFINITION LANG.
--CREATE -TABLO OLUSTURMA
CREATE TABLE ogrenciler2
(
ogrenci_no char(7),
isim varchar (20),
soyisim varchar(25),
not_ort real, --ondalikli sayilar icin kullanilir(double gibi)
kayit_tarih date 	
);

--VAROLAN BIR TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE ogrenci_notlari
AS --Benzer tablodaki basliklarla ve data tipleriyle yeni bit tablo olusturmak icin normal 
--tablo olustururken ki parantezler yerine AS kullanip Select komutuyla almak istedigimiz 
--verileri aliriz.
SELECT isim,soyisim,not_ort FROM ogrenciler2;

--DML - DATA MANUPULATION LANG.
--INSERT (Database'e veri ekleme)
INSERT INTO ogrenciler2 VALUES(1234567, 'Said', 'ILHAN', 85.5,now());
INSERT INTO ogrenciler2 VALUES(1234567, 'Said', 'ILHAN', 85.5,'2022-12-11');

--BIR TABLOYA PARCALI VERI EKLMEK ISTERSEK;

INSERT INTO ogrenciler2(isim,soyisim)VALUES ('Yakup','Haveydi');

-- DQL - DATA OUERY LANG.
--SELECT 

select * FROM ogrenciler2;--buradaki * sembolu herseyi anlamindadir.







