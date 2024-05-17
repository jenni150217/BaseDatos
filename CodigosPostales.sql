CREATE DATABASE Postales
USE Postales

CREATE TABLE InformacionCodigosP( 
D_Codigo VARCHAR(10),
D_Asenta VARCHAR (100),
D_Tipo_Asenta VARCHAR (50),
D_Mnpio VARCHAR(100),
D_Estado VARCHAR (100),
D_Ciudad VARCHAR (100),
D_CP VARCHAR (10),
C_Estado VARCHAR (10),
C_Oficina VARCHAR (10),
C_CP VARCHAR(10),
C_Tipo_Asenta VARCHAR (MAX),
C_Mnpio VARCHAR (10),
Id_Asenta_CpCons VARCHAR (MAX),
D_Zona VARCHAR (50),
C_Cve_Ciudad VARCHAR (MAX)
)

BULK INSERT InformacionCodigosP  
FROM  'C:\Users\Jennifer Lopez\Downloads\CPdescarga.txt' 
WITH (
    FIELDTERMINATOR = '|',  
    ROWTERMINATOR = '\n'  
)

SELECT * FROM InformacionCodigosP

----


-------Nueva tabla MUNICIPIOS

CREATE TABLE Municipios (
Id_Municipio INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(255)  
)

-- Insertar valores desde InformacionCodigosP 
INSERT INTO Municipios (Nombre)
SELECT DISTINCT D_Mnpio
FROM InformacionCodigosP;

SELECT * FROM Municipios
--


CREATE TABLE Asenta (
IdAsenta INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(255)  
)

INSERT INTO Asenta (Nombre)
SELECT DISTINCT D_Asenta
FROM InformacionCodigosP;

SELECT * FROM Asenta

----
CREATE TABLE TipoAsenta (
IdTipo INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(255)  
)

INSERT INTO TipoAsenta (Nombre)
SELECT DISTINCT D_Tipo_Asenta
FROM InformacionCodigosP;

SELECT * FROM TipoAsenta

---
CREATE TABLE Estado (
IdEstado INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(255)  
)

INSERT INTO Estado(Nombre)
SELECT DISTINCT D_Estado
FROM InformacionCodigosP;


SELECT * FROM Estado


--
CREATE TABLE Ciudad (
IdCiudad INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(255)  
)

INSERT INTO Ciudad (Nombre)
SELECT DISTINCT D_Ciudad
FROM InformacionCodigosP;

SELECT * FROM Ciudad

---
CREATE TABLE Zona (
IdZona INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(255)  
)

INSERT INTO Zona(Nombre)
SELECT DISTINCT D_Zona
FROM InformacionCodigosP;

SELECT * FROM Zona

	

-- Aqui voy a utilizar un UPDATE para actualizar cada una de las columnas(D_Mnpio, D_Asenta, D_Tipo_Asenta, D_Estado, D_Ciudad y D_Zona)

UPDATE InformacionCodigosP
SET D_Mnpio = Municipios.Id_Municipio
FROM InformacionCodigosP
JOIN Municipios ON InformacionCodigosP.D_Mnpio = Municipios.Nombre;


UPDATE InformacionCodigosP
SET D_Asenta = Asenta.IdAsenta
FROM InformacionCodigosP
JOIN Asenta ON InformacionCodigosP.D_Asenta = Asenta.Nombre;


UPDATE InformacionCodigosP
SET D_Tipo_Asenta = TipoAsenta.IdTipo
FROM InformacionCodigosP
JOIN TipoAsenta ON InformacionCodigosP.D_Tipo_Asenta = TipoAsenta.Nombre;


UPDATE InformacionCodigosP
SET D_Estado = Estado.IdEstado
FROM InformacionCodigosP
JOIN Estado ON InformacionCodigosP.D_Estado = Estado.Nombre;


UPDATE InformacionCodigosP
SET D_Ciudad = Ciudad.IdCiudad
FROM InformacionCodigosP
JOIN Ciudad ON InformacionCodigosP.D_Ciudad = Ciudad.Nombre;


UPDATE InformacionCodigosP
SET D_Zona = Zona.IdZona
FROM InformacionCodigosP
JOIN Zona ON InformacionCodigosP.D_Zona = Zona.Nombre;