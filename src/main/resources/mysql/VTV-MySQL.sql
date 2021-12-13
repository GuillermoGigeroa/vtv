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
  `DNI_Inspector` bigint NOT NULL,
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
  `DNI` bigint NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Baja` bit NOT NULL,
  PRIMARY KEY (`DNI`)
);

DROP TABLE IF EXISTS `Propietarios`;
CREATE TABLE `Propietarios`  (
  `DNI` bigint NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Exento` bit NOT NULL,
	`Baja` bit NOT NULL,
  PRIMARY KEY (`DNI`)
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
  `DNI_Propietario` bigint NOT NULL,
  PRIMARY KEY (`ID_Vehiculo`)
);

ALTER TABLE `Inspecciones` ADD CONSTRAINT `fk_Inspecciones_Inspectores_1` FOREIGN KEY (`DNI_Inspector`) REFERENCES `Inspectores` (`DNI`);
ALTER TABLE `Inspecciones` ADD CONSTRAINT `fk_Inspecciones_Estados_1` FOREIGN KEY (`ID_Estado`) REFERENCES `Estados` (`ID`);
ALTER TABLE `Inspecciones_x_Vehiculo` ADD CONSTRAINT `fk_Inspecciones_x_Vehiculo_Inspecciones_1` FOREIGN KEY (`ID_Inspeccion`) REFERENCES `Inspecciones` (`ID`);
ALTER TABLE `Inspecciones_x_Vehiculo` ADD CONSTRAINT `fk_Inspecciones_x_Vehiculo_Vehiculos_1` FOREIGN KEY (`ID_Vehiculo`) REFERENCES `Vehiculos` (`ID`);
ALTER TABLE `Vehiculos_x_Propietario` ADD CONSTRAINT `fk_Vehiculos_x_Propietario_Propietarios_1` FOREIGN KEY (`DNI_Propietario`) REFERENCES `Propietarios` (`DNI`);
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
CREATE PROCEDURE SP_AgregarInspector (IN DNI bigint, IN NombreInspector VARCHAR(255))
BEGIN
	INSERT INTO Inspectores (DNI, Nombre, Baja)
	VALUES (DNI, NombreInspector, 0);
END;

/*Se ingresan datos de ejemplo*/
CALL SP_AgregarInspector(39112399,'Guillermo Gigeroa');
CALL SP_AgregarInspector(11111111,'Mario Allende');
CALL SP_AgregarInspector(22222222,'Roberto Gomez');
CALL SP_AgregarInspector(33333333,'Mariana Perez');
CALL SP_AgregarInspector(44444444,'Gianluca Salvador');
CALL SP_AgregarInspector(55555555,'Santiago Martinez');
CALL SP_AgregarInspector(66666666,'Maximiliano Fernandez');
CALL SP_AgregarInspector(77777777,'Lucas Lopez');
CALL SP_AgregarInspector(88888888,'Damian Basualdo');
CALL SP_AgregarInspector(99999999,'Nicolas Vega');

/*Stored Procedure para dar de baja o alta un inspector*/
DROP PROCEDURE IF EXISTS SP_BajaLogicaInspector;
CREATE PROCEDURE SP_BajaLogicaInspector (IN DNI bigint, IN Estado bit)
BEGIN
	UPDATE Inspectores as I
	SET Baja = Estado
	WHERE I.DNI = DNI;
END;

/*Stored Procedure para modificar un inspector*/
DROP PROCEDURE IF EXISTS SP_ModificarInspector;
CREATE PROCEDURE SP_ModificarInspector (IN DNI bigint, IN NuevoNombre VARCHAR(255))
BEGIN
	UPDATE Inspectores as I
	SET Nombre = NuevoNombre
	WHERE I.DNI = DNI;
END;

/*Stored Procedure para listar inspectores*/
DROP PROCEDURE IF EXISTS SP_ListarInspectores;
CREATE PROCEDURE SP_ListarInspectores()
BEGIN
	SELECT I.DNI, I.Nombre
	FROM Inspectores as I
	WHERE I.Baja = 0;
END;

/*Stored Procedure para agregar un nuevo propietario*/
DROP PROCEDURE IF EXISTS SP_AgregarPropietario;
CREATE PROCEDURE SP_AgregarPropietario (IN DNI bigint, IN NombrePropietario VARCHAR(255), IN EsExento bit)
BEGIN
	INSERT INTO Propietarios (DNI, Nombre, Exento, Baja)
	VALUES (DNI, NombrePropietario, EsExento, 0);
END;

/*Se ingresan datos de ejemplo*/
CALL SP_AgregarPropietario(11111110,'Juan Figueroa',0);
CALL SP_AgregarPropietario(22222220,'Martin Solari',1);
CALL SP_AgregarPropietario(33333330,'Federico Vazquez',0);
CALL SP_AgregarPropietario(44444440,'Francisco Vallejos',1);
CALL SP_AgregarPropietario(55555550,'Luciano Flores',1);
CALL SP_AgregarPropietario(66666660,'Marcela Morales',1);
CALL SP_AgregarPropietario(77777770,'Ruben Mamani',0);
CALL SP_AgregarPropietario(88888880,'Mario Debrito',0);
CALL SP_AgregarPropietario(99999990,'Agustina Perez',1);
CALL SP_AgregarPropietario(11111120,'Agustin Gomez',0);

/*Stored Procedure para listar los propietarios*/
DROP PROCEDURE IF EXISTS SP_ListarPropietarios;
CREATE PROCEDURE SP_ListarPropietarios ()
BEGIN
	SELECT DNI, Nombre, Exento
	FROM Propietarios;
END;

/*Stored Procedure para dar de baja o alta un propietario*/
DROP PROCEDURE IF EXISTS SP_BajaLogicaPropietario;
CREATE PROCEDURE SP_BajaLogicaPropietario (IN DNI bigint, IN Estado bit)
BEGIN
	UPDATE Propietarios as P
	SET Baja = Estado
	WHERE P.DNI = DNI;
END;

/*Stored Procedure para modificar un propietario*/
DROP PROCEDURE IF EXISTS SP_ModificarPropietario;
CREATE PROCEDURE SP_ModificarPropietario (IN DNI bigint, IN NuevoNombre VARCHAR(255), IN NuevoExento bit)
BEGIN
	UPDATE Propietarios as P
	SET Nombre = NuevoNombre, Exento = NuevoExento
	WHERE P.DNI = DNI;
END;

/*Stored Procedure para agregar un nuevo vehiculo*/
DROP PROCEDURE IF EXISTS SP_AgregarVehiculo;
CREATE PROCEDURE SP_AgregarVehiculo (IN DominioV VARCHAR(255), IN MarcaV VARCHAR(255), IN ModeloV VARCHAR(255), IN DNIPropietario bigint)
BEGIN
	INSERT INTO Vehiculos (Dominio,Marca,Modelo,Baja)
	VALUES (DominioV,MarcaV,ModeloV,0);
	INSERT INTO Vehiculos_x_Propietario (ID_Vehiculo,DNI_Propietario)
	VALUES (LAST_INSERT_ID(),DNIPropietario);
END;

/*Se ingresan datos de ejemplo*/
CALL SP_AgregarVehiculo ('AB056XS','Ford','Focus',66666660);
CALL SP_AgregarVehiculo ('VTE213','Ford','Sierra',22222220);
CALL SP_AgregarVehiculo ('AA458RT','Volkswagen','Golf',33333330);
CALL SP_AgregarVehiculo ('AB984FS','Audi','A3',55555550);
CALL SP_AgregarVehiculo ('AG149SL','Audi','A4',44444440);
CALL SP_AgregarVehiculo ('BC938HF','Peugeot','207',11111110);
CALL SP_AgregarVehiculo ('FLE786','Chevrolet','Corsa',77777770);
CALL SP_AgregarVehiculo ('AK476UL','Honda','Civic',11111120);
CALL SP_AgregarVehiculo ('BF668JK','Toyota','Corolla',99999990);
CALL SP_AgregarVehiculo ('EZR272','Suzuki','Fun',88888880);

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
	SELECT V.ID as IDVehiculo, V.Dominio, V.Marca, V.Modelo, P.DNI as DNIPropietario, P.Nombre as NombrePropietario, P.Exento
	FROM Vehiculos as V
	LEFT JOIN Vehiculos_x_Propietario as VXP
	ON V.ID = VXP.ID_Vehiculo
	LEFT JOIN Propietarios as P
	ON VXP.DNI_Propietario = P.DNI
	WHERE V.Baja = 0;
END;

/*Stored Procedure para agregar una inspeccion*/
DROP PROCEDURE IF EXISTS SP_AgregarInspeccion;
CREATE PROCEDURE SP_AgregarInspeccion (IN Fecha VARCHAR(255), IN FechaVencimiento VARCHAR(255) , IN DNIInspector bigint, IN IDEstado int, IN IDVehiculo int)
BEGIN
	INSERT INTO Inspecciones (Fecha, FechaVencimiento, DNI_Inspector, ID_Estado, Baja)
	VALUES (Fecha, FechaVencimiento, DNIInspector, IDEstado, 0);
	INSERT INTO Inspecciones_x_Vehiculo (ID_Inspeccion, ID_Vehiculo)
	VALUES (LAST_INSERT_ID(),IDVehiculo);
END;

/*Se ingresan datos de ejemplo*/
CALL SP_AgregarInspeccion('2021-11-14','2022-11-14',55555555,2,3);
CALL SP_AgregarInspeccion('2020-05-21','2021-05-21',88888888,1,5);
CALL SP_AgregarInspeccion('2021-07-25','2022-07-25',33333333,3,2);
CALL SP_AgregarInspeccion('2020-02-04','2021-02-04',11111111,2,5);
CALL SP_AgregarInspeccion('2020-06-18','2021-06-18',55555555,1,1);
CALL SP_AgregarInspeccion('2018-03-02','2019-03-02',22222222,3,6);
CALL SP_AgregarInspeccion('2020-09-15','2021-09-15',99999999,2,2);
CALL SP_AgregarInspeccion('2021-06-24','2022-06-24',11111111,1,9);
CALL SP_AgregarInspeccion('2020-08-22','2021-08-22',66666666,3,5);
CALL SP_AgregarInspeccion('2020-08-22','2021-08-22',88888888,2,8);
CALL SP_AgregarInspeccion('2021-11-13','2022-11-13',55555555,2,3);
CALL SP_AgregarInspeccion('2021-11-12','2022-11-12',88888888,1,5);
CALL SP_AgregarInspeccion('2021-11-12','2022-11-12',33333333,3,2);
CALL SP_AgregarInspeccion('2021-11-12','2022-11-12',11111111,2,5);
CALL SP_AgregarInspeccion('2021-11-09','2022-11-09',55555555,1,1);
CALL SP_AgregarInspeccion('2021-11-09','2022-11-09',22222222,3,6);
CALL SP_AgregarInspeccion('2021-10-15','2022-10-15',99999999,2,2);
CALL SP_AgregarInspeccion('2021-08-24','2022-08-24',11111111,1,9);
CALL SP_AgregarInspeccion('2021-07-08','2022-07-08',66666666,3,5);
CALL SP_AgregarInspeccion('2021-05-22','2022-05-22',88888888,2,8);

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
CREATE PROCEDURE SP_ModificarInspeccion (IN ID int, IN NuevaFecha VARCHAR(255), IN NuevaFechaVencimiento VARCHAR(255), IN NuevoDNIInspector bigint, IN NuevoIDEstado int, IN NuevoIDVehiculo int)
BEGIN
	UPDATE Inspecciones as I
	SET Fecha = NuevaFecha, FechaVencimiento = NuevaFechaVencimiento, DNI_Inspector = NuevoDNIInspector, ID_Estado = NuevoIDEstado
	WHERE I.ID = ID;
	UPDATE Inspecciones_x_Vehiculo as IXV
	SET IXV.ID_Vehiculo = NuevoIDVehiculo
	WHERE IXV.ID_Inspeccion = ID;
END;

/*Stored Procedure para listar vehiculos por ID de propietario*/
DROP PROCEDURE IF EXISTS SP_ListarVehiculosPorPropietario;
CREATE PROCEDURE SP_ListarVehiculosPorPropietario (IN DNIPropietario bigint)
BEGIN
	SELECT V.ID as IDVehiculo, V.Dominio, V.Marca, V.Modelo, P.DNI as DNIPropietario, P.Nombre as NombrePropietario, P.Exento
	FROM Vehiculos as V
	LEFT JOIN Vehiculos_x_Propietario as VXP
	ON V.ID = VXP.ID_Vehiculo
	LEFT JOIN Propietarios as P
	ON VXP.DNI_Propietario = P.DNI
	WHERE VXP.DNI_Propietario = DNIPropietario AND V.Baja = 0;
END;

/*Stored Procedure para listar inspecciones por fecha*/
DROP PROCEDURE IF EXISTS SP_ListarInspeccionesPorFecha;
CREATE PROCEDURE SP_ListarInspeccionesPorFecha (IN Fecha VARCHAR(255))
BEGIN
	SELECT I.ID as NumeroInspeccion, I.Fecha, I.FechaVencimiento, I.ID_Estado as Estado, Ins.DNI as DNIInspector, Ins.Nombre as Inspector, V.Dominio, V.Marca, V.Modelo, V.ID as IDVehiculo, P.DNI as DNIPropietario, P.Nombre as NombrePropietario, P.Exento
	FROM Vehiculos as V
	LEFT JOIN Inspecciones_x_Vehiculo as IXV
	ON IXV.ID_Vehiculo = V.ID
	LEFT JOIN Inspecciones as I
	ON I.ID = IXV.ID_Inspeccion
	LEFT JOIN Inspectores as Ins
	ON Ins.DNI = I.DNI_Inspector
	LEFT JOIN Vehiculos_x_Propietario as VXP
	ON V.ID = VXP.ID_Vehiculo
	LEFT JOIN Propietarios as P
	ON VXP.DNI_Propietario = P.DNI
	WHERE I.Fecha = Fecha AND I.Baja = 0;
END;

/*Stored Procedure para listar inspecciones por fecha*/
DROP PROCEDURE IF EXISTS SP_ListarInspecciones;
CREATE PROCEDURE SP_ListarInspecciones ()
BEGIN
	SELECT I.ID as NumeroInspeccion, I.Fecha, I.FechaVencimiento, I.ID_Estado as Estado, Ins.DNI as DNIInspector, Ins.Nombre as Inspector, V.Dominio, V.Marca, V.Modelo, V.ID as IDVehiculo, P.DNI as DNIPropietario, P.Nombre as NombrePropietario, P.Exento
	FROM Vehiculos as V
	LEFT JOIN Inspecciones_x_Vehiculo as IXV
	ON IXV.ID_Vehiculo = V.ID
	LEFT JOIN Inspecciones as I
	ON I.ID = IXV.ID_Inspeccion
	LEFT JOIN Inspectores as Ins
	ON Ins.DNI = I.DNI_Inspector
	LEFT JOIN Vehiculos_x_Propietario as VXP
	ON V.ID = VXP.ID_Vehiculo
	LEFT JOIN Propietarios as P
	ON VXP.DNI_Propietario = P.DNI
	WHERE I.Baja = 0;
END;

/*Stored Procedure para listar vehiculos por estado*/
DROP PROCEDURE IF EXISTS SP_ListarVehiculosPorEstado;
CREATE PROCEDURE SP_ListarVehiculosPorEstado (IN ID int)
BEGIN
	SELECT V.ID as IDVehiculo, V.Dominio, V.Marca, V.Modelo, E.ID as IDEstado, P.DNI as DNIPropietario, P.Nombre as NombrePropietario, P.Exento
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
	ON VXP.DNI_Propietario = P.DNI
	WHERE I.ID_Estado = ID;
END;

/*Stored Procedure para listar inspecciones por propietario*/
DROP PROCEDURE IF EXISTS SP_ListarInspeccionesPorPropietario;
CREATE PROCEDURE SP_ListarInspeccionesPorPropietario (IN DNI bigint)
BEGIN
	SELECT P.DNI as DNIPropietario, P.Nombre as NombrePropietario, P.Exento, V.ID as IDVehiculo, V.Dominio, V.Marca, V.Modelo, E.ID as Estado, I.ID as NumeroInspeccion, I.Fecha, I.FechaVencimiento, Ins.DNI as DNIInspector, Ins.Nombre as Inspector
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
	ON P.DNI = VXP.DNI_Propietario
	LEFT JOIN Inspectores as Ins
	ON I.DNI_Inspector = Ins.DNI
	WHERE P.DNI = DNI;
END;
