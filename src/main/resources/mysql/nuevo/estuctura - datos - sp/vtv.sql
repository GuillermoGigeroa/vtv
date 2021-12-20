/*
 Navicat Premium Data Transfer

 Source Server         : MySQL80
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : vtv

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 20/12/2021 18:03:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for estados
-- ----------------------------
DROP TABLE IF EXISTS `estados`;
CREATE TABLE `estados`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of estados
-- ----------------------------
INSERT INTO `estados` VALUES (1, 'Apto');
INSERT INTO `estados` VALUES (2, 'Condicional');
INSERT INTO `estados` VALUES (3, 'Rechazado');

-- ----------------------------
-- Table structure for inspecciones
-- ----------------------------
DROP TABLE IF EXISTS `inspecciones`;
CREATE TABLE `inspecciones`  (
  `Numero` int(0) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LegajoInspector` bigint(0) NOT NULL,
  `Estado` int(0) NOT NULL,
  `FechaVencimiento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Numero`) USING BTREE,
  INDEX `fk_Inspecciones_Inspectores_1`(`LegajoInspector`) USING BTREE,
  INDEX `fk_Inspecciones_Estados_1`(`Estado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inspecciones
-- ----------------------------
INSERT INTO `inspecciones` VALUES (1, '2021-11-14', 1006, 2, '2022-11-14');
INSERT INTO `inspecciones` VALUES (2, '2020-05-21', 1009, 1, '2021-05-21');
INSERT INTO `inspecciones` VALUES (3, '2021-07-25', 1003, 3, '2022-07-25');
INSERT INTO `inspecciones` VALUES (4, '2020-02-04', 1001, 2, '2021-02-04');
INSERT INTO `inspecciones` VALUES (5, '2020-06-18', 1006, 1, '2021-06-18');
INSERT INTO `inspecciones` VALUES (6, '2018-03-02', 1002, 3, '2019-03-02');
INSERT INTO `inspecciones` VALUES (7, '2020-09-15', 1010, 2, '2021-09-15');
INSERT INTO `inspecciones` VALUES (8, '2021-06-24', 1001, 1, '2022-06-24');
INSERT INTO `inspecciones` VALUES (9, '2020-08-22', 1007, 3, '2021-08-22');
INSERT INTO `inspecciones` VALUES (10, '2020-08-22', 1009, 2, '2021-08-22');
INSERT INTO `inspecciones` VALUES (11, '2021-11-13', 1006, 2, '2022-11-13');
INSERT INTO `inspecciones` VALUES (12, '2021-11-12', 1009, 1, '2022-11-12');
INSERT INTO `inspecciones` VALUES (13, '2021-11-12', 1003, 3, '2022-11-12');
INSERT INTO `inspecciones` VALUES (14, '2021-11-12', 1001, 2, '2022-11-12');
INSERT INTO `inspecciones` VALUES (15, '2021-11-09', 1006, 1, '2022-11-09');
INSERT INTO `inspecciones` VALUES (16, '2021-11-09', 1002, 3, '2022-11-09');
INSERT INTO `inspecciones` VALUES (17, '2021-10-15', 1010, 2, '2022-10-15');
INSERT INTO `inspecciones` VALUES (18, '2021-08-24', 1001, 1, '2022-08-24');
INSERT INTO `inspecciones` VALUES (19, '2021-07-08', 1007, 3, '2022-07-08');
INSERT INTO `inspecciones` VALUES (20, '2021-05-22', 1009, 2, '2022-05-22');

-- ----------------------------
-- Table structure for inspecciones_x_vehiculo
-- ----------------------------
DROP TABLE IF EXISTS `inspecciones_x_vehiculo`;
CREATE TABLE `inspecciones_x_vehiculo`  (
  `ID_Inspeccion` int(0) NOT NULL,
  `ID_Vehiculo` int(0) NOT NULL,
  PRIMARY KEY (`ID_Inspeccion`, `ID_Vehiculo`) USING BTREE,
  INDEX `fk_Inspecciones_x_Vehiculo_Vehiculos_1`(`ID_Vehiculo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inspecciones_x_vehiculo
-- ----------------------------
INSERT INTO `inspecciones_x_vehiculo` VALUES (5, 1);
INSERT INTO `inspecciones_x_vehiculo` VALUES (15, 1);
INSERT INTO `inspecciones_x_vehiculo` VALUES (3, 2);
INSERT INTO `inspecciones_x_vehiculo` VALUES (7, 2);
INSERT INTO `inspecciones_x_vehiculo` VALUES (13, 2);
INSERT INTO `inspecciones_x_vehiculo` VALUES (17, 2);
INSERT INTO `inspecciones_x_vehiculo` VALUES (1, 3);
INSERT INTO `inspecciones_x_vehiculo` VALUES (11, 3);
INSERT INTO `inspecciones_x_vehiculo` VALUES (2, 5);
INSERT INTO `inspecciones_x_vehiculo` VALUES (4, 5);
INSERT INTO `inspecciones_x_vehiculo` VALUES (9, 5);
INSERT INTO `inspecciones_x_vehiculo` VALUES (12, 5);
INSERT INTO `inspecciones_x_vehiculo` VALUES (14, 5);
INSERT INTO `inspecciones_x_vehiculo` VALUES (19, 5);
INSERT INTO `inspecciones_x_vehiculo` VALUES (6, 6);
INSERT INTO `inspecciones_x_vehiculo` VALUES (16, 6);
INSERT INTO `inspecciones_x_vehiculo` VALUES (10, 8);
INSERT INTO `inspecciones_x_vehiculo` VALUES (20, 8);
INSERT INTO `inspecciones_x_vehiculo` VALUES (8, 9);
INSERT INTO `inspecciones_x_vehiculo` VALUES (18, 9);

-- ----------------------------
-- Table structure for inspectores
-- ----------------------------
DROP TABLE IF EXISTS `inspectores`;
CREATE TABLE `inspectores`  (
  `DNI` bigint(0) NOT NULL,
  `Legajo` bigint(0) NOT NULL,
  `Nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Apellido` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Legajo`, `DNI`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inspectores
-- ----------------------------
INSERT INTO `inspectores` VALUES (11111111, 1001, 'Mario', 'Allende');
INSERT INTO `inspectores` VALUES (22222222, 1002, 'Roberto', 'Gomez');
INSERT INTO `inspectores` VALUES (33333333, 1003, 'Mariana', 'Perez');
INSERT INTO `inspectores` VALUES (39112399, 1004, 'Guillermo', 'Gigeroa');
INSERT INTO `inspectores` VALUES (44444444, 1005, 'Gianluca', 'Salvador');
INSERT INTO `inspectores` VALUES (55555555, 1006, 'Santiago', 'Martinez');
INSERT INTO `inspectores` VALUES (66666666, 1007, 'Maximiliano', 'Fernandez');
INSERT INTO `inspectores` VALUES (77777777, 1008, 'Lucas', 'Lopez');
INSERT INTO `inspectores` VALUES (88888888, 1009, 'Damian', 'Basualdo');
INSERT INTO `inspectores` VALUES (99999999, 1010, 'Nicolas', 'Vega');

-- ----------------------------
-- Table structure for marcas
-- ----------------------------
DROP TABLE IF EXISTS `marcas`;
CREATE TABLE `marcas`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of marcas
-- ----------------------------
INSERT INTO `marcas` VALUES (1, 'Abarth');
INSERT INTO `marcas` VALUES (2, 'Alfa-Romeo');
INSERT INTO `marcas` VALUES (3, 'Aro');
INSERT INTO `marcas` VALUES (4, 'Asia');
INSERT INTO `marcas` VALUES (5, 'Asia-Motors');
INSERT INTO `marcas` VALUES (6, 'Aston-Martin');
INSERT INTO `marcas` VALUES (7, 'Audi');
INSERT INTO `marcas` VALUES (8, 'Austin');
INSERT INTO `marcas` VALUES (9, 'Auverland');
INSERT INTO `marcas` VALUES (10, 'Bentley');
INSERT INTO `marcas` VALUES (11, 'Bertone');
INSERT INTO `marcas` VALUES (12, 'Bmw');
INSERT INTO `marcas` VALUES (13, 'Cadillac');
INSERT INTO `marcas` VALUES (14, 'Chevrolet');
INSERT INTO `marcas` VALUES (15, 'Chrysler');
INSERT INTO `marcas` VALUES (16, 'Citroen');
INSERT INTO `marcas` VALUES (17, 'Corvette');
INSERT INTO `marcas` VALUES (18, 'Dacia');
INSERT INTO `marcas` VALUES (19, 'Daewoo');
INSERT INTO `marcas` VALUES (20, 'Daf');
INSERT INTO `marcas` VALUES (21, 'Daihatsu');
INSERT INTO `marcas` VALUES (22, 'Daimler');
INSERT INTO `marcas` VALUES (23, 'Dodge');
INSERT INTO `marcas` VALUES (24, 'Ferrari');
INSERT INTO `marcas` VALUES (25, 'Fiat');
INSERT INTO `marcas` VALUES (26, 'Ford');
INSERT INTO `marcas` VALUES (27, 'Galloper');
INSERT INTO `marcas` VALUES (28, 'Gmc');
INSERT INTO `marcas` VALUES (29, 'Honda');
INSERT INTO `marcas` VALUES (30, 'Hummer');
INSERT INTO `marcas` VALUES (31, 'Hyundai');
INSERT INTO `marcas` VALUES (32, 'Infiniti');
INSERT INTO `marcas` VALUES (33, 'Innocenti');
INSERT INTO `marcas` VALUES (34, 'Isuzu');
INSERT INTO `marcas` VALUES (35, 'Iveco');
INSERT INTO `marcas` VALUES (36, 'Iveco-Pegaso');
INSERT INTO `marcas` VALUES (37, 'Jaguar');
INSERT INTO `marcas` VALUES (38, 'Jeep');
INSERT INTO `marcas` VALUES (39, 'Kia');
INSERT INTO `marcas` VALUES (40, 'Lada');
INSERT INTO `marcas` VALUES (41, 'Lamborghini');
INSERT INTO `marcas` VALUES (42, 'Lancia');
INSERT INTO `marcas` VALUES (43, 'Land Rover');
INSERT INTO `marcas` VALUES (44, 'Ldv');
INSERT INTO `marcas` VALUES (45, 'Lexus');
INSERT INTO `marcas` VALUES (46, 'Lotus');
INSERT INTO `marcas` VALUES (47, 'Mahindra');
INSERT INTO `marcas` VALUES (48, 'Maserati');
INSERT INTO `marcas` VALUES (49, 'Maybach');
INSERT INTO `marcas` VALUES (50, 'Mazda');
INSERT INTO `marcas` VALUES (51, 'Mercedes-Benz');
INSERT INTO `marcas` VALUES (52, 'Mg');
INSERT INTO `marcas` VALUES (53, 'Mini');
INSERT INTO `marcas` VALUES (54, 'Mitsubishi');
INSERT INTO `marcas` VALUES (55, 'Morgan');
INSERT INTO `marcas` VALUES (56, 'Nissan');
INSERT INTO `marcas` VALUES (57, 'Opel');
INSERT INTO `marcas` VALUES (58, 'Peugeot');
INSERT INTO `marcas` VALUES (59, 'Pontiac');
INSERT INTO `marcas` VALUES (60, 'Porsche');
INSERT INTO `marcas` VALUES (61, 'Renault');
INSERT INTO `marcas` VALUES (62, 'Rolls-Royce');
INSERT INTO `marcas` VALUES (63, 'Rover');
INSERT INTO `marcas` VALUES (64, 'Saab');
INSERT INTO `marcas` VALUES (65, 'Santana');
INSERT INTO `marcas` VALUES (66, 'Seat');
INSERT INTO `marcas` VALUES (67, 'Skoda');
INSERT INTO `marcas` VALUES (68, 'Smart');
INSERT INTO `marcas` VALUES (69, 'Ssangyong');
INSERT INTO `marcas` VALUES (70, 'Subaru');
INSERT INTO `marcas` VALUES (71, 'Suzuki');
INSERT INTO `marcas` VALUES (72, 'Talbot');
INSERT INTO `marcas` VALUES (73, 'Tata');
INSERT INTO `marcas` VALUES (74, 'Toyota');
INSERT INTO `marcas` VALUES (75, 'Umm');
INSERT INTO `marcas` VALUES (76, 'Vaz');
INSERT INTO `marcas` VALUES (77, 'Volkswagen');
INSERT INTO `marcas` VALUES (78, 'Volvo');
INSERT INTO `marcas` VALUES (79, 'Wartburg');

-- ----------------------------
-- Table structure for modelos
-- ----------------------------
DROP TABLE IF EXISTS `modelos`;
CREATE TABLE `modelos`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1008 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of modelos
-- ----------------------------
INSERT INTO `modelos` VALUES (1, '500');
INSERT INTO `modelos` VALUES (2, 'Grande Punto');
INSERT INTO `modelos` VALUES (3, 'Punto Evo');
INSERT INTO `modelos` VALUES (4, '500c');
INSERT INTO `modelos` VALUES (5, '695');
INSERT INTO `modelos` VALUES (6, 'Punto');
INSERT INTO `modelos` VALUES (7, '155');
INSERT INTO `modelos` VALUES (8, '156');
INSERT INTO `modelos` VALUES (9, '159');
INSERT INTO `modelos` VALUES (10, '164');
INSERT INTO `modelos` VALUES (11, '145');
INSERT INTO `modelos` VALUES (12, '147');
INSERT INTO `modelos` VALUES (13, '146');
INSERT INTO `modelos` VALUES (14, 'Gtv');
INSERT INTO `modelos` VALUES (15, 'Spider');
INSERT INTO `modelos` VALUES (16, '166');
INSERT INTO `modelos` VALUES (17, 'Gt');
INSERT INTO `modelos` VALUES (18, 'Crosswagon');
INSERT INTO `modelos` VALUES (19, 'Brera');
INSERT INTO `modelos` VALUES (20, '90');
INSERT INTO `modelos` VALUES (21, '75');
INSERT INTO `modelos` VALUES (22, '33');
INSERT INTO `modelos` VALUES (23, 'Giulietta');
INSERT INTO `modelos` VALUES (24, 'Sprint');
INSERT INTO `modelos` VALUES (25, 'Mito');
INSERT INTO `modelos` VALUES (26, 'Expander');
INSERT INTO `modelos` VALUES (27, '10');
INSERT INTO `modelos` VALUES (28, '24');
INSERT INTO `modelos` VALUES (29, 'Dacia');
INSERT INTO `modelos` VALUES (30, 'Rocsta');
INSERT INTO `modelos` VALUES (31, 'Rocsta');
INSERT INTO `modelos` VALUES (32, 'Db7');
INSERT INTO `modelos` VALUES (33, 'V8');
INSERT INTO `modelos` VALUES (34, 'Db9');
INSERT INTO `modelos` VALUES (35, 'Vanquish');
INSERT INTO `modelos` VALUES (36, 'V8 Vantage');
INSERT INTO `modelos` VALUES (37, 'Vantage');
INSERT INTO `modelos` VALUES (38, 'Dbs');
INSERT INTO `modelos` VALUES (39, 'Volante');
INSERT INTO `modelos` VALUES (40, 'Virage');
INSERT INTO `modelos` VALUES (41, 'Vantage V8');
INSERT INTO `modelos` VALUES (42, 'Vantage V12');
INSERT INTO `modelos` VALUES (43, 'Rapide');
INSERT INTO `modelos` VALUES (44, 'Cygnet');
INSERT INTO `modelos` VALUES (45, '80');
INSERT INTO `modelos` VALUES (46, 'A4');
INSERT INTO `modelos` VALUES (47, 'A6');
INSERT INTO `modelos` VALUES (48, 'S6');
INSERT INTO `modelos` VALUES (49, 'Coupe');
INSERT INTO `modelos` VALUES (50, 'S2');
INSERT INTO `modelos` VALUES (51, 'Rs2');
INSERT INTO `modelos` VALUES (52, 'A8');
INSERT INTO `modelos` VALUES (53, 'Cabriolet');
INSERT INTO `modelos` VALUES (54, 'S8');
INSERT INTO `modelos` VALUES (55, 'A3');
INSERT INTO `modelos` VALUES (56, 'S4');
INSERT INTO `modelos` VALUES (57, 'Tt');
INSERT INTO `modelos` VALUES (58, 'S3');
INSERT INTO `modelos` VALUES (59, 'Allroad Quattro');
INSERT INTO `modelos` VALUES (60, 'Rs4');
INSERT INTO `modelos` VALUES (61, 'A2');
INSERT INTO `modelos` VALUES (62, 'Rs6');
INSERT INTO `modelos` VALUES (63, 'Q7');
INSERT INTO `modelos` VALUES (64, 'R8');
INSERT INTO `modelos` VALUES (65, 'A5');
INSERT INTO `modelos` VALUES (66, 'S5');
INSERT INTO `modelos` VALUES (67, 'V8');
INSERT INTO `modelos` VALUES (68, '200');
INSERT INTO `modelos` VALUES (69, '100');
INSERT INTO `modelos` VALUES (70, '90');
INSERT INTO `modelos` VALUES (71, 'Tts');
INSERT INTO `modelos` VALUES (72, 'Q5');
INSERT INTO `modelos` VALUES (73, 'A4 Allroad Quattro');
INSERT INTO `modelos` VALUES (74, 'Tt Rs');
INSERT INTO `modelos` VALUES (75, 'Rs5');
INSERT INTO `modelos` VALUES (76, 'A1');
INSERT INTO `modelos` VALUES (77, 'A7');
INSERT INTO `modelos` VALUES (78, 'Rs3');
INSERT INTO `modelos` VALUES (79, 'Q3');
INSERT INTO `modelos` VALUES (80, 'A6 Allroad Quattro');
INSERT INTO `modelos` VALUES (81, 'S7');
INSERT INTO `modelos` VALUES (82, 'Sq5');
INSERT INTO `modelos` VALUES (83, 'Mini');
INSERT INTO `modelos` VALUES (84, 'Montego');
INSERT INTO `modelos` VALUES (85, 'Maestro');
INSERT INTO `modelos` VALUES (86, 'Metro');
INSERT INTO `modelos` VALUES (87, 'Mini Moke');
INSERT INTO `modelos` VALUES (88, 'Diesel');
INSERT INTO `modelos` VALUES (89, 'Brooklands');
INSERT INTO `modelos` VALUES (90, 'Turbo');
INSERT INTO `modelos` VALUES (91, 'Continental');
INSERT INTO `modelos` VALUES (92, 'Azure');
INSERT INTO `modelos` VALUES (93, 'Arnage');
INSERT INTO `modelos` VALUES (94, 'Continental Gt');
INSERT INTO `modelos` VALUES (95, 'Continental Flying Spur');
INSERT INTO `modelos` VALUES (96, 'Turbo R');
INSERT INTO `modelos` VALUES (97, 'Mulsanne');
INSERT INTO `modelos` VALUES (98, 'Eight');
INSERT INTO `modelos` VALUES (99, 'Continental Gtc');
INSERT INTO `modelos` VALUES (100, 'Continental Supersports');
INSERT INTO `modelos` VALUES (101, 'Freeclimber Diesel');
INSERT INTO `modelos` VALUES (102, 'Serie 3');
INSERT INTO `modelos` VALUES (103, 'Serie 5');
INSERT INTO `modelos` VALUES (104, 'Compact');
INSERT INTO `modelos` VALUES (105, 'Serie 7');
INSERT INTO `modelos` VALUES (106, 'Serie 8');
INSERT INTO `modelos` VALUES (107, 'Z3');
INSERT INTO `modelos` VALUES (108, 'Z4');
INSERT INTO `modelos` VALUES (109, 'Z8');
INSERT INTO `modelos` VALUES (110, 'X5');
INSERT INTO `modelos` VALUES (111, 'Serie 6');
INSERT INTO `modelos` VALUES (112, 'X3');
INSERT INTO `modelos` VALUES (113, 'Serie 1');
INSERT INTO `modelos` VALUES (114, 'Z1');
INSERT INTO `modelos` VALUES (115, 'X6');
INSERT INTO `modelos` VALUES (116, 'X1');
INSERT INTO `modelos` VALUES (117, 'Seville');
INSERT INTO `modelos` VALUES (118, 'Sts');
INSERT INTO `modelos` VALUES (119, 'El Dorado');
INSERT INTO `modelos` VALUES (120, 'Cts');
INSERT INTO `modelos` VALUES (121, 'Xlr');
INSERT INTO `modelos` VALUES (122, 'Srx');
INSERT INTO `modelos` VALUES (123, 'Escalade');
INSERT INTO `modelos` VALUES (124, 'Bls');
INSERT INTO `modelos` VALUES (125, 'Corvette');
INSERT INTO `modelos` VALUES (126, 'Blazer');
INSERT INTO `modelos` VALUES (127, 'Astro');
INSERT INTO `modelos` VALUES (128, 'Nubira');
INSERT INTO `modelos` VALUES (129, 'Evanda');
INSERT INTO `modelos` VALUES (130, 'Trans Sport');
INSERT INTO `modelos` VALUES (131, 'Camaro');
INSERT INTO `modelos` VALUES (132, 'Matiz');
INSERT INTO `modelos` VALUES (133, 'Alero');
INSERT INTO `modelos` VALUES (134, 'Tahoe');
INSERT INTO `modelos` VALUES (135, 'Tacuma');
INSERT INTO `modelos` VALUES (136, 'Trailblazer');
INSERT INTO `modelos` VALUES (137, 'Kalos');
INSERT INTO `modelos` VALUES (138, 'Aveo');
INSERT INTO `modelos` VALUES (139, 'Lacetti');
INSERT INTO `modelos` VALUES (140, 'Epica');
INSERT INTO `modelos` VALUES (141, 'Captiva');
INSERT INTO `modelos` VALUES (142, 'Hhr');
INSERT INTO `modelos` VALUES (143, 'Cruze');
INSERT INTO `modelos` VALUES (144, 'Spark');
INSERT INTO `modelos` VALUES (145, 'Orlando');
INSERT INTO `modelos` VALUES (146, 'Volt');
INSERT INTO `modelos` VALUES (147, 'Malibu');
INSERT INTO `modelos` VALUES (148, 'Vision');
INSERT INTO `modelos` VALUES (149, '300m');
INSERT INTO `modelos` VALUES (150, 'Grand Voyager');
INSERT INTO `modelos` VALUES (151, 'Viper');
INSERT INTO `modelos` VALUES (152, 'Neon');
INSERT INTO `modelos` VALUES (153, 'Voyager');
INSERT INTO `modelos` VALUES (154, 'Stratus');
INSERT INTO `modelos` VALUES (155, 'Sebring');
INSERT INTO `modelos` VALUES (156, 'Sebring 200c');
INSERT INTO `modelos` VALUES (157, 'New Yorker');
INSERT INTO `modelos` VALUES (158, 'Pt Cruiser');
INSERT INTO `modelos` VALUES (159, 'Crossfire');
INSERT INTO `modelos` VALUES (160, '300c');
INSERT INTO `modelos` VALUES (161, 'Le Baron');
INSERT INTO `modelos` VALUES (162, 'Saratoga');
INSERT INTO `modelos` VALUES (163, 'Xantia');
INSERT INTO `modelos` VALUES (164, 'Xm');
INSERT INTO `modelos` VALUES (165, 'Ax');
INSERT INTO `modelos` VALUES (166, 'Zx');
INSERT INTO `modelos` VALUES (167, 'Evasion');
INSERT INTO `modelos` VALUES (168, 'C8');
INSERT INTO `modelos` VALUES (169, 'Saxo');
INSERT INTO `modelos` VALUES (170, 'C2');
INSERT INTO `modelos` VALUES (171, 'Xsara');
INSERT INTO `modelos` VALUES (172, 'C4');
INSERT INTO `modelos` VALUES (173, 'Xsara Picasso');
INSERT INTO `modelos` VALUES (174, 'C5');
INSERT INTO `modelos` VALUES (175, 'C3');
INSERT INTO `modelos` VALUES (176, 'C3 Pluriel');
INSERT INTO `modelos` VALUES (177, 'C1');
INSERT INTO `modelos` VALUES (178, 'C6');
INSERT INTO `modelos` VALUES (179, 'Grand C4 Picasso');
INSERT INTO `modelos` VALUES (180, 'C4 Picasso');
INSERT INTO `modelos` VALUES (181, 'Ccrosser');
INSERT INTO `modelos` VALUES (182, 'C15');
INSERT INTO `modelos` VALUES (183, 'Jumper');
INSERT INTO `modelos` VALUES (184, 'Jumpy');
INSERT INTO `modelos` VALUES (185, 'Berlingo');
INSERT INTO `modelos` VALUES (186, 'Bx');
INSERT INTO `modelos` VALUES (187, 'C25');
INSERT INTO `modelos` VALUES (188, 'Cx');
INSERT INTO `modelos` VALUES (189, 'Gsa');
INSERT INTO `modelos` VALUES (190, 'Visa');
INSERT INTO `modelos` VALUES (191, 'Lna');
INSERT INTO `modelos` VALUES (192, '2cv');
INSERT INTO `modelos` VALUES (193, 'Nemo');
INSERT INTO `modelos` VALUES (194, 'C4 Sedan');
INSERT INTO `modelos` VALUES (195, 'Berlingo First');
INSERT INTO `modelos` VALUES (196, 'C3 Picasso');
INSERT INTO `modelos` VALUES (197, 'Ds3');
INSERT INTO `modelos` VALUES (198, 'Czero');
INSERT INTO `modelos` VALUES (199, 'Ds4');
INSERT INTO `modelos` VALUES (200, 'Ds5');
INSERT INTO `modelos` VALUES (201, 'C4 Aircross');
INSERT INTO `modelos` VALUES (202, 'Celysee');
INSERT INTO `modelos` VALUES (203, 'Corvette');
INSERT INTO `modelos` VALUES (204, 'Contac');
INSERT INTO `modelos` VALUES (205, 'Logan');
INSERT INTO `modelos` VALUES (206, 'Sandero');
INSERT INTO `modelos` VALUES (207, 'Duster');
INSERT INTO `modelos` VALUES (208, 'Lodgy');
INSERT INTO `modelos` VALUES (209, 'Nexia');
INSERT INTO `modelos` VALUES (210, 'Aranos');
INSERT INTO `modelos` VALUES (211, 'Lanos');
INSERT INTO `modelos` VALUES (212, 'Nubira');
INSERT INTO `modelos` VALUES (213, 'Compact');
INSERT INTO `modelos` VALUES (214, 'Nubira Compact');
INSERT INTO `modelos` VALUES (215, 'Leganza');
INSERT INTO `modelos` VALUES (216, 'Evanda');
INSERT INTO `modelos` VALUES (217, 'Matiz');
INSERT INTO `modelos` VALUES (218, 'Tacuma');
INSERT INTO `modelos` VALUES (219, 'Kalos');
INSERT INTO `modelos` VALUES (220, 'Lacetti');
INSERT INTO `modelos` VALUES (221, 'Applause');
INSERT INTO `modelos` VALUES (222, 'Charade');
INSERT INTO `modelos` VALUES (223, 'Rocky');
INSERT INTO `modelos` VALUES (224, 'Feroza');
INSERT INTO `modelos` VALUES (225, 'Terios');
INSERT INTO `modelos` VALUES (226, 'Sirion');
INSERT INTO `modelos` VALUES (227, 'Serie Xj');
INSERT INTO `modelos` VALUES (228, 'Xj');
INSERT INTO `modelos` VALUES (229, 'Double Six');
INSERT INTO `modelos` VALUES (230, 'Six');
INSERT INTO `modelos` VALUES (231, 'Series Iii');
INSERT INTO `modelos` VALUES (232, 'Viper');
INSERT INTO `modelos` VALUES (233, 'Caliber');
INSERT INTO `modelos` VALUES (234, 'Nitro');
INSERT INTO `modelos` VALUES (235, 'Avenger');
INSERT INTO `modelos` VALUES (236, 'Journey');
INSERT INTO `modelos` VALUES (237, 'F355');
INSERT INTO `modelos` VALUES (238, '360');
INSERT INTO `modelos` VALUES (239, 'F430');
INSERT INTO `modelos` VALUES (240, 'F512 M');
INSERT INTO `modelos` VALUES (241, '550 Maranello');
INSERT INTO `modelos` VALUES (242, '575m Maranello');
INSERT INTO `modelos` VALUES (243, '599');
INSERT INTO `modelos` VALUES (244, '456');
INSERT INTO `modelos` VALUES (245, '456m');
INSERT INTO `modelos` VALUES (246, '612');
INSERT INTO `modelos` VALUES (247, 'F50');
INSERT INTO `modelos` VALUES (248, 'Enzo');
INSERT INTO `modelos` VALUES (249, 'Superamerica');
INSERT INTO `modelos` VALUES (250, '430');
INSERT INTO `modelos` VALUES (251, '348');
INSERT INTO `modelos` VALUES (252, 'Testarossa');
INSERT INTO `modelos` VALUES (253, '512');
INSERT INTO `modelos` VALUES (254, '355');
INSERT INTO `modelos` VALUES (255, 'F40');
INSERT INTO `modelos` VALUES (256, '412');
INSERT INTO `modelos` VALUES (257, 'Mondial');
INSERT INTO `modelos` VALUES (258, '328');
INSERT INTO `modelos` VALUES (259, 'California');
INSERT INTO `modelos` VALUES (260, '458');
INSERT INTO `modelos` VALUES (261, 'Ff');
INSERT INTO `modelos` VALUES (262, 'Croma');
INSERT INTO `modelos` VALUES (263, 'Cinquecento');
INSERT INTO `modelos` VALUES (264, 'Seicento');
INSERT INTO `modelos` VALUES (265, 'Punto');
INSERT INTO `modelos` VALUES (266, 'Grande Punto');
INSERT INTO `modelos` VALUES (267, 'Panda');
INSERT INTO `modelos` VALUES (268, 'Tipo');
INSERT INTO `modelos` VALUES (269, 'Coupe');
INSERT INTO `modelos` VALUES (270, 'Uno');
INSERT INTO `modelos` VALUES (271, 'Ulysse');
INSERT INTO `modelos` VALUES (272, 'Tempra');
INSERT INTO `modelos` VALUES (273, 'Marea');
INSERT INTO `modelos` VALUES (274, 'Barchetta');
INSERT INTO `modelos` VALUES (275, 'Bravo');
INSERT INTO `modelos` VALUES (276, 'Stilo');
INSERT INTO `modelos` VALUES (277, 'Brava');
INSERT INTO `modelos` VALUES (278, 'Palio Weekend');
INSERT INTO `modelos` VALUES (279, '600');
INSERT INTO `modelos` VALUES (280, 'Multipla');
INSERT INTO `modelos` VALUES (281, 'Idea');
INSERT INTO `modelos` VALUES (282, 'Sedici');
INSERT INTO `modelos` VALUES (283, 'Linea');
INSERT INTO `modelos` VALUES (284, '500');
INSERT INTO `modelos` VALUES (285, 'Fiorino');
INSERT INTO `modelos` VALUES (286, 'Ducato');
INSERT INTO `modelos` VALUES (287, 'Doblo Cargo');
INSERT INTO `modelos` VALUES (288, 'Doblo');
INSERT INTO `modelos` VALUES (289, 'Strada');
INSERT INTO `modelos` VALUES (290, 'Regata');
INSERT INTO `modelos` VALUES (291, 'Talento');
INSERT INTO `modelos` VALUES (292, 'Argenta');
INSERT INTO `modelos` VALUES (293, 'Ritmo');
INSERT INTO `modelos` VALUES (294, 'Punto Classic');
INSERT INTO `modelos` VALUES (295, 'Qubo');
INSERT INTO `modelos` VALUES (296, 'Punto Evo');
INSERT INTO `modelos` VALUES (297, '500c');
INSERT INTO `modelos` VALUES (298, 'Freemont');
INSERT INTO `modelos` VALUES (299, 'Panda Classic');
INSERT INTO `modelos` VALUES (300, '500l');
INSERT INTO `modelos` VALUES (301, 'Maverick');
INSERT INTO `modelos` VALUES (302, 'Escort');
INSERT INTO `modelos` VALUES (303, 'Focus');
INSERT INTO `modelos` VALUES (304, 'Mondeo');
INSERT INTO `modelos` VALUES (305, 'Scorpio');
INSERT INTO `modelos` VALUES (306, 'Fiesta');
INSERT INTO `modelos` VALUES (307, 'Probe');
INSERT INTO `modelos` VALUES (308, 'Explorer');
INSERT INTO `modelos` VALUES (309, 'Galaxy');
INSERT INTO `modelos` VALUES (310, 'Ka');
INSERT INTO `modelos` VALUES (311, 'Puma');
INSERT INTO `modelos` VALUES (312, 'Cougar');
INSERT INTO `modelos` VALUES (313, 'Focus Cmax');
INSERT INTO `modelos` VALUES (314, 'Fusion');
INSERT INTO `modelos` VALUES (315, 'Streetka');
INSERT INTO `modelos` VALUES (316, 'Cmax');
INSERT INTO `modelos` VALUES (317, 'Smax');
INSERT INTO `modelos` VALUES (318, 'Transit');
INSERT INTO `modelos` VALUES (319, 'Courier');
INSERT INTO `modelos` VALUES (320, 'Ranger');
INSERT INTO `modelos` VALUES (321, 'Sierra');
INSERT INTO `modelos` VALUES (322, 'Orion');
INSERT INTO `modelos` VALUES (323, 'Pick Up');
INSERT INTO `modelos` VALUES (324, 'Capri');
INSERT INTO `modelos` VALUES (325, 'Granada');
INSERT INTO `modelos` VALUES (326, 'Kuga');
INSERT INTO `modelos` VALUES (327, 'Grand Cmax');
INSERT INTO `modelos` VALUES (328, 'Bmax');
INSERT INTO `modelos` VALUES (329, 'Tourneo Custom');
INSERT INTO `modelos` VALUES (330, 'Exceed');
INSERT INTO `modelos` VALUES (331, 'Santamo');
INSERT INTO `modelos` VALUES (332, 'Super Exceed');
INSERT INTO `modelos` VALUES (333, 'Accord');
INSERT INTO `modelos` VALUES (334, 'Civic');
INSERT INTO `modelos` VALUES (335, 'Crx');
INSERT INTO `modelos` VALUES (336, 'Prelude');
INSERT INTO `modelos` VALUES (337, 'Nsx');
INSERT INTO `modelos` VALUES (338, 'Legend');
INSERT INTO `modelos` VALUES (339, 'Crv');
INSERT INTO `modelos` VALUES (340, 'Hrv');
INSERT INTO `modelos` VALUES (341, 'Logo');
INSERT INTO `modelos` VALUES (342, 'S2000');
INSERT INTO `modelos` VALUES (343, 'Stream');
INSERT INTO `modelos` VALUES (344, 'Jazz');
INSERT INTO `modelos` VALUES (345, 'Frv');
INSERT INTO `modelos` VALUES (346, 'Concerto');
INSERT INTO `modelos` VALUES (347, 'Insight');
INSERT INTO `modelos` VALUES (348, 'Crz');
INSERT INTO `modelos` VALUES (349, 'H2');
INSERT INTO `modelos` VALUES (350, 'H3');
INSERT INTO `modelos` VALUES (351, 'H3t');
INSERT INTO `modelos` VALUES (352, 'Lantra');
INSERT INTO `modelos` VALUES (353, 'Sonata');
INSERT INTO `modelos` VALUES (354, 'Elantra');
INSERT INTO `modelos` VALUES (355, 'Accent');
INSERT INTO `modelos` VALUES (356, 'Scoupe');
INSERT INTO `modelos` VALUES (357, 'Coupe');
INSERT INTO `modelos` VALUES (358, 'Atos');
INSERT INTO `modelos` VALUES (359, 'H1');
INSERT INTO `modelos` VALUES (360, 'Atos Prime');
INSERT INTO `modelos` VALUES (361, 'Xg');
INSERT INTO `modelos` VALUES (362, 'Trajet');
INSERT INTO `modelos` VALUES (363, 'Santa Fe');
INSERT INTO `modelos` VALUES (364, 'Terracan');
INSERT INTO `modelos` VALUES (365, 'Matrix');
INSERT INTO `modelos` VALUES (366, 'Getz');
INSERT INTO `modelos` VALUES (367, 'Tucson');
INSERT INTO `modelos` VALUES (368, 'I30');
INSERT INTO `modelos` VALUES (369, 'Pony');
INSERT INTO `modelos` VALUES (370, 'Grandeur');
INSERT INTO `modelos` VALUES (371, 'I10');
INSERT INTO `modelos` VALUES (372, 'I800');
INSERT INTO `modelos` VALUES (373, 'Sonata Fl');
INSERT INTO `modelos` VALUES (374, 'Ix55');
INSERT INTO `modelos` VALUES (375, 'I20');
INSERT INTO `modelos` VALUES (376, 'Ix35');
INSERT INTO `modelos` VALUES (377, 'Ix20');
INSERT INTO `modelos` VALUES (378, 'Genesis');
INSERT INTO `modelos` VALUES (379, 'I40');
INSERT INTO `modelos` VALUES (380, 'Veloster');
INSERT INTO `modelos` VALUES (381, 'G');
INSERT INTO `modelos` VALUES (382, 'Ex');
INSERT INTO `modelos` VALUES (383, 'Fx');
INSERT INTO `modelos` VALUES (384, 'M');
INSERT INTO `modelos` VALUES (385, 'Elba');
INSERT INTO `modelos` VALUES (386, 'Minitre');
INSERT INTO `modelos` VALUES (387, 'Trooper');
INSERT INTO `modelos` VALUES (388, 'Pick Up');
INSERT INTO `modelos` VALUES (389, 'D Max');
INSERT INTO `modelos` VALUES (390, 'Rodeo');
INSERT INTO `modelos` VALUES (391, 'Dmax');
INSERT INTO `modelos` VALUES (392, 'Trroper');
INSERT INTO `modelos` VALUES (393, 'Daily');
INSERT INTO `modelos` VALUES (394, 'Massif');
INSERT INTO `modelos` VALUES (395, 'Daily');
INSERT INTO `modelos` VALUES (396, 'Duty');
INSERT INTO `modelos` VALUES (397, 'Serie Xj');
INSERT INTO `modelos` VALUES (398, 'Serie Xk');
INSERT INTO `modelos` VALUES (399, 'Xj');
INSERT INTO `modelos` VALUES (400, 'Stype');
INSERT INTO `modelos` VALUES (401, 'Xf');
INSERT INTO `modelos` VALUES (402, 'Xtype');
INSERT INTO `modelos` VALUES (403, 'Wrangler');
INSERT INTO `modelos` VALUES (404, 'Cherokee');
INSERT INTO `modelos` VALUES (405, 'Grand Cherokee');
INSERT INTO `modelos` VALUES (406, 'Commander');
INSERT INTO `modelos` VALUES (407, 'Compass');
INSERT INTO `modelos` VALUES (408, 'Wrangler Unlimited');
INSERT INTO `modelos` VALUES (409, 'Patriot');
INSERT INTO `modelos` VALUES (410, 'Sportage');
INSERT INTO `modelos` VALUES (411, 'Sephia');
INSERT INTO `modelos` VALUES (412, 'Sephia Ii');
INSERT INTO `modelos` VALUES (413, 'Pride');
INSERT INTO `modelos` VALUES (414, 'Clarus');
INSERT INTO `modelos` VALUES (415, 'Shuma');
INSERT INTO `modelos` VALUES (416, 'Carnival');
INSERT INTO `modelos` VALUES (417, 'Joice');
INSERT INTO `modelos` VALUES (418, 'Magentis');
INSERT INTO `modelos` VALUES (419, 'Carens');
INSERT INTO `modelos` VALUES (420, 'Rio');
INSERT INTO `modelos` VALUES (421, 'Cerato');
INSERT INTO `modelos` VALUES (422, 'Sorento');
INSERT INTO `modelos` VALUES (423, 'Opirus');
INSERT INTO `modelos` VALUES (424, 'Picanto');
INSERT INTO `modelos` VALUES (425, 'Ceed');
INSERT INTO `modelos` VALUES (426, 'Ceed Sporty Wagon');
INSERT INTO `modelos` VALUES (427, 'Proceed');
INSERT INTO `modelos` VALUES (428, 'K2500 Frontier');
INSERT INTO `modelos` VALUES (429, 'K2500');
INSERT INTO `modelos` VALUES (430, 'Soul');
INSERT INTO `modelos` VALUES (431, 'Venga');
INSERT INTO `modelos` VALUES (432, 'Optima');
INSERT INTO `modelos` VALUES (433, 'Ceed Sportswagon');
INSERT INTO `modelos` VALUES (434, 'Samara');
INSERT INTO `modelos` VALUES (435, 'Niva');
INSERT INTO `modelos` VALUES (436, 'Sagona');
INSERT INTO `modelos` VALUES (437, 'Stawra 2110');
INSERT INTO `modelos` VALUES (438, '214');
INSERT INTO `modelos` VALUES (439, 'Kalina');
INSERT INTO `modelos` VALUES (440, 'Serie 2100');
INSERT INTO `modelos` VALUES (441, 'Priora');
INSERT INTO `modelos` VALUES (442, 'Gallardo');
INSERT INTO `modelos` VALUES (443, 'Murcielago');
INSERT INTO `modelos` VALUES (444, 'Aventador');
INSERT INTO `modelos` VALUES (445, 'Delta');
INSERT INTO `modelos` VALUES (446, 'K');
INSERT INTO `modelos` VALUES (447, 'Y10');
INSERT INTO `modelos` VALUES (448, 'Dedra');
INSERT INTO `modelos` VALUES (449, 'Lybra');
INSERT INTO `modelos` VALUES (450, 'Z');
INSERT INTO `modelos` VALUES (451, 'Y');
INSERT INTO `modelos` VALUES (452, 'Ypsilon');
INSERT INTO `modelos` VALUES (453, 'Thesis');
INSERT INTO `modelos` VALUES (454, 'Phedra');
INSERT INTO `modelos` VALUES (455, 'Musa');
INSERT INTO `modelos` VALUES (456, 'Thema');
INSERT INTO `modelos` VALUES (457, 'Zeta');
INSERT INTO `modelos` VALUES (458, 'Kappa');
INSERT INTO `modelos` VALUES (459, 'Trevi');
INSERT INTO `modelos` VALUES (460, 'Prisma');
INSERT INTO `modelos` VALUES (461, 'A112');
INSERT INTO `modelos` VALUES (462, 'Ypsilon Elefantino');
INSERT INTO `modelos` VALUES (463, 'Voyager');
INSERT INTO `modelos` VALUES (464, 'Range Rover');
INSERT INTO `modelos` VALUES (465, 'Defender');
INSERT INTO `modelos` VALUES (466, 'Discovery');
INSERT INTO `modelos` VALUES (467, 'Freelander');
INSERT INTO `modelos` VALUES (468, 'Range Rover Sport');
INSERT INTO `modelos` VALUES (469, 'Discovery 4');
INSERT INTO `modelos` VALUES (470, 'Range Rover Evoque');
INSERT INTO `modelos` VALUES (471, 'Maxus');
INSERT INTO `modelos` VALUES (472, 'Ls400');
INSERT INTO `modelos` VALUES (473, 'Ls430');
INSERT INTO `modelos` VALUES (474, 'Gs300');
INSERT INTO `modelos` VALUES (475, 'Is200');
INSERT INTO `modelos` VALUES (476, 'Rx300');
INSERT INTO `modelos` VALUES (477, 'Gs430');
INSERT INTO `modelos` VALUES (478, 'Gs460');
INSERT INTO `modelos` VALUES (479, 'Sc430');
INSERT INTO `modelos` VALUES (480, 'Is300');
INSERT INTO `modelos` VALUES (481, 'Is250');
INSERT INTO `modelos` VALUES (482, 'Rx400h');
INSERT INTO `modelos` VALUES (483, 'Is220d');
INSERT INTO `modelos` VALUES (484, 'Rx350');
INSERT INTO `modelos` VALUES (485, 'Gs450h');
INSERT INTO `modelos` VALUES (486, 'Ls460');
INSERT INTO `modelos` VALUES (487, 'Ls600h');
INSERT INTO `modelos` VALUES (488, 'Ls');
INSERT INTO `modelos` VALUES (489, 'Gs');
INSERT INTO `modelos` VALUES (490, 'Is');
INSERT INTO `modelos` VALUES (491, 'Sc');
INSERT INTO `modelos` VALUES (492, 'Rx');
INSERT INTO `modelos` VALUES (493, 'Ct');
INSERT INTO `modelos` VALUES (494, 'Elise');
INSERT INTO `modelos` VALUES (495, 'Exige');
INSERT INTO `modelos` VALUES (496, 'Bolero Pickup');
INSERT INTO `modelos` VALUES (497, 'Goa Pickup');
INSERT INTO `modelos` VALUES (498, 'Goa');
INSERT INTO `modelos` VALUES (499, 'Cj');
INSERT INTO `modelos` VALUES (500, 'Pikup');
INSERT INTO `modelos` VALUES (501, 'Thar');
INSERT INTO `modelos` VALUES (502, 'Ghibli');
INSERT INTO `modelos` VALUES (503, 'Shamal');
INSERT INTO `modelos` VALUES (504, 'Quattroporte');
INSERT INTO `modelos` VALUES (505, '3200 Gt');
INSERT INTO `modelos` VALUES (506, 'Coupe');
INSERT INTO `modelos` VALUES (507, 'Spyder');
INSERT INTO `modelos` VALUES (508, 'Gransport');
INSERT INTO `modelos` VALUES (509, 'Granturismo');
INSERT INTO `modelos` VALUES (510, '430');
INSERT INTO `modelos` VALUES (511, 'Biturbo');
INSERT INTO `modelos` VALUES (512, '228');
INSERT INTO `modelos` VALUES (513, '224');
INSERT INTO `modelos` VALUES (514, 'Grancabrio');
INSERT INTO `modelos` VALUES (515, 'Maybach');
INSERT INTO `modelos` VALUES (516, 'Xedos 6');
INSERT INTO `modelos` VALUES (517, '626');
INSERT INTO `modelos` VALUES (518, '121');
INSERT INTO `modelos` VALUES (519, 'Xedos 9');
INSERT INTO `modelos` VALUES (520, '323');
INSERT INTO `modelos` VALUES (521, 'Mx3');
INSERT INTO `modelos` VALUES (522, 'Rx7');
INSERT INTO `modelos` VALUES (523, 'Mx5');
INSERT INTO `modelos` VALUES (524, 'Mazda3');
INSERT INTO `modelos` VALUES (525, 'Mpv');
INSERT INTO `modelos` VALUES (526, 'Demio');
INSERT INTO `modelos` VALUES (527, 'Premacy');
INSERT INTO `modelos` VALUES (528, 'Tribute');
INSERT INTO `modelos` VALUES (529, 'Mazda6');
INSERT INTO `modelos` VALUES (530, 'Mazda2');
INSERT INTO `modelos` VALUES (531, 'Rx8');
INSERT INTO `modelos` VALUES (532, 'Mazda5');
INSERT INTO `modelos` VALUES (533, 'Cx7');
INSERT INTO `modelos` VALUES (534, 'Serie B');
INSERT INTO `modelos` VALUES (535, 'B2500');
INSERT INTO `modelos` VALUES (536, 'Bt50');
INSERT INTO `modelos` VALUES (537, 'Mx6');
INSERT INTO `modelos` VALUES (538, '929');
INSERT INTO `modelos` VALUES (539, 'Cx5');
INSERT INTO `modelos` VALUES (540, 'Clase C');
INSERT INTO `modelos` VALUES (541, 'Clase E');
INSERT INTO `modelos` VALUES (542, 'Clase Sl');
INSERT INTO `modelos` VALUES (543, 'Clase S');
INSERT INTO `modelos` VALUES (544, 'Clase Cl');
INSERT INTO `modelos` VALUES (545, 'Clase G');
INSERT INTO `modelos` VALUES (546, 'Clase Slk');
INSERT INTO `modelos` VALUES (547, 'Clase V');
INSERT INTO `modelos` VALUES (548, 'Viano');
INSERT INTO `modelos` VALUES (549, 'Clase Clk');
INSERT INTO `modelos` VALUES (550, 'Clase A');
INSERT INTO `modelos` VALUES (551, 'Clase M');
INSERT INTO `modelos` VALUES (552, 'Vaneo');
INSERT INTO `modelos` VALUES (553, 'Slklasse');
INSERT INTO `modelos` VALUES (554, 'Slr Mclaren');
INSERT INTO `modelos` VALUES (555, 'Clase Cls');
INSERT INTO `modelos` VALUES (556, 'Clase R');
INSERT INTO `modelos` VALUES (557, 'Clase Gl');
INSERT INTO `modelos` VALUES (558, 'Clase B');
INSERT INTO `modelos` VALUES (559, '100d');
INSERT INTO `modelos` VALUES (560, '140d');
INSERT INTO `modelos` VALUES (561, '180d');
INSERT INTO `modelos` VALUES (562, 'Sprinter');
INSERT INTO `modelos` VALUES (563, 'Vito');
INSERT INTO `modelos` VALUES (564, 'Transporter');
INSERT INTO `modelos` VALUES (565, '280');
INSERT INTO `modelos` VALUES (566, '220');
INSERT INTO `modelos` VALUES (567, '200');
INSERT INTO `modelos` VALUES (568, '190');
INSERT INTO `modelos` VALUES (569, '600');
INSERT INTO `modelos` VALUES (570, '400');
INSERT INTO `modelos` VALUES (571, 'Clase Sl R129');
INSERT INTO `modelos` VALUES (572, '300');
INSERT INTO `modelos` VALUES (573, '500');
INSERT INTO `modelos` VALUES (574, '420');
INSERT INTO `modelos` VALUES (575, '260');
INSERT INTO `modelos` VALUES (576, '230');
INSERT INTO `modelos` VALUES (577, 'Clase Clc');
INSERT INTO `modelos` VALUES (578, 'Clase Glk');
INSERT INTO `modelos` VALUES (579, 'Sls Amg');
INSERT INTO `modelos` VALUES (580, 'Mgf');
INSERT INTO `modelos` VALUES (581, 'Tf');
INSERT INTO `modelos` VALUES (582, 'Zr');
INSERT INTO `modelos` VALUES (583, 'Zs');
INSERT INTO `modelos` VALUES (584, 'Zt');
INSERT INTO `modelos` VALUES (585, 'Ztt');
INSERT INTO `modelos` VALUES (586, 'Mini');
INSERT INTO `modelos` VALUES (587, 'Countryman');
INSERT INTO `modelos` VALUES (588, 'Paceman');
INSERT INTO `modelos` VALUES (589, 'Montero');
INSERT INTO `modelos` VALUES (590, 'Galant');
INSERT INTO `modelos` VALUES (591, 'Colt');
INSERT INTO `modelos` VALUES (592, 'Space Wagon');
INSERT INTO `modelos` VALUES (593, 'Space Runner');
INSERT INTO `modelos` VALUES (594, 'Space Gear');
INSERT INTO `modelos` VALUES (595, '3000 Gt');
INSERT INTO `modelos` VALUES (596, 'Carisma');
INSERT INTO `modelos` VALUES (597, 'Eclipse');
INSERT INTO `modelos` VALUES (598, 'Space Star');
INSERT INTO `modelos` VALUES (599, 'Montero Sport');
INSERT INTO `modelos` VALUES (600, 'Montero Io');
INSERT INTO `modelos` VALUES (601, 'Outlander');
INSERT INTO `modelos` VALUES (602, 'Lancer');
INSERT INTO `modelos` VALUES (603, 'Grandis');
INSERT INTO `modelos` VALUES (604, 'L200');
INSERT INTO `modelos` VALUES (605, 'Canter');
INSERT INTO `modelos` VALUES (606, '300 Gt');
INSERT INTO `modelos` VALUES (607, 'Asx');
INSERT INTO `modelos` VALUES (608, 'Imiev');
INSERT INTO `modelos` VALUES (609, '44');
INSERT INTO `modelos` VALUES (610, 'Plus 8');
INSERT INTO `modelos` VALUES (611, 'Aero 8');
INSERT INTO `modelos` VALUES (612, 'V6');
INSERT INTO `modelos` VALUES (613, 'Roadster');
INSERT INTO `modelos` VALUES (614, '4');
INSERT INTO `modelos` VALUES (615, 'Plus 4');
INSERT INTO `modelos` VALUES (616, 'Terrano Ii');
INSERT INTO `modelos` VALUES (617, 'Terrano');
INSERT INTO `modelos` VALUES (618, 'Micra');
INSERT INTO `modelos` VALUES (619, 'Sunny');
INSERT INTO `modelos` VALUES (620, 'Primera');
INSERT INTO `modelos` VALUES (621, 'Serena');
INSERT INTO `modelos` VALUES (622, 'Patrol');
INSERT INTO `modelos` VALUES (623, 'Maxima Qx');
INSERT INTO `modelos` VALUES (624, '200 Sx');
INSERT INTO `modelos` VALUES (625, '300 Zx');
INSERT INTO `modelos` VALUES (626, 'Patrol Gr');
INSERT INTO `modelos` VALUES (627, '100 Nx');
INSERT INTO `modelos` VALUES (628, 'Almera');
INSERT INTO `modelos` VALUES (629, 'Pathfinder');
INSERT INTO `modelos` VALUES (630, 'Almera Tino');
INSERT INTO `modelos` VALUES (631, 'Xtrail');
INSERT INTO `modelos` VALUES (632, '350z');
INSERT INTO `modelos` VALUES (633, 'Murano');
INSERT INTO `modelos` VALUES (634, 'Note');
INSERT INTO `modelos` VALUES (635, 'Qashqai');
INSERT INTO `modelos` VALUES (636, 'Tiida');
INSERT INTO `modelos` VALUES (637, 'Vanette');
INSERT INTO `modelos` VALUES (638, 'Trade');
INSERT INTO `modelos` VALUES (639, 'Vanette Cargo');
INSERT INTO `modelos` VALUES (640, 'Pickup');
INSERT INTO `modelos` VALUES (641, 'Navara');
INSERT INTO `modelos` VALUES (642, 'Cabstar E');
INSERT INTO `modelos` VALUES (643, 'Cabstar');
INSERT INTO `modelos` VALUES (644, 'Maxima');
INSERT INTO `modelos` VALUES (645, 'Camion');
INSERT INTO `modelos` VALUES (646, 'Prairie');
INSERT INTO `modelos` VALUES (647, 'Bluebird');
INSERT INTO `modelos` VALUES (648, 'Np300 Pick Up');
INSERT INTO `modelos` VALUES (649, 'Qashqai2');
INSERT INTO `modelos` VALUES (650, 'Pixo');
INSERT INTO `modelos` VALUES (651, 'Gtr');
INSERT INTO `modelos` VALUES (652, '370z');
INSERT INTO `modelos` VALUES (653, 'Cube');
INSERT INTO `modelos` VALUES (654, 'Juke');
INSERT INTO `modelos` VALUES (655, 'Leaf');
INSERT INTO `modelos` VALUES (656, 'Evalia');
INSERT INTO `modelos` VALUES (657, 'Astra');
INSERT INTO `modelos` VALUES (658, 'Vectra');
INSERT INTO `modelos` VALUES (659, 'Calibra');
INSERT INTO `modelos` VALUES (660, 'Corsa');
INSERT INTO `modelos` VALUES (661, 'Omega');
INSERT INTO `modelos` VALUES (662, 'Frontera');
INSERT INTO `modelos` VALUES (663, 'Tigra');
INSERT INTO `modelos` VALUES (664, 'Monterey');
INSERT INTO `modelos` VALUES (665, 'Sintra');
INSERT INTO `modelos` VALUES (666, 'Zafira');
INSERT INTO `modelos` VALUES (667, 'Agila');
INSERT INTO `modelos` VALUES (668, 'Speedster');
INSERT INTO `modelos` VALUES (669, 'Signum');
INSERT INTO `modelos` VALUES (670, 'Meriva');
INSERT INTO `modelos` VALUES (671, 'Antara');
INSERT INTO `modelos` VALUES (672, 'Gt');
INSERT INTO `modelos` VALUES (673, 'Combo');
INSERT INTO `modelos` VALUES (674, 'Movano');
INSERT INTO `modelos` VALUES (675, 'Vivaro');
INSERT INTO `modelos` VALUES (676, 'Kadett');
INSERT INTO `modelos` VALUES (677, 'Monza');
INSERT INTO `modelos` VALUES (678, 'Senator');
INSERT INTO `modelos` VALUES (679, 'Rekord');
INSERT INTO `modelos` VALUES (680, 'Manta');
INSERT INTO `modelos` VALUES (681, 'Ascona');
INSERT INTO `modelos` VALUES (682, 'Insignia');
INSERT INTO `modelos` VALUES (683, 'Zafira Tourer');
INSERT INTO `modelos` VALUES (684, 'Ampera');
INSERT INTO `modelos` VALUES (685, 'Mokka');
INSERT INTO `modelos` VALUES (686, 'Adam');
INSERT INTO `modelos` VALUES (687, '306');
INSERT INTO `modelos` VALUES (688, '605');
INSERT INTO `modelos` VALUES (689, '106');
INSERT INTO `modelos` VALUES (690, '205');
INSERT INTO `modelos` VALUES (691, '405');
INSERT INTO `modelos` VALUES (692, '406');
INSERT INTO `modelos` VALUES (693, '806');
INSERT INTO `modelos` VALUES (694, '807');
INSERT INTO `modelos` VALUES (695, '407');
INSERT INTO `modelos` VALUES (696, '307');
INSERT INTO `modelos` VALUES (697, '206');
INSERT INTO `modelos` VALUES (698, '607');
INSERT INTO `modelos` VALUES (699, '308');
INSERT INTO `modelos` VALUES (700, '307 Sw');
INSERT INTO `modelos` VALUES (701, '206 Sw');
INSERT INTO `modelos` VALUES (702, '407 Sw');
INSERT INTO `modelos` VALUES (703, '1007');
INSERT INTO `modelos` VALUES (704, '107');
INSERT INTO `modelos` VALUES (705, '207');
INSERT INTO `modelos` VALUES (706, '4007');
INSERT INTO `modelos` VALUES (707, 'Boxer');
INSERT INTO `modelos` VALUES (708, 'Partner');
INSERT INTO `modelos` VALUES (709, 'J5');
INSERT INTO `modelos` VALUES (710, '604');
INSERT INTO `modelos` VALUES (711, '505');
INSERT INTO `modelos` VALUES (712, '309');
INSERT INTO `modelos` VALUES (713, 'Bipper');
INSERT INTO `modelos` VALUES (714, 'Partner Origin');
INSERT INTO `modelos` VALUES (715, '3008');
INSERT INTO `modelos` VALUES (716, '5008');
INSERT INTO `modelos` VALUES (717, 'Rcz');
INSERT INTO `modelos` VALUES (718, '508');
INSERT INTO `modelos` VALUES (719, 'Ion');
INSERT INTO `modelos` VALUES (720, '208');
INSERT INTO `modelos` VALUES (721, '4008');
INSERT INTO `modelos` VALUES (722, 'Trans Sport');
INSERT INTO `modelos` VALUES (723, 'Firebird');
INSERT INTO `modelos` VALUES (724, 'Trans Am');
INSERT INTO `modelos` VALUES (725, '911');
INSERT INTO `modelos` VALUES (726, 'Boxster');
INSERT INTO `modelos` VALUES (727, 'Cayenne');
INSERT INTO `modelos` VALUES (728, 'Carrera Gt');
INSERT INTO `modelos` VALUES (729, 'Cayman');
INSERT INTO `modelos` VALUES (730, '928');
INSERT INTO `modelos` VALUES (731, '968');
INSERT INTO `modelos` VALUES (732, '944');
INSERT INTO `modelos` VALUES (733, '924');
INSERT INTO `modelos` VALUES (734, 'Panamera');
INSERT INTO `modelos` VALUES (735, '918');
INSERT INTO `modelos` VALUES (736, 'Megane');
INSERT INTO `modelos` VALUES (737, 'Safrane');
INSERT INTO `modelos` VALUES (738, 'Laguna');
INSERT INTO `modelos` VALUES (739, 'Clio');
INSERT INTO `modelos` VALUES (740, 'Twingo');
INSERT INTO `modelos` VALUES (741, 'Nevada');
INSERT INTO `modelos` VALUES (742, 'Espace');
INSERT INTO `modelos` VALUES (743, 'Spider');
INSERT INTO `modelos` VALUES (744, 'Scenic');
INSERT INTO `modelos` VALUES (745, 'Grand Espace');
INSERT INTO `modelos` VALUES (746, 'Avantime');
INSERT INTO `modelos` VALUES (747, 'Vel Satis');
INSERT INTO `modelos` VALUES (748, 'Grand Scenic');
INSERT INTO `modelos` VALUES (749, 'Clio Campus');
INSERT INTO `modelos` VALUES (750, 'Modus');
INSERT INTO `modelos` VALUES (751, 'Express');
INSERT INTO `modelos` VALUES (752, 'Trafic');
INSERT INTO `modelos` VALUES (753, 'Master');
INSERT INTO `modelos` VALUES (754, 'Kangoo');
INSERT INTO `modelos` VALUES (755, 'Mascott');
INSERT INTO `modelos` VALUES (756, 'Master Propulsion');
INSERT INTO `modelos` VALUES (757, 'Maxity');
INSERT INTO `modelos` VALUES (758, 'R19');
INSERT INTO `modelos` VALUES (759, 'R25');
INSERT INTO `modelos` VALUES (760, 'R5');
INSERT INTO `modelos` VALUES (761, 'R21');
INSERT INTO `modelos` VALUES (762, 'R4');
INSERT INTO `modelos` VALUES (763, 'Alpine');
INSERT INTO `modelos` VALUES (764, 'Fuego');
INSERT INTO `modelos` VALUES (765, 'R18');
INSERT INTO `modelos` VALUES (766, 'R11');
INSERT INTO `modelos` VALUES (767, 'R9');
INSERT INTO `modelos` VALUES (768, 'R6');
INSERT INTO `modelos` VALUES (769, 'Grand Modus');
INSERT INTO `modelos` VALUES (770, 'Kangoo Combi');
INSERT INTO `modelos` VALUES (771, 'Koleos');
INSERT INTO `modelos` VALUES (772, 'Fluence');
INSERT INTO `modelos` VALUES (773, 'Wind');
INSERT INTO `modelos` VALUES (774, 'Latitude');
INSERT INTO `modelos` VALUES (775, 'Grand Kangoo Combi');
INSERT INTO `modelos` VALUES (776, 'Siver Dawn');
INSERT INTO `modelos` VALUES (777, 'Silver Spur');
INSERT INTO `modelos` VALUES (778, 'Park Ward');
INSERT INTO `modelos` VALUES (779, 'Silver Seraph');
INSERT INTO `modelos` VALUES (780, 'Corniche');
INSERT INTO `modelos` VALUES (781, 'Phantom');
INSERT INTO `modelos` VALUES (782, 'Touring');
INSERT INTO `modelos` VALUES (783, 'Silvier');
INSERT INTO `modelos` VALUES (784, '800');
INSERT INTO `modelos` VALUES (785, '600');
INSERT INTO `modelos` VALUES (786, '100');
INSERT INTO `modelos` VALUES (787, '200');
INSERT INTO `modelos` VALUES (788, 'Coupe');
INSERT INTO `modelos` VALUES (789, '400');
INSERT INTO `modelos` VALUES (790, '45');
INSERT INTO `modelos` VALUES (791, 'Cabriolet');
INSERT INTO `modelos` VALUES (792, '25');
INSERT INTO `modelos` VALUES (793, 'Mini');
INSERT INTO `modelos` VALUES (794, '75');
INSERT INTO `modelos` VALUES (795, 'Streetwise');
INSERT INTO `modelos` VALUES (796, 'Sd');
INSERT INTO `modelos` VALUES (797, '900');
INSERT INTO `modelos` VALUES (798, '93');
INSERT INTO `modelos` VALUES (799, '9000');
INSERT INTO `modelos` VALUES (800, '95');
INSERT INTO `modelos` VALUES (801, '93x');
INSERT INTO `modelos` VALUES (802, '94x');
INSERT INTO `modelos` VALUES (803, '300');
INSERT INTO `modelos` VALUES (804, '350');
INSERT INTO `modelos` VALUES (805, 'Anibal');
INSERT INTO `modelos` VALUES (806, 'Anibal Pick Up');
INSERT INTO `modelos` VALUES (807, 'Ibiza');
INSERT INTO `modelos` VALUES (808, 'Cordoba');
INSERT INTO `modelos` VALUES (809, 'Toledo');
INSERT INTO `modelos` VALUES (810, 'Marbella');
INSERT INTO `modelos` VALUES (811, 'Alhambra');
INSERT INTO `modelos` VALUES (812, 'Arosa');
INSERT INTO `modelos` VALUES (813, 'Leon');
INSERT INTO `modelos` VALUES (814, 'Altea');
INSERT INTO `modelos` VALUES (815, 'Altea Xl');
INSERT INTO `modelos` VALUES (816, 'Altea Freetrack');
INSERT INTO `modelos` VALUES (817, 'Terra');
INSERT INTO `modelos` VALUES (818, 'Inca');
INSERT INTO `modelos` VALUES (819, 'Malaga');
INSERT INTO `modelos` VALUES (820, 'Ronda');
INSERT INTO `modelos` VALUES (821, 'Exeo');
INSERT INTO `modelos` VALUES (822, 'Mii');
INSERT INTO `modelos` VALUES (823, 'Felicia');
INSERT INTO `modelos` VALUES (824, 'Forman');
INSERT INTO `modelos` VALUES (825, 'Octavia');
INSERT INTO `modelos` VALUES (826, 'Octavia Tour');
INSERT INTO `modelos` VALUES (827, 'Fabia');
INSERT INTO `modelos` VALUES (828, 'Superb');
INSERT INTO `modelos` VALUES (829, 'Roomster');
INSERT INTO `modelos` VALUES (830, 'Scout');
INSERT INTO `modelos` VALUES (831, 'Pickup');
INSERT INTO `modelos` VALUES (832, 'Favorit');
INSERT INTO `modelos` VALUES (833, '130');
INSERT INTO `modelos` VALUES (834, 'S');
INSERT INTO `modelos` VALUES (835, 'Yeti');
INSERT INTO `modelos` VALUES (836, 'Citigo');
INSERT INTO `modelos` VALUES (837, 'Rapid');
INSERT INTO `modelos` VALUES (838, 'Smart');
INSERT INTO `modelos` VALUES (839, 'Citycoupe');
INSERT INTO `modelos` VALUES (840, 'Fortwo');
INSERT INTO `modelos` VALUES (841, 'Cabrio');
INSERT INTO `modelos` VALUES (842, 'Crossblade');
INSERT INTO `modelos` VALUES (843, 'Roadster');
INSERT INTO `modelos` VALUES (844, 'Forfour');
INSERT INTO `modelos` VALUES (845, 'Korando');
INSERT INTO `modelos` VALUES (846, 'Family');
INSERT INTO `modelos` VALUES (847, 'K4d');
INSERT INTO `modelos` VALUES (848, 'Musso');
INSERT INTO `modelos` VALUES (849, 'Korando Kj');
INSERT INTO `modelos` VALUES (850, 'Rexton');
INSERT INTO `modelos` VALUES (851, 'Rexton Ii');
INSERT INTO `modelos` VALUES (852, 'Rodius');
INSERT INTO `modelos` VALUES (853, 'Kyron');
INSERT INTO `modelos` VALUES (854, 'Actyon');
INSERT INTO `modelos` VALUES (855, 'Sports Pick Up');
INSERT INTO `modelos` VALUES (856, 'Actyon Sports Pick Up');
INSERT INTO `modelos` VALUES (857, 'Kodando');
INSERT INTO `modelos` VALUES (858, 'Legacy');
INSERT INTO `modelos` VALUES (859, 'Impreza');
INSERT INTO `modelos` VALUES (860, 'Svx');
INSERT INTO `modelos` VALUES (861, 'Justy');
INSERT INTO `modelos` VALUES (862, 'Outback');
INSERT INTO `modelos` VALUES (863, 'Forester');
INSERT INTO `modelos` VALUES (864, 'G3x Justy');
INSERT INTO `modelos` VALUES (865, 'B9 Tribeca');
INSERT INTO `modelos` VALUES (866, 'Xt');
INSERT INTO `modelos` VALUES (867, '1800');
INSERT INTO `modelos` VALUES (868, 'Tribeca');
INSERT INTO `modelos` VALUES (869, 'Wrx Sti');
INSERT INTO `modelos` VALUES (870, 'Trezia');
INSERT INTO `modelos` VALUES (871, 'Xv');
INSERT INTO `modelos` VALUES (872, 'Brz');
INSERT INTO `modelos` VALUES (873, 'Maruti');
INSERT INTO `modelos` VALUES (874, 'Swift');
INSERT INTO `modelos` VALUES (875, 'Vitara');
INSERT INTO `modelos` VALUES (876, 'Baleno');
INSERT INTO `modelos` VALUES (877, 'Samurai');
INSERT INTO `modelos` VALUES (878, 'Alto');
INSERT INTO `modelos` VALUES (879, 'Wagon R');
INSERT INTO `modelos` VALUES (880, 'Jimny');
INSERT INTO `modelos` VALUES (881, 'Grand Vitara');
INSERT INTO `modelos` VALUES (882, 'Ignis');
INSERT INTO `modelos` VALUES (883, 'Liana');
INSERT INTO `modelos` VALUES (884, 'Grand Vitara Xl7');
INSERT INTO `modelos` VALUES (885, 'Sx4');
INSERT INTO `modelos` VALUES (886, 'Splash');
INSERT INTO `modelos` VALUES (887, 'Kizashi');
INSERT INTO `modelos` VALUES (888, 'Samba');
INSERT INTO `modelos` VALUES (889, 'Tagora');
INSERT INTO `modelos` VALUES (890, 'Solara');
INSERT INTO `modelos` VALUES (891, 'Horizon');
INSERT INTO `modelos` VALUES (892, 'Telcosport');
INSERT INTO `modelos` VALUES (893, 'Telco');
INSERT INTO `modelos` VALUES (894, 'Sumo');
INSERT INTO `modelos` VALUES (895, 'Safari');
INSERT INTO `modelos` VALUES (896, 'Indica');
INSERT INTO `modelos` VALUES (897, 'Indigo');
INSERT INTO `modelos` VALUES (898, 'Grand Safari');
INSERT INTO `modelos` VALUES (899, 'Tl Pick Up');
INSERT INTO `modelos` VALUES (900, 'Xenon Pick Up');
INSERT INTO `modelos` VALUES (901, 'Vista');
INSERT INTO `modelos` VALUES (902, 'Xenon');
INSERT INTO `modelos` VALUES (903, 'Aria');
INSERT INTO `modelos` VALUES (904, 'Carina E');
INSERT INTO `modelos` VALUES (905, '4runner');
INSERT INTO `modelos` VALUES (906, 'Camry');
INSERT INTO `modelos` VALUES (907, 'Rav4');
INSERT INTO `modelos` VALUES (908, 'Celica');
INSERT INTO `modelos` VALUES (909, 'Supra');
INSERT INTO `modelos` VALUES (910, 'Paseo');
INSERT INTO `modelos` VALUES (911, 'Land Cruiser 80');
INSERT INTO `modelos` VALUES (912, 'Land Cruiser 100');
INSERT INTO `modelos` VALUES (913, 'Land Cruiser');
INSERT INTO `modelos` VALUES (914, 'Land Cruiser 90');
INSERT INTO `modelos` VALUES (915, 'Corolla');
INSERT INTO `modelos` VALUES (916, 'Auris');
INSERT INTO `modelos` VALUES (917, 'Avensis');
INSERT INTO `modelos` VALUES (918, 'Picnic');
INSERT INTO `modelos` VALUES (919, 'Yaris');
INSERT INTO `modelos` VALUES (920, 'Yaris Verso');
INSERT INTO `modelos` VALUES (921, 'Mr2');
INSERT INTO `modelos` VALUES (922, 'Previa');
INSERT INTO `modelos` VALUES (923, 'Prius');
INSERT INTO `modelos` VALUES (924, 'Avensis Verso');
INSERT INTO `modelos` VALUES (925, 'Corolla Verso');
INSERT INTO `modelos` VALUES (926, 'Corolla Sedan');
INSERT INTO `modelos` VALUES (927, 'Aygo');
INSERT INTO `modelos` VALUES (928, 'Hilux');
INSERT INTO `modelos` VALUES (929, 'Dyna');
INSERT INTO `modelos` VALUES (930, 'Land Cruiser 200');
INSERT INTO `modelos` VALUES (931, 'Verso');
INSERT INTO `modelos` VALUES (932, 'Iq');
INSERT INTO `modelos` VALUES (933, 'Urban Cruiser');
INSERT INTO `modelos` VALUES (934, 'Gt86');
INSERT INTO `modelos` VALUES (935, '100');
INSERT INTO `modelos` VALUES (936, '121');
INSERT INTO `modelos` VALUES (937, '214');
INSERT INTO `modelos` VALUES (938, '110 Stawra');
INSERT INTO `modelos` VALUES (939, '111 Stawra');
INSERT INTO `modelos` VALUES (940, '215');
INSERT INTO `modelos` VALUES (941, '112 Stawra');
INSERT INTO `modelos` VALUES (942, 'Passat');
INSERT INTO `modelos` VALUES (943, 'Golf');
INSERT INTO `modelos` VALUES (944, 'Vento');
INSERT INTO `modelos` VALUES (945, 'Polo');
INSERT INTO `modelos` VALUES (946, 'Corrado');
INSERT INTO `modelos` VALUES (947, 'Sharan');
INSERT INTO `modelos` VALUES (948, 'Lupo');
INSERT INTO `modelos` VALUES (949, 'Bora');
INSERT INTO `modelos` VALUES (950, 'Jetta');
INSERT INTO `modelos` VALUES (951, 'New Beetle');
INSERT INTO `modelos` VALUES (952, 'Phaeton');
INSERT INTO `modelos` VALUES (953, 'Touareg');
INSERT INTO `modelos` VALUES (954, 'Touran');
INSERT INTO `modelos` VALUES (955, 'Multivan');
INSERT INTO `modelos` VALUES (956, 'Caddy');
INSERT INTO `modelos` VALUES (957, 'Golf Plus');
INSERT INTO `modelos` VALUES (958, 'Fox');
INSERT INTO `modelos` VALUES (959, 'Eos');
INSERT INTO `modelos` VALUES (960, 'Caravelle');
INSERT INTO `modelos` VALUES (961, 'Tiguan');
INSERT INTO `modelos` VALUES (962, 'Transporter');
INSERT INTO `modelos` VALUES (963, 'Lt');
INSERT INTO `modelos` VALUES (964, 'Taro');
INSERT INTO `modelos` VALUES (965, 'Crafter');
INSERT INTO `modelos` VALUES (966, 'California');
INSERT INTO `modelos` VALUES (967, 'Santana');
INSERT INTO `modelos` VALUES (968, 'Scirocco');
INSERT INTO `modelos` VALUES (969, 'Passat Cc');
INSERT INTO `modelos` VALUES (970, 'Amarok');
INSERT INTO `modelos` VALUES (971, 'Beetle');
INSERT INTO `modelos` VALUES (972, 'Up');
INSERT INTO `modelos` VALUES (973, 'Cc');
INSERT INTO `modelos` VALUES (974, '440');
INSERT INTO `modelos` VALUES (975, '850');
INSERT INTO `modelos` VALUES (976, 'S70');
INSERT INTO `modelos` VALUES (977, 'V70');
INSERT INTO `modelos` VALUES (978, 'V70 Classic');
INSERT INTO `modelos` VALUES (979, '940');
INSERT INTO `modelos` VALUES (980, '480');
INSERT INTO `modelos` VALUES (981, '460');
INSERT INTO `modelos` VALUES (982, '960');
INSERT INTO `modelos` VALUES (983, 'S90');
INSERT INTO `modelos` VALUES (984, 'V90');
INSERT INTO `modelos` VALUES (985, 'Classic');
INSERT INTO `modelos` VALUES (986, 'S40');
INSERT INTO `modelos` VALUES (987, 'V40');
INSERT INTO `modelos` VALUES (988, 'V50');
INSERT INTO `modelos` VALUES (989, 'V70 Xc');
INSERT INTO `modelos` VALUES (990, 'Xc70');
INSERT INTO `modelos` VALUES (991, 'C70');
INSERT INTO `modelos` VALUES (992, 'S80');
INSERT INTO `modelos` VALUES (993, 'S60');
INSERT INTO `modelos` VALUES (994, 'Xc90');
INSERT INTO `modelos` VALUES (995, 'C30');
INSERT INTO `modelos` VALUES (996, '780');
INSERT INTO `modelos` VALUES (997, '760');
INSERT INTO `modelos` VALUES (998, '740');
INSERT INTO `modelos` VALUES (999, '240');
INSERT INTO `modelos` VALUES (1000, '360');
INSERT INTO `modelos` VALUES (1001, '340');
INSERT INTO `modelos` VALUES (1002, 'Xc60');
INSERT INTO `modelos` VALUES (1003, 'V60');
INSERT INTO `modelos` VALUES (1004, 'V40 Cross Country');
INSERT INTO `modelos` VALUES (1005, '353');
INSERT INTO `modelos` VALUES (1006, 'Mini');
INSERT INTO `modelos` VALUES (1007, 'Countryman');
INSERT INTO `modelos` VALUES (1008, 'Paceman');

-- ----------------------------
-- Table structure for modelos_x_marca
-- ----------------------------
DROP TABLE IF EXISTS `modelos_x_marca`;
CREATE TABLE `modelos_x_marca`  (
  `ID_Marca` int(0) NOT NULL,
  `ID_Modelo` int(0) NOT NULL,
  PRIMARY KEY (`ID_Modelo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of modelos_x_marca
-- ----------------------------
INSERT INTO `modelos_x_marca` VALUES (1, 1);
INSERT INTO `modelos_x_marca` VALUES (1, 2);
INSERT INTO `modelos_x_marca` VALUES (1, 3);
INSERT INTO `modelos_x_marca` VALUES (1, 4);
INSERT INTO `modelos_x_marca` VALUES (1, 5);
INSERT INTO `modelos_x_marca` VALUES (1, 6);
INSERT INTO `modelos_x_marca` VALUES (2, 7);
INSERT INTO `modelos_x_marca` VALUES (2, 8);
INSERT INTO `modelos_x_marca` VALUES (2, 9);
INSERT INTO `modelos_x_marca` VALUES (2, 10);
INSERT INTO `modelos_x_marca` VALUES (2, 11);
INSERT INTO `modelos_x_marca` VALUES (2, 12);
INSERT INTO `modelos_x_marca` VALUES (2, 13);
INSERT INTO `modelos_x_marca` VALUES (2, 14);
INSERT INTO `modelos_x_marca` VALUES (2, 15);
INSERT INTO `modelos_x_marca` VALUES (2, 16);
INSERT INTO `modelos_x_marca` VALUES (2, 17);
INSERT INTO `modelos_x_marca` VALUES (2, 18);
INSERT INTO `modelos_x_marca` VALUES (2, 19);
INSERT INTO `modelos_x_marca` VALUES (2, 20);
INSERT INTO `modelos_x_marca` VALUES (2, 21);
INSERT INTO `modelos_x_marca` VALUES (2, 22);
INSERT INTO `modelos_x_marca` VALUES (2, 23);
INSERT INTO `modelos_x_marca` VALUES (2, 24);
INSERT INTO `modelos_x_marca` VALUES (2, 25);
INSERT INTO `modelos_x_marca` VALUES (3, 26);
INSERT INTO `modelos_x_marca` VALUES (3, 27);
INSERT INTO `modelos_x_marca` VALUES (3, 28);
INSERT INTO `modelos_x_marca` VALUES (3, 29);
INSERT INTO `modelos_x_marca` VALUES (4, 30);
INSERT INTO `modelos_x_marca` VALUES (5, 31);
INSERT INTO `modelos_x_marca` VALUES (6, 32);
INSERT INTO `modelos_x_marca` VALUES (6, 33);
INSERT INTO `modelos_x_marca` VALUES (6, 34);
INSERT INTO `modelos_x_marca` VALUES (6, 35);
INSERT INTO `modelos_x_marca` VALUES (6, 36);
INSERT INTO `modelos_x_marca` VALUES (6, 37);
INSERT INTO `modelos_x_marca` VALUES (6, 38);
INSERT INTO `modelos_x_marca` VALUES (6, 39);
INSERT INTO `modelos_x_marca` VALUES (6, 40);
INSERT INTO `modelos_x_marca` VALUES (6, 41);
INSERT INTO `modelos_x_marca` VALUES (6, 42);
INSERT INTO `modelos_x_marca` VALUES (6, 43);
INSERT INTO `modelos_x_marca` VALUES (6, 44);
INSERT INTO `modelos_x_marca` VALUES (7, 45);
INSERT INTO `modelos_x_marca` VALUES (7, 46);
INSERT INTO `modelos_x_marca` VALUES (7, 47);
INSERT INTO `modelos_x_marca` VALUES (7, 48);
INSERT INTO `modelos_x_marca` VALUES (7, 49);
INSERT INTO `modelos_x_marca` VALUES (7, 50);
INSERT INTO `modelos_x_marca` VALUES (7, 51);
INSERT INTO `modelos_x_marca` VALUES (7, 52);
INSERT INTO `modelos_x_marca` VALUES (7, 53);
INSERT INTO `modelos_x_marca` VALUES (7, 54);
INSERT INTO `modelos_x_marca` VALUES (7, 55);
INSERT INTO `modelos_x_marca` VALUES (7, 56);
INSERT INTO `modelos_x_marca` VALUES (7, 57);
INSERT INTO `modelos_x_marca` VALUES (7, 58);
INSERT INTO `modelos_x_marca` VALUES (7, 59);
INSERT INTO `modelos_x_marca` VALUES (7, 60);
INSERT INTO `modelos_x_marca` VALUES (7, 61);
INSERT INTO `modelos_x_marca` VALUES (7, 62);
INSERT INTO `modelos_x_marca` VALUES (7, 63);
INSERT INTO `modelos_x_marca` VALUES (7, 64);
INSERT INTO `modelos_x_marca` VALUES (7, 65);
INSERT INTO `modelos_x_marca` VALUES (7, 66);
INSERT INTO `modelos_x_marca` VALUES (7, 67);
INSERT INTO `modelos_x_marca` VALUES (7, 68);
INSERT INTO `modelos_x_marca` VALUES (7, 69);
INSERT INTO `modelos_x_marca` VALUES (7, 70);
INSERT INTO `modelos_x_marca` VALUES (7, 71);
INSERT INTO `modelos_x_marca` VALUES (7, 72);
INSERT INTO `modelos_x_marca` VALUES (7, 73);
INSERT INTO `modelos_x_marca` VALUES (7, 74);
INSERT INTO `modelos_x_marca` VALUES (7, 75);
INSERT INTO `modelos_x_marca` VALUES (7, 76);
INSERT INTO `modelos_x_marca` VALUES (7, 77);
INSERT INTO `modelos_x_marca` VALUES (7, 78);
INSERT INTO `modelos_x_marca` VALUES (7, 79);
INSERT INTO `modelos_x_marca` VALUES (7, 80);
INSERT INTO `modelos_x_marca` VALUES (7, 81);
INSERT INTO `modelos_x_marca` VALUES (7, 82);
INSERT INTO `modelos_x_marca` VALUES (8, 83);
INSERT INTO `modelos_x_marca` VALUES (8, 84);
INSERT INTO `modelos_x_marca` VALUES (8, 85);
INSERT INTO `modelos_x_marca` VALUES (8, 86);
INSERT INTO `modelos_x_marca` VALUES (8, 87);
INSERT INTO `modelos_x_marca` VALUES (9, 88);
INSERT INTO `modelos_x_marca` VALUES (10, 89);
INSERT INTO `modelos_x_marca` VALUES (10, 90);
INSERT INTO `modelos_x_marca` VALUES (10, 91);
INSERT INTO `modelos_x_marca` VALUES (10, 92);
INSERT INTO `modelos_x_marca` VALUES (10, 93);
INSERT INTO `modelos_x_marca` VALUES (10, 94);
INSERT INTO `modelos_x_marca` VALUES (10, 95);
INSERT INTO `modelos_x_marca` VALUES (10, 96);
INSERT INTO `modelos_x_marca` VALUES (10, 97);
INSERT INTO `modelos_x_marca` VALUES (10, 98);
INSERT INTO `modelos_x_marca` VALUES (10, 99);
INSERT INTO `modelos_x_marca` VALUES (10, 100);
INSERT INTO `modelos_x_marca` VALUES (11, 101);
INSERT INTO `modelos_x_marca` VALUES (12, 102);
INSERT INTO `modelos_x_marca` VALUES (12, 103);
INSERT INTO `modelos_x_marca` VALUES (12, 104);
INSERT INTO `modelos_x_marca` VALUES (12, 105);
INSERT INTO `modelos_x_marca` VALUES (12, 106);
INSERT INTO `modelos_x_marca` VALUES (12, 107);
INSERT INTO `modelos_x_marca` VALUES (12, 108);
INSERT INTO `modelos_x_marca` VALUES (12, 109);
INSERT INTO `modelos_x_marca` VALUES (12, 110);
INSERT INTO `modelos_x_marca` VALUES (12, 111);
INSERT INTO `modelos_x_marca` VALUES (12, 112);
INSERT INTO `modelos_x_marca` VALUES (12, 113);
INSERT INTO `modelos_x_marca` VALUES (12, 114);
INSERT INTO `modelos_x_marca` VALUES (12, 115);
INSERT INTO `modelos_x_marca` VALUES (12, 116);
INSERT INTO `modelos_x_marca` VALUES (13, 117);
INSERT INTO `modelos_x_marca` VALUES (13, 118);
INSERT INTO `modelos_x_marca` VALUES (13, 119);
INSERT INTO `modelos_x_marca` VALUES (13, 120);
INSERT INTO `modelos_x_marca` VALUES (13, 121);
INSERT INTO `modelos_x_marca` VALUES (13, 122);
INSERT INTO `modelos_x_marca` VALUES (13, 123);
INSERT INTO `modelos_x_marca` VALUES (13, 124);
INSERT INTO `modelos_x_marca` VALUES (14, 125);
INSERT INTO `modelos_x_marca` VALUES (14, 126);
INSERT INTO `modelos_x_marca` VALUES (14, 127);
INSERT INTO `modelos_x_marca` VALUES (14, 128);
INSERT INTO `modelos_x_marca` VALUES (14, 129);
INSERT INTO `modelos_x_marca` VALUES (14, 130);
INSERT INTO `modelos_x_marca` VALUES (14, 131);
INSERT INTO `modelos_x_marca` VALUES (14, 132);
INSERT INTO `modelos_x_marca` VALUES (14, 133);
INSERT INTO `modelos_x_marca` VALUES (14, 134);
INSERT INTO `modelos_x_marca` VALUES (14, 135);
INSERT INTO `modelos_x_marca` VALUES (14, 136);
INSERT INTO `modelos_x_marca` VALUES (14, 137);
INSERT INTO `modelos_x_marca` VALUES (14, 138);
INSERT INTO `modelos_x_marca` VALUES (14, 139);
INSERT INTO `modelos_x_marca` VALUES (14, 140);
INSERT INTO `modelos_x_marca` VALUES (14, 141);
INSERT INTO `modelos_x_marca` VALUES (14, 142);
INSERT INTO `modelos_x_marca` VALUES (14, 143);
INSERT INTO `modelos_x_marca` VALUES (14, 144);
INSERT INTO `modelos_x_marca` VALUES (14, 145);
INSERT INTO `modelos_x_marca` VALUES (14, 146);
INSERT INTO `modelos_x_marca` VALUES (14, 147);
INSERT INTO `modelos_x_marca` VALUES (15, 148);
INSERT INTO `modelos_x_marca` VALUES (15, 149);
INSERT INTO `modelos_x_marca` VALUES (15, 150);
INSERT INTO `modelos_x_marca` VALUES (15, 151);
INSERT INTO `modelos_x_marca` VALUES (15, 152);
INSERT INTO `modelos_x_marca` VALUES (15, 153);
INSERT INTO `modelos_x_marca` VALUES (15, 154);
INSERT INTO `modelos_x_marca` VALUES (15, 155);
INSERT INTO `modelos_x_marca` VALUES (15, 156);
INSERT INTO `modelos_x_marca` VALUES (15, 157);
INSERT INTO `modelos_x_marca` VALUES (15, 158);
INSERT INTO `modelos_x_marca` VALUES (15, 159);
INSERT INTO `modelos_x_marca` VALUES (15, 160);
INSERT INTO `modelos_x_marca` VALUES (15, 161);
INSERT INTO `modelos_x_marca` VALUES (15, 162);
INSERT INTO `modelos_x_marca` VALUES (16, 163);
INSERT INTO `modelos_x_marca` VALUES (16, 164);
INSERT INTO `modelos_x_marca` VALUES (16, 165);
INSERT INTO `modelos_x_marca` VALUES (16, 166);
INSERT INTO `modelos_x_marca` VALUES (16, 167);
INSERT INTO `modelos_x_marca` VALUES (16, 168);
INSERT INTO `modelos_x_marca` VALUES (16, 169);
INSERT INTO `modelos_x_marca` VALUES (16, 170);
INSERT INTO `modelos_x_marca` VALUES (16, 171);
INSERT INTO `modelos_x_marca` VALUES (16, 172);
INSERT INTO `modelos_x_marca` VALUES (16, 173);
INSERT INTO `modelos_x_marca` VALUES (16, 174);
INSERT INTO `modelos_x_marca` VALUES (16, 175);
INSERT INTO `modelos_x_marca` VALUES (16, 176);
INSERT INTO `modelos_x_marca` VALUES (16, 177);
INSERT INTO `modelos_x_marca` VALUES (16, 178);
INSERT INTO `modelos_x_marca` VALUES (16, 179);
INSERT INTO `modelos_x_marca` VALUES (16, 180);
INSERT INTO `modelos_x_marca` VALUES (16, 181);
INSERT INTO `modelos_x_marca` VALUES (16, 182);
INSERT INTO `modelos_x_marca` VALUES (16, 183);
INSERT INTO `modelos_x_marca` VALUES (16, 184);
INSERT INTO `modelos_x_marca` VALUES (16, 185);
INSERT INTO `modelos_x_marca` VALUES (16, 186);
INSERT INTO `modelos_x_marca` VALUES (16, 187);
INSERT INTO `modelos_x_marca` VALUES (16, 188);
INSERT INTO `modelos_x_marca` VALUES (16, 189);
INSERT INTO `modelos_x_marca` VALUES (16, 190);
INSERT INTO `modelos_x_marca` VALUES (16, 191);
INSERT INTO `modelos_x_marca` VALUES (16, 192);
INSERT INTO `modelos_x_marca` VALUES (16, 193);
INSERT INTO `modelos_x_marca` VALUES (16, 194);
INSERT INTO `modelos_x_marca` VALUES (16, 195);
INSERT INTO `modelos_x_marca` VALUES (16, 196);
INSERT INTO `modelos_x_marca` VALUES (16, 197);
INSERT INTO `modelos_x_marca` VALUES (16, 198);
INSERT INTO `modelos_x_marca` VALUES (16, 199);
INSERT INTO `modelos_x_marca` VALUES (16, 200);
INSERT INTO `modelos_x_marca` VALUES (16, 201);
INSERT INTO `modelos_x_marca` VALUES (16, 202);
INSERT INTO `modelos_x_marca` VALUES (17, 203);
INSERT INTO `modelos_x_marca` VALUES (18, 204);
INSERT INTO `modelos_x_marca` VALUES (18, 205);
INSERT INTO `modelos_x_marca` VALUES (18, 206);
INSERT INTO `modelos_x_marca` VALUES (18, 207);
INSERT INTO `modelos_x_marca` VALUES (18, 208);
INSERT INTO `modelos_x_marca` VALUES (19, 209);
INSERT INTO `modelos_x_marca` VALUES (19, 210);
INSERT INTO `modelos_x_marca` VALUES (19, 211);
INSERT INTO `modelos_x_marca` VALUES (19, 212);
INSERT INTO `modelos_x_marca` VALUES (19, 213);
INSERT INTO `modelos_x_marca` VALUES (19, 214);
INSERT INTO `modelos_x_marca` VALUES (19, 215);
INSERT INTO `modelos_x_marca` VALUES (19, 216);
INSERT INTO `modelos_x_marca` VALUES (19, 217);
INSERT INTO `modelos_x_marca` VALUES (19, 218);
INSERT INTO `modelos_x_marca` VALUES (19, 219);
INSERT INTO `modelos_x_marca` VALUES (19, 220);
INSERT INTO `modelos_x_marca` VALUES (21, 221);
INSERT INTO `modelos_x_marca` VALUES (21, 222);
INSERT INTO `modelos_x_marca` VALUES (21, 223);
INSERT INTO `modelos_x_marca` VALUES (21, 224);
INSERT INTO `modelos_x_marca` VALUES (21, 225);
INSERT INTO `modelos_x_marca` VALUES (21, 226);
INSERT INTO `modelos_x_marca` VALUES (22, 227);
INSERT INTO `modelos_x_marca` VALUES (22, 228);
INSERT INTO `modelos_x_marca` VALUES (22, 229);
INSERT INTO `modelos_x_marca` VALUES (22, 230);
INSERT INTO `modelos_x_marca` VALUES (22, 231);
INSERT INTO `modelos_x_marca` VALUES (23, 232);
INSERT INTO `modelos_x_marca` VALUES (23, 233);
INSERT INTO `modelos_x_marca` VALUES (23, 234);
INSERT INTO `modelos_x_marca` VALUES (23, 235);
INSERT INTO `modelos_x_marca` VALUES (23, 236);
INSERT INTO `modelos_x_marca` VALUES (24, 237);
INSERT INTO `modelos_x_marca` VALUES (24, 238);
INSERT INTO `modelos_x_marca` VALUES (24, 239);
INSERT INTO `modelos_x_marca` VALUES (24, 240);
INSERT INTO `modelos_x_marca` VALUES (24, 241);
INSERT INTO `modelos_x_marca` VALUES (24, 242);
INSERT INTO `modelos_x_marca` VALUES (24, 243);
INSERT INTO `modelos_x_marca` VALUES (24, 244);
INSERT INTO `modelos_x_marca` VALUES (24, 245);
INSERT INTO `modelos_x_marca` VALUES (24, 246);
INSERT INTO `modelos_x_marca` VALUES (24, 247);
INSERT INTO `modelos_x_marca` VALUES (24, 248);
INSERT INTO `modelos_x_marca` VALUES (24, 249);
INSERT INTO `modelos_x_marca` VALUES (24, 250);
INSERT INTO `modelos_x_marca` VALUES (24, 251);
INSERT INTO `modelos_x_marca` VALUES (24, 252);
INSERT INTO `modelos_x_marca` VALUES (24, 253);
INSERT INTO `modelos_x_marca` VALUES (24, 254);
INSERT INTO `modelos_x_marca` VALUES (24, 255);
INSERT INTO `modelos_x_marca` VALUES (24, 256);
INSERT INTO `modelos_x_marca` VALUES (24, 257);
INSERT INTO `modelos_x_marca` VALUES (24, 258);
INSERT INTO `modelos_x_marca` VALUES (24, 259);
INSERT INTO `modelos_x_marca` VALUES (24, 260);
INSERT INTO `modelos_x_marca` VALUES (24, 261);
INSERT INTO `modelos_x_marca` VALUES (25, 262);
INSERT INTO `modelos_x_marca` VALUES (25, 263);
INSERT INTO `modelos_x_marca` VALUES (25, 264);
INSERT INTO `modelos_x_marca` VALUES (25, 265);
INSERT INTO `modelos_x_marca` VALUES (25, 266);
INSERT INTO `modelos_x_marca` VALUES (25, 267);
INSERT INTO `modelos_x_marca` VALUES (25, 268);
INSERT INTO `modelos_x_marca` VALUES (25, 269);
INSERT INTO `modelos_x_marca` VALUES (25, 270);
INSERT INTO `modelos_x_marca` VALUES (25, 271);
INSERT INTO `modelos_x_marca` VALUES (25, 272);
INSERT INTO `modelos_x_marca` VALUES (25, 273);
INSERT INTO `modelos_x_marca` VALUES (25, 274);
INSERT INTO `modelos_x_marca` VALUES (25, 275);
INSERT INTO `modelos_x_marca` VALUES (25, 276);
INSERT INTO `modelos_x_marca` VALUES (25, 277);
INSERT INTO `modelos_x_marca` VALUES (25, 278);
INSERT INTO `modelos_x_marca` VALUES (25, 279);
INSERT INTO `modelos_x_marca` VALUES (25, 280);
INSERT INTO `modelos_x_marca` VALUES (25, 281);
INSERT INTO `modelos_x_marca` VALUES (25, 282);
INSERT INTO `modelos_x_marca` VALUES (25, 283);
INSERT INTO `modelos_x_marca` VALUES (25, 284);
INSERT INTO `modelos_x_marca` VALUES (25, 285);
INSERT INTO `modelos_x_marca` VALUES (25, 286);
INSERT INTO `modelos_x_marca` VALUES (25, 287);
INSERT INTO `modelos_x_marca` VALUES (25, 288);
INSERT INTO `modelos_x_marca` VALUES (25, 289);
INSERT INTO `modelos_x_marca` VALUES (25, 290);
INSERT INTO `modelos_x_marca` VALUES (25, 291);
INSERT INTO `modelos_x_marca` VALUES (25, 292);
INSERT INTO `modelos_x_marca` VALUES (25, 293);
INSERT INTO `modelos_x_marca` VALUES (25, 294);
INSERT INTO `modelos_x_marca` VALUES (25, 295);
INSERT INTO `modelos_x_marca` VALUES (25, 296);
INSERT INTO `modelos_x_marca` VALUES (25, 297);
INSERT INTO `modelos_x_marca` VALUES (25, 298);
INSERT INTO `modelos_x_marca` VALUES (25, 299);
INSERT INTO `modelos_x_marca` VALUES (25, 300);
INSERT INTO `modelos_x_marca` VALUES (26, 301);
INSERT INTO `modelos_x_marca` VALUES (26, 302);
INSERT INTO `modelos_x_marca` VALUES (26, 303);
INSERT INTO `modelos_x_marca` VALUES (26, 304);
INSERT INTO `modelos_x_marca` VALUES (26, 305);
INSERT INTO `modelos_x_marca` VALUES (26, 306);
INSERT INTO `modelos_x_marca` VALUES (26, 307);
INSERT INTO `modelos_x_marca` VALUES (26, 308);
INSERT INTO `modelos_x_marca` VALUES (26, 309);
INSERT INTO `modelos_x_marca` VALUES (26, 310);
INSERT INTO `modelos_x_marca` VALUES (26, 311);
INSERT INTO `modelos_x_marca` VALUES (26, 312);
INSERT INTO `modelos_x_marca` VALUES (26, 313);
INSERT INTO `modelos_x_marca` VALUES (26, 314);
INSERT INTO `modelos_x_marca` VALUES (26, 315);
INSERT INTO `modelos_x_marca` VALUES (26, 316);
INSERT INTO `modelos_x_marca` VALUES (26, 317);
INSERT INTO `modelos_x_marca` VALUES (26, 318);
INSERT INTO `modelos_x_marca` VALUES (26, 319);
INSERT INTO `modelos_x_marca` VALUES (26, 320);
INSERT INTO `modelos_x_marca` VALUES (26, 321);
INSERT INTO `modelos_x_marca` VALUES (26, 322);
INSERT INTO `modelos_x_marca` VALUES (26, 323);
INSERT INTO `modelos_x_marca` VALUES (26, 324);
INSERT INTO `modelos_x_marca` VALUES (26, 325);
INSERT INTO `modelos_x_marca` VALUES (26, 326);
INSERT INTO `modelos_x_marca` VALUES (26, 327);
INSERT INTO `modelos_x_marca` VALUES (26, 328);
INSERT INTO `modelos_x_marca` VALUES (26, 329);
INSERT INTO `modelos_x_marca` VALUES (27, 330);
INSERT INTO `modelos_x_marca` VALUES (27, 331);
INSERT INTO `modelos_x_marca` VALUES (27, 332);
INSERT INTO `modelos_x_marca` VALUES (29, 333);
INSERT INTO `modelos_x_marca` VALUES (29, 334);
INSERT INTO `modelos_x_marca` VALUES (29, 335);
INSERT INTO `modelos_x_marca` VALUES (29, 336);
INSERT INTO `modelos_x_marca` VALUES (29, 337);
INSERT INTO `modelos_x_marca` VALUES (29, 338);
INSERT INTO `modelos_x_marca` VALUES (29, 339);
INSERT INTO `modelos_x_marca` VALUES (29, 340);
INSERT INTO `modelos_x_marca` VALUES (29, 341);
INSERT INTO `modelos_x_marca` VALUES (29, 342);
INSERT INTO `modelos_x_marca` VALUES (29, 343);
INSERT INTO `modelos_x_marca` VALUES (29, 344);
INSERT INTO `modelos_x_marca` VALUES (29, 345);
INSERT INTO `modelos_x_marca` VALUES (29, 346);
INSERT INTO `modelos_x_marca` VALUES (29, 347);
INSERT INTO `modelos_x_marca` VALUES (29, 348);
INSERT INTO `modelos_x_marca` VALUES (30, 349);
INSERT INTO `modelos_x_marca` VALUES (30, 350);
INSERT INTO `modelos_x_marca` VALUES (30, 351);
INSERT INTO `modelos_x_marca` VALUES (31, 352);
INSERT INTO `modelos_x_marca` VALUES (31, 353);
INSERT INTO `modelos_x_marca` VALUES (31, 354);
INSERT INTO `modelos_x_marca` VALUES (31, 355);
INSERT INTO `modelos_x_marca` VALUES (31, 356);
INSERT INTO `modelos_x_marca` VALUES (31, 357);
INSERT INTO `modelos_x_marca` VALUES (31, 358);
INSERT INTO `modelos_x_marca` VALUES (31, 359);
INSERT INTO `modelos_x_marca` VALUES (31, 360);
INSERT INTO `modelos_x_marca` VALUES (31, 361);
INSERT INTO `modelos_x_marca` VALUES (31, 362);
INSERT INTO `modelos_x_marca` VALUES (31, 363);
INSERT INTO `modelos_x_marca` VALUES (31, 364);
INSERT INTO `modelos_x_marca` VALUES (31, 365);
INSERT INTO `modelos_x_marca` VALUES (31, 366);
INSERT INTO `modelos_x_marca` VALUES (31, 367);
INSERT INTO `modelos_x_marca` VALUES (31, 368);
INSERT INTO `modelos_x_marca` VALUES (31, 369);
INSERT INTO `modelos_x_marca` VALUES (31, 370);
INSERT INTO `modelos_x_marca` VALUES (31, 371);
INSERT INTO `modelos_x_marca` VALUES (31, 372);
INSERT INTO `modelos_x_marca` VALUES (31, 373);
INSERT INTO `modelos_x_marca` VALUES (31, 374);
INSERT INTO `modelos_x_marca` VALUES (31, 375);
INSERT INTO `modelos_x_marca` VALUES (31, 376);
INSERT INTO `modelos_x_marca` VALUES (31, 377);
INSERT INTO `modelos_x_marca` VALUES (31, 378);
INSERT INTO `modelos_x_marca` VALUES (31, 379);
INSERT INTO `modelos_x_marca` VALUES (31, 380);
INSERT INTO `modelos_x_marca` VALUES (32, 381);
INSERT INTO `modelos_x_marca` VALUES (32, 382);
INSERT INTO `modelos_x_marca` VALUES (32, 383);
INSERT INTO `modelos_x_marca` VALUES (32, 384);
INSERT INTO `modelos_x_marca` VALUES (33, 385);
INSERT INTO `modelos_x_marca` VALUES (33, 386);
INSERT INTO `modelos_x_marca` VALUES (34, 387);
INSERT INTO `modelos_x_marca` VALUES (34, 388);
INSERT INTO `modelos_x_marca` VALUES (34, 389);
INSERT INTO `modelos_x_marca` VALUES (34, 390);
INSERT INTO `modelos_x_marca` VALUES (34, 391);
INSERT INTO `modelos_x_marca` VALUES (34, 392);
INSERT INTO `modelos_x_marca` VALUES (35, 393);
INSERT INTO `modelos_x_marca` VALUES (35, 394);
INSERT INTO `modelos_x_marca` VALUES (36, 395);
INSERT INTO `modelos_x_marca` VALUES (36, 396);
INSERT INTO `modelos_x_marca` VALUES (37, 397);
INSERT INTO `modelos_x_marca` VALUES (37, 398);
INSERT INTO `modelos_x_marca` VALUES (37, 399);
INSERT INTO `modelos_x_marca` VALUES (37, 400);
INSERT INTO `modelos_x_marca` VALUES (37, 401);
INSERT INTO `modelos_x_marca` VALUES (37, 402);
INSERT INTO `modelos_x_marca` VALUES (38, 403);
INSERT INTO `modelos_x_marca` VALUES (38, 404);
INSERT INTO `modelos_x_marca` VALUES (38, 405);
INSERT INTO `modelos_x_marca` VALUES (38, 406);
INSERT INTO `modelos_x_marca` VALUES (38, 407);
INSERT INTO `modelos_x_marca` VALUES (38, 408);
INSERT INTO `modelos_x_marca` VALUES (38, 409);
INSERT INTO `modelos_x_marca` VALUES (39, 410);
INSERT INTO `modelos_x_marca` VALUES (39, 411);
INSERT INTO `modelos_x_marca` VALUES (39, 412);
INSERT INTO `modelos_x_marca` VALUES (39, 413);
INSERT INTO `modelos_x_marca` VALUES (39, 414);
INSERT INTO `modelos_x_marca` VALUES (39, 415);
INSERT INTO `modelos_x_marca` VALUES (39, 416);
INSERT INTO `modelos_x_marca` VALUES (39, 417);
INSERT INTO `modelos_x_marca` VALUES (39, 418);
INSERT INTO `modelos_x_marca` VALUES (39, 419);
INSERT INTO `modelos_x_marca` VALUES (39, 420);
INSERT INTO `modelos_x_marca` VALUES (39, 421);
INSERT INTO `modelos_x_marca` VALUES (39, 422);
INSERT INTO `modelos_x_marca` VALUES (39, 423);
INSERT INTO `modelos_x_marca` VALUES (39, 424);
INSERT INTO `modelos_x_marca` VALUES (39, 425);
INSERT INTO `modelos_x_marca` VALUES (39, 426);
INSERT INTO `modelos_x_marca` VALUES (39, 427);
INSERT INTO `modelos_x_marca` VALUES (39, 428);
INSERT INTO `modelos_x_marca` VALUES (39, 429);
INSERT INTO `modelos_x_marca` VALUES (39, 430);
INSERT INTO `modelos_x_marca` VALUES (39, 431);
INSERT INTO `modelos_x_marca` VALUES (39, 432);
INSERT INTO `modelos_x_marca` VALUES (39, 433);
INSERT INTO `modelos_x_marca` VALUES (40, 434);
INSERT INTO `modelos_x_marca` VALUES (40, 435);
INSERT INTO `modelos_x_marca` VALUES (40, 436);
INSERT INTO `modelos_x_marca` VALUES (40, 437);
INSERT INTO `modelos_x_marca` VALUES (40, 438);
INSERT INTO `modelos_x_marca` VALUES (40, 439);
INSERT INTO `modelos_x_marca` VALUES (40, 440);
INSERT INTO `modelos_x_marca` VALUES (40, 441);
INSERT INTO `modelos_x_marca` VALUES (41, 442);
INSERT INTO `modelos_x_marca` VALUES (41, 443);
INSERT INTO `modelos_x_marca` VALUES (41, 444);
INSERT INTO `modelos_x_marca` VALUES (42, 445);
INSERT INTO `modelos_x_marca` VALUES (42, 446);
INSERT INTO `modelos_x_marca` VALUES (42, 447);
INSERT INTO `modelos_x_marca` VALUES (42, 448);
INSERT INTO `modelos_x_marca` VALUES (42, 449);
INSERT INTO `modelos_x_marca` VALUES (42, 450);
INSERT INTO `modelos_x_marca` VALUES (42, 451);
INSERT INTO `modelos_x_marca` VALUES (42, 452);
INSERT INTO `modelos_x_marca` VALUES (42, 453);
INSERT INTO `modelos_x_marca` VALUES (42, 454);
INSERT INTO `modelos_x_marca` VALUES (42, 455);
INSERT INTO `modelos_x_marca` VALUES (42, 456);
INSERT INTO `modelos_x_marca` VALUES (42, 457);
INSERT INTO `modelos_x_marca` VALUES (42, 458);
INSERT INTO `modelos_x_marca` VALUES (42, 459);
INSERT INTO `modelos_x_marca` VALUES (42, 460);
INSERT INTO `modelos_x_marca` VALUES (42, 461);
INSERT INTO `modelos_x_marca` VALUES (42, 462);
INSERT INTO `modelos_x_marca` VALUES (42, 463);
INSERT INTO `modelos_x_marca` VALUES (43, 464);
INSERT INTO `modelos_x_marca` VALUES (43, 465);
INSERT INTO `modelos_x_marca` VALUES (43, 466);
INSERT INTO `modelos_x_marca` VALUES (43, 467);
INSERT INTO `modelos_x_marca` VALUES (43, 468);
INSERT INTO `modelos_x_marca` VALUES (43, 469);
INSERT INTO `modelos_x_marca` VALUES (43, 470);
INSERT INTO `modelos_x_marca` VALUES (44, 471);
INSERT INTO `modelos_x_marca` VALUES (45, 472);
INSERT INTO `modelos_x_marca` VALUES (45, 473);
INSERT INTO `modelos_x_marca` VALUES (45, 474);
INSERT INTO `modelos_x_marca` VALUES (45, 475);
INSERT INTO `modelos_x_marca` VALUES (45, 476);
INSERT INTO `modelos_x_marca` VALUES (45, 477);
INSERT INTO `modelos_x_marca` VALUES (45, 478);
INSERT INTO `modelos_x_marca` VALUES (45, 479);
INSERT INTO `modelos_x_marca` VALUES (45, 480);
INSERT INTO `modelos_x_marca` VALUES (45, 481);
INSERT INTO `modelos_x_marca` VALUES (45, 482);
INSERT INTO `modelos_x_marca` VALUES (45, 483);
INSERT INTO `modelos_x_marca` VALUES (45, 484);
INSERT INTO `modelos_x_marca` VALUES (45, 485);
INSERT INTO `modelos_x_marca` VALUES (45, 486);
INSERT INTO `modelos_x_marca` VALUES (45, 487);
INSERT INTO `modelos_x_marca` VALUES (45, 488);
INSERT INTO `modelos_x_marca` VALUES (45, 489);
INSERT INTO `modelos_x_marca` VALUES (45, 490);
INSERT INTO `modelos_x_marca` VALUES (45, 491);
INSERT INTO `modelos_x_marca` VALUES (45, 492);
INSERT INTO `modelos_x_marca` VALUES (45, 493);
INSERT INTO `modelos_x_marca` VALUES (46, 494);
INSERT INTO `modelos_x_marca` VALUES (46, 495);
INSERT INTO `modelos_x_marca` VALUES (47, 496);
INSERT INTO `modelos_x_marca` VALUES (47, 497);
INSERT INTO `modelos_x_marca` VALUES (47, 498);
INSERT INTO `modelos_x_marca` VALUES (47, 499);
INSERT INTO `modelos_x_marca` VALUES (47, 500);
INSERT INTO `modelos_x_marca` VALUES (47, 501);
INSERT INTO `modelos_x_marca` VALUES (48, 502);
INSERT INTO `modelos_x_marca` VALUES (48, 503);
INSERT INTO `modelos_x_marca` VALUES (48, 504);
INSERT INTO `modelos_x_marca` VALUES (48, 505);
INSERT INTO `modelos_x_marca` VALUES (48, 506);
INSERT INTO `modelos_x_marca` VALUES (48, 507);
INSERT INTO `modelos_x_marca` VALUES (48, 508);
INSERT INTO `modelos_x_marca` VALUES (48, 509);
INSERT INTO `modelos_x_marca` VALUES (48, 510);
INSERT INTO `modelos_x_marca` VALUES (48, 511);
INSERT INTO `modelos_x_marca` VALUES (48, 512);
INSERT INTO `modelos_x_marca` VALUES (48, 513);
INSERT INTO `modelos_x_marca` VALUES (48, 514);
INSERT INTO `modelos_x_marca` VALUES (49, 515);
INSERT INTO `modelos_x_marca` VALUES (50, 516);
INSERT INTO `modelos_x_marca` VALUES (50, 517);
INSERT INTO `modelos_x_marca` VALUES (50, 518);
INSERT INTO `modelos_x_marca` VALUES (50, 519);
INSERT INTO `modelos_x_marca` VALUES (50, 520);
INSERT INTO `modelos_x_marca` VALUES (50, 521);
INSERT INTO `modelos_x_marca` VALUES (50, 522);
INSERT INTO `modelos_x_marca` VALUES (50, 523);
INSERT INTO `modelos_x_marca` VALUES (50, 524);
INSERT INTO `modelos_x_marca` VALUES (50, 525);
INSERT INTO `modelos_x_marca` VALUES (50, 526);
INSERT INTO `modelos_x_marca` VALUES (50, 527);
INSERT INTO `modelos_x_marca` VALUES (50, 528);
INSERT INTO `modelos_x_marca` VALUES (50, 529);
INSERT INTO `modelos_x_marca` VALUES (50, 530);
INSERT INTO `modelos_x_marca` VALUES (50, 531);
INSERT INTO `modelos_x_marca` VALUES (50, 532);
INSERT INTO `modelos_x_marca` VALUES (50, 533);
INSERT INTO `modelos_x_marca` VALUES (50, 534);
INSERT INTO `modelos_x_marca` VALUES (50, 535);
INSERT INTO `modelos_x_marca` VALUES (50, 536);
INSERT INTO `modelos_x_marca` VALUES (50, 537);
INSERT INTO `modelos_x_marca` VALUES (50, 538);
INSERT INTO `modelos_x_marca` VALUES (50, 539);
INSERT INTO `modelos_x_marca` VALUES (51, 540);
INSERT INTO `modelos_x_marca` VALUES (51, 541);
INSERT INTO `modelos_x_marca` VALUES (51, 542);
INSERT INTO `modelos_x_marca` VALUES (51, 543);
INSERT INTO `modelos_x_marca` VALUES (51, 544);
INSERT INTO `modelos_x_marca` VALUES (51, 545);
INSERT INTO `modelos_x_marca` VALUES (51, 546);
INSERT INTO `modelos_x_marca` VALUES (51, 547);
INSERT INTO `modelos_x_marca` VALUES (51, 548);
INSERT INTO `modelos_x_marca` VALUES (51, 549);
INSERT INTO `modelos_x_marca` VALUES (51, 550);
INSERT INTO `modelos_x_marca` VALUES (51, 551);
INSERT INTO `modelos_x_marca` VALUES (51, 552);
INSERT INTO `modelos_x_marca` VALUES (51, 553);
INSERT INTO `modelos_x_marca` VALUES (51, 554);
INSERT INTO `modelos_x_marca` VALUES (51, 555);
INSERT INTO `modelos_x_marca` VALUES (51, 556);
INSERT INTO `modelos_x_marca` VALUES (51, 557);
INSERT INTO `modelos_x_marca` VALUES (51, 558);
INSERT INTO `modelos_x_marca` VALUES (51, 559);
INSERT INTO `modelos_x_marca` VALUES (51, 560);
INSERT INTO `modelos_x_marca` VALUES (51, 561);
INSERT INTO `modelos_x_marca` VALUES (51, 562);
INSERT INTO `modelos_x_marca` VALUES (51, 563);
INSERT INTO `modelos_x_marca` VALUES (51, 564);
INSERT INTO `modelos_x_marca` VALUES (51, 565);
INSERT INTO `modelos_x_marca` VALUES (51, 566);
INSERT INTO `modelos_x_marca` VALUES (51, 567);
INSERT INTO `modelos_x_marca` VALUES (51, 568);
INSERT INTO `modelos_x_marca` VALUES (51, 569);
INSERT INTO `modelos_x_marca` VALUES (51, 570);
INSERT INTO `modelos_x_marca` VALUES (51, 571);
INSERT INTO `modelos_x_marca` VALUES (51, 572);
INSERT INTO `modelos_x_marca` VALUES (51, 573);
INSERT INTO `modelos_x_marca` VALUES (51, 574);
INSERT INTO `modelos_x_marca` VALUES (51, 575);
INSERT INTO `modelos_x_marca` VALUES (51, 576);
INSERT INTO `modelos_x_marca` VALUES (51, 577);
INSERT INTO `modelos_x_marca` VALUES (51, 578);
INSERT INTO `modelos_x_marca` VALUES (51, 579);
INSERT INTO `modelos_x_marca` VALUES (52, 580);
INSERT INTO `modelos_x_marca` VALUES (52, 581);
INSERT INTO `modelos_x_marca` VALUES (52, 582);
INSERT INTO `modelos_x_marca` VALUES (52, 583);
INSERT INTO `modelos_x_marca` VALUES (52, 584);
INSERT INTO `modelos_x_marca` VALUES (52, 585);
INSERT INTO `modelos_x_marca` VALUES (52, 586);
INSERT INTO `modelos_x_marca` VALUES (52, 587);
INSERT INTO `modelos_x_marca` VALUES (52, 588);
INSERT INTO `modelos_x_marca` VALUES (54, 589);
INSERT INTO `modelos_x_marca` VALUES (54, 590);
INSERT INTO `modelos_x_marca` VALUES (54, 591);
INSERT INTO `modelos_x_marca` VALUES (54, 592);
INSERT INTO `modelos_x_marca` VALUES (54, 593);
INSERT INTO `modelos_x_marca` VALUES (54, 594);
INSERT INTO `modelos_x_marca` VALUES (54, 595);
INSERT INTO `modelos_x_marca` VALUES (54, 596);
INSERT INTO `modelos_x_marca` VALUES (54, 597);
INSERT INTO `modelos_x_marca` VALUES (54, 598);
INSERT INTO `modelos_x_marca` VALUES (54, 599);
INSERT INTO `modelos_x_marca` VALUES (54, 600);
INSERT INTO `modelos_x_marca` VALUES (54, 601);
INSERT INTO `modelos_x_marca` VALUES (54, 602);
INSERT INTO `modelos_x_marca` VALUES (54, 603);
INSERT INTO `modelos_x_marca` VALUES (54, 604);
INSERT INTO `modelos_x_marca` VALUES (54, 605);
INSERT INTO `modelos_x_marca` VALUES (54, 606);
INSERT INTO `modelos_x_marca` VALUES (54, 607);
INSERT INTO `modelos_x_marca` VALUES (54, 608);
INSERT INTO `modelos_x_marca` VALUES (55, 609);
INSERT INTO `modelos_x_marca` VALUES (55, 610);
INSERT INTO `modelos_x_marca` VALUES (55, 611);
INSERT INTO `modelos_x_marca` VALUES (55, 612);
INSERT INTO `modelos_x_marca` VALUES (55, 613);
INSERT INTO `modelos_x_marca` VALUES (55, 614);
INSERT INTO `modelos_x_marca` VALUES (55, 615);
INSERT INTO `modelos_x_marca` VALUES (56, 616);
INSERT INTO `modelos_x_marca` VALUES (56, 617);
INSERT INTO `modelos_x_marca` VALUES (56, 618);
INSERT INTO `modelos_x_marca` VALUES (56, 619);
INSERT INTO `modelos_x_marca` VALUES (56, 620);
INSERT INTO `modelos_x_marca` VALUES (56, 621);
INSERT INTO `modelos_x_marca` VALUES (56, 622);
INSERT INTO `modelos_x_marca` VALUES (56, 623);
INSERT INTO `modelos_x_marca` VALUES (56, 624);
INSERT INTO `modelos_x_marca` VALUES (56, 625);
INSERT INTO `modelos_x_marca` VALUES (56, 626);
INSERT INTO `modelos_x_marca` VALUES (56, 627);
INSERT INTO `modelos_x_marca` VALUES (56, 628);
INSERT INTO `modelos_x_marca` VALUES (56, 629);
INSERT INTO `modelos_x_marca` VALUES (56, 630);
INSERT INTO `modelos_x_marca` VALUES (56, 631);
INSERT INTO `modelos_x_marca` VALUES (56, 632);
INSERT INTO `modelos_x_marca` VALUES (56, 633);
INSERT INTO `modelos_x_marca` VALUES (56, 634);
INSERT INTO `modelos_x_marca` VALUES (56, 635);
INSERT INTO `modelos_x_marca` VALUES (56, 636);
INSERT INTO `modelos_x_marca` VALUES (56, 637);
INSERT INTO `modelos_x_marca` VALUES (56, 638);
INSERT INTO `modelos_x_marca` VALUES (56, 639);
INSERT INTO `modelos_x_marca` VALUES (56, 640);
INSERT INTO `modelos_x_marca` VALUES (56, 641);
INSERT INTO `modelos_x_marca` VALUES (56, 642);
INSERT INTO `modelos_x_marca` VALUES (56, 643);
INSERT INTO `modelos_x_marca` VALUES (56, 644);
INSERT INTO `modelos_x_marca` VALUES (56, 645);
INSERT INTO `modelos_x_marca` VALUES (56, 646);
INSERT INTO `modelos_x_marca` VALUES (56, 647);
INSERT INTO `modelos_x_marca` VALUES (56, 648);
INSERT INTO `modelos_x_marca` VALUES (56, 649);
INSERT INTO `modelos_x_marca` VALUES (56, 650);
INSERT INTO `modelos_x_marca` VALUES (56, 651);
INSERT INTO `modelos_x_marca` VALUES (56, 652);
INSERT INTO `modelos_x_marca` VALUES (56, 653);
INSERT INTO `modelos_x_marca` VALUES (56, 654);
INSERT INTO `modelos_x_marca` VALUES (56, 655);
INSERT INTO `modelos_x_marca` VALUES (56, 656);
INSERT INTO `modelos_x_marca` VALUES (57, 657);
INSERT INTO `modelos_x_marca` VALUES (57, 658);
INSERT INTO `modelos_x_marca` VALUES (57, 659);
INSERT INTO `modelos_x_marca` VALUES (57, 660);
INSERT INTO `modelos_x_marca` VALUES (57, 661);
INSERT INTO `modelos_x_marca` VALUES (57, 662);
INSERT INTO `modelos_x_marca` VALUES (57, 663);
INSERT INTO `modelos_x_marca` VALUES (57, 664);
INSERT INTO `modelos_x_marca` VALUES (57, 665);
INSERT INTO `modelos_x_marca` VALUES (57, 666);
INSERT INTO `modelos_x_marca` VALUES (57, 667);
INSERT INTO `modelos_x_marca` VALUES (57, 668);
INSERT INTO `modelos_x_marca` VALUES (57, 669);
INSERT INTO `modelos_x_marca` VALUES (57, 670);
INSERT INTO `modelos_x_marca` VALUES (57, 671);
INSERT INTO `modelos_x_marca` VALUES (57, 672);
INSERT INTO `modelos_x_marca` VALUES (57, 673);
INSERT INTO `modelos_x_marca` VALUES (57, 674);
INSERT INTO `modelos_x_marca` VALUES (57, 675);
INSERT INTO `modelos_x_marca` VALUES (57, 676);
INSERT INTO `modelos_x_marca` VALUES (57, 677);
INSERT INTO `modelos_x_marca` VALUES (57, 678);
INSERT INTO `modelos_x_marca` VALUES (57, 679);
INSERT INTO `modelos_x_marca` VALUES (57, 680);
INSERT INTO `modelos_x_marca` VALUES (57, 681);
INSERT INTO `modelos_x_marca` VALUES (57, 682);
INSERT INTO `modelos_x_marca` VALUES (57, 683);
INSERT INTO `modelos_x_marca` VALUES (57, 684);
INSERT INTO `modelos_x_marca` VALUES (57, 685);
INSERT INTO `modelos_x_marca` VALUES (57, 686);
INSERT INTO `modelos_x_marca` VALUES (58, 687);
INSERT INTO `modelos_x_marca` VALUES (58, 688);
INSERT INTO `modelos_x_marca` VALUES (58, 689);
INSERT INTO `modelos_x_marca` VALUES (58, 690);
INSERT INTO `modelos_x_marca` VALUES (58, 691);
INSERT INTO `modelos_x_marca` VALUES (58, 692);
INSERT INTO `modelos_x_marca` VALUES (58, 693);
INSERT INTO `modelos_x_marca` VALUES (58, 694);
INSERT INTO `modelos_x_marca` VALUES (58, 695);
INSERT INTO `modelos_x_marca` VALUES (58, 696);
INSERT INTO `modelos_x_marca` VALUES (58, 697);
INSERT INTO `modelos_x_marca` VALUES (58, 698);
INSERT INTO `modelos_x_marca` VALUES (58, 699);
INSERT INTO `modelos_x_marca` VALUES (58, 700);
INSERT INTO `modelos_x_marca` VALUES (58, 701);
INSERT INTO `modelos_x_marca` VALUES (58, 702);
INSERT INTO `modelos_x_marca` VALUES (58, 703);
INSERT INTO `modelos_x_marca` VALUES (58, 704);
INSERT INTO `modelos_x_marca` VALUES (58, 705);
INSERT INTO `modelos_x_marca` VALUES (58, 706);
INSERT INTO `modelos_x_marca` VALUES (58, 707);
INSERT INTO `modelos_x_marca` VALUES (58, 708);
INSERT INTO `modelos_x_marca` VALUES (58, 709);
INSERT INTO `modelos_x_marca` VALUES (58, 710);
INSERT INTO `modelos_x_marca` VALUES (58, 711);
INSERT INTO `modelos_x_marca` VALUES (58, 712);
INSERT INTO `modelos_x_marca` VALUES (58, 713);
INSERT INTO `modelos_x_marca` VALUES (58, 714);
INSERT INTO `modelos_x_marca` VALUES (58, 715);
INSERT INTO `modelos_x_marca` VALUES (58, 716);
INSERT INTO `modelos_x_marca` VALUES (58, 717);
INSERT INTO `modelos_x_marca` VALUES (58, 718);
INSERT INTO `modelos_x_marca` VALUES (58, 719);
INSERT INTO `modelos_x_marca` VALUES (58, 720);
INSERT INTO `modelos_x_marca` VALUES (58, 721);
INSERT INTO `modelos_x_marca` VALUES (59, 722);
INSERT INTO `modelos_x_marca` VALUES (59, 723);
INSERT INTO `modelos_x_marca` VALUES (59, 724);
INSERT INTO `modelos_x_marca` VALUES (60, 725);
INSERT INTO `modelos_x_marca` VALUES (60, 726);
INSERT INTO `modelos_x_marca` VALUES (60, 727);
INSERT INTO `modelos_x_marca` VALUES (60, 728);
INSERT INTO `modelos_x_marca` VALUES (60, 729);
INSERT INTO `modelos_x_marca` VALUES (60, 730);
INSERT INTO `modelos_x_marca` VALUES (60, 731);
INSERT INTO `modelos_x_marca` VALUES (60, 732);
INSERT INTO `modelos_x_marca` VALUES (60, 733);
INSERT INTO `modelos_x_marca` VALUES (60, 734);
INSERT INTO `modelos_x_marca` VALUES (60, 735);
INSERT INTO `modelos_x_marca` VALUES (61, 736);
INSERT INTO `modelos_x_marca` VALUES (61, 737);
INSERT INTO `modelos_x_marca` VALUES (61, 738);
INSERT INTO `modelos_x_marca` VALUES (61, 739);
INSERT INTO `modelos_x_marca` VALUES (61, 740);
INSERT INTO `modelos_x_marca` VALUES (61, 741);
INSERT INTO `modelos_x_marca` VALUES (61, 742);
INSERT INTO `modelos_x_marca` VALUES (61, 743);
INSERT INTO `modelos_x_marca` VALUES (61, 744);
INSERT INTO `modelos_x_marca` VALUES (61, 745);
INSERT INTO `modelos_x_marca` VALUES (61, 746);
INSERT INTO `modelos_x_marca` VALUES (61, 747);
INSERT INTO `modelos_x_marca` VALUES (61, 748);
INSERT INTO `modelos_x_marca` VALUES (61, 749);
INSERT INTO `modelos_x_marca` VALUES (61, 750);
INSERT INTO `modelos_x_marca` VALUES (61, 751);
INSERT INTO `modelos_x_marca` VALUES (61, 752);
INSERT INTO `modelos_x_marca` VALUES (61, 753);
INSERT INTO `modelos_x_marca` VALUES (61, 754);
INSERT INTO `modelos_x_marca` VALUES (61, 755);
INSERT INTO `modelos_x_marca` VALUES (61, 756);
INSERT INTO `modelos_x_marca` VALUES (61, 757);
INSERT INTO `modelos_x_marca` VALUES (61, 758);
INSERT INTO `modelos_x_marca` VALUES (61, 759);
INSERT INTO `modelos_x_marca` VALUES (61, 760);
INSERT INTO `modelos_x_marca` VALUES (61, 761);
INSERT INTO `modelos_x_marca` VALUES (61, 762);
INSERT INTO `modelos_x_marca` VALUES (61, 763);
INSERT INTO `modelos_x_marca` VALUES (61, 764);
INSERT INTO `modelos_x_marca` VALUES (61, 765);
INSERT INTO `modelos_x_marca` VALUES (61, 766);
INSERT INTO `modelos_x_marca` VALUES (61, 767);
INSERT INTO `modelos_x_marca` VALUES (61, 768);
INSERT INTO `modelos_x_marca` VALUES (61, 769);
INSERT INTO `modelos_x_marca` VALUES (61, 770);
INSERT INTO `modelos_x_marca` VALUES (61, 771);
INSERT INTO `modelos_x_marca` VALUES (61, 772);
INSERT INTO `modelos_x_marca` VALUES (61, 773);
INSERT INTO `modelos_x_marca` VALUES (61, 774);
INSERT INTO `modelos_x_marca` VALUES (61, 775);
INSERT INTO `modelos_x_marca` VALUES (62, 776);
INSERT INTO `modelos_x_marca` VALUES (62, 777);
INSERT INTO `modelos_x_marca` VALUES (62, 778);
INSERT INTO `modelos_x_marca` VALUES (62, 779);
INSERT INTO `modelos_x_marca` VALUES (62, 780);
INSERT INTO `modelos_x_marca` VALUES (62, 781);
INSERT INTO `modelos_x_marca` VALUES (62, 782);
INSERT INTO `modelos_x_marca` VALUES (62, 783);
INSERT INTO `modelos_x_marca` VALUES (63, 784);
INSERT INTO `modelos_x_marca` VALUES (63, 785);
INSERT INTO `modelos_x_marca` VALUES (63, 786);
INSERT INTO `modelos_x_marca` VALUES (63, 787);
INSERT INTO `modelos_x_marca` VALUES (63, 788);
INSERT INTO `modelos_x_marca` VALUES (63, 789);
INSERT INTO `modelos_x_marca` VALUES (63, 790);
INSERT INTO `modelos_x_marca` VALUES (63, 791);
INSERT INTO `modelos_x_marca` VALUES (63, 792);
INSERT INTO `modelos_x_marca` VALUES (63, 793);
INSERT INTO `modelos_x_marca` VALUES (63, 794);
INSERT INTO `modelos_x_marca` VALUES (63, 795);
INSERT INTO `modelos_x_marca` VALUES (63, 796);
INSERT INTO `modelos_x_marca` VALUES (64, 797);
INSERT INTO `modelos_x_marca` VALUES (64, 798);
INSERT INTO `modelos_x_marca` VALUES (64, 799);
INSERT INTO `modelos_x_marca` VALUES (64, 800);
INSERT INTO `modelos_x_marca` VALUES (64, 801);
INSERT INTO `modelos_x_marca` VALUES (64, 802);
INSERT INTO `modelos_x_marca` VALUES (65, 803);
INSERT INTO `modelos_x_marca` VALUES (65, 804);
INSERT INTO `modelos_x_marca` VALUES (65, 805);
INSERT INTO `modelos_x_marca` VALUES (65, 806);
INSERT INTO `modelos_x_marca` VALUES (66, 807);
INSERT INTO `modelos_x_marca` VALUES (66, 808);
INSERT INTO `modelos_x_marca` VALUES (66, 809);
INSERT INTO `modelos_x_marca` VALUES (66, 810);
INSERT INTO `modelos_x_marca` VALUES (66, 811);
INSERT INTO `modelos_x_marca` VALUES (66, 812);
INSERT INTO `modelos_x_marca` VALUES (66, 813);
INSERT INTO `modelos_x_marca` VALUES (66, 814);
INSERT INTO `modelos_x_marca` VALUES (66, 815);
INSERT INTO `modelos_x_marca` VALUES (66, 816);
INSERT INTO `modelos_x_marca` VALUES (66, 817);
INSERT INTO `modelos_x_marca` VALUES (66, 818);
INSERT INTO `modelos_x_marca` VALUES (66, 819);
INSERT INTO `modelos_x_marca` VALUES (66, 820);
INSERT INTO `modelos_x_marca` VALUES (66, 821);
INSERT INTO `modelos_x_marca` VALUES (66, 822);
INSERT INTO `modelos_x_marca` VALUES (67, 823);
INSERT INTO `modelos_x_marca` VALUES (67, 824);
INSERT INTO `modelos_x_marca` VALUES (67, 825);
INSERT INTO `modelos_x_marca` VALUES (67, 826);
INSERT INTO `modelos_x_marca` VALUES (67, 827);
INSERT INTO `modelos_x_marca` VALUES (67, 828);
INSERT INTO `modelos_x_marca` VALUES (67, 829);
INSERT INTO `modelos_x_marca` VALUES (67, 830);
INSERT INTO `modelos_x_marca` VALUES (67, 831);
INSERT INTO `modelos_x_marca` VALUES (67, 832);
INSERT INTO `modelos_x_marca` VALUES (67, 833);
INSERT INTO `modelos_x_marca` VALUES (67, 834);
INSERT INTO `modelos_x_marca` VALUES (67, 835);
INSERT INTO `modelos_x_marca` VALUES (67, 836);
INSERT INTO `modelos_x_marca` VALUES (67, 837);
INSERT INTO `modelos_x_marca` VALUES (68, 838);
INSERT INTO `modelos_x_marca` VALUES (68, 839);
INSERT INTO `modelos_x_marca` VALUES (68, 840);
INSERT INTO `modelos_x_marca` VALUES (68, 841);
INSERT INTO `modelos_x_marca` VALUES (68, 842);
INSERT INTO `modelos_x_marca` VALUES (68, 843);
INSERT INTO `modelos_x_marca` VALUES (68, 844);
INSERT INTO `modelos_x_marca` VALUES (69, 845);
INSERT INTO `modelos_x_marca` VALUES (69, 846);
INSERT INTO `modelos_x_marca` VALUES (69, 847);
INSERT INTO `modelos_x_marca` VALUES (69, 848);
INSERT INTO `modelos_x_marca` VALUES (69, 849);
INSERT INTO `modelos_x_marca` VALUES (69, 850);
INSERT INTO `modelos_x_marca` VALUES (69, 851);
INSERT INTO `modelos_x_marca` VALUES (69, 852);
INSERT INTO `modelos_x_marca` VALUES (69, 853);
INSERT INTO `modelos_x_marca` VALUES (69, 854);
INSERT INTO `modelos_x_marca` VALUES (69, 855);
INSERT INTO `modelos_x_marca` VALUES (69, 856);
INSERT INTO `modelos_x_marca` VALUES (69, 857);
INSERT INTO `modelos_x_marca` VALUES (70, 858);
INSERT INTO `modelos_x_marca` VALUES (70, 859);
INSERT INTO `modelos_x_marca` VALUES (70, 860);
INSERT INTO `modelos_x_marca` VALUES (70, 861);
INSERT INTO `modelos_x_marca` VALUES (70, 862);
INSERT INTO `modelos_x_marca` VALUES (70, 863);
INSERT INTO `modelos_x_marca` VALUES (70, 864);
INSERT INTO `modelos_x_marca` VALUES (70, 865);
INSERT INTO `modelos_x_marca` VALUES (70, 866);
INSERT INTO `modelos_x_marca` VALUES (70, 867);
INSERT INTO `modelos_x_marca` VALUES (70, 868);
INSERT INTO `modelos_x_marca` VALUES (70, 869);
INSERT INTO `modelos_x_marca` VALUES (70, 870);
INSERT INTO `modelos_x_marca` VALUES (70, 871);
INSERT INTO `modelos_x_marca` VALUES (70, 872);
INSERT INTO `modelos_x_marca` VALUES (71, 873);
INSERT INTO `modelos_x_marca` VALUES (71, 874);
INSERT INTO `modelos_x_marca` VALUES (71, 875);
INSERT INTO `modelos_x_marca` VALUES (71, 876);
INSERT INTO `modelos_x_marca` VALUES (71, 877);
INSERT INTO `modelos_x_marca` VALUES (71, 878);
INSERT INTO `modelos_x_marca` VALUES (71, 879);
INSERT INTO `modelos_x_marca` VALUES (71, 880);
INSERT INTO `modelos_x_marca` VALUES (71, 881);
INSERT INTO `modelos_x_marca` VALUES (71, 882);
INSERT INTO `modelos_x_marca` VALUES (71, 883);
INSERT INTO `modelos_x_marca` VALUES (71, 884);
INSERT INTO `modelos_x_marca` VALUES (71, 885);
INSERT INTO `modelos_x_marca` VALUES (71, 886);
INSERT INTO `modelos_x_marca` VALUES (71, 887);
INSERT INTO `modelos_x_marca` VALUES (72, 888);
INSERT INTO `modelos_x_marca` VALUES (72, 889);
INSERT INTO `modelos_x_marca` VALUES (72, 890);
INSERT INTO `modelos_x_marca` VALUES (72, 891);
INSERT INTO `modelos_x_marca` VALUES (73, 892);
INSERT INTO `modelos_x_marca` VALUES (73, 893);
INSERT INTO `modelos_x_marca` VALUES (73, 894);
INSERT INTO `modelos_x_marca` VALUES (73, 895);
INSERT INTO `modelos_x_marca` VALUES (73, 896);
INSERT INTO `modelos_x_marca` VALUES (73, 897);
INSERT INTO `modelos_x_marca` VALUES (73, 898);
INSERT INTO `modelos_x_marca` VALUES (73, 899);
INSERT INTO `modelos_x_marca` VALUES (73, 900);
INSERT INTO `modelos_x_marca` VALUES (73, 901);
INSERT INTO `modelos_x_marca` VALUES (73, 902);
INSERT INTO `modelos_x_marca` VALUES (73, 903);
INSERT INTO `modelos_x_marca` VALUES (74, 904);
INSERT INTO `modelos_x_marca` VALUES (74, 905);
INSERT INTO `modelos_x_marca` VALUES (74, 906);
INSERT INTO `modelos_x_marca` VALUES (74, 907);
INSERT INTO `modelos_x_marca` VALUES (74, 908);
INSERT INTO `modelos_x_marca` VALUES (74, 909);
INSERT INTO `modelos_x_marca` VALUES (74, 910);
INSERT INTO `modelos_x_marca` VALUES (74, 911);
INSERT INTO `modelos_x_marca` VALUES (74, 912);
INSERT INTO `modelos_x_marca` VALUES (74, 913);
INSERT INTO `modelos_x_marca` VALUES (74, 914);
INSERT INTO `modelos_x_marca` VALUES (74, 915);
INSERT INTO `modelos_x_marca` VALUES (74, 916);
INSERT INTO `modelos_x_marca` VALUES (74, 917);
INSERT INTO `modelos_x_marca` VALUES (74, 918);
INSERT INTO `modelos_x_marca` VALUES (74, 919);
INSERT INTO `modelos_x_marca` VALUES (74, 920);
INSERT INTO `modelos_x_marca` VALUES (74, 921);
INSERT INTO `modelos_x_marca` VALUES (74, 922);
INSERT INTO `modelos_x_marca` VALUES (74, 923);
INSERT INTO `modelos_x_marca` VALUES (74, 924);
INSERT INTO `modelos_x_marca` VALUES (74, 925);
INSERT INTO `modelos_x_marca` VALUES (74, 926);
INSERT INTO `modelos_x_marca` VALUES (74, 927);
INSERT INTO `modelos_x_marca` VALUES (74, 928);
INSERT INTO `modelos_x_marca` VALUES (74, 929);
INSERT INTO `modelos_x_marca` VALUES (74, 930);
INSERT INTO `modelos_x_marca` VALUES (74, 931);
INSERT INTO `modelos_x_marca` VALUES (74, 932);
INSERT INTO `modelos_x_marca` VALUES (74, 933);
INSERT INTO `modelos_x_marca` VALUES (74, 934);
INSERT INTO `modelos_x_marca` VALUES (75, 935);
INSERT INTO `modelos_x_marca` VALUES (75, 936);
INSERT INTO `modelos_x_marca` VALUES (76, 937);
INSERT INTO `modelos_x_marca` VALUES (76, 938);
INSERT INTO `modelos_x_marca` VALUES (76, 939);
INSERT INTO `modelos_x_marca` VALUES (76, 940);
INSERT INTO `modelos_x_marca` VALUES (76, 941);
INSERT INTO `modelos_x_marca` VALUES (77, 942);
INSERT INTO `modelos_x_marca` VALUES (77, 943);
INSERT INTO `modelos_x_marca` VALUES (77, 944);
INSERT INTO `modelos_x_marca` VALUES (77, 945);
INSERT INTO `modelos_x_marca` VALUES (77, 946);
INSERT INTO `modelos_x_marca` VALUES (77, 947);
INSERT INTO `modelos_x_marca` VALUES (77, 948);
INSERT INTO `modelos_x_marca` VALUES (77, 949);
INSERT INTO `modelos_x_marca` VALUES (77, 950);
INSERT INTO `modelos_x_marca` VALUES (77, 951);
INSERT INTO `modelos_x_marca` VALUES (77, 952);
INSERT INTO `modelos_x_marca` VALUES (77, 953);
INSERT INTO `modelos_x_marca` VALUES (77, 954);
INSERT INTO `modelos_x_marca` VALUES (77, 955);
INSERT INTO `modelos_x_marca` VALUES (77, 956);
INSERT INTO `modelos_x_marca` VALUES (77, 957);
INSERT INTO `modelos_x_marca` VALUES (77, 958);
INSERT INTO `modelos_x_marca` VALUES (77, 959);
INSERT INTO `modelos_x_marca` VALUES (77, 960);
INSERT INTO `modelos_x_marca` VALUES (77, 961);
INSERT INTO `modelos_x_marca` VALUES (77, 962);
INSERT INTO `modelos_x_marca` VALUES (77, 963);
INSERT INTO `modelos_x_marca` VALUES (77, 964);
INSERT INTO `modelos_x_marca` VALUES (77, 965);
INSERT INTO `modelos_x_marca` VALUES (77, 966);
INSERT INTO `modelos_x_marca` VALUES (77, 967);
INSERT INTO `modelos_x_marca` VALUES (77, 968);
INSERT INTO `modelos_x_marca` VALUES (77, 969);
INSERT INTO `modelos_x_marca` VALUES (77, 970);
INSERT INTO `modelos_x_marca` VALUES (77, 971);
INSERT INTO `modelos_x_marca` VALUES (77, 972);
INSERT INTO `modelos_x_marca` VALUES (77, 973);
INSERT INTO `modelos_x_marca` VALUES (78, 974);
INSERT INTO `modelos_x_marca` VALUES (78, 975);
INSERT INTO `modelos_x_marca` VALUES (78, 976);
INSERT INTO `modelos_x_marca` VALUES (78, 977);
INSERT INTO `modelos_x_marca` VALUES (78, 978);
INSERT INTO `modelos_x_marca` VALUES (78, 979);
INSERT INTO `modelos_x_marca` VALUES (78, 980);
INSERT INTO `modelos_x_marca` VALUES (78, 981);
INSERT INTO `modelos_x_marca` VALUES (78, 982);
INSERT INTO `modelos_x_marca` VALUES (78, 983);
INSERT INTO `modelos_x_marca` VALUES (78, 984);
INSERT INTO `modelos_x_marca` VALUES (78, 985);
INSERT INTO `modelos_x_marca` VALUES (78, 986);
INSERT INTO `modelos_x_marca` VALUES (78, 987);
INSERT INTO `modelos_x_marca` VALUES (78, 988);
INSERT INTO `modelos_x_marca` VALUES (78, 989);
INSERT INTO `modelos_x_marca` VALUES (78, 990);
INSERT INTO `modelos_x_marca` VALUES (78, 991);
INSERT INTO `modelos_x_marca` VALUES (78, 992);
INSERT INTO `modelos_x_marca` VALUES (78, 993);
INSERT INTO `modelos_x_marca` VALUES (78, 994);
INSERT INTO `modelos_x_marca` VALUES (78, 995);
INSERT INTO `modelos_x_marca` VALUES (78, 996);
INSERT INTO `modelos_x_marca` VALUES (78, 997);
INSERT INTO `modelos_x_marca` VALUES (78, 998);
INSERT INTO `modelos_x_marca` VALUES (78, 999);
INSERT INTO `modelos_x_marca` VALUES (78, 1000);
INSERT INTO `modelos_x_marca` VALUES (78, 1001);
INSERT INTO `modelos_x_marca` VALUES (78, 1002);
INSERT INTO `modelos_x_marca` VALUES (78, 1003);
INSERT INTO `modelos_x_marca` VALUES (78, 1004);
INSERT INTO `modelos_x_marca` VALUES (79, 1005);
INSERT INTO `modelos_x_marca` VALUES (53, 1006);
INSERT INTO `modelos_x_marca` VALUES (53, 1007);
INSERT INTO `modelos_x_marca` VALUES (53, 1008);

-- ----------------------------
-- Table structure for propietarios
-- ----------------------------
DROP TABLE IF EXISTS `propietarios`;
CREATE TABLE `propietarios`  (
  `dni` bigint(0) NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apellido` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `exento` bit(1) NOT NULL,
  PRIMARY KEY (`dni`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of propietarios
-- ----------------------------
INSERT INTO `propietarios` VALUES (11111110, 'Juan', 'Figueroa', b'0');
INSERT INTO `propietarios` VALUES (11111120, 'Agustin', 'Gomez', b'0');
INSERT INTO `propietarios` VALUES (22222220, 'Martin', 'Solari', b'1');
INSERT INTO `propietarios` VALUES (33333330, 'Federico', 'Vazquez', b'0');
INSERT INTO `propietarios` VALUES (44444440, 'Francisco', 'Vallejos', b'1');
INSERT INTO `propietarios` VALUES (55555550, 'Luciano', 'Flores', b'1');
INSERT INTO `propietarios` VALUES (66666660, 'Marcela', 'Morales', b'1');
INSERT INTO `propietarios` VALUES (77777770, 'Ruben', 'Mamani', b'0');
INSERT INTO `propietarios` VALUES (88888880, 'Mario', 'Debrito', b'0');
INSERT INTO `propietarios` VALUES (99999990, 'Agustina', 'Perez', b'1');

-- ----------------------------
-- Table structure for vehiculos
-- ----------------------------
DROP TABLE IF EXISTS `vehiculos`;
CREATE TABLE `vehiculos`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `Dominio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Marca` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Modelo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vehiculos
-- ----------------------------
INSERT INTO `vehiculos` VALUES (1, 'AB056XS', 'Ford', 'Focus');
INSERT INTO `vehiculos` VALUES (2, 'VTE213', 'Ford', 'Sierra');
INSERT INTO `vehiculos` VALUES (3, 'AA458RT', 'Volkswagen', 'Golf');
INSERT INTO `vehiculos` VALUES (4, 'AB984FS', 'Audi', 'A3');
INSERT INTO `vehiculos` VALUES (5, 'AG149SL', 'Audi', 'A4');
INSERT INTO `vehiculos` VALUES (6, 'BC938HF', 'Peugeot', '207');
INSERT INTO `vehiculos` VALUES (7, 'FLE786', 'Chevrolet', 'Corsa');
INSERT INTO `vehiculos` VALUES (8, 'AK476UL', 'Honda', 'Civic');
INSERT INTO `vehiculos` VALUES (9, 'BF668JK', 'Toyota', 'Corolla');
INSERT INTO `vehiculos` VALUES (10, 'EZR272', 'Suzuki', 'Fun');

-- ----------------------------
-- Table structure for vehiculos_x_propietario
-- ----------------------------
DROP TABLE IF EXISTS `vehiculos_x_propietario`;
CREATE TABLE `vehiculos_x_propietario`  (
  `ID_Vehiculo` int(0) NOT NULL,
  `DNI_Propietario` bigint(0) NOT NULL,
  PRIMARY KEY (`ID_Vehiculo`) USING BTREE,
  INDEX `fk_Vehiculos_x_Propietario_Propietarios_1`(`DNI_Propietario`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vehiculos_x_propietario
-- ----------------------------
INSERT INTO `vehiculos_x_propietario` VALUES (6, 11111110);
INSERT INTO `vehiculos_x_propietario` VALUES (8, 11111120);
INSERT INTO `vehiculos_x_propietario` VALUES (2, 22222220);
INSERT INTO `vehiculos_x_propietario` VALUES (3, 33333330);
INSERT INTO `vehiculos_x_propietario` VALUES (5, 44444440);
INSERT INTO `vehiculos_x_propietario` VALUES (4, 55555550);
INSERT INTO `vehiculos_x_propietario` VALUES (1, 66666660);
INSERT INTO `vehiculos_x_propietario` VALUES (7, 77777770);
INSERT INTO `vehiculos_x_propietario` VALUES (10, 88888880);
INSERT INTO `vehiculos_x_propietario` VALUES (9, 99999990);

-- ----------------------------
-- Procedure structure for SP_AgregarEstado
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_AgregarEstado`;
delimiter ;;
CREATE PROCEDURE `SP_AgregarEstado`(IN IDUnico int, IN Estado VARCHAR(255))
BEGIN
	INSERT INTO Estados (ID, Nombre)
	VALUES (IDUnico, Estado);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_AgregarInspeccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_AgregarInspeccion`;
delimiter ;;
CREATE PROCEDURE `SP_AgregarInspeccion`(IN Fecha VARCHAR(255), IN FechaVencimiento VARCHAR(255) , IN DNIInspector bigint, IN IDEstado int, IN IDVehiculo int)
BEGIN
	INSERT INTO Inspecciones (Fecha, FechaVencimiento, DNI_Inspector, ID_Estado, Baja)
	VALUES (Fecha, FechaVencimiento, DNIInspector, IDEstado, 0);
	INSERT INTO Inspecciones_x_Vehiculo (ID_Inspeccion, ID_Vehiculo)
	VALUES (LAST_INSERT_ID(),IDVehiculo);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_AgregarInspector
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_AgregarInspector`;
delimiter ;;
CREATE PROCEDURE `SP_AgregarInspector`(IN DNI bigint, IN NombreInspector VARCHAR(255))
BEGIN
	INSERT INTO Inspectores (DNI, Nombre, Baja)
	VALUES (DNI, NombreInspector, 0);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_AgregarMarca
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_AgregarMarca`;
delimiter ;;
CREATE PROCEDURE `SP_AgregarMarca`(IN IDMarca int, IN NombreMarca VARCHAR(255))
BEGIN
	INSERT INTO Marcas (ID, Nombre)
	VALUES (IDMarca, NombreMarca);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_AgregarModelo
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_AgregarModelo`;
delimiter ;;
CREATE PROCEDURE `SP_AgregarModelo`(IN IDMarca int, IN IDModelo int, IN NombreModelo VARCHAR(255))
BEGIN
	INSERT INTO Modelos (ID, Nombre)
	VALUES (IDModelo, NombreModelo);
	INSERT INTO Modelos_x_Marca (ID_Marca, ID_Modelo)
	VALUES (IDMarca, IDModelo);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_AgregarPropietario
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_AgregarPropietario`;
delimiter ;;
CREATE PROCEDURE `SP_AgregarPropietario`(IN DNI bigint, IN NombrePropietario VARCHAR(255), IN EsExento bit)
BEGIN
	INSERT INTO Propietarios (DNI, Nombre, Exento, Baja)
	VALUES (DNI, NombrePropietario, EsExento, 0);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_AgregarVehiculo
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_AgregarVehiculo`;
delimiter ;;
CREATE PROCEDURE `SP_AgregarVehiculo`(IN DominioV VARCHAR(255), IN MarcaV VARCHAR(255), IN ModeloV VARCHAR(255), IN DNIPropietario bigint)
BEGIN
	INSERT INTO Vehiculos (Dominio,Marca,Modelo,Baja)
	VALUES (DominioV,MarcaV,ModeloV,0);
	INSERT INTO Vehiculos_x_Propietario (ID_Vehiculo,DNI_Propietario)
	VALUES (LAST_INSERT_ID(),DNIPropietario);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_BajaLogicaInspeccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_BajaLogicaInspeccion`;
delimiter ;;
CREATE PROCEDURE `SP_BajaLogicaInspeccion`(IN ID int, IN Estado bit)
BEGIN
	UPDATE Inspecciones as I
	SET Baja = Estado
	WHERE I.ID = ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_BajaLogicaInspector
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_BajaLogicaInspector`;
delimiter ;;
CREATE PROCEDURE `SP_BajaLogicaInspector`(IN DNI bigint, IN Estado bit)
BEGIN
	UPDATE Inspectores as I
	SET Baja = Estado
	WHERE I.DNI = DNI;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_BajaLogicaPropietario
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_BajaLogicaPropietario`;
delimiter ;;
CREATE PROCEDURE `SP_BajaLogicaPropietario`(IN DNI bigint, IN Estado bit)
BEGIN
	UPDATE Propietarios as P
	SET Baja = Estado
	WHERE P.DNI = DNI;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_BajaLogicaVehiculo
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_BajaLogicaVehiculo`;
delimiter ;;
CREATE PROCEDURE `SP_BajaLogicaVehiculo`(IN ID int, IN Estado bit)
BEGIN
	UPDATE Vehiculos as V
	SET Baja = Estado
	WHERE V.ID = ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ListarInspecciones
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ListarInspecciones`;
delimiter ;;
CREATE PROCEDURE `SP_ListarInspecciones`()
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ListarInspeccionesPorFecha
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ListarInspeccionesPorFecha`;
delimiter ;;
CREATE PROCEDURE `SP_ListarInspeccionesPorFecha`(IN Fecha VARCHAR(255))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ListarInspeccionesPorPropietario
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ListarInspeccionesPorPropietario`;
delimiter ;;
CREATE PROCEDURE `SP_ListarInspeccionesPorPropietario`(IN DNI bigint)
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ListarInspectores
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ListarInspectores`;
delimiter ;;
CREATE PROCEDURE `SP_ListarInspectores`()
BEGIN
	SELECT I.DNI, I.Nombre
	FROM Inspectores as I
	WHERE I.Baja = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ListarMarcas
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ListarMarcas`;
delimiter ;;
CREATE PROCEDURE `SP_ListarMarcas`()
BEGIN
	SELECT Marcas.ID as IDMarca, Marcas.Nombre as NombreMarca	FROM Marcas;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ListarModelos
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ListarModelos`;
delimiter ;;
CREATE PROCEDURE `SP_ListarModelos`(IN IDMarca int)
BEGIN
	SELECT M.ID as IDModelo, M.Nombre as NombreModelo
	FROM Modelos as M
	LEFT JOIN Modelos_x_Marca as MXM
	ON MXM.ID_Modelo = M.ID
	WHERE MXM.ID_Marca = IDMarca;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ListarPropietarios
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ListarPropietarios`;
delimiter ;;
CREATE PROCEDURE `SP_ListarPropietarios`()
BEGIN
	SELECT DNI, Nombre, Exento
	FROM Propietarios;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ListarVehiculos
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ListarVehiculos`;
delimiter ;;
CREATE PROCEDURE `SP_ListarVehiculos`()
BEGIN
	SELECT V.ID as IDVehiculo, V.Dominio, V.Marca, V.Modelo, P.DNI as DNIPropietario, P.Nombre as NombrePropietario, P.Exento
	FROM Vehiculos as V
	LEFT JOIN Vehiculos_x_Propietario as VXP
	ON V.ID = VXP.ID_Vehiculo
	LEFT JOIN Propietarios as P
	ON VXP.DNI_Propietario = P.DNI
	WHERE V.Baja = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ListarVehiculosPorEstado
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ListarVehiculosPorEstado`;
delimiter ;;
CREATE PROCEDURE `SP_ListarVehiculosPorEstado`(IN ID int)
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ListarVehiculosPorPropietario
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ListarVehiculosPorPropietario`;
delimiter ;;
CREATE PROCEDURE `SP_ListarVehiculosPorPropietario`(IN DNIPropietario bigint)
BEGIN
	SELECT V.ID as IDVehiculo, V.Dominio, V.Marca, V.Modelo, P.DNI as DNIPropietario, P.Nombre as NombrePropietario, P.Exento
	FROM Vehiculos as V
	LEFT JOIN Vehiculos_x_Propietario as VXP
	ON V.ID = VXP.ID_Vehiculo
	LEFT JOIN Propietarios as P
	ON VXP.DNI_Propietario = P.DNI
	WHERE VXP.DNI_Propietario = DNIPropietario AND V.Baja = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ModificarInspeccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ModificarInspeccion`;
delimiter ;;
CREATE PROCEDURE `SP_ModificarInspeccion`(IN ID int, IN NuevaFecha VARCHAR(255), IN NuevaFechaVencimiento VARCHAR(255), IN NuevoDNIInspector bigint, IN NuevoIDEstado int, IN NuevoIDVehiculo int)
BEGIN
	UPDATE Inspecciones as I
	SET Fecha = NuevaFecha, FechaVencimiento = NuevaFechaVencimiento, DNI_Inspector = NuevoDNIInspector, ID_Estado = NuevoIDEstado
	WHERE I.ID = ID;
	UPDATE Inspecciones_x_Vehiculo as IXV
	SET IXV.ID_Vehiculo = NuevoIDVehiculo
	WHERE IXV.ID_Inspeccion = ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ModificarInspector
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ModificarInspector`;
delimiter ;;
CREATE PROCEDURE `SP_ModificarInspector`(IN DNI bigint, IN NuevoNombre VARCHAR(255))
BEGIN
	UPDATE Inspectores as I
	SET Nombre = NuevoNombre
	WHERE I.DNI = DNI;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ModificarPropietario
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ModificarPropietario`;
delimiter ;;
CREATE PROCEDURE `SP_ModificarPropietario`(IN DNI bigint, IN NuevoNombre VARCHAR(255), IN NuevoExento bit)
BEGIN
	UPDATE Propietarios as P
	SET Nombre = NuevoNombre, Exento = NuevoExento
	WHERE P.DNI = DNI;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_ModificarVehiculo
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ModificarVehiculo`;
delimiter ;;
CREATE PROCEDURE `SP_ModificarVehiculo`(IN ID int, IN NuevoDominio VARCHAR(255), IN NuevaMarca VARCHAR(255), IN NuevoModelo VARCHAR(255))
BEGIN
	UPDATE Vehiculos as V
	SET Dominio = NuevoDominio, Marca = NuevaMarca, Modelo = NuevoModelo
	WHERE V.ID = ID;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
