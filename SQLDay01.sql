CREATE TABLE ogrenciler
(
student_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,--Ondalikli sayilar icin kullanilir(double gibi)	
kayit_tarih date	
);

--VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE ogrenci_notlari
AS 
SELECT isim,soyisim,not_ort FROM ogrenciler;

   --Benzer tablodaki basliklarla ve data tipleriyle yeni bir tablo olusturmak icin normal olustururken ki 
   --parantezler yerine AS kullanip Select komutuyla almak istedigimizverileri aliriz.
   
   
   --DML - DATA MANUPULATION LANG.
   --INSERT (DATABASE'e VERI EKLEME)
   
   INSERT INTO ogrenciler VALUES('1234567', 'Said', 'ILHAN',85.5,'2020-12-11');
   
   
   --BIR TABLOYA PARCALI VERI EKLEMEK ISTERSEK 
   INSERT INTO ogrenciler (isim,soyisim) VALUES ('Yakup', 'Haveydi');
   
   --DQL - DATA QUERY LANG.
   --SELECT
   
   select * FROM ogrenciler; --Buradadaki * sembolu herseyi anlami katar.