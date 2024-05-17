CREATE DATABASE Equiposs_Medicoss
 
CREATE TABLE Usuarios
(id_Usr SMALLINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Nombre_Usuario VARCHAR(MAX),
Pass_word VARCHAR(MAX),
Usr_Adm BIT NOT NULL)
 
INSERT INTO Usuarios VALUES ('Jennifer Lopez', 'contra1234', 1)
 
SELECT Nombre_Usuario FROM Usuarios WHERE Pass_word = 'contra1234' AND Nombre_Usuario = 'Jennifer Lopez'
 
CREATE TABLE Ubicacion
(id_Ubi CHAR(6) NOT NULL PRIMARY KEY,
Nombre_Ubicacion VARCHAR(MAX))
 
CREATE TABLE Sub_Ubicacion
(id_SubUbi SMALLINT NOT NULL PRIMARY KEY,
Nombre_SubUbi VARCHAR(MAX),
id_Ubi CHAR(6) NOT NULL FOREIGN KEY REFERENCES Ubicacion(id_Ubi))
 
CREATE TABLE tipoMP
(idMP SMALLINT NOT NULL PRIMARY KEY,
tipo_MP VARCHAR(MAX))
 
CREATE TABLE Pertenencia
(idPertenencia SMALLINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
tipo_Pertenencia VARCHAR(MAX))
 
CREATE TABLE Estatus
(idEstatus SMALLINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Estatu VARCHAR(MAX))
 
CREATE TABLE Equipo_Medico
(id_Equipo CHAR(6) NOT NULL PRIMARY KEY,
Nombre_Activo VARCHAR(MAX),
Folio VARCHAR(10),
Marca VARCHAR(MAX),
No_Serie VARCHAR(MAX),
id_Ubi CHAR(6) FOREIGN KEY REFERENCES Ubicacion(id_Ubi),
id_SubUbi SMALLINT FOREIGN KEY REFERENCES Sub_Ubicacion(id_SubUbi),
idEstatus SMALLINT FOREIGN KEY REFERENCES Estatus(idEstatus),
idPertenencia SMALLINT FOREIGN KEY REFERENCES Pertenencia(idPertenencia),
idMP SMALLINT FOREIGN KEY REFERENCES tipoMP(idMP))
 
CREATE TABLE Requisiciones
(idRequisicion SMALLINT IDENTITY(1,1) NOT NULL,
NombreEquipo VARCHAR(MAX),
NombreArchivo VARCHAR(MAX))
 
CREATE TABLE MantenimientosPreventivos
(idMtto SMALLINT IDENTITY(1,1) NOT NULL,
id_Equipo CHAR(6) FOREIGN KEY REFERENCES Equipo_Medico(id_Equipo),
fechaMtto DATE,
proximoMtto DATE)
 
CREATE TABLE MantenimientosCorrectivos
(idMttoC SMALLINT IDENTITY(1,1) NOT NULL,
id_Equipo CHAR(6) FOREIGN KEY REFERENCES Equipo_Medico(id_Equipo),
fechaMtto DATE,
Descripcion VARCHAR(MAX),
No_Factura VARCHAR(MAX))
 
-- Datos para la tabla Ubicacion
INSERT INTO Ubicacion (id_Ubi, Nombre_Ubicacion) VALUES
('U001', 'Hospital General'),
('U002', 'Centro de Salud'),
('U003', 'Clínica Privada'),
('U004', 'Hospital Infantil'),
('U005', 'Centro de Rehabilitación'),
('U006', 'Unidad de Atención Primaria'),
('U007', 'Clínica Geriátrica'),
('U008', 'Centro de Salud Mental'),
('U009', 'Laboratorio Clínico'),
('U010', 'Centro de Cirugía Ambulatoria'),
('U011', 'Consultorio Médico Familiar'),
('U012', 'Hospital Psiquiátrico'),
('U013', 'Unidad de Cuidados Intensivos');
 
-- Datos para la tabla Sub_Ubicacion
INSERT INTO Sub_Ubicacion (id_SubUbi, Nombre_SubUbi, id_Ubi) VALUES
(1, 'Planta baja', 'U001'),
(2, 'Piso 1', 'U001'),
(3, 'Sala de espera', 'U002'),
(4, 'Piso 2', 'U004'),
(5, 'Área de Rehabilitación', 'U005'),
(6, 'Consultorio 1', 'U011'),
(7, 'Área de Terapia Ocupacional', 'U010'),
(8, 'Sala de Espera', 'U008'),
(9, 'Área de Observación', 'U012'),
(10, 'Sala de Rayos X', 'U013');
 
 
-- Datos para la tabla tipoMP
INSERT INTO tipoMP (idMP, tipo_MP) VALUES
(1, 'Material de curación'),
(2, 'Equipos de diagnóstico'),
(3, 'Medicamentos'),
(4, 'Material Quirúrgico'),
(5, 'Dispositivos Médicos'),
(6, 'Productos de Higiene'),
(7, 'Reactivo para Laboratorio'),
(8, 'Equipo de Protección Personal');
 
-- Datos para la tabla Pertenencia
INSERT INTO Pertenencia (tipo_Pertenencia) VALUES
('Propio'),
('Arrendado'),
('En préstamo'),
('En comodato'),
('En leasing'),
('En propiedad compartida'),
('En fideicomiso'),
('En usufructo');
-- Datos para la tabla Estatus
INSERT INTO Estatus (Estatu) VALUES
('Activo'),
('En reparación'),
('Descontinuado'),
('En mantenimiento'),
('En revisión'),
('Fuera de servicio'),
('En proceso de calibración'),
('En espera de repuestos');
 
-- Datos para la tabla Equipo_Medico
INSERT INTO Equipo_Medico (id_Equipo, Nombre_Activo, Folio, Marca, No_Serie, id_Ubi, id_SubUbi, idEstatus, idPertenencia, idMP) VALUES
('EQ001', 'Rayos X Portátil', 'FOL001', 'Siemens', '123456', 'U001', 1, 1, 1, 2),
('EQ002', 'Desfibrilador', 'FOL002', 'Phillips', '789012', 'U002', 3, 1, 1, 2),
('EQ003', 'Monitor de Signos Vitales', 'FOL003', 'GE Healthcare', '345678', 'U001', 2, 3, 2, 2),
('EQ004', 'Ventilador Pulmonar', 'FOL004', 'Hamilton Medical', '901234', 'U006', 1, 1, 2, 5),
('EQ005', 'Electrocardiograma', 'FOL005', 'Nihon Kohden', '567890', 'U007', 1, 2, 1, 2),
('EQ006', 'Incubadora Neonatal', 'FOL006', 'Dräger', '678901', 'U004', 4, 1, 3, 5);
 
-- Datos para la tabla Requisiciones
INSERT INTO Requisiciones (NombreEquipo, NombreArchivo) VALUES
('Rayos X Portátil', 'requisicion_rayosx.pdf'),
('Monitor de Signos Vitales', 'requisicion_monitor.pdf'),
('Ventilador Pulmonar', 'requisicion_ventilador.pdf'),
('Incubadora Neonatal', 'requisicion_incubadora.pdf');
 
-- Datos para la tabla MantenimientosPreventivos
INSERT INTO MantenimientosPreventivos (id_Equipo, fechaMtto, proximoMtto) VALUES
('EQ001', '2024-03-15', '2024-09-15'),
('EQ003', '2024-04-20', '2024-10-20'),
('EQ004', '2024-04-10', '2024-10-10'),
('EQ005', '2024-03-20', '2024-09-20');
 
-- Datos para la tabla MantenimientosCorrectivos
INSERT INTO MantenimientosCorrectivos (id_Equipo, fechaMtto, Descripcion, No_Factura) VALUES
('EQ002', '2024-02-10', 'Reemplazo de batería', 'FACT001'),
('EQ003', '2024-03-05', 'Reparación de pantalla', 'FACT002'),
('EQ006', '2024-01-15', 'Cambio de sensor de temperatura', 'FACT003'),
('EQ004', '2024-02-25', 'Reparación de circuito eléctrico', 'FACT004');

SELECT * FROM MantenimientosCorrectivos
SELECT * FROM MantenimientosPreventivos
SELECT * FROM Requisiciones
SELECT * FROM Equipo_Medico