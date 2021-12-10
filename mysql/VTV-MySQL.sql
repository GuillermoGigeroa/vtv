DROP DATABASE IF EXISTS VTV;
CREATE DATABASE VTV;
USE VTV;

DROP TABLE IF EXISTS `Estados`;
CREATE TABLE `Estados`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
);

DROP TABLE IF EXISTS `Inspecciones`;
CREATE TABLE `Inspecciones`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(255) NOT NULL,
  `ID_Inspector` int NOT NULL,
  `ID_Estado` int NOT NULL,
  `FechaVencimiento` varchar(255) NOT NULL,
  `Baja` bit NOT NULL,
  PRIMARY KEY (`ID`)
);

DROP TABLE IF EXISTS `Inspecciones_x_Vehiculo`;
CREATE TABLE `Inspecciones_x_Vehiculo`  (
  `ID_Inspeccion` int NOT NULL,
  `ID_Vehiculo` int NOT NULL,
  PRIMARY KEY (`ID_Inspeccion`, `ID_Vehiculo`)
);

DROP TABLE IF EXISTS `Inspectores`;
CREATE TABLE `Inspectores`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Baja` bit NOT NULL,
  PRIMARY KEY (`ID`)
);

DROP TABLE IF EXISTS `Propietarios`;
CREATE TABLE `Propietarios`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Exento` bit NOT NULL,
	`Baja` bit NOT NULL,
  PRIMARY KEY (`ID`)
);

DROP TABLE IF EXISTS `Vehiculos`;
CREATE TABLE `Vehiculos`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Dominio` varchar(255) NOT NULL,
  `Marca` varchar(255) NOT NULL,
  `Modelo` varchar(255) NOT NULL,
  `Baja` bit NOT NULL,
  PRIMARY KEY (`ID`)
);

DROP TABLE IF EXISTS `Vehiculos_x_Propietario`;
CREATE TABLE `Vehiculos_x_Propietario`  (
  `ID_Vehiculo` int NOT NULL,
  `ID_Propietario` int NOT NULL,
  PRIMARY KEY (`ID_Vehiculo`)
);

ALTER TABLE `Inspecciones` ADD CONSTRAINT `fk_Inspecciones_Inspectores_1` FOREIGN KEY (`ID_Inspector`) REFERENCES `Inspectores` (`ID`);
ALTER TABLE `Inspecciones` ADD CONSTRAINT `fk_Inspecciones_Estados_1` FOREIGN KEY (`ID_Estado`) REFERENCES `Estados` (`ID`);
ALTER TABLE `Inspecciones_x_Vehiculo` ADD CONSTRAINT `fk_Inspecciones_x_Vehiculo_Inspecciones_1` FOREIGN KEY (`ID_Inspeccion`) REFERENCES `Inspecciones` (`ID`);
ALTER TABLE `Inspecciones_x_Vehiculo` ADD CONSTRAINT `fk_Inspecciones_x_Vehiculo_Vehiculos_1` FOREIGN KEY (`ID_Vehiculo`) REFERENCES `Vehiculos` (`ID`);
ALTER TABLE `Vehiculos_x_Propietario` ADD CONSTRAINT `fk_Vehiculos_x_Propietario_Propietarios_1` FOREIGN KEY (`ID_Propietario`) REFERENCES `Propietarios` (`ID`);
ALTER TABLE `Vehiculos_x_Propietario` ADD CONSTRAINT `fk_Vehiculos_x_Propietario_Vehiculos_1` FOREIGN KEY (`ID_Vehiculo`) REFERENCES `Vehiculos` (`ID`);

/*Stored Procedure para agregar un nuevo estado*/
DROP PROCEDURE IF EXISTS SP_AgregarEstado;
CREATE PROCEDURE SP_AgregarEstado (IN IDUnico int, IN Estado VARCHAR(255))
BEGIN
	INSERT INTO Estados (ID, Nombre)
	VALUES (IDUnico, Estado);
END;

/*Se ingresan los estados disponibles*/
CALL SP_AgregarEstado(1,'Apto');
CALL SP_AgregarEstado(2,'Condicional');
CALL SP_AgregarEstado(3,'Rechazado');

/*Stored Procedure para agregar un nuevo inspector*/
DROP PROCEDURE IF EXISTS SP_AgregarInspector;
CREATE PROCEDURE SP_AgregarInspector (IN NombreInspector VARCHAR(255))
BEGIN
	INSERT INTO Inspectores (Nombre, Baja)
	VALUES (NombreInspector, 0);
END;

/*Se ingresan datos de ejemplo*/
CALL SP_AgregarInspector('Guillermo Gigeroa');
CALL SP_AgregarInspector('Mario Allende');
CALL SP_AgregarInspector('Roberto Gomez');
CALL SP_AgregarInspector('Mariana Perez');
CALL SP_AgregarInspector('Gianluca Salvador');
CALL SP_AgregarInspector('Santiago Martinez');
CALL SP_AgregarInspector('Maximiliano Fernandez');
CALL SP_AgregarInspector('Lucas Lopez');
CALL SP_AgregarInspector('Damian Basualdo');
CALL SP_AgregarInspector('Nicolas Vega');

/*Stored Procedure para dar de baja o alta un inspector*/
DROP PROCEDURE IF EXISTS SP_BajaLogicaInspector;
CREATE PROCEDURE SP_BajaLogicaInspector (IN ID int, IN Estado bit)
BEGIN
	UPDATE Inspectores as I
	SET Baja = Estado
	WHERE I.ID = ID;
END;

/*Stored Procedure para modificar un inspector*/
DROP PROCEDURE IF EXISTS SP_ModificarInspector;
CREATE PROCEDURE SP_ModificarInspector (IN ID int, IN NuevoNombre VARCHAR(255))
BEGIN
	UPDATE Inspectores as I
	SET Nombre = NuevoNombre
	WHERE I.ID = ID;
END;

/*Stored Procedure para listar inspectores*/
DROP PROCEDURE IF EXISTS SP_ListarInspectores;
CREATE PROCEDURE SP_ListarInspectores()
BEGIN
	SELECT I.ID, I.Nombre
	FROM Inspectores as I
	WHERE I.Baja = 0;
END;

/*Stored Procedure para agregar un nuevo propietario*/
DROP PROCEDURE IF EXISTS SP_AgregarPropietario;
CREATE PROCEDURE SP_AgregarPropietario (IN NombrePropietario VARCHAR(255), IN EsExento bit)
BEGIN
	INSERT INTO Propietarios (Nombre,Exento,Baja)
	VALUES (NombrePropietario,EsExento,0);
END;

/*Se ingresan datos de ejemplo*/
CALL SP_AgregarPropietario('Juan Figueroa',0);
CALL SP_AgregarPropietario('Martin Solari',1);
CALL SP_AgregarPropietario('Federico Vazquez',0);
CALL SP_AgregarPropietario('Francisco Vallejos',1);
CALL SP_AgregarPropietario('Luciano Flores',1);
CALL SP_AgregarPropietario('Marcela Morales',1);
CALL SP_AgregarPropietario('Ruben Mamani',0);
CALL SP_AgregarPropietario('Mario Debrito',0);
CALL SP_AgregarPropietario('Agustina Perez',1);
CALL SP_AgregarPropietario('Agustin Gomez',0);

/*Stored Procedure para listar los propietarios*/
DROP PROCEDURE IF EXISTS SP_ListarPropietarios;
CREATE PROCEDURE SP_ListarPropietarios ()
BEGIN
	SELECT ID, Nombre, Exento
	FROM Propietarios;
END;

/*Stored Procedure para dar de baja o alta un propietario*/
DROP PROCEDURE IF EXISTS SP_BajaLogicaPropietario;
CREATE PROCEDURE SP_BajaLogicaPropietario (IN ID int, IN Estado bit)
BEGIN
	UPDATE Propietarios as P
	SET Baja = Estado
	WHERE P.ID = ID;
END;

/*Stored Procedure para modificar un propietario*/
DROP PROCEDURE IF EXISTS SP_ModificarPropietario;
CREATE PROCEDURE SP_ModificarPropietario (IN ID int, IN NuevoNombre VARCHAR(255), IN NuevoExento bit)
BEGIN
	UPDATE Propietarios as P
	SET Nombre = NuevoNombre, Exento = NuevoExento
	WHERE P.ID = ID;
END;

/*Stored Procedure para agregar un nuevo vehiculo*/
DROP PROCEDURE IF EXISTS SP_AgregarVehiculo;
CREATE PROCEDURE SP_AgregarVehiculo (IN DominioV VARCHAR(255), IN MarcaV VARCHAR(255), IN ModeloV VARCHAR(255), IN IDPropietario int)
BEGIN
	INSERT INTO Vehiculos (Dominio,Marca,Modelo,Baja)
	VALUES (DominioV,MarcaV,ModeloV,0);
	INSERT INTO Vehiculos_x_Propietario (ID_Vehiculo,ID_Propietario)
	VALUES (LAST_INSERT_ID(),IDPropietario);
END;

/*Se ingresan datos de ejemplo*/
CALL SP_AgregarVehiculo ('AB056XS','Ford','Focus',6);
CALL SP_AgregarVehiculo ('VTE213','Ford','Sierra',2);
CALL SP_AgregarVehiculo ('AA458RT','Volkswagen','Golf',3);
CALL SP_AgregarVehiculo ('AB984FS','Audi','A3',5);
CALL SP_AgregarVehiculo ('AG149SL','Audi','A4',4);
CALL SP_AgregarVehiculo ('BC938HF','Peugeot','207',1);
CALL SP_AgregarVehiculo ('FLE786','Chevrolet','Corsa',7);
CALL SP_AgregarVehiculo ('AK476UL','Honda','Civic',10);
CALL SP_AgregarVehiculo ('BF668JK','Toyota','Corolla',9);
CALL SP_AgregarVehiculo ('EZR272','Suzuki','Fun',8);

/*Stored Procedure para dar de baja o alta un vehiculo*/
DROP PROCEDURE IF EXISTS SP_BajaLogicaVehiculo;
CREATE PROCEDURE SP_BajaLogicaVehiculo (IN ID int, IN Estado bit)
BEGIN
	UPDATE Vehiculos as V
	SET Baja = Estado
	WHERE V.ID = ID;
END;

/*Stored Procedure para modificar un vehiculo*/
DROP PROCEDURE IF EXISTS SP_ModificarVehiculo;
CREATE PROCEDURE SP_ModificarVehiculo (IN ID int, IN NuevoDominio VARCHAR(255), IN NuevaMarca VARCHAR(255), IN NuevoModelo VARCHAR(255))
BEGIN
	UPDATE Vehiculos as V
	SET Dominio = NuevoDominio, Marca = NuevaMarca, Modelo = NuevoModelo
	WHERE V.ID = ID;
END;

/*Stored Procedure para listar los vehiculos*/
DROP PROCEDURE IF EXISTS SP_ListarVehiculos;
CREATE PROCEDURE SP_ListarVehiculos ()
BEGIN
	SELECT V.ID as IDVehiculo, V.Dominio, V.Marca, V.Modelo, P.ID as IDPropietario, P.Nombre as NombrePropietario, P.Exento
	FROM Vehiculos as V
	LEFT JOIN Vehiculos_x_Propietario as VXP
	ON V.ID = VXP.ID_Vehiculo
	LEFT JOIN Propietarios as P
	ON VXP.ID_Propietario = P.ID
	WHERE V.Baja = 0;
END;

/*Stored Procedure para agregar una inspeccion*/
DROP PROCEDURE IF EXISTS SP_AgregarInspeccion;
CREATE PROCEDURE SP_AgregarInspeccion (IN Fecha VARCHAR(255), IN FechaVencimiento VARCHAR(255) , IN IDInspector int, IN IDEstado int, IN IDVehiculo int)
BEGIN
	INSERT INTO Inspecciones (Fecha, FechaVencimiento, ID_Inspector, ID_Estado, Baja)
	VALUES (Fecha, FechaVencimiento, IDInspector, IDEstado, 0);
	INSERT INTO Inspecciones_x_Vehiculo (ID_Inspeccion, ID_Vehiculo)
	VALUES (LAST_INSERT_ID(),IDVehiculo);
END;

/*Se ingresan datos de ejemplo*/
CALL SP_AgregarInspeccion('2021-11-14','2022-11-14',5,2,3);
CALL SP_AgregarInspeccion('2020-05-21','2021-05-21',8,1,5);
CALL SP_AgregarInspeccion('2021-07-25','2022-07-25',3,3,2);
CALL SP_AgregarInspeccion('2020-02-04','2021-02-04',1,2,5);
CALL SP_AgregarInspeccion('2020-06-18','2021-06-18',5,1,1);
CALL SP_AgregarInspeccion('2018-03-02','2019-03-02',2,3,6);
CALL SP_AgregarInspeccion('2020-09-15','2021-09-15',9,2,2);
CALL SP_AgregarInspeccion('2021-06-24','2022-06-24',1,1,9);
CALL SP_AgregarInspeccion('2020-08-22','2021-08-22',6,3,5);
CALL SP_AgregarInspeccion('2020-08-22','2021-08-22',8,2,8);
CALL SP_AgregarInspeccion('2021-11-13','2022-11-13',5,2,3);
CALL SP_AgregarInspeccion('2021-11-12','2022-11-12',8,1,5);
CALL SP_AgregarInspeccion('2021-11-12','2022-11-12',3,3,2);
CALL SP_AgregarInspeccion('2021-11-12','2022-11-12',1,2,5);
CALL SP_AgregarInspeccion('2021-11-09','2022-11-09',5,1,1);
CALL SP_AgregarInspeccion('2021-11-09','2022-11-09',2,3,6);
CALL SP_AgregarInspeccion('2021-10-15','2022-10-15',9,2,2);
CALL SP_AgregarInspeccion('2021-08-24','2022-08-24',1,1,9);
CALL SP_AgregarInspeccion('2021-07-08','2022-07-08',6,3,5);
CALL SP_AgregarInspeccion('2021-05-22','2022-05-22',8,2,8);

/*Stored Procedure para dar de baja o alta una inspeccion*/
DROP PROCEDURE IF EXISTS SP_BajaLogicaInspeccion;
CREATE PROCEDURE SP_BajaLogicaInspeccion (IN ID int, IN Estado bit)
BEGIN
	UPDATE Inspecciones as I
	SET Baja = Estado
	WHERE I.ID = ID;
END;

/*Stored Procedure para dar de baja o alta una inspeccion*/
DROP PROCEDURE IF EXISTS SP_ModificarInspeccion;
CREATE PROCEDURE SP_ModificarInspeccion (IN ID int, IN NuevaFecha VARCHAR(255), IN NuevaFechaVencimiento VARCHAR(255), IN NuevoIDInspector int, IN NuevoIDEstado int, IN NuevoIDVehiculo int)
BEGIN
	UPDATE Inspecciones as I
	SET Fecha = NuevaFecha, FechaVencimiento = NuevaFechaVencimiento, ID_Inspector = NuevoIDInspector, ID_Estado = NuevoIDEstado
	WHERE I.ID = ID;
	UPDATE Inspecciones_x_Vehiculo as IXV
	SET IXV.ID_Vehiculo = NuevoIDVehiculo
	WHERE IXV.ID_Inspeccion = ID;
END;

/*Stored Procedure para listar vehiculos por ID de propietario*/
DROP PROCEDURE IF EXISTS SP_ListarVehiculosPorPropietario;
CREATE PROCEDURE SP_ListarVehiculosPorPropietario (IN IDPropietario int)
BEGIN
	SELECT V.ID as IDVehiculo, V.Dominio, V.Marca, V.Modelo, P.ID as IDPropietario, P.Nombre as NombrePropietario, P.Exento
	FROM Vehiculos as V
	LEFT JOIN Vehiculos_x_Propietario as VXP
	ON V.ID = VXP.ID_Vehiculo
	LEFT JOIN Propietarios as P
	ON VXP.ID_Propietario = P.ID
	WHERE VXP.ID_Propietario = IDPropietario AND V.Baja = 0;
END;

/*Stored Procedure para listar inspecciones por fecha*/
DROP PROCEDURE IF EXISTS SP_ListarInspeccionesPorFecha;
CREATE PROCEDURE SP_ListarInspeccionesPorFecha (IN Fecha VARCHAR(255))
BEGIN
	SELECT I.ID as NumeroInspeccion, I.Fecha, I.FechaVencimiento, I.ID_Estado as Estado, Ins.ID as IDInspector, Ins.Nombre as Inspector, V.Dominio, V.Marca, V.Modelo, V.ID as IDVehiculo, P.ID as IDPropietario, P.Nombre as NombrePropietario, P.Exento
	FROM Vehiculos as V
	LEFT JOIN Inspecciones_x_Vehiculo as IXV
	ON IXV.ID_Vehiculo = V.ID
	LEFT JOIN Inspecciones as I
	ON I.ID = IXV.ID_Inspeccion
	LEFT JOIN Inspectores as Ins
	ON Ins.ID = I.ID_Inspector
	LEFT JOIN Vehiculos_x_Propietario as VXP
	ON V.ID = VXP.ID_Vehiculo
	LEFT JOIN Propietarios as P
	ON VXP.ID_Propietario = P.ID
	WHERE I.Fecha = Fecha AND I.Baja = 0;
END;

/*Stored Procedure para listar inspecciones por fecha*/
DROP PROCEDURE IF EXISTS SP_ListarInspecciones;
CREATE PROCEDURE SP_ListarInspecciones ()
BEGIN
	SELECT I.ID as NumeroInspeccion, I.Fecha, I.FechaVencimiento, I.ID_Estado as Estado, Ins.ID as IDInspector, Ins.Nombre as Inspector, V.Dominio, V.Marca, V.Modelo, V.ID as IDVehiculo, P.ID as IDPropietario, P.Nombre as NombrePropietario, P.Exento
	FROM Vehiculos as V
	LEFT JOIN Inspecciones_x_Vehiculo as IXV
	ON IXV.ID_Vehiculo = V.ID
	LEFT JOIN Inspecciones as I
	ON I.ID = IXV.ID_Inspeccion
	LEFT JOIN Inspectores as Ins
	ON Ins.ID = I.ID_Inspector
	LEFT JOIN Vehiculos_x_Propietario as VXP
	ON V.ID = VXP.ID_Vehiculo
	LEFT JOIN Propietarios as P
	ON VXP.ID_Propietario = P.ID
	WHERE I.Baja = 0;
END;

/*Stored Procedure para listar vehiculos por estado*/
DROP PROCEDURE IF EXISTS SP_ListarVehiculosPorEstado;
CREATE PROCEDURE SP_ListarVehiculosPorEstado (IN ID int)
BEGIN
	SELECT V.ID as IDVehiculo, V.Dominio, V.Marca, V.Modelo, E.ID as IDEstado, P.ID as IDPropietario, P.Nombre as NombrePropietario, P.Exento
	FROM Inspecciones as I
	LEFT JOIN Inspecciones_x_Vehiculo as IXV
	ON I.ID = IXV.ID_Inspeccion
	LEFT JOIN Estados as E
	ON I.ID_Estado = E.ID
	LEFT JOIN Vehiculos as V
	ON IXV.ID_Vehiculo = V.ID
	LEFT JOIN Vehiculos_x_Propietario as VXP
	ON V.ID = VXP.ID_Vehiculo
	LEFT JOIN Propietarios as P
	ON VXP.ID_Propietario = P.ID
	WHERE I.ID_Estado = ID;
END;

/*Stored Procedure para listar inspecciones por propietario*/
DROP PROCEDURE IF EXISTS SP_ListarInspeccionesPorPropietario;
CREATE PROCEDURE SP_ListarInspeccionesPorPropietario (IN ID int)
BEGIN
	SELECT P.ID as IDPropietario, P.Nombre as NombrePropietario, P.Exento, V.ID as IDVehiculo, V.Dominio, V.Marca, V.Modelo, E.ID as Estado, I.ID as NumeroInspeccion, I.Fecha, I.FechaVencimiento, Ins.ID as IDInspector, Ins.Nombre as Inspector
	FROM Inspecciones as I
	LEFT JOIN Inspecciones_x_Vehiculo as IXV
	ON I.ID = IXV.ID_Inspeccion
	LEFT JOIN Estados as E
	ON I.ID_Estado = E.ID
	LEFT JOIN Vehiculos as V
	ON IXV.ID_Vehiculo = V.ID
	LEFT JOIN Vehiculos_x_Propietario as VXP
	ON V.ID = VXP.ID_Vehiculo
	LEFT JOIN Propietarios as P
	ON P.ID = VXP.ID_Propietario
	LEFT JOIN Inspectores as Ins
	ON I.ID_Inspector = Ins.ID
	WHERE P.ID = ID;
END;
