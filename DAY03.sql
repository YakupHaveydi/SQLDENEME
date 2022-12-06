--ismi Nesibe Yilmaz veya Mustafa Bak olan kayitlari silelim.

CREATE TABLE ogrenciler3
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int 
);
INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler3

--ismi Nesibe Yilmaz veya Mustafa Bak olan kayitlari silelim.

DELETE FROM ogrenciler3 WHERE isim = 'Mustafa Bak' or isim = 'Nesibe Yilmaz';

--Veli ismi Hasan olan datayi silelim.


--TRUNCATE --
--Bir Tablodaki tum verileri geri alamyacagimiz sekilde siler.Sartli silme yapmaz.

TRUNCATE TABLE ogrenciler3--hepsi silindi
select * from ogrenciler3 --yaparak sonucu gorebiliriz.
DELETE FROM ogrenciler3 WHERE veli_isim='Hasan';

-- ON DELETE CASCADE 

DROP TABLE if exists adresler -- Eger tablo varsa tabloyu siler.

CREATE TABLE talebeler
(
id CHAR(3) primary key, 
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE notlar2( 
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
REFERENCES talebeler(id)
on delete cascade
);
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO notlar2 VALUES ('123','kimya',75);
INSERT INTO notlar2 VALUES ('124', 'fizik',65);
INSERT INTO notlar2 VALUES ('125', 'tarih',90);
INSERT INTO notlar2 VALUES ('126', 'Matematik',90);

select * from talebeler;
select * from notlar2;

--NOTLAR TABLOSUNDAN talebe_id si 123 olan datayi silelim.

DELETE FROM notlar2 WHERE talebe_id = '123'

--talebeler tablosundan id si 126 olan datayi silelim.

DELETE FROM talebeler WHERE id ='126'




