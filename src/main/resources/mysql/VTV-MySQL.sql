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

CREATE TABLE `Marcas`  (
  `ID` int NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `Modelos`  (
  `ID` int NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `Modelos_x_Marca`  (
  `ID_Marca` int NOT NULL,
  `ID_Modelo` int NOT NULL,
  PRIMARY KEY (`ID_Modelo`)
);

CREATE TABLE `Vehiculos`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Dominio` varchar(255) NOT NULL,
	/*
  `ID_Marca` int NOT NULL,
  `ID_Modelo` int NOT NULL,
	*/
	`Marca` VARCHAR(255) NOT NULL,
  `Modelo` VARCHAR(255) NOT NULL,
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
/*
ALTER TABLE `Modelos_x_Marca` ADD CONSTRAINT `fk_Modelos_x_Marca_Marcas_1` FOREIGN KEY (`ID_Marca`) REFERENCES `Marcas` (`ID`);
ALTER TABLE `Modelos_x_Marca` ADD CONSTRAINT `fk_Modelos_x_Marca_Modelos_1` FOREIGN KEY (`ID_Modelo`) REFERENCES `Modelos` (`ID`);
ALTER TABLE `Vehiculos` ADD CONSTRAINT `fk_Vehiculos_Marcas_1` FOREIGN KEY (`ID_Marca`) REFERENCES `Marcas` (`ID`);
ALTER TABLE `Vehiculos` ADD CONSTRAINT `fk_Vehiculos_Modelos_1` FOREIGN KEY (`ID_Modelo`) REFERENCES `Modelos` (`ID`);
*/

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

DROP PROCEDURE IF EXISTS SP_AgregarMarca;
CREATE PROCEDURE SP_AgregarMarca (IN IDMarca int, IN NombreMarca VARCHAR(255))
BEGIN
	INSERT INTO Marcas (ID, Nombre)
	VALUES (IDMarca, NombreMarca);
END;

CALL SP_AgregarMarca(1,"Abarth");
CALL SP_AgregarMarca(2,"Alfa-Romeo");
CALL SP_AgregarMarca(3,"Aro");
CALL SP_AgregarMarca(4,"Asia");
CALL SP_AgregarMarca(5,"Asia-Motors");
CALL SP_AgregarMarca(6,"Aston-Martin");
CALL SP_AgregarMarca(7,"Audi");
CALL SP_AgregarMarca(8,"Austin");
CALL SP_AgregarMarca(9,"Auverland");
CALL SP_AgregarMarca(10,"Bentley");
CALL SP_AgregarMarca(11,"Bertone");
CALL SP_AgregarMarca(12,"Bmw");
CALL SP_AgregarMarca(13,"Cadillac");
CALL SP_AgregarMarca(14,"Chevrolet");
CALL SP_AgregarMarca(15,"Chrysler");
CALL SP_AgregarMarca(16,"Citroen");
CALL SP_AgregarMarca(17,"Corvette");
CALL SP_AgregarMarca(18,"Dacia");
CALL SP_AgregarMarca(19,"Daewoo");
CALL SP_AgregarMarca(20,"Daf");
CALL SP_AgregarMarca(21,"Daihatsu");
CALL SP_AgregarMarca(22,"Daimler");
CALL SP_AgregarMarca(23,"Dodge");
CALL SP_AgregarMarca(24,"Ferrari");
CALL SP_AgregarMarca(25,"Fiat");
CALL SP_AgregarMarca(26,"Ford");
CALL SP_AgregarMarca(27,"Galloper");
CALL SP_AgregarMarca(28,"Gmc");
CALL SP_AgregarMarca(29,"Honda");
CALL SP_AgregarMarca(30,"Hummer");
CALL SP_AgregarMarca(31,"Hyundai");
CALL SP_AgregarMarca(32,"Infiniti");
CALL SP_AgregarMarca(33,"Innocenti");
CALL SP_AgregarMarca(34,"Isuzu");
CALL SP_AgregarMarca(35,"Iveco");
CALL SP_AgregarMarca(36,"Iveco-Pegaso");
CALL SP_AgregarMarca(37,"Jaguar");
CALL SP_AgregarMarca(38,"Jeep");
CALL SP_AgregarMarca(39,"Kia");
CALL SP_AgregarMarca(40,"Lada");
CALL SP_AgregarMarca(41,"Lamborghini");
CALL SP_AgregarMarca(42,"Lancia");
CALL SP_AgregarMarca(43,"Land Rover");
CALL SP_AgregarMarca(44,"Ldv");
CALL SP_AgregarMarca(45,"Lexus");
CALL SP_AgregarMarca(46,"Lotus");
CALL SP_AgregarMarca(47,"Mahindra");
CALL SP_AgregarMarca(48,"Maserati");
CALL SP_AgregarMarca(49,"Maybach");
CALL SP_AgregarMarca(50,"Mazda");
CALL SP_AgregarMarca(51,"Mercedes-Benz");
CALL SP_AgregarMarca(52,"Mg");
CALL SP_AgregarMarca(53,"Mini");
CALL SP_AgregarMarca(54,"Mitsubishi");
CALL SP_AgregarMarca(55,"Morgan");
CALL SP_AgregarMarca(56,"Nissan");
CALL SP_AgregarMarca(57,"Opel");
CALL SP_AgregarMarca(58,"Peugeot");
CALL SP_AgregarMarca(59,"Pontiac");
CALL SP_AgregarMarca(60,"Porsche");
CALL SP_AgregarMarca(61,"Renault");
CALL SP_AgregarMarca(62,"Rolls-Royce");
CALL SP_AgregarMarca(63,"Rover");
CALL SP_AgregarMarca(64,"Saab");
CALL SP_AgregarMarca(65,"Santana");
CALL SP_AgregarMarca(66,"Seat");
CALL SP_AgregarMarca(67,"Skoda");
CALL SP_AgregarMarca(68,"Smart");
CALL SP_AgregarMarca(69,"Ssangyong");
CALL SP_AgregarMarca(70,"Subaru");
CALL SP_AgregarMarca(71,"Suzuki");
CALL SP_AgregarMarca(72,"Talbot");
CALL SP_AgregarMarca(73,"Tata");
CALL SP_AgregarMarca(74,"Toyota");
CALL SP_AgregarMarca(75,"Umm");
CALL SP_AgregarMarca(76,"Vaz");
CALL SP_AgregarMarca(77,"Volkswagen");
CALL SP_AgregarMarca(78,"Volvo");
CALL SP_AgregarMarca(79,"Wartburg");

DROP PROCEDURE IF EXISTS SP_AgregarModelo;
CREATE PROCEDURE SP_AgregarModelo (IN IDMarca int, IN IDModelo int, IN NombreModelo VARCHAR(255))
BEGIN
	INSERT INTO Modelos (ID, Nombre)
	VALUES (IDModelo, NombreModelo);
	INSERT INTO Modelos_x_Marca (ID_Marca, ID_Modelo)
	VALUES (IDMarca, IDModelo);
END;

CALL SP_AgregarModelo(1,1,"500");
CALL SP_AgregarModelo(1,2,"Grande Punto");
CALL SP_AgregarModelo(1,3,"Punto Evo");
CALL SP_AgregarModelo(1,4,"500c");
CALL SP_AgregarModelo(1,5,"695");
CALL SP_AgregarModelo(1,6,"Punto");
CALL SP_AgregarModelo(2,7,"155");
CALL SP_AgregarModelo(2,8,"156");
CALL SP_AgregarModelo(2,9,"159");
CALL SP_AgregarModelo(2,10,"164");
CALL SP_AgregarModelo(2,11,"145");
CALL SP_AgregarModelo(2,12,"147");
CALL SP_AgregarModelo(2,13,"146");
CALL SP_AgregarModelo(2,14,"Gtv");
CALL SP_AgregarModelo(2,15,"Spider");
CALL SP_AgregarModelo(2,16,"166");
CALL SP_AgregarModelo(2,17,"Gt");
CALL SP_AgregarModelo(2,18,"Crosswagon");
CALL SP_AgregarModelo(2,19,"Brera");
CALL SP_AgregarModelo(2,20,"90");
CALL SP_AgregarModelo(2,21,"75");
CALL SP_AgregarModelo(2,22,"33");
CALL SP_AgregarModelo(2,23,"Giulietta");
CALL SP_AgregarModelo(2,24,"Sprint");
CALL SP_AgregarModelo(2,25,"Mito");
CALL SP_AgregarModelo(3,26,"Expander");
CALL SP_AgregarModelo(3,27,"10");
CALL SP_AgregarModelo(3,28,"24");
CALL SP_AgregarModelo(3,29,"Dacia");
CALL SP_AgregarModelo(4,30,"Rocsta");
CALL SP_AgregarModelo(5,31,"Rocsta");
CALL SP_AgregarModelo(6,32,"Db7");
CALL SP_AgregarModelo(6,33,"V8");
CALL SP_AgregarModelo(6,34,"Db9");
CALL SP_AgregarModelo(6,35,"Vanquish");
CALL SP_AgregarModelo(6,36,"V8 Vantage");
CALL SP_AgregarModelo(6,37,"Vantage");
CALL SP_AgregarModelo(6,38,"Dbs");
CALL SP_AgregarModelo(6,39,"Volante");
CALL SP_AgregarModelo(6,40,"Virage");
CALL SP_AgregarModelo(6,41,"Vantage V8");
CALL SP_AgregarModelo(6,42,"Vantage V12");
CALL SP_AgregarModelo(6,43,"Rapide");
CALL SP_AgregarModelo(6,44,"Cygnet");
CALL SP_AgregarModelo(7,45,"80");
CALL SP_AgregarModelo(7,46,"A4");
CALL SP_AgregarModelo(7,47,"A6");
CALL SP_AgregarModelo(7,48,"S6");
CALL SP_AgregarModelo(7,49,"Coupe");
CALL SP_AgregarModelo(7,50,"S2");
CALL SP_AgregarModelo(7,51,"Rs2");
CALL SP_AgregarModelo(7,52,"A8");
CALL SP_AgregarModelo(7,53,"Cabriolet");
CALL SP_AgregarModelo(7,54,"S8");
CALL SP_AgregarModelo(7,55,"A3");
CALL SP_AgregarModelo(7,56,"S4");
CALL SP_AgregarModelo(7,57,"Tt");
CALL SP_AgregarModelo(7,58,"S3");
CALL SP_AgregarModelo(7,59,"Allroad Quattro");
CALL SP_AgregarModelo(7,60,"Rs4");
CALL SP_AgregarModelo(7,61,"A2");
CALL SP_AgregarModelo(7,62,"Rs6");
CALL SP_AgregarModelo(7,63,"Q7");
CALL SP_AgregarModelo(7,64,"R8");
CALL SP_AgregarModelo(7,65,"A5");
CALL SP_AgregarModelo(7,66,"S5");
CALL SP_AgregarModelo(7,67,"V8");
CALL SP_AgregarModelo(7,68,"200");
CALL SP_AgregarModelo(7,69,"100");
CALL SP_AgregarModelo(7,70,"90");
CALL SP_AgregarModelo(7,71,"Tts");
CALL SP_AgregarModelo(7,72,"Q5");
CALL SP_AgregarModelo(7,73,"A4 Allroad Quattro");
CALL SP_AgregarModelo(7,74,"Tt Rs");
CALL SP_AgregarModelo(7,75,"Rs5");
CALL SP_AgregarModelo(7,76,"A1");
CALL SP_AgregarModelo(7,77,"A7");
CALL SP_AgregarModelo(7,78,"Rs3");
CALL SP_AgregarModelo(7,79,"Q3");
CALL SP_AgregarModelo(7,80,"A6 Allroad Quattro");
CALL SP_AgregarModelo(7,81,"S7");
CALL SP_AgregarModelo(7,82,"Sq5");
CALL SP_AgregarModelo(8,83,"Mini");
CALL SP_AgregarModelo(8,84,"Montego");
CALL SP_AgregarModelo(8,85,"Maestro");
CALL SP_AgregarModelo(8,86,"Metro");
CALL SP_AgregarModelo(8,87,"Mini Moke");
CALL SP_AgregarModelo(9,88,"Diesel");
CALL SP_AgregarModelo(10,89,"Brooklands");
CALL SP_AgregarModelo(10,90,"Turbo");
CALL SP_AgregarModelo(10,91,"Continental");
CALL SP_AgregarModelo(10,92,"Azure");
CALL SP_AgregarModelo(10,93,"Arnage");
CALL SP_AgregarModelo(10,94,"Continental Gt");
CALL SP_AgregarModelo(10,95,"Continental Flying Spur");
CALL SP_AgregarModelo(10,96,"Turbo R");
CALL SP_AgregarModelo(10,97,"Mulsanne");
CALL SP_AgregarModelo(10,98,"Eight");
CALL SP_AgregarModelo(10,99,"Continental Gtc");
CALL SP_AgregarModelo(10,100,"Continental Supersports");
CALL SP_AgregarModelo(11,101,"Freeclimber Diesel");
CALL SP_AgregarModelo(12,102,"Serie 3");
CALL SP_AgregarModelo(12,103,"Serie 5");
CALL SP_AgregarModelo(12,104,"Compact");
CALL SP_AgregarModelo(12,105,"Serie 7");
CALL SP_AgregarModelo(12,106,"Serie 8");
CALL SP_AgregarModelo(12,107,"Z3");
CALL SP_AgregarModelo(12,108,"Z4");
CALL SP_AgregarModelo(12,109,"Z8");
CALL SP_AgregarModelo(12,110,"X5");
CALL SP_AgregarModelo(12,111,"Serie 6");
CALL SP_AgregarModelo(12,112,"X3");
CALL SP_AgregarModelo(12,113,"Serie 1");
CALL SP_AgregarModelo(12,114,"Z1");
CALL SP_AgregarModelo(12,115,"X6");
CALL SP_AgregarModelo(12,116,"X1");
CALL SP_AgregarModelo(13,117,"Seville");
CALL SP_AgregarModelo(13,118,"Sts");
CALL SP_AgregarModelo(13,119,"El Dorado");
CALL SP_AgregarModelo(13,120,"Cts");
CALL SP_AgregarModelo(13,121,"Xlr");
CALL SP_AgregarModelo(13,122,"Srx");
CALL SP_AgregarModelo(13,123,"Escalade");
CALL SP_AgregarModelo(13,124,"Bls");
CALL SP_AgregarModelo(14,125,"Corvette");
CALL SP_AgregarModelo(14,126,"Blazer");
CALL SP_AgregarModelo(14,127,"Astro");
CALL SP_AgregarModelo(14,128,"Nubira");
CALL SP_AgregarModelo(14,129,"Evanda");
CALL SP_AgregarModelo(14,130,"Trans Sport");
CALL SP_AgregarModelo(14,131,"Camaro");
CALL SP_AgregarModelo(14,132,"Matiz");
CALL SP_AgregarModelo(14,133,"Alero");
CALL SP_AgregarModelo(14,134,"Tahoe");
CALL SP_AgregarModelo(14,135,"Tacuma");
CALL SP_AgregarModelo(14,136,"Trailblazer");
CALL SP_AgregarModelo(14,137,"Kalos");
CALL SP_AgregarModelo(14,138,"Aveo");
CALL SP_AgregarModelo(14,139,"Lacetti");
CALL SP_AgregarModelo(14,140,"Epica");
CALL SP_AgregarModelo(14,141,"Captiva");
CALL SP_AgregarModelo(14,142,"Hhr");
CALL SP_AgregarModelo(14,143,"Cruze");
CALL SP_AgregarModelo(14,144,"Spark");
CALL SP_AgregarModelo(14,145,"Orlando");
CALL SP_AgregarModelo(14,146,"Volt");
CALL SP_AgregarModelo(14,147,"Malibu");
CALL SP_AgregarModelo(15,148,"Vision");
CALL SP_AgregarModelo(15,149,"300m");
CALL SP_AgregarModelo(15,150,"Grand Voyager");
CALL SP_AgregarModelo(15,151,"Viper");
CALL SP_AgregarModelo(15,152,"Neon");
CALL SP_AgregarModelo(15,153,"Voyager");
CALL SP_AgregarModelo(15,154,"Stratus");
CALL SP_AgregarModelo(15,155,"Sebring");
CALL SP_AgregarModelo(15,156,"Sebring 200c");
CALL SP_AgregarModelo(15,157,"New Yorker");
CALL SP_AgregarModelo(15,158,"Pt Cruiser");
CALL SP_AgregarModelo(15,159,"Crossfire");
CALL SP_AgregarModelo(15,160,"300c");
CALL SP_AgregarModelo(15,161,"Le Baron");
CALL SP_AgregarModelo(15,162,"Saratoga");
CALL SP_AgregarModelo(16,163,"Xantia");
CALL SP_AgregarModelo(16,164,"Xm");
CALL SP_AgregarModelo(16,165,"Ax");
CALL SP_AgregarModelo(16,166,"Zx");
CALL SP_AgregarModelo(16,167,"Evasion");
CALL SP_AgregarModelo(16,168,"C8");
CALL SP_AgregarModelo(16,169,"Saxo");
CALL SP_AgregarModelo(16,170,"C2");
CALL SP_AgregarModelo(16,171,"Xsara");
CALL SP_AgregarModelo(16,172,"C4");
CALL SP_AgregarModelo(16,173,"Xsara Picasso");
CALL SP_AgregarModelo(16,174,"C5");
CALL SP_AgregarModelo(16,175,"C3");
CALL SP_AgregarModelo(16,176,"C3 Pluriel");
CALL SP_AgregarModelo(16,177,"C1");
CALL SP_AgregarModelo(16,178,"C6");
CALL SP_AgregarModelo(16,179,"Grand C4 Picasso");
CALL SP_AgregarModelo(16,180,"C4 Picasso");
CALL SP_AgregarModelo(16,181,"Ccrosser");
CALL SP_AgregarModelo(16,182,"C15");
CALL SP_AgregarModelo(16,183,"Jumper");
CALL SP_AgregarModelo(16,184,"Jumpy");
CALL SP_AgregarModelo(16,185,"Berlingo");
CALL SP_AgregarModelo(16,186,"Bx");
CALL SP_AgregarModelo(16,187,"C25");
CALL SP_AgregarModelo(16,188,"Cx");
CALL SP_AgregarModelo(16,189,"Gsa");
CALL SP_AgregarModelo(16,190,"Visa");
CALL SP_AgregarModelo(16,191,"Lna");
CALL SP_AgregarModelo(16,192,"2cv");
CALL SP_AgregarModelo(16,193,"Nemo");
CALL SP_AgregarModelo(16,194,"C4 Sedan");
CALL SP_AgregarModelo(16,195,"Berlingo First");
CALL SP_AgregarModelo(16,196,"C3 Picasso");
CALL SP_AgregarModelo(16,197,"Ds3");
CALL SP_AgregarModelo(16,198,"Czero");
CALL SP_AgregarModelo(16,199,"Ds4");
CALL SP_AgregarModelo(16,200,"Ds5");
CALL SP_AgregarModelo(16,201,"C4 Aircross");
CALL SP_AgregarModelo(16,202,"Celysee");
CALL SP_AgregarModelo(17,203,"Corvette");
CALL SP_AgregarModelo(18,204,"Contac");
CALL SP_AgregarModelo(18,205,"Logan");
CALL SP_AgregarModelo(18,206,"Sandero");
CALL SP_AgregarModelo(18,207,"Duster");
CALL SP_AgregarModelo(18,208,"Lodgy");
CALL SP_AgregarModelo(19,209,"Nexia");
CALL SP_AgregarModelo(19,210,"Aranos");
CALL SP_AgregarModelo(19,211,"Lanos");
CALL SP_AgregarModelo(19,212,"Nubira");
CALL SP_AgregarModelo(19,213,"Compact");
CALL SP_AgregarModelo(19,214,"Nubira Compact");
CALL SP_AgregarModelo(19,215,"Leganza");
CALL SP_AgregarModelo(19,216,"Evanda");
CALL SP_AgregarModelo(19,217,"Matiz");
CALL SP_AgregarModelo(19,218,"Tacuma");
CALL SP_AgregarModelo(19,219,"Kalos");
CALL SP_AgregarModelo(19,220,"Lacetti");
CALL SP_AgregarModelo(21,221,"Applause");
CALL SP_AgregarModelo(21,222,"Charade");
CALL SP_AgregarModelo(21,223,"Rocky");
CALL SP_AgregarModelo(21,224,"Feroza");
CALL SP_AgregarModelo(21,225,"Terios");
CALL SP_AgregarModelo(21,226,"Sirion");
CALL SP_AgregarModelo(22,227,"Serie Xj");
CALL SP_AgregarModelo(22,228,"Xj");
CALL SP_AgregarModelo(22,229,"Double Six");
CALL SP_AgregarModelo(22,230,"Six");
CALL SP_AgregarModelo(22,231,"Series Iii");
CALL SP_AgregarModelo(23,232,"Viper");
CALL SP_AgregarModelo(23,233,"Caliber");
CALL SP_AgregarModelo(23,234,"Nitro");
CALL SP_AgregarModelo(23,235,"Avenger");
CALL SP_AgregarModelo(23,236,"Journey");
CALL SP_AgregarModelo(24,237,"F355");
CALL SP_AgregarModelo(24,238,"360");
CALL SP_AgregarModelo(24,239,"F430");
CALL SP_AgregarModelo(24,240,"F512 M");
CALL SP_AgregarModelo(24,241,"550 Maranello");
CALL SP_AgregarModelo(24,242,"575m Maranello");
CALL SP_AgregarModelo(24,243,"599");
CALL SP_AgregarModelo(24,244,"456");
CALL SP_AgregarModelo(24,245,"456m");
CALL SP_AgregarModelo(24,246,"612");
CALL SP_AgregarModelo(24,247,"F50");
CALL SP_AgregarModelo(24,248,"Enzo");
CALL SP_AgregarModelo(24,249,"Superamerica");
CALL SP_AgregarModelo(24,250,"430");
CALL SP_AgregarModelo(24,251,"348");
CALL SP_AgregarModelo(24,252,"Testarossa");
CALL SP_AgregarModelo(24,253,"512");
CALL SP_AgregarModelo(24,254,"355");
CALL SP_AgregarModelo(24,255,"F40");
CALL SP_AgregarModelo(24,256,"412");
CALL SP_AgregarModelo(24,257,"Mondial");
CALL SP_AgregarModelo(24,258,"328");
CALL SP_AgregarModelo(24,259,"California");
CALL SP_AgregarModelo(24,260,"458");
CALL SP_AgregarModelo(24,261,"Ff");
CALL SP_AgregarModelo(25,262,"Croma");
CALL SP_AgregarModelo(25,263,"Cinquecento");
CALL SP_AgregarModelo(25,264,"Seicento");
CALL SP_AgregarModelo(25,265,"Punto");
CALL SP_AgregarModelo(25,266,"Grande Punto");
CALL SP_AgregarModelo(25,267,"Panda");
CALL SP_AgregarModelo(25,268,"Tipo");
CALL SP_AgregarModelo(25,269,"Coupe");
CALL SP_AgregarModelo(25,270,"Uno");
CALL SP_AgregarModelo(25,271,"Ulysse");
CALL SP_AgregarModelo(25,272,"Tempra");
CALL SP_AgregarModelo(25,273,"Marea");
CALL SP_AgregarModelo(25,274,"Barchetta");
CALL SP_AgregarModelo(25,275,"Bravo");
CALL SP_AgregarModelo(25,276,"Stilo");
CALL SP_AgregarModelo(25,277,"Brava");
CALL SP_AgregarModelo(25,278,"Palio Weekend");
CALL SP_AgregarModelo(25,279,"600");
CALL SP_AgregarModelo(25,280,"Multipla");
CALL SP_AgregarModelo(25,281,"Idea");
CALL SP_AgregarModelo(25,282,"Sedici");
CALL SP_AgregarModelo(25,283,"Linea");
CALL SP_AgregarModelo(25,284,"500");
CALL SP_AgregarModelo(25,285,"Fiorino");
CALL SP_AgregarModelo(25,286,"Ducato");
CALL SP_AgregarModelo(25,287,"Doblo Cargo");
CALL SP_AgregarModelo(25,288,"Doblo");
CALL SP_AgregarModelo(25,289,"Strada");
CALL SP_AgregarModelo(25,290,"Regata");
CALL SP_AgregarModelo(25,291,"Talento");
CALL SP_AgregarModelo(25,292,"Argenta");
CALL SP_AgregarModelo(25,293,"Ritmo");
CALL SP_AgregarModelo(25,294,"Punto Classic");
CALL SP_AgregarModelo(25,295,"Qubo");
CALL SP_AgregarModelo(25,296,"Punto Evo");
CALL SP_AgregarModelo(25,297,"500c");
CALL SP_AgregarModelo(25,298,"Freemont");
CALL SP_AgregarModelo(25,299,"Panda Classic");
CALL SP_AgregarModelo(25,300,"500l");
CALL SP_AgregarModelo(26,301,"Maverick");
CALL SP_AgregarModelo(26,302,"Escort");
CALL SP_AgregarModelo(26,303,"Focus");
CALL SP_AgregarModelo(26,304,"Mondeo");
CALL SP_AgregarModelo(26,305,"Scorpio");
CALL SP_AgregarModelo(26,306,"Fiesta");
CALL SP_AgregarModelo(26,307,"Probe");
CALL SP_AgregarModelo(26,308,"Explorer");
CALL SP_AgregarModelo(26,309,"Galaxy");
CALL SP_AgregarModelo(26,310,"Ka");
CALL SP_AgregarModelo(26,311,"Puma");
CALL SP_AgregarModelo(26,312,"Cougar");
CALL SP_AgregarModelo(26,313,"Focus Cmax");
CALL SP_AgregarModelo(26,314,"Fusion");
CALL SP_AgregarModelo(26,315,"Streetka");
CALL SP_AgregarModelo(26,316,"Cmax");
CALL SP_AgregarModelo(26,317,"Smax");
CALL SP_AgregarModelo(26,318,"Transit");
CALL SP_AgregarModelo(26,319,"Courier");
CALL SP_AgregarModelo(26,320,"Ranger");
CALL SP_AgregarModelo(26,321,"Sierra");
CALL SP_AgregarModelo(26,322,"Orion");
CALL SP_AgregarModelo(26,323,"Pick Up");
CALL SP_AgregarModelo(26,324,"Capri");
CALL SP_AgregarModelo(26,325,"Granada");
CALL SP_AgregarModelo(26,326,"Kuga");
CALL SP_AgregarModelo(26,327,"Grand Cmax");
CALL SP_AgregarModelo(26,328,"Bmax");
CALL SP_AgregarModelo(26,329,"Tourneo Custom");
CALL SP_AgregarModelo(27,330,"Exceed");
CALL SP_AgregarModelo(27,331,"Santamo");
CALL SP_AgregarModelo(27,332,"Super Exceed");
CALL SP_AgregarModelo(29,333,"Accord");
CALL SP_AgregarModelo(29,334,"Civic");
CALL SP_AgregarModelo(29,335,"Crx");
CALL SP_AgregarModelo(29,336,"Prelude");
CALL SP_AgregarModelo(29,337,"Nsx");
CALL SP_AgregarModelo(29,338,"Legend");
CALL SP_AgregarModelo(29,339,"Crv");
CALL SP_AgregarModelo(29,340,"Hrv");
CALL SP_AgregarModelo(29,341,"Logo");
CALL SP_AgregarModelo(29,342,"S2000");
CALL SP_AgregarModelo(29,343,"Stream");
CALL SP_AgregarModelo(29,344,"Jazz");
CALL SP_AgregarModelo(29,345,"Frv");
CALL SP_AgregarModelo(29,346,"Concerto");
CALL SP_AgregarModelo(29,347,"Insight");
CALL SP_AgregarModelo(29,348,"Crz");
CALL SP_AgregarModelo(30,349,"H2");
CALL SP_AgregarModelo(30,350,"H3");
CALL SP_AgregarModelo(30,351,"H3t");
CALL SP_AgregarModelo(31,352,"Lantra");
CALL SP_AgregarModelo(31,353,"Sonata");
CALL SP_AgregarModelo(31,354,"Elantra");
CALL SP_AgregarModelo(31,355,"Accent");
CALL SP_AgregarModelo(31,356,"Scoupe");
CALL SP_AgregarModelo(31,357,"Coupe");
CALL SP_AgregarModelo(31,358,"Atos");
CALL SP_AgregarModelo(31,359,"H1");
CALL SP_AgregarModelo(31,360,"Atos Prime");
CALL SP_AgregarModelo(31,361,"Xg");
CALL SP_AgregarModelo(31,362,"Trajet");
CALL SP_AgregarModelo(31,363,"Santa Fe");
CALL SP_AgregarModelo(31,364,"Terracan");
CALL SP_AgregarModelo(31,365,"Matrix");
CALL SP_AgregarModelo(31,366,"Getz");
CALL SP_AgregarModelo(31,367,"Tucson");
CALL SP_AgregarModelo(31,368,"I30");
CALL SP_AgregarModelo(31,369,"Pony");
CALL SP_AgregarModelo(31,370,"Grandeur");
CALL SP_AgregarModelo(31,371,"I10");
CALL SP_AgregarModelo(31,372,"I800");
CALL SP_AgregarModelo(31,373,"Sonata Fl");
CALL SP_AgregarModelo(31,374,"Ix55");
CALL SP_AgregarModelo(31,375,"I20");
CALL SP_AgregarModelo(31,376,"Ix35");
CALL SP_AgregarModelo(31,377,"Ix20");
CALL SP_AgregarModelo(31,378,"Genesis");
CALL SP_AgregarModelo(31,379,"I40");
CALL SP_AgregarModelo(31,380,"Veloster");
CALL SP_AgregarModelo(32,381,"G");
CALL SP_AgregarModelo(32,382,"Ex");
CALL SP_AgregarModelo(32,383,"Fx");
CALL SP_AgregarModelo(32,384,"M");
CALL SP_AgregarModelo(33,385,"Elba");
CALL SP_AgregarModelo(33,386,"Minitre");
CALL SP_AgregarModelo(34,387,"Trooper");
CALL SP_AgregarModelo(34,388,"Pick Up");
CALL SP_AgregarModelo(34,389,"D Max");
CALL SP_AgregarModelo(34,390,"Rodeo");
CALL SP_AgregarModelo(34,391,"Dmax");
CALL SP_AgregarModelo(34,392,"Trroper");
CALL SP_AgregarModelo(35,393,"Daily");
CALL SP_AgregarModelo(35,394,"Massif");
CALL SP_AgregarModelo(36,395,"Daily");
CALL SP_AgregarModelo(36,396,"Duty");
CALL SP_AgregarModelo(37,397,"Serie Xj");
CALL SP_AgregarModelo(37,398,"Serie Xk");
CALL SP_AgregarModelo(37,399,"Xj");
CALL SP_AgregarModelo(37,400,"Stype");
CALL SP_AgregarModelo(37,401,"Xf");
CALL SP_AgregarModelo(37,402,"Xtype");
CALL SP_AgregarModelo(38,403,"Wrangler");
CALL SP_AgregarModelo(38,404,"Cherokee");
CALL SP_AgregarModelo(38,405,"Grand Cherokee");
CALL SP_AgregarModelo(38,406,"Commander");
CALL SP_AgregarModelo(38,407,"Compass");
CALL SP_AgregarModelo(38,408,"Wrangler Unlimited");
CALL SP_AgregarModelo(38,409,"Patriot");
CALL SP_AgregarModelo(39,410,"Sportage");
CALL SP_AgregarModelo(39,411,"Sephia");
CALL SP_AgregarModelo(39,412,"Sephia Ii");
CALL SP_AgregarModelo(39,413,"Pride");
CALL SP_AgregarModelo(39,414,"Clarus");
CALL SP_AgregarModelo(39,415,"Shuma");
CALL SP_AgregarModelo(39,416,"Carnival");
CALL SP_AgregarModelo(39,417,"Joice");
CALL SP_AgregarModelo(39,418,"Magentis");
CALL SP_AgregarModelo(39,419,"Carens");
CALL SP_AgregarModelo(39,420,"Rio");
CALL SP_AgregarModelo(39,421,"Cerato");
CALL SP_AgregarModelo(39,422,"Sorento");
CALL SP_AgregarModelo(39,423,"Opirus");
CALL SP_AgregarModelo(39,424,"Picanto");
CALL SP_AgregarModelo(39,425,"Ceed");
CALL SP_AgregarModelo(39,426,"Ceed Sporty Wagon");
CALL SP_AgregarModelo(39,427,"Proceed");
CALL SP_AgregarModelo(39,428,"K2500 Frontier");
CALL SP_AgregarModelo(39,429,"K2500");
CALL SP_AgregarModelo(39,430,"Soul");
CALL SP_AgregarModelo(39,431,"Venga");
CALL SP_AgregarModelo(39,432,"Optima");
CALL SP_AgregarModelo(39,433,"Ceed Sportswagon");
CALL SP_AgregarModelo(40,434,"Samara");
CALL SP_AgregarModelo(40,435,"Niva");
CALL SP_AgregarModelo(40,436,"Sagona");
CALL SP_AgregarModelo(40,437,"Stawra 2110");
CALL SP_AgregarModelo(40,438,"214");
CALL SP_AgregarModelo(40,439,"Kalina");
CALL SP_AgregarModelo(40,440,"Serie 2100");
CALL SP_AgregarModelo(40,441,"Priora");
CALL SP_AgregarModelo(41,442,"Gallardo");
CALL SP_AgregarModelo(41,443,"Murcielago");
CALL SP_AgregarModelo(41,444,"Aventador");
CALL SP_AgregarModelo(42,445,"Delta");
CALL SP_AgregarModelo(42,446,"K");
CALL SP_AgregarModelo(42,447,"Y10");
CALL SP_AgregarModelo(42,448,"Dedra");
CALL SP_AgregarModelo(42,449,"Lybra");
CALL SP_AgregarModelo(42,450,"Z");
CALL SP_AgregarModelo(42,451,"Y");
CALL SP_AgregarModelo(42,452,"Ypsilon");
CALL SP_AgregarModelo(42,453,"Thesis");
CALL SP_AgregarModelo(42,454,"Phedra");
CALL SP_AgregarModelo(42,455,"Musa");
CALL SP_AgregarModelo(42,456,"Thema");
CALL SP_AgregarModelo(42,457,"Zeta");
CALL SP_AgregarModelo(42,458,"Kappa");
CALL SP_AgregarModelo(42,459,"Trevi");
CALL SP_AgregarModelo(42,460,"Prisma");
CALL SP_AgregarModelo(42,461,"A112");
CALL SP_AgregarModelo(42,462,"Ypsilon Elefantino");
CALL SP_AgregarModelo(42,463,"Voyager");
CALL SP_AgregarModelo(43,464,"Range Rover");
CALL SP_AgregarModelo(43,465,"Defender");
CALL SP_AgregarModelo(43,466,"Discovery");
CALL SP_AgregarModelo(43,467,"Freelander");
CALL SP_AgregarModelo(43,468,"Range Rover Sport");
CALL SP_AgregarModelo(43,469,"Discovery 4");
CALL SP_AgregarModelo(43,470,"Range Rover Evoque");
CALL SP_AgregarModelo(44,471,"Maxus");
CALL SP_AgregarModelo(45,472,"Ls400");
CALL SP_AgregarModelo(45,473,"Ls430");
CALL SP_AgregarModelo(45,474,"Gs300");
CALL SP_AgregarModelo(45,475,"Is200");
CALL SP_AgregarModelo(45,476,"Rx300");
CALL SP_AgregarModelo(45,477,"Gs430");
CALL SP_AgregarModelo(45,478,"Gs460");
CALL SP_AgregarModelo(45,479,"Sc430");
CALL SP_AgregarModelo(45,480,"Is300");
CALL SP_AgregarModelo(45,481,"Is250");
CALL SP_AgregarModelo(45,482,"Rx400h");
CALL SP_AgregarModelo(45,483,"Is220d");
CALL SP_AgregarModelo(45,484,"Rx350");
CALL SP_AgregarModelo(45,485,"Gs450h");
CALL SP_AgregarModelo(45,486,"Ls460");
CALL SP_AgregarModelo(45,487,"Ls600h");
CALL SP_AgregarModelo(45,488,"Ls");
CALL SP_AgregarModelo(45,489,"Gs");
CALL SP_AgregarModelo(45,490,"Is");
CALL SP_AgregarModelo(45,491,"Sc");
CALL SP_AgregarModelo(45,492,"Rx");
CALL SP_AgregarModelo(45,493,"Ct");
CALL SP_AgregarModelo(46,494,"Elise");
CALL SP_AgregarModelo(46,495,"Exige");
CALL SP_AgregarModelo(47,496,"Bolero Pickup");
CALL SP_AgregarModelo(47,497,"Goa Pickup");
CALL SP_AgregarModelo(47,498,"Goa");
CALL SP_AgregarModelo(47,499,"Cj");
CALL SP_AgregarModelo(47,500,"Pikup");
CALL SP_AgregarModelo(47,501,"Thar");
CALL SP_AgregarModelo(48,502,"Ghibli");
CALL SP_AgregarModelo(48,503,"Shamal");
CALL SP_AgregarModelo(48,504,"Quattroporte");
CALL SP_AgregarModelo(48,505,"3200 Gt");
CALL SP_AgregarModelo(48,506,"Coupe");
CALL SP_AgregarModelo(48,507,"Spyder");
CALL SP_AgregarModelo(48,508,"Gransport");
CALL SP_AgregarModelo(48,509,"Granturismo");
CALL SP_AgregarModelo(48,510,"430");
CALL SP_AgregarModelo(48,511,"Biturbo");
CALL SP_AgregarModelo(48,512,"228");
CALL SP_AgregarModelo(48,513,"224");
CALL SP_AgregarModelo(48,514,"Grancabrio");
CALL SP_AgregarModelo(49,515,"Maybach");
CALL SP_AgregarModelo(50,516,"Xedos 6");
CALL SP_AgregarModelo(50,517,"626");
CALL SP_AgregarModelo(50,518,"121");
CALL SP_AgregarModelo(50,519,"Xedos 9");
CALL SP_AgregarModelo(50,520,"323");
CALL SP_AgregarModelo(50,521,"Mx3");
CALL SP_AgregarModelo(50,522,"Rx7");
CALL SP_AgregarModelo(50,523,"Mx5");
CALL SP_AgregarModelo(50,524,"Mazda3");
CALL SP_AgregarModelo(50,525,"Mpv");
CALL SP_AgregarModelo(50,526,"Demio");
CALL SP_AgregarModelo(50,527,"Premacy");
CALL SP_AgregarModelo(50,528,"Tribute");
CALL SP_AgregarModelo(50,529,"Mazda6");
CALL SP_AgregarModelo(50,530,"Mazda2");
CALL SP_AgregarModelo(50,531,"Rx8");
CALL SP_AgregarModelo(50,532,"Mazda5");
CALL SP_AgregarModelo(50,533,"Cx7");
CALL SP_AgregarModelo(50,534,"Serie B");
CALL SP_AgregarModelo(50,535,"B2500");
CALL SP_AgregarModelo(50,536,"Bt50");
CALL SP_AgregarModelo(50,537,"Mx6");
CALL SP_AgregarModelo(50,538,"929");
CALL SP_AgregarModelo(50,539,"Cx5");
CALL SP_AgregarModelo(51,540,"Clase C");
CALL SP_AgregarModelo(51,541,"Clase E");
CALL SP_AgregarModelo(51,542,"Clase Sl");
CALL SP_AgregarModelo(51,543,"Clase S");
CALL SP_AgregarModelo(51,544,"Clase Cl");
CALL SP_AgregarModelo(51,545,"Clase G");
CALL SP_AgregarModelo(51,546,"Clase Slk");
CALL SP_AgregarModelo(51,547,"Clase V");
CALL SP_AgregarModelo(51,548,"Viano");
CALL SP_AgregarModelo(51,549,"Clase Clk");
CALL SP_AgregarModelo(51,550,"Clase A");
CALL SP_AgregarModelo(51,551,"Clase M");
CALL SP_AgregarModelo(51,552,"Vaneo");
CALL SP_AgregarModelo(51,553,"Slklasse");
CALL SP_AgregarModelo(51,554,"Slr Mclaren");
CALL SP_AgregarModelo(51,555,"Clase Cls");
CALL SP_AgregarModelo(51,556,"Clase R");
CALL SP_AgregarModelo(51,557,"Clase Gl");
CALL SP_AgregarModelo(51,558,"Clase B");
CALL SP_AgregarModelo(51,559,"100d");
CALL SP_AgregarModelo(51,560,"140d");
CALL SP_AgregarModelo(51,561,"180d");
CALL SP_AgregarModelo(51,562,"Sprinter");
CALL SP_AgregarModelo(51,563,"Vito");
CALL SP_AgregarModelo(51,564,"Transporter");
CALL SP_AgregarModelo(51,565,"280");
CALL SP_AgregarModelo(51,566,"220");
CALL SP_AgregarModelo(51,567,"200");
CALL SP_AgregarModelo(51,568,"190");
CALL SP_AgregarModelo(51,569,"600");
CALL SP_AgregarModelo(51,570,"400");
CALL SP_AgregarModelo(51,571,"Clase Sl R129");
CALL SP_AgregarModelo(51,572,"300");
CALL SP_AgregarModelo(51,573,"500");
CALL SP_AgregarModelo(51,574,"420");
CALL SP_AgregarModelo(51,575,"260");
CALL SP_AgregarModelo(51,576,"230");
CALL SP_AgregarModelo(51,577,"Clase Clc");
CALL SP_AgregarModelo(51,578,"Clase Glk");
CALL SP_AgregarModelo(51,579,"Sls Amg");
CALL SP_AgregarModelo(52,580,"Mgf");
CALL SP_AgregarModelo(52,581,"Tf");
CALL SP_AgregarModelo(52,582,"Zr");
CALL SP_AgregarModelo(52,583,"Zs");
CALL SP_AgregarModelo(52,584,"Zt");
CALL SP_AgregarModelo(52,585,"Ztt");
CALL SP_AgregarModelo(52,586,"Mini");
CALL SP_AgregarModelo(52,587,"Countryman");
CALL SP_AgregarModelo(52,588,"Paceman");
CALL SP_AgregarModelo(54,589,"Montero");
CALL SP_AgregarModelo(54,590,"Galant");
CALL SP_AgregarModelo(54,591,"Colt");
CALL SP_AgregarModelo(54,592,"Space Wagon");
CALL SP_AgregarModelo(54,593,"Space Runner");
CALL SP_AgregarModelo(54,594,"Space Gear");
CALL SP_AgregarModelo(54,595,"3000 Gt");
CALL SP_AgregarModelo(54,596,"Carisma");
CALL SP_AgregarModelo(54,597,"Eclipse");
CALL SP_AgregarModelo(54,598,"Space Star");
CALL SP_AgregarModelo(54,599,"Montero Sport");
CALL SP_AgregarModelo(54,600,"Montero Io");
CALL SP_AgregarModelo(54,601,"Outlander");
CALL SP_AgregarModelo(54,602,"Lancer");
CALL SP_AgregarModelo(54,603,"Grandis");
CALL SP_AgregarModelo(54,604,"L200");
CALL SP_AgregarModelo(54,605,"Canter");
CALL SP_AgregarModelo(54,606,"300 Gt");
CALL SP_AgregarModelo(54,607,"Asx");
CALL SP_AgregarModelo(54,608,"Imiev");
CALL SP_AgregarModelo(55,609,"44");
CALL SP_AgregarModelo(55,610,"Plus 8");
CALL SP_AgregarModelo(55,611,"Aero 8");
CALL SP_AgregarModelo(55,612,"V6");
CALL SP_AgregarModelo(55,613,"Roadster");
CALL SP_AgregarModelo(55,614,"4");
CALL SP_AgregarModelo(55,615,"Plus 4");
CALL SP_AgregarModelo(56,616,"Terrano Ii");
CALL SP_AgregarModelo(56,617,"Terrano");
CALL SP_AgregarModelo(56,618,"Micra");
CALL SP_AgregarModelo(56,619,"Sunny");
CALL SP_AgregarModelo(56,620,"Primera");
CALL SP_AgregarModelo(56,621,"Serena");
CALL SP_AgregarModelo(56,622,"Patrol");
CALL SP_AgregarModelo(56,623,"Maxima Qx");
CALL SP_AgregarModelo(56,624,"200 Sx");
CALL SP_AgregarModelo(56,625,"300 Zx");
CALL SP_AgregarModelo(56,626,"Patrol Gr");
CALL SP_AgregarModelo(56,627,"100 Nx");
CALL SP_AgregarModelo(56,628,"Almera");
CALL SP_AgregarModelo(56,629,"Pathfinder");
CALL SP_AgregarModelo(56,630,"Almera Tino");
CALL SP_AgregarModelo(56,631,"Xtrail");
CALL SP_AgregarModelo(56,632,"350z");
CALL SP_AgregarModelo(56,633,"Murano");
CALL SP_AgregarModelo(56,634,"Note");
CALL SP_AgregarModelo(56,635,"Qashqai");
CALL SP_AgregarModelo(56,636,"Tiida");
CALL SP_AgregarModelo(56,637,"Vanette");
CALL SP_AgregarModelo(56,638,"Trade");
CALL SP_AgregarModelo(56,639,"Vanette Cargo");
CALL SP_AgregarModelo(56,640,"Pickup");
CALL SP_AgregarModelo(56,641,"Navara");
CALL SP_AgregarModelo(56,642,"Cabstar E");
CALL SP_AgregarModelo(56,643,"Cabstar");
CALL SP_AgregarModelo(56,644,"Maxima");
CALL SP_AgregarModelo(56,645,"Camion");
CALL SP_AgregarModelo(56,646,"Prairie");
CALL SP_AgregarModelo(56,647,"Bluebird");
CALL SP_AgregarModelo(56,648,"Np300 Pick Up");
CALL SP_AgregarModelo(56,649,"Qashqai2");
CALL SP_AgregarModelo(56,650,"Pixo");
CALL SP_AgregarModelo(56,651,"Gtr");
CALL SP_AgregarModelo(56,652,"370z");
CALL SP_AgregarModelo(56,653,"Cube");
CALL SP_AgregarModelo(56,654,"Juke");
CALL SP_AgregarModelo(56,655,"Leaf");
CALL SP_AgregarModelo(56,656,"Evalia");
CALL SP_AgregarModelo(57,657,"Astra");
CALL SP_AgregarModelo(57,658,"Vectra");
CALL SP_AgregarModelo(57,659,"Calibra");
CALL SP_AgregarModelo(57,660,"Corsa");
CALL SP_AgregarModelo(57,661,"Omega");
CALL SP_AgregarModelo(57,662,"Frontera");
CALL SP_AgregarModelo(57,663,"Tigra");
CALL SP_AgregarModelo(57,664,"Monterey");
CALL SP_AgregarModelo(57,665,"Sintra");
CALL SP_AgregarModelo(57,666,"Zafira");
CALL SP_AgregarModelo(57,667,"Agila");
CALL SP_AgregarModelo(57,668,"Speedster");
CALL SP_AgregarModelo(57,669,"Signum");
CALL SP_AgregarModelo(57,670,"Meriva");
CALL SP_AgregarModelo(57,671,"Antara");
CALL SP_AgregarModelo(57,672,"Gt");
CALL SP_AgregarModelo(57,673,"Combo");
CALL SP_AgregarModelo(57,674,"Movano");
CALL SP_AgregarModelo(57,675,"Vivaro");
CALL SP_AgregarModelo(57,676,"Kadett");
CALL SP_AgregarModelo(57,677,"Monza");
CALL SP_AgregarModelo(57,678,"Senator");
CALL SP_AgregarModelo(57,679,"Rekord");
CALL SP_AgregarModelo(57,680,"Manta");
CALL SP_AgregarModelo(57,681,"Ascona");
CALL SP_AgregarModelo(57,682,"Insignia");
CALL SP_AgregarModelo(57,683,"Zafira Tourer");
CALL SP_AgregarModelo(57,684,"Ampera");
CALL SP_AgregarModelo(57,685,"Mokka");
CALL SP_AgregarModelo(57,686,"Adam");
CALL SP_AgregarModelo(58,687,"306");
CALL SP_AgregarModelo(58,688,"605");
CALL SP_AgregarModelo(58,689,"106");
CALL SP_AgregarModelo(58,690,"205");
CALL SP_AgregarModelo(58,691,"405");
CALL SP_AgregarModelo(58,692,"406");
CALL SP_AgregarModelo(58,693,"806");
CALL SP_AgregarModelo(58,694,"807");
CALL SP_AgregarModelo(58,695,"407");
CALL SP_AgregarModelo(58,696,"307");
CALL SP_AgregarModelo(58,697,"206");
CALL SP_AgregarModelo(58,698,"607");
CALL SP_AgregarModelo(58,699,"308");
CALL SP_AgregarModelo(58,700,"307 Sw");
CALL SP_AgregarModelo(58,701,"206 Sw");
CALL SP_AgregarModelo(58,702,"407 Sw");
CALL SP_AgregarModelo(58,703,"1007");
CALL SP_AgregarModelo(58,704,"107");
CALL SP_AgregarModelo(58,705,"207");
CALL SP_AgregarModelo(58,706,"4007");
CALL SP_AgregarModelo(58,707,"Boxer");
CALL SP_AgregarModelo(58,708,"Partner");
CALL SP_AgregarModelo(58,709,"J5");
CALL SP_AgregarModelo(58,710,"604");
CALL SP_AgregarModelo(58,711,"505");
CALL SP_AgregarModelo(58,712,"309");
CALL SP_AgregarModelo(58,713,"Bipper");
CALL SP_AgregarModelo(58,714,"Partner Origin");
CALL SP_AgregarModelo(58,715,"3008");
CALL SP_AgregarModelo(58,716,"5008");
CALL SP_AgregarModelo(58,717,"Rcz");
CALL SP_AgregarModelo(58,718,"508");
CALL SP_AgregarModelo(58,719,"Ion");
CALL SP_AgregarModelo(58,720,"208");
CALL SP_AgregarModelo(58,721,"4008");
CALL SP_AgregarModelo(59,722,"Trans Sport");
CALL SP_AgregarModelo(59,723,"Firebird");
CALL SP_AgregarModelo(59,724,"Trans Am");
CALL SP_AgregarModelo(60,725,"911");
CALL SP_AgregarModelo(60,726,"Boxster");
CALL SP_AgregarModelo(60,727,"Cayenne");
CALL SP_AgregarModelo(60,728,"Carrera Gt");
CALL SP_AgregarModelo(60,729,"Cayman");
CALL SP_AgregarModelo(60,730,"928");
CALL SP_AgregarModelo(60,731,"968");
CALL SP_AgregarModelo(60,732,"944");
CALL SP_AgregarModelo(60,733,"924");
CALL SP_AgregarModelo(60,734,"Panamera");
CALL SP_AgregarModelo(60,735,"918");
CALL SP_AgregarModelo(61,736,"Megane");
CALL SP_AgregarModelo(61,737,"Safrane");
CALL SP_AgregarModelo(61,738,"Laguna");
CALL SP_AgregarModelo(61,739,"Clio");
CALL SP_AgregarModelo(61,740,"Twingo");
CALL SP_AgregarModelo(61,741,"Nevada");
CALL SP_AgregarModelo(61,742,"Espace");
CALL SP_AgregarModelo(61,743,"Spider");
CALL SP_AgregarModelo(61,744,"Scenic");
CALL SP_AgregarModelo(61,745,"Grand Espace");
CALL SP_AgregarModelo(61,746,"Avantime");
CALL SP_AgregarModelo(61,747,"Vel Satis");
CALL SP_AgregarModelo(61,748,"Grand Scenic");
CALL SP_AgregarModelo(61,749,"Clio Campus");
CALL SP_AgregarModelo(61,750,"Modus");
CALL SP_AgregarModelo(61,751,"Express");
CALL SP_AgregarModelo(61,752,"Trafic");
CALL SP_AgregarModelo(61,753,"Master");
CALL SP_AgregarModelo(61,754,"Kangoo");
CALL SP_AgregarModelo(61,755,"Mascott");
CALL SP_AgregarModelo(61,756,"Master Propulsion");
CALL SP_AgregarModelo(61,757,"Maxity");
CALL SP_AgregarModelo(61,758,"R19");
CALL SP_AgregarModelo(61,759,"R25");
CALL SP_AgregarModelo(61,760,"R5");
CALL SP_AgregarModelo(61,761,"R21");
CALL SP_AgregarModelo(61,762,"R4");
CALL SP_AgregarModelo(61,763,"Alpine");
CALL SP_AgregarModelo(61,764,"Fuego");
CALL SP_AgregarModelo(61,765,"R18");
CALL SP_AgregarModelo(61,766,"R11");
CALL SP_AgregarModelo(61,767,"R9");
CALL SP_AgregarModelo(61,768,"R6");
CALL SP_AgregarModelo(61,769,"Grand Modus");
CALL SP_AgregarModelo(61,770,"Kangoo Combi");
CALL SP_AgregarModelo(61,771,"Koleos");
CALL SP_AgregarModelo(61,772,"Fluence");
CALL SP_AgregarModelo(61,773,"Wind");
CALL SP_AgregarModelo(61,774,"Latitude");
CALL SP_AgregarModelo(61,775,"Grand Kangoo Combi");
CALL SP_AgregarModelo(62,776,"Siver Dawn");
CALL SP_AgregarModelo(62,777,"Silver Spur");
CALL SP_AgregarModelo(62,778,"Park Ward");
CALL SP_AgregarModelo(62,779,"Silver Seraph");
CALL SP_AgregarModelo(62,780,"Corniche");
CALL SP_AgregarModelo(62,781,"Phantom");
CALL SP_AgregarModelo(62,782,"Touring");
CALL SP_AgregarModelo(62,783,"Silvier");
CALL SP_AgregarModelo(63,784,"800");
CALL SP_AgregarModelo(63,785,"600");
CALL SP_AgregarModelo(63,786,"100");
CALL SP_AgregarModelo(63,787,"200");
CALL SP_AgregarModelo(63,788,"Coupe");
CALL SP_AgregarModelo(63,789,"400");
CALL SP_AgregarModelo(63,790,"45");
CALL SP_AgregarModelo(63,791,"Cabriolet");
CALL SP_AgregarModelo(63,792,"25");
CALL SP_AgregarModelo(63,793,"Mini");
CALL SP_AgregarModelo(63,794,"75");
CALL SP_AgregarModelo(63,795,"Streetwise");
CALL SP_AgregarModelo(63,796,"Sd");
CALL SP_AgregarModelo(64,797,"900");
CALL SP_AgregarModelo(64,798,"93");
CALL SP_AgregarModelo(64,799,"9000");
CALL SP_AgregarModelo(64,800,"95");
CALL SP_AgregarModelo(64,801,"93x");
CALL SP_AgregarModelo(64,802,"94x");
CALL SP_AgregarModelo(65,803,"300");
CALL SP_AgregarModelo(65,804,"350");
CALL SP_AgregarModelo(65,805,"Anibal");
CALL SP_AgregarModelo(65,806,"Anibal Pick Up");
CALL SP_AgregarModelo(66,807,"Ibiza");
CALL SP_AgregarModelo(66,808,"Cordoba");
CALL SP_AgregarModelo(66,809,"Toledo");
CALL SP_AgregarModelo(66,810,"Marbella");
CALL SP_AgregarModelo(66,811,"Alhambra");
CALL SP_AgregarModelo(66,812,"Arosa");
CALL SP_AgregarModelo(66,813,"Leon");
CALL SP_AgregarModelo(66,814,"Altea");
CALL SP_AgregarModelo(66,815,"Altea Xl");
CALL SP_AgregarModelo(66,816,"Altea Freetrack");
CALL SP_AgregarModelo(66,817,"Terra");
CALL SP_AgregarModelo(66,818,"Inca");
CALL SP_AgregarModelo(66,819,"Malaga");
CALL SP_AgregarModelo(66,820,"Ronda");
CALL SP_AgregarModelo(66,821,"Exeo");
CALL SP_AgregarModelo(66,822,"Mii");
CALL SP_AgregarModelo(67,823,"Felicia");
CALL SP_AgregarModelo(67,824,"Forman");
CALL SP_AgregarModelo(67,825,"Octavia");
CALL SP_AgregarModelo(67,826,"Octavia Tour");
CALL SP_AgregarModelo(67,827,"Fabia");
CALL SP_AgregarModelo(67,828,"Superb");
CALL SP_AgregarModelo(67,829,"Roomster");
CALL SP_AgregarModelo(67,830,"Scout");
CALL SP_AgregarModelo(67,831,"Pickup");
CALL SP_AgregarModelo(67,832,"Favorit");
CALL SP_AgregarModelo(67,833,"130");
CALL SP_AgregarModelo(67,834,"S");
CALL SP_AgregarModelo(67,835,"Yeti");
CALL SP_AgregarModelo(67,836,"Citigo");
CALL SP_AgregarModelo(67,837,"Rapid");
CALL SP_AgregarModelo(68,838,"Smart");
CALL SP_AgregarModelo(68,839,"Citycoupe");
CALL SP_AgregarModelo(68,840,"Fortwo");
CALL SP_AgregarModelo(68,841,"Cabrio");
CALL SP_AgregarModelo(68,842,"Crossblade");
CALL SP_AgregarModelo(68,843,"Roadster");
CALL SP_AgregarModelo(68,844,"Forfour");
CALL SP_AgregarModelo(69,845,"Korando");
CALL SP_AgregarModelo(69,846,"Family");
CALL SP_AgregarModelo(69,847,"K4d");
CALL SP_AgregarModelo(69,848,"Musso");
CALL SP_AgregarModelo(69,849,"Korando Kj");
CALL SP_AgregarModelo(69,850,"Rexton");
CALL SP_AgregarModelo(69,851,"Rexton Ii");
CALL SP_AgregarModelo(69,852,"Rodius");
CALL SP_AgregarModelo(69,853,"Kyron");
CALL SP_AgregarModelo(69,854,"Actyon");
CALL SP_AgregarModelo(69,855,"Sports Pick Up");
CALL SP_AgregarModelo(69,856,"Actyon Sports Pick Up");
CALL SP_AgregarModelo(69,857,"Kodando");
CALL SP_AgregarModelo(70,858,"Legacy");
CALL SP_AgregarModelo(70,859,"Impreza");
CALL SP_AgregarModelo(70,860,"Svx");
CALL SP_AgregarModelo(70,861,"Justy");
CALL SP_AgregarModelo(70,862,"Outback");
CALL SP_AgregarModelo(70,863,"Forester");
CALL SP_AgregarModelo(70,864,"G3x Justy");
CALL SP_AgregarModelo(70,865,"B9 Tribeca");
CALL SP_AgregarModelo(70,866,"Xt");
CALL SP_AgregarModelo(70,867,"1800");
CALL SP_AgregarModelo(70,868,"Tribeca");
CALL SP_AgregarModelo(70,869,"Wrx Sti");
CALL SP_AgregarModelo(70,870,"Trezia");
CALL SP_AgregarModelo(70,871,"Xv");
CALL SP_AgregarModelo(70,872,"Brz");
CALL SP_AgregarModelo(71,873,"Maruti");
CALL SP_AgregarModelo(71,874,"Swift");
CALL SP_AgregarModelo(71,875,"Vitara");
CALL SP_AgregarModelo(71,876,"Baleno");
CALL SP_AgregarModelo(71,877,"Samurai");
CALL SP_AgregarModelo(71,878,"Alto");
CALL SP_AgregarModelo(71,879,"Wagon R");
CALL SP_AgregarModelo(71,880,"Jimny");
CALL SP_AgregarModelo(71,881,"Grand Vitara");
CALL SP_AgregarModelo(71,882,"Ignis");
CALL SP_AgregarModelo(71,883,"Liana");
CALL SP_AgregarModelo(71,884,"Grand Vitara Xl7");
CALL SP_AgregarModelo(71,885,"Sx4");
CALL SP_AgregarModelo(71,886,"Splash");
CALL SP_AgregarModelo(71,887,"Kizashi");
CALL SP_AgregarModelo(72,888,"Samba");
CALL SP_AgregarModelo(72,889,"Tagora");
CALL SP_AgregarModelo(72,890,"Solara");
CALL SP_AgregarModelo(72,891,"Horizon");
CALL SP_AgregarModelo(73,892,"Telcosport");
CALL SP_AgregarModelo(73,893,"Telco");
CALL SP_AgregarModelo(73,894,"Sumo");
CALL SP_AgregarModelo(73,895,"Safari");
CALL SP_AgregarModelo(73,896,"Indica");
CALL SP_AgregarModelo(73,897,"Indigo");
CALL SP_AgregarModelo(73,898,"Grand Safari");
CALL SP_AgregarModelo(73,899,"Tl Pick Up");
CALL SP_AgregarModelo(73,900,"Xenon Pick Up");
CALL SP_AgregarModelo(73,901,"Vista");
CALL SP_AgregarModelo(73,902,"Xenon");
CALL SP_AgregarModelo(73,903,"Aria");
CALL SP_AgregarModelo(74,904,"Carina E");
CALL SP_AgregarModelo(74,905,"4runner");
CALL SP_AgregarModelo(74,906,"Camry");
CALL SP_AgregarModelo(74,907,"Rav4");
CALL SP_AgregarModelo(74,908,"Celica");
CALL SP_AgregarModelo(74,909,"Supra");
CALL SP_AgregarModelo(74,910,"Paseo");
CALL SP_AgregarModelo(74,911,"Land Cruiser 80");
CALL SP_AgregarModelo(74,912,"Land Cruiser 100");
CALL SP_AgregarModelo(74,913,"Land Cruiser");
CALL SP_AgregarModelo(74,914,"Land Cruiser 90");
CALL SP_AgregarModelo(74,915,"Corolla");
CALL SP_AgregarModelo(74,916,"Auris");
CALL SP_AgregarModelo(74,917,"Avensis");
CALL SP_AgregarModelo(74,918,"Picnic");
CALL SP_AgregarModelo(74,919,"Yaris");
CALL SP_AgregarModelo(74,920,"Yaris Verso");
CALL SP_AgregarModelo(74,921,"Mr2");
CALL SP_AgregarModelo(74,922,"Previa");
CALL SP_AgregarModelo(74,923,"Prius");
CALL SP_AgregarModelo(74,924,"Avensis Verso");
CALL SP_AgregarModelo(74,925,"Corolla Verso");
CALL SP_AgregarModelo(74,926,"Corolla Sedan");
CALL SP_AgregarModelo(74,927,"Aygo");
CALL SP_AgregarModelo(74,928,"Hilux");
CALL SP_AgregarModelo(74,929,"Dyna");
CALL SP_AgregarModelo(74,930,"Land Cruiser 200");
CALL SP_AgregarModelo(74,931,"Verso");
CALL SP_AgregarModelo(74,932,"Iq");
CALL SP_AgregarModelo(74,933,"Urban Cruiser");
CALL SP_AgregarModelo(74,934,"Gt86");
CALL SP_AgregarModelo(75,935,"100");
CALL SP_AgregarModelo(75,936,"121");
CALL SP_AgregarModelo(76,937,"214");
CALL SP_AgregarModelo(76,938,"110 Stawra");
CALL SP_AgregarModelo(76,939,"111 Stawra");
CALL SP_AgregarModelo(76,940,"215");
CALL SP_AgregarModelo(76,941,"112 Stawra");
CALL SP_AgregarModelo(77,942,"Passat");
CALL SP_AgregarModelo(77,943,"Golf");
CALL SP_AgregarModelo(77,944,"Vento");
CALL SP_AgregarModelo(77,945,"Polo");
CALL SP_AgregarModelo(77,946,"Corrado");
CALL SP_AgregarModelo(77,947,"Sharan");
CALL SP_AgregarModelo(77,948,"Lupo");
CALL SP_AgregarModelo(77,949,"Bora");
CALL SP_AgregarModelo(77,950,"Jetta");
CALL SP_AgregarModelo(77,951,"New Beetle");
CALL SP_AgregarModelo(77,952,"Phaeton");
CALL SP_AgregarModelo(77,953,"Touareg");
CALL SP_AgregarModelo(77,954,"Touran");
CALL SP_AgregarModelo(77,955,"Multivan");
CALL SP_AgregarModelo(77,956,"Caddy");
CALL SP_AgregarModelo(77,957,"Golf Plus");
CALL SP_AgregarModelo(77,958,"Fox");
CALL SP_AgregarModelo(77,959,"Eos");
CALL SP_AgregarModelo(77,960,"Caravelle");
CALL SP_AgregarModelo(77,961,"Tiguan");
CALL SP_AgregarModelo(77,962,"Transporter");
CALL SP_AgregarModelo(77,963,"Lt");
CALL SP_AgregarModelo(77,964,"Taro");
CALL SP_AgregarModelo(77,965,"Crafter");
CALL SP_AgregarModelo(77,966,"California");
CALL SP_AgregarModelo(77,967,"Santana");
CALL SP_AgregarModelo(77,968,"Scirocco");
CALL SP_AgregarModelo(77,969,"Passat Cc");
CALL SP_AgregarModelo(77,970,"Amarok");
CALL SP_AgregarModelo(77,971,"Beetle");
CALL SP_AgregarModelo(77,972,"Up");
CALL SP_AgregarModelo(77,973,"Cc");
CALL SP_AgregarModelo(78,974,"440");
CALL SP_AgregarModelo(78,975,"850");
CALL SP_AgregarModelo(78,976,"S70");
CALL SP_AgregarModelo(78,977,"V70");
CALL SP_AgregarModelo(78,978,"V70 Classic");
CALL SP_AgregarModelo(78,979,"940");
CALL SP_AgregarModelo(78,980,"480");
CALL SP_AgregarModelo(78,981,"460");
CALL SP_AgregarModelo(78,982,"960");
CALL SP_AgregarModelo(78,983,"S90");
CALL SP_AgregarModelo(78,984,"V90");
CALL SP_AgregarModelo(78,985,"Classic");
CALL SP_AgregarModelo(78,986,"S40");
CALL SP_AgregarModelo(78,987,"V40");
CALL SP_AgregarModelo(78,988,"V50");
CALL SP_AgregarModelo(78,989,"V70 Xc");
CALL SP_AgregarModelo(78,990,"Xc70");
CALL SP_AgregarModelo(78,991,"C70");
CALL SP_AgregarModelo(78,992,"S80");
CALL SP_AgregarModelo(78,993,"S60");
CALL SP_AgregarModelo(78,994,"Xc90");
CALL SP_AgregarModelo(78,995,"C30");
CALL SP_AgregarModelo(78,996,"780");
CALL SP_AgregarModelo(78,997,"760");
CALL SP_AgregarModelo(78,998,"740");
CALL SP_AgregarModelo(78,999,"240");
CALL SP_AgregarModelo(78,1000,"360");
CALL SP_AgregarModelo(78,1001,"340");
CALL SP_AgregarModelo(78,1002,"Xc60");
CALL SP_AgregarModelo(78,1003,"V60");
CALL SP_AgregarModelo(78,1004,"V40 Cross Country");
CALL SP_AgregarModelo(79,1005,"353");
CALL SP_AgregarModelo(53,1006,"Mini");
CALL SP_AgregarModelo(53,1007,"Countryman");
CALL SP_AgregarModelo(53,1008,"Paceman");

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
