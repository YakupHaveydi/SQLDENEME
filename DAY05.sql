                                  --GROUP BY 
--SORU--Isme gore toplam maaslari bulun:

CREATE TABLE personel 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz','Istanbul', 5500,'Honda'); 
INSERT INTO personel VALUES(234567890, 'Veli Sahin','Istanbul', 4500,'Toyota'); 
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk','Ankara', 3500,'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk','Izmir', 6000,'Ford'); 
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk','Ankara', 7000,'Tofas'); 
INSERT INTO personel VALUES(456789012, 'Veli Sahin','Ankara', 4500,'Ford'); 
INSERT INTO personel VALUES(123456710, 'Hatice Sahin','Bursa', 4500,'Honda');

select * from personel

SELECT isim,sum(maas) FROM personel
GROUP BY isim

--SORU--personel tablosundaki isimleri gruplayiniz.
SELECT isim FROM personel
GROUP BY isim   --isme gore grupla

--SORU--Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun.

SELECT sirket, COUNT (*) AS calisan_sayisi 
FROM personel
WHERE maas>5000
GROUP BY sirket;

                                 --HAVING CLAUSE KULLANIMI
/*
HAVING komutu sadece group by komutu ile kullanilir, eger gruplamadan sonra bir sart varsa HAVING komutu kullanilir.
WHERE kullanimi ile ayni mantikta calisir.
*/
-- SORU --Her sirketin MIN maaslarini eger 4000’den buyukse gosterin.

select * from personel

SELECT sirket, MIN (maas) AS en_az_maas
FROM personel 
GROUP BY sirket
HAVING MIN (maas) >4000;

--HAVING CLAUSE KULLANIMI 
--SORU -- Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi ve toplam maasi gosteren sorgu yaziniz

select * from personel

SELECT isim, SUM (maas) AS toplam_maas 
FROM personel
GROUP BY isim
HAVING SUM (maas) >10000;


-- SORU -- 3) Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz.
--(gruplama olacak bu soruda)
SELECT sehir, COUNT (isim) AS toplam_personel_sayisi 
FROM personel
GROUP BY sehir
HAVING COUNT (isim) >1;


-- SORU -- Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz
select * from personel

SELECT sehir, MAX (maas) AS max_maas 
FROM personel
GROUP BY sehir
HAVING MAX (maas) <5000;


                                  -- UNION OPERATOR KULLANIMI --
-- SORU --Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan sehirleri gosteren sorguyu yaziniz.

SELECT sehir AS isci_veya_sehir_ismi ,maas
FROM personel 
WHERE maas >5000 

UNION --iki soruyu ayri ayri yazip birlestirir.

SELECT isim AS isci_veya_sehir_ismi , maas
FROM personel
WHERE maas > 4000;


-- SORU -- Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarinibir tabloda gosteren sorgu yaziniz
select * from personel

SELECT sehir AS isci_veya_sehir_ismi, maas
FROM personel 
WHERE sehir='Istanbul' 

UNION --iki soruyu ayri ayri yazip birlestirir.

SELECT isim AS isci_veya_sehir_ismi, maas 
FROM personel
WHERE isim = 'Mehmet Ozturk';


                                    -- UNION OPERATOR --
-- 2 Tablodan Data Birlestirme --

-- SORU -- Personel isminde bir tablo olusturun.Icinde id,isim,sehir,maas ve sirket field’lari olsun. Id’yi 2.yontemle PK yapin.

CREATE TABLE personel
(id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);

DROP TABLE if exists personel 

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

CREATE TABLE personel_bilgi (
id int,
tel char(10) UNIQUE , 
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY 
(id) REFERENCES personel(id)
);

INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5); 
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

select  from personel
select * from personel_bilgi

--id’si 12345678 olan personelin Personel tablosundan sehir ve maasini, 
--personel_bilgi tablosundan da tel ve cocuk sayisini yazdirin.

SELECT sehir AS sehir_ve_tel ,maas FROM personel 
WHERE id=123456789

UNION --iki sorguyu birlestirir

SELECT tel, cocuk_sayisi FROM personel_bilgi
WHERE id=123456789


                                -- UNION ALL OPERATOR  KULLANIMI --
/*
Union tekrarli verileri teke dusurur ve bize o sekilde sonuc verir,
UNION ALL ise tekrarli verilerle birliktetum sorgulari getirir.
*/
--SORU -- personel tablosundada maasi 5000'den ay olan tum isimleri ve maaslari bulunuz.

SELECT isim,maas FROM personel WHERE maas<5000
UNION ALL
SELECT isim,maas FROM personel WHERE maas<5000

                                   -- INTERSECT OPERATOR KULLANIMI -- (kesisim)
/*
Farkli iki sayinin tablodaki ortak verileri INTERSECT komutu  ile getirebiliriz
*/

--Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdirin.
--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin.

SELECT id FROM personel WHERE sehir IN ('Istanbul','Ankara')

INTERSECT

SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN (2,3)


-- SORU -- Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini listeleyiniz.
-- SORU -- Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin.
SELECT id
FROM personel
WHERE maas NOT BETWEEN 4800 AND 5500

INTERSECT

SELECT id
FROM personel_bilgi
WHERE cocuk_sayisi IN (2,3)

-- SORU --Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin.
SELECT isim FROM personel WHERE sirket='Honda'
INTERSECT
SELECT isim FROM personel WHERE sirket='Ford'
INTERSECT
SELECT isim FROM personel WHERE sirket='Tofas'

                                   -- EXCEPT (MINUS) OPERATOR KULLANIMI --

/*
iki sorgulamada harici bir sorgulama istenirse EXCEPT komutu kullanilir.
*/
-- SORU -- 5000’den az maas alip Honda’da calismayanlari yazdirin.
SELECT isim,sirket 
FROM personel 
WHERE maas<5000

EXCEPT

SELECT isim,sirket 
FROM personel 
WHERE sirket='Honda'