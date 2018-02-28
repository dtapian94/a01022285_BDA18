# Daniel Tapia Nava a01022285
#Bases de Datos avanzadas
#Primer Examen parcial

DROP TABLE gomitas; #Para eliminar si ya existe una con este nombre , posteriormente ya la creamos
CREATE TABLE gomitas(
  ID INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
  NOMBRE VARCHAR(150) NOT NULL,
  PRECIO DECIMAL(10,6) NOT NULL,
  cstart DATE NOT NULL,
  cend DATE NOT NULL,
  period business_time(cstart, cend),
  PRIMARY KEY(ID, business_time WITHOUT overlaps)
);

INSERT INTO gomitas (NOMBRE, PRECIO, cstart, cend) VALUES
  ('Sandia', 5, '2018-1-1', '2019-1-1'),
  ('Mango', 6, '2018-1-1', '2019-1-1'),
  ('Tamarindo', 7, '2018-1-1', '2019-1-1'),
  ('Limon', 8, '2018-1-1', '2019-1-1'),
  ('Coca Cola', 9, '2018-1-1', '2019-1-1'),
  ('Dulci Gomas', 10, '2018-1-1', '2019-1-1'),
  ('Gusanito', 11, '2018-1-1', '2019-1-1'),
  ('Manguito', 12, '2018-1-1', '2019-1-1'),
  ('Dientes', 13, '2018-1-1', '2019-1-1'),
  ('Pinguino', 14, '2018-1-1', '2019-1-1'),
  ('Life Savers', 15, '2018-1-1', '2019-1-1'),
  ('Sour Patch', 16, '2018-1-1', '2019-1-1');


# Para calcular los precios 
UPDATE gomitas
FOR PORTION OF BUSINESS_TIME FROM '2018-2-1' to '2019-1-1'
  SET PRICE = PRICE*1.45;

UPDATE gomitas
FOR PORTION OF BUSINESS_TIME FROM '2018-2-15' to '2019-1-1'
  SET PRICE = (PRICE/1.45)*1.1;

UPDATE gomitas
FOR PORTION OF BUSINESS_TIME FROM '2018-4-25' to '2019-1-1'
  SET PRICE = PRICE*1.45;

UPDATE gomitas
FOR PORTION OF BUSINESS_TIME FROM '2018-5-5' to '2019-1-1'
  SET PRICE = (PRICE/1.45)*1.1;

UPDATE gomitas
FOR PORTION OF BUSINESS_TIME FROM '2018-10-25' to '2019-1-1'
  SET PRICE = PRICE*1.45;

UPDATE gomitas
FOR PORTION OF BUSINESS_TIME FROM '2018-11-5' to '2019-1-1'
  SET PRICE = (PRICE/1.45)*1.1;

SELECT * from gomitas WHERE NAME='Sandia';

SELECT SUM(PRICE)/COUNT(*) as AVG from gomitas WHERE NAME='Sandia';

SELECT MAX(PRICE) as MAX from gomitas WHERE NAME='Sandia';

SELECT MIN(PRICE) as MAX from gomitas WHERE NAME='Sandia';