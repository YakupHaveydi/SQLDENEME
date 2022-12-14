CREATE TABLE ogrenciler5
(
ogrenci_no char(7),--uzunlugunu bildigimiz stringler icin char kullanilir
isim varchar (20), --uzunlugunu bilmedigimiz stringler  icin varchar kullanilir
soyisim varchar(25),
not_ort real, --ondalikli sayilar icin kullanilir (double gibi)
kayit_tarih date);

--VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE notlar
AS
SELECT isim,not_ort FROM ogrenciler5;

select * from notlar;

--INSER - TABLO ICINE VERI EKLEME
INSERT INTO notlar VALUES ('Haveydi',70.5);
INSERT INTO notlar VALUES ('Ali',75.5);
INSERT INTO notlar VALUES ('Musa',45.5);
INSERT INTO notlar VALUES ('Hakan', 65.5);
INSERT INTO notlar VALUES ('Adem',75.5);
INSERT INTO notlar VALUES ('Sumeyye',85.5);

select * from notlar;--tiklayinca isim ve notlari getirir.

select isim from notlar; --tiklayinca sadece isimleri getirir.

--CONSTRAINT 
--UNIQUE
--NOT NULL
	
CREATE TABLE ogrenciler7
(
ogrenci_no char(7) unique, 
isim varchar (20) not null,
soyisim varchar(25),
not_ort real, 
kayit_tarih date);

select * from ogrenciler7;

INSERT INTO ogrenciler7 VALUES ('1234567','Haveydi', 'Musa', 75.5,now());--unique
INSERT INTO ogrenciler7 VALUES ('1234568','ALI', 'VELI', 75.5,now()); --not null

--parcali veri ekleme

INSERT INTO ogrenciler7 (ogrenci_no,soyisim,not_ort) VALUES('1234569','Hakan', 85.5);--not null kisistlamasi oldugu icin bu 
                                                                                     --veri eklenemez
																					 
--PRIMARY KEY OLUTURMA

CREATE TABLE ogrenciler8
(
ogrenci_no char(7)PRIMARY KEY, 
isim varchar (20),
soyisim varchar(25),
not_ort real, 
kayit_tarih date);

--PRIMARY KEY olusturma 2.yol
--Eger CONSTRAINT ismini kendimiz vermek istersek bu yolu kullaniriz.
CREATE TABLE ogrenciler9
(
ogrenci_no char(7), 
isim varchar (20),
soyisim varchar(25),
not_ort real, 
kayit_tarih date,
CONSTRAINT ogr PRIMARY KEY (ogrenci_no)
);


--PRIMARY KEY OLUSTURMA 3.yol

CREATE TABLE ogrenciler10
(
ogrenci_no char(7), 
isim varchar (20),
soyisim varchar(25),
not_ort real, 
kayit_tarih date,
PRIMARY KEY (ogrenci_no)
);


--FOREIGN KEY OLUSTURMA
/*
Practice 4:
???tedarikciler3??? isimli bir tablo olusturun. Tabloda ???tedarikci_id???, ???tedarikci_ismi???, 
???iletisim_isim??? field???lari olsun ve ???tedarikci_id??? yi Primary Key yapin.
???urunler??? isminde baska bir tablo olusturun ???tedarikci_id??? ve ???urun_id??? field???lari olsun ve
???tedarikci_id??? yi Foreign Key yapin.
*/

CREATE TABLE tedarikciler3
(
tedarikci_id char (5) PRIMARY KEY,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)	
);

CREATE TABLE urunler (
tedarikci_id char(5),
urun_id char(5),
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)	
);
	
select * from tedarikciler3;
select * from urunler;

--Tabloya ???Foreign Key??? Nasil Eklenir ?

/*
Practice 5: ???calisanlar??? isimli bir Tablo olusturun. Icinde ???id???, ???isim???, ???maas???
, 
???ise_baslama??? field???lari 
olsun. ???id??? yi Primary Key yapin, ???isim??? i Unique, ???maas??? i Not Null yap??n. ???adresler??? isminde baska bir tablo olusturun.Icinde ???adres_id???, ???sokak???
, 
???cadde??? ve ???sehir???
fieldlari olsun. ???adres_id??? field???i ile Foreign Key olu??turun.
*/

CREATE TABLE calisanlar
(
id char (5)PRIMARY KEY,
isim varchar (20)UNIQUE,
maas int NOT NULL,	
ise_baslama	date
);

CREATE TABLE adresler
(
adres_id char (5),
sokak varchar (15),
cadde varchar (15),
sehir varchar (15),
FOREIGN KEY (adres_id)REFERENCES calisanlar(id)	
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Y??lmaz' ,12000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', 'Mehmet Y??lmaz', 5000, '2018-04-14'); --UNIQUE CONST, oldugu icin kabul etmez 2 mehmet yilmaz
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Ya??', NULL, '2019-04-12'); --NOT NULL oldugu icin CONS. kabul etmez.
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE CONST, oldugu icin kabul etmez
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --STRING/ INT hatasindan dolayi kabul etmez.
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --PRIMARY KEY 
--INSERT INTO calisanlar VALUES( '10002', 'ayse Y??lmaz' ,12000, '2018-04-14'); --PRIMARY KEY 
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); --PRIMARY KEY ler null kabul etmez

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','A??a Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','A??a Sok', '30.Cad.','Antep');---- FK'ye null de??eri atanabilir.

-- FK'ye null de??eri atanabilir.
INSERT INTO adresler VALUES(NULL,'A??a Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'A??a Sok', '30.Cad.','Mara??');

SELECT * FROM calisanlar;
SELECT * FROM adresler;


--Tabloya ???CHECK Constraint??? Nasil Eklenir ?

CREATE TABLE calisanlar1
(
id varchar (15)PRIMARY KEY,
isim varchar (30)UNIQUE,
maas int CHECK (maas>10000),	
ise_baslama	date
);

INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Y??lmaz' ,19000, '2018-04-14'); 

--DQL --WHERE KULLANIMI

SELECT * FROM calisanlar;
SELECT isim FROM calisanlar;

--Calisanlar tablosundan maasi 5000 den buyuk olan isimleri listeleyiniz.
SELECT isim FROM calisanlar WHERE maas>5000 ;
SELECT isim,maas FROM calisanlar WHERE maas>5000 ;

--calisanlar tablosundan ismi Veli Han olan tum verileri listeleyiniz.
SELECT * FROM calisanlar WHERE isim= 'Veli Han';

--Calisanlar tablosundan maasi 5000 den buyuk olan tum verileri listeleyiniz.
SELECT * FROM calisanlar WHERE maas = 5000;


--DML - DELETE KOMUTU OLUSTURMA
DELETE FROM calisanlar;--eger parent tablo  baska bir child tablo ile iliskili ise once child tablo silinebilir
DELETE FROM adresler;
select * from adresler;

--Adresler tablosundan sehri Antep olan verileri silelim.
DELETE FROM adresler WHERE sehir = 'Antep';


--id si 124 olan ogrenciyi siliniz
--ismi Kemal Yasa olan satirini siliniz

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