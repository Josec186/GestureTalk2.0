-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: 192.168.1.89    Database: gtmx2
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Tipos`
--

DROP TABLE IF EXISTS `Tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipos` (
  `id_tipo` smallint(2) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipos`
--

LOCK TABLES `Tipos` WRITE;
/*!40000 ALTER TABLE `Tipos` DISABLE KEYS */;
INSERT INTO `Tipos` VALUES (1,'Nombre femenino');
/*!40000 ALTER TABLE `Tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `demo`
--

DROP TABLE IF EXISTS `demo`;
/*!50001 DROP VIEW IF EXISTS `demo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `demo` AS SELECT 
 1 AS `id_nivel`,
 1 AS `palabra`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ejercicio`
--

DROP TABLE IF EXISTS `ejercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ejercicio` (
  `id_nivel` smallint(4) NOT NULL,
  `id_expresion` smallint(4) NOT NULL,
  PRIMARY KEY (`id_nivel`,`id_expresion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejercicio`
--

LOCK TABLES `ejercicio` WRITE;
/*!40000 ALTER TABLE `ejercicio` DISABLE KEYS */;
INSERT INTO `ejercicio` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(4,30),(4,31),(4,32),(4,33),(4,34),(5,35),(5,36),(5,37),(5,38),(5,39),(6,40),(6,41),(6,42),(7,43),(7,44),(7,45),(8,46),(8,47),(8,48),(9,49),(9,50),(9,51),(9,52),(10,53),(10,54);
/*!40000 ALTER TABLE `ejercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expresion`
--

DROP TABLE IF EXISTS `expresion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expresion` (
  `id_expresion` smallint(4) NOT NULL,
  `palabra` varchar(25) NOT NULL,
  `id_tipo` smallint(2) NOT NULL,
  `foto_palabra` varchar(45) DEFAULT NULL,
  `descr` longtext,
  PRIMARY KEY (`id_expresion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expresion`
--

LOCK TABLES `expresion` WRITE;
/*!40000 ALTER TABLE `expresion` DISABLE KEYS */;
INSERT INTO `expresion` VALUES (1,'A',1,'A','La letra A del abecedario español mexicano.'),(2,'B',1,'b','La letra B del abecedario español mexicano.'),(3,'C',1,'c','La letra C del abecedario español mexicano.'),(4,'D',1,'D','La letra D del abecedario español mexicano.'),(5,'E',1,'E','La letra E del abecedario español mexicano.'),(6,'F',1,'F','La letra F del abecedario español mexicano.'),(7,'G',1,'G','La letra G del abecedario español mexicano.'),(8,'H',1,'H','La letra H del abecedario español mexicano.'),(9,'I',1,'I','La letra I del abecedario español mexicano.'),(10,'J',1,'J','La letra J del abecedario español mexicano.'),(11,'K',1,'K','La letra K del abecedario español mexicano.'),(12,'L',1,'L','La letra L del abecedario español mexicano.'),(13,'LL',1,'LL','La letra LL del abecedario español mexicano.'),(14,'M',1,'M','La letra M del abecedario español mexicano.'),(15,'N',1,'N','La letra N del abecedario español mexicano.'),(16,'NN',1,'NN','La letra Ñ del abecedario español mexicano.'),(17,'O',1,'O','La letra O del abecedario español mexicano.'),(18,'P',1,'P','La letra P del abecedario español mexicano.'),(19,'Q',1,'Q','La letra Q del abecedario español mexicano.'),(20,'R',1,'R','La letra R del abecedario español mexicano.'),(21,'RR',1,'RR','La letra RR del abecedario español mexicano.'),(22,'S',1,'S','La letra S del abecedario español mexicano.'),(23,'T',1,'T','La letra T del abecedario español mexicano.'),(24,'U',1,'U','La letra U del abecedario español mexicano.'),(25,'V',1,'V','La letra V del abecedario español mexicano.'),(26,'W',1,'W','La letra W del abecedario español mexicano.'),(27,'X',1,'X','La letra X del abecedario español mexicano.'),(28,'Y',1,'Y','La letra Y del abecedario español mexicano.'),(29,'Z',1,'Z','La letra Z del abecedario español mexicano.'),(30,'HOLA',2,'hola','Salutación familiar.'),(31,'ADIOS',2,'adios','Para despedirse.'),(32,'MI NOMBRE ES',2,'minombrees',''),(33,'BUENAS NOCHES',2,'buenasnoches',''),(34,'BUENAS TARDES',2,'buenastardes',''),(35,'BUENOS DIAS',2,'buenosdias',''),(36,'¿COMO TE LLAMAS?',2,'comotellamas',''),(37,'¿COMO ESTAS?',2,'comoestas',''),(38,'CON PERMISO',2,'conpermiso',''),(39,'DE NADA',2,'denada',''),(40,'GRACIAS',3,'gracias','Expresión para saludar.'),(41,'MUCHO GUSTO',3,'muchogusto','Expresión para despedirse.'),(42,'POR FAVOR',4,'porfavor','Expresión para irse a acostar.'),(43,'ME DUELE',5,'meduele','Contrario y opuesto a la razón.'),(44,'¿QUE SIGNIFICA?',5,'quesignifica','Denota alegría o viveza.'),(45,'FELIZ',5,'feliz','Manifestación de cansancio.'),(46,'ENOJADO',6,'enojado','Forma que designa a la persona que habla o escribe.'),(47,'AUSTADO',6,'asustado','Forma que designa a la persona a la que se dirige quien habla o escribe.'),(48,'SORPRENDIDO',6,'sorprendido','Forma que designa a la persona, el animal o la cosa de los que se habla.'),(49,'ABURRIDO',7,'aburrido','Líquido potable transparente insipido e incoloro.'),(50,'TRISTE',7,'triste','Gaseosa dulce con sabor a cola.'),(51,'ENAMORADO',7,'enamorado','Bebida caliente de harina de maíz disuelta en agua o leche.'),(52,'MIEDO',7,'miedo','Bebida lactea nutritiva procedente de la vaca.'),(53,'CONFUNDIDO',7,'confundido','Alimento procedente generalmente de gallina destinado a la alimentación.'),(54,'YO',7,'yo','Comida rápida popular hecha de carne picada freida dentro de un pan.'),(55,'TU',7,'tu','Alimento de sabor dulce que es elaborado por las abejas a partir del néctar de las flores.'),(56,'EL',7,'el','Primer día de la semana.'),(57,'NOSOTROS',7,'nosotros','Segundo día de la semana.'),(58,'ELLOS',7,'ellos','Tercer día de la semana.'),(59,'USTEDES',7,'ustedes','Cuarto día de la semana.'),(60,'LUNES',7,'lunes','Quinto día de la semana.'),(61,'MARTES',7,'martes','Sexto día de la semana.'),(62,'MIERCOLES',7,'miercoles','Séptimo día de la semana.'),(63,'JUEVES',8,'jueves','En este día.'),(64,'VIERNES',8,'viernes','En el día que precede inmediatamente al de hoy.'),(65,'SABADO',8,'sabado','En el día que sigue inmediatamente al de hoy.'),(66,'DOMINGO',7,'domingo','Suceso eventual o acción de que resulta daño involuntario para las personas o las cosas.'),(67,'AZUL',9,'azul','Auxiliar o socorrer.'),(68,'AMARILLO',3,'amarillo','Preocupacion y temor o para llamar la atención.'),(69,'VERDE',7,'verde','Bien público o particular de cada uno.'),(70,'ROJO',1,'rojo',NULL),(71,'NEGRO',1,'negro',NULL),(72,'BLANCO',1,'blanco',NULL),(73,'FAMILIA',1,'familia',NULL),(74,'PAPA',1,'papa',NULL),(75,'MAMA',1,'mama',NULL),(76,'HERMANO',1,'hermano',NULL),(77,'HERMANA',1,'hermana',NULL),(78,'ESPOSA',1,'esposa',NULL),(79,'ESPOSO',1,'esposo',NULL),(80,'ABUELO',1,'abuelo',NULL),(81,'ABUELA',1,'abuela',NULL),(82,'HIJO',1,'hijo',NULL),(83,'MUCHO',1,NULL,NULL),(84,'POCO',1,NULL,NULL),(85,'RAPIDO',1,NULL,NULL),(86,'LENTO',1,NULL,NULL),(87,'ALTO',1,NULL,NULL),(88,'BAJO',1,NULL,NULL),(89,'CASA',1,NULL,NULL),(90,'COCINA',1,NULL,NULL),(91,'CAMA',1,NULL,NULL),(92,'COMPUTADORA',1,NULL,NULL),(93,'INTERNET',1,NULL,NULL),(94,'REFRIGERADOR',1,NULL,NULL),(95,'TELEVISOR',1,NULL,NULL),(96,'ARROZ',1,NULL,NULL),(97,'CARNE',1,NULL,NULL),(98,'CAFE',1,NULL,NULL),(99,'CERVEZA',1,NULL,NULL),(100,'LECHE',1,NULL,NULL),(101,'MAIZ',1,NULL,NULL),(102,'NOPAL',1,NULL,NULL),(103,'PAN',1,NULL,NULL),(104,'QUESO',1,NULL,NULL),(105,'REFRESCO',1,NULL,NULL),(106,'AQUI',1,NULL,NULL),(107,'ALLA',1,NULL,NULL),(108,'ABAJO',1,NULL,NULL),(109,'FRENTE',1,NULL,NULL),(110,'DIA',1,NULL,NULL),(111,'AÑO',1,NULL,NULL),(112,'DIARIAMENTE',1,NULL,NULL),(113,'AMIGO',1,NULL,NULL),(114,'BEBE',1,NULL,NULL),(115,'EXTRAÑO',1,NULL,NULL),(116,'PERSONAS',1,NULL,NULL),(117,'HOMBRE',1,NULL,NULL),(118,'MUJER',1,NULL,NULL),(119,'NIÑO',1,NULL,NULL),(120,'SORDO',1,NULL,NULL),(121,'MIO',1,NULL,NULL),(122,'TU',1,NULL,NULL),(123,'TUYO',1,NULL,NULL),(124,'NUESTRO',1,NULL,NULL),(125,'¿COMO?',1,'como',NULL),(126,'¿CUAL?',1,'cual',NULL),(127,'¿CUANDO?',1,'cuando',NULL),(128,'¿CUANTOS?',1,'cuantos',NULL),(129,'¿DONDE?',1,'donde',NULL),(130,'¿POR QUE?',1,'porque',NULL),(131,'¿QUE?',1,'que',NULL),(132,'¿QUIEN?',1,'quien',NULL),(133,'INGENIERO',1,NULL,NULL),(134,'ALUMNO',1,NULL,NULL),(135,'DENTISTA',1,NULL,NULL),(136,'INTERPRETE',1,NULL,NULL),(137,'LADRON',1,NULL,NULL),(138,'MAESTRO',1,NULL,NULL),(139,'MESERO',1,NULL,NULL),(140,'POLICIA',1,NULL,NULL),(141,'BOMBERO',1,NULL,NULL),(142,'DOCTOR',1,NULL,NULL),(143,'CHOFER',1,NULL,NULL),(144,'JUEZ',1,NULL,NULL),(145,'ABOGADO',1,NULL,NULL),(146,'PERRO',1,NULL,NULL),(147,'GATO',1,NULL,NULL),(148,'PAJARO',1,NULL,NULL),(149,'ANIMAL',1,NULL,NULL),(150,'CERDO',1,NULL,NULL),(151,'GALLO',1,NULL,NULL),(152,'MARIPOSA',1,NULL,NULL),(153,'MOSQUITO',1,NULL,NULL),(154,'RATON',1,NULL,NULL),(155,'VIVORA',1,NULL,NULL),(156,'PEZ',1,NULL,NULL),(157,'PROBLEMA',1,NULL,NULL),(158,'EMERGENCIA',1,NULL,NULL),(159,'AYUDA',1,NULL,NULL),(160,'MEDICINA',1,NULL,NULL),(161,'PELIGRO',1,NULL,NULL),(162,'AGUASCALIENTES',1,NULL,NULL),(163,'CIUDAD',1,NULL,NULL),(164,'ESTADO',1,NULL,NULL),(165,'MEXICO',1,NULL,NULL),(166,'PAIS',1,NULL,NULL),(167,'IGLESIAS',1,NULL,NULL),(168,'CENTRO',1,NULL,NULL),(169,'1',1,NULL,NULL),(170,'2',1,NULL,NULL),(171,'3',1,NULL,NULL),(172,'4',1,NULL,NULL),(173,'5',1,NULL,NULL),(174,'6',1,NULL,NULL),(175,'7',1,NULL,NULL),(176,'8',1,NULL,NULL),(177,'9',1,NULL,NULL),(178,'10',1,NULL,NULL),(179,'11',1,NULL,NULL),(180,'12',1,NULL,NULL),(181,'13',1,NULL,NULL),(182,'14',1,NULL,NULL),(183,'15',1,NULL,NULL),(184,'16',1,NULL,NULL),(185,'17',1,NULL,NULL),(186,'18',1,NULL,NULL),(187,'19',1,NULL,NULL),(188,'20',1,NULL,NULL),(189,'30',1,NULL,NULL),(190,'40',1,NULL,NULL),(191,'50',1,NULL,NULL),(192,'60',1,NULL,NULL),(193,'70',1,NULL,NULL),(194,'80',1,NULL,NULL),(195,'90',1,NULL,NULL),(196,'100',1,NULL,NULL),(197,'ENERO',1,NULL,NULL),(198,'FEBRERO',1,NULL,NULL),(199,'MARZO',1,NULL,NULL),(200,'ABRIL',1,NULL,NULL),(201,'MAYO',1,NULL,NULL),(202,'JUNIO',1,NULL,NULL),(203,'JULIO',1,NULL,NULL),(204,'AGOSTO',1,NULL,NULL),(205,'SEPTIEMBRE',1,NULL,NULL),(206,'OCTUBRE',1,NULL,NULL),(207,'NOVIEMBRE',1,NULL,NULL),(208,'DICIEMBRE',1,NULL,NULL),(209,'PRIMAVERA',1,NULL,NULL),(210,'VERANO',1,NULL,NULL),(211,'OTOÑO',1,NULL,NULL),(212,'INVIERNO',1,NULL,NULL),(213,'FRIO',1,NULL,NULL),(214,'CALOR',1,NULL,NULL),(215,'LLUVIA',1,NULL,NULL),(216,'ABRIR',1,NULL,NULL),(217,'CERRAR',1,NULL,NULL),(218,'ACEPTAR',1,NULL,NULL),(219,'ADIVINAR',1,NULL,NULL),(220,'AGARRAR',1,NULL,NULL),(221,'AMAR',1,NULL,NULL),(222,'ALIMENTAR',1,NULL,NULL),(223,'APAGAR',1,NULL,NULL),(224,'ENCENDER',1,NULL,NULL),(225,'APLAUDIR',1,NULL,NULL),(226,'APRENDER',1,NULL,NULL),(227,'AVISAR',1,NULL,NULL),(228,'AYUDAR',1,NULL,NULL),(229,'BAILAR',1,NULL,NULL),(230,'BAJAR',1,NULL,NULL),(231,'SUBIR',1,NULL,NULL),(232,'BUSCAR',1,NULL,NULL),(233,'CALENTAR',1,NULL,NULL),(234,'CAMINAR',1,NULL,NULL),(235,'CANTAR',1,NULL,NULL),(236,'COMER',1,NULL,NULL),(237,'COMUNICAR',1,NULL,NULL),(238,'CONFUNDIR',1,NULL,NULL),(239,'CONOCER',1,NULL,NULL),(240,'COBRAR',1,NULL,NULL),(241,'COMPRAR',1,NULL,NULL),(242,'DESCANSAR',1,NULL,NULL),(243,'ENSEÑAR',1,NULL,NULL),(244,'ESTUDIAR',1,NULL,NULL),(245,'OLVIDAR',1,NULL,NULL),(246,'PEDIR',1,NULL,NULL),(247,'PENSAR',1,NULL,NULL),(248,'SUFRIR',1,NULL,NULL),(249,'HOY',1,NULL,NULL),(250,'AYER',1,NULL,NULL),(251,'MAÑANA',1,NULL,NULL),(252,'LUEGO',1,NULL,NULL),(253,'AHORA',1,NULL,NULL);
/*!40000 ALTER TABLE `expresion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel` (
  `id_nivel` smallint(4) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `id_unidad` smallint(4) NOT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel`
--

LOCK TABLES `nivel` WRITE;
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT INTO `nivel` VALUES (0,'Inicio','Variable de control',0),(1,'De A a J','Letras del abecedario, de la A a la J',1),(2,'De K a Q','Letras del abecedario, de la K a la Q',1),(3,'De R a Z','Letras del abecedario, de la R a la Z',1),(4,'Presentación','Numeros, del 1 al 5',2),(5,'Frases comunes','Numeros, del 6 al 10',2),(6,'Emociones','La forma de saludar y despedirse',2),(7,'Pronombres','La forma de decir adjetivos y estados de animo',2),(8,'Colores','Pronombres, primera y segunda persona',2),(9,'Familia','Bebidas más comunes de tomar día a día',3),(10,'Cantidades','Comida casera y de restaurant',3),(11,'Casa','Días de la semana, de L a J',3),(12,'Comida','Días de la semana, de V a D',3),(13,'Advervios','Ayer, hoy y mañana',4),(14,'Personas','Palabras relacionadas con accidentes',4),(15,'Posesivos','Todos los meses del año',4),(16,'Preguntas','x',4),(17,'Profesiones','x',5),(18,'Animales','x',5),(19,'Emergencias','x',5),(20,'Modismos','x',5),(21,'Lugares','x',5),(22,'Del 1 al 10','x',6),(23,'Del 10 al 20','x',6),(24,'Del 30 al 100','x',6),(25,'Semana','x',7),(26,'Meses ','x',7),(27,'Climas','x',7),(28,'Verbos 1','x',8),(29,'Verbos 2','x',8),(30,'Verbos 3','x',8),(31,'Verbos 4','x',8),(32,'Lugares 2','x',5),(33,'Tiempos','x',7);
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `nivel_ejercicios`
--

DROP TABLE IF EXISTS `nivel_ejercicios`;
/*!50001 DROP VIEW IF EXISTS `nivel_ejercicios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `nivel_ejercicios` AS SELECT 
 1 AS `id_nivel`,
 1 AS `palabra`,
 1 AS `foto_palabra`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `puntajeusuario`
--

DROP TABLE IF EXISTS `puntajeusuario`;
/*!50001 DROP VIEW IF EXISTS `puntajeusuario`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `puntajeusuario` AS SELECT 
 1 AS `id_usuario`,
 1 AS `Name_exp_2`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `realizo`
--

DROP TABLE IF EXISTS `realizo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realizo` (
  `id_nivel` smallint(4) NOT NULL,
  `id_usuario` smallint(4) NOT NULL,
  `puntaje` int(11) NOT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realizo`
--

LOCK TABLES `realizo` WRITE;
/*!40000 ALTER TABLE `realizo` DISABLE KEYS */;
INSERT INTO `realizo` VALUES (0,7,0),(1,7,0),(2,7,0),(3,7,0),(4,7,0),(5,7,0),(6,7,0),(7,7,0),(8,7,0),(9,7,0),(10,7,0),(11,7,0),(12,7,0),(13,7,0),(14,7,0),(15,7,0),(16,7,0),(17,7,0),(18,7,0),(19,7,0),(20,7,0),(21,7,0),(22,7,0),(23,7,0),(24,7,0),(25,7,0),(26,7,0),(27,7,0),(32,7,0),(33,7,0);
/*!40000 ALTER TABLE `realizo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad`
--

DROP TABLE IF EXISTS `unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad` (
  `id_unidad` smallint(4) NOT NULL,
  `nombre` varchar(15) DEFAULT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad`
--

LOCK TABLES `unidad` WRITE;
/*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
INSERT INTO `unidad` VALUES (0,'Control','Unidad de control'),(1,'Abecedario','Abecedario en español mexicano'),(2,'Conversacion 1','Vocabulario básico, pronombres y colores'),(3,'Conversacion 2','Saludos, adjetivos y pronombres'),(4,'Conversacion 3','Vocabulario medio y cuestionamientos'),(5,'Conversacion 4','Profesiones, lugares, modismos, animales'),(6,'Números','Numeros del 1 al 100'),(7,'Tiempo','Días, meses y climas'),(8,'Verbos','Acciones a realizar');
/*!40000 ALTER TABLE `unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` smallint(4) NOT NULL,
  `nickname` varchar(10) NOT NULL,
  `passwrd` longtext NOT NULL,
  `id_pregunta` smallint(6) NOT NULL,
  `respuesta` longtext NOT NULL,
  `id_avatar` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (0,'erick','eere',4,'ere',0),(2,'lulu','ENlg8oCc7ZA=',4,'PIZZA',5),(3,'yareli','b0kgKKDjVWY=',4,'HOLA',5),(4,'puchamon','PWGK9 AYV2LdwUpF IJ6EA==',4,'NPE',2),(5,'prueba10','5PkVjj0q+Q8=',4,'NPE',2),(6,'Luis','b0kgKKDjVWY=',4,'PUJU',1),(7,'prueba11','5PkVjj0q+Q8=',2,'AQUI',2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gtmx2'
--

--
-- Dumping routines for database 'gtmx2'
--

--
-- Final view structure for view `demo`
--

/*!50001 DROP VIEW IF EXISTS `demo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `demo` AS select `nivel`.`id_nivel` AS `id_nivel`,`expresion`.`palabra` AS `palabra` from ((`nivel` join `expresion`) join `ejercicio`) where ((`nivel`.`id_nivel` = `ejercicio`.`id_nivel`) and (`expresion`.`id_expresion` = `ejercicio`.`id_expresion`) and (`expresion`.`id_expresion` < 4)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nivel_ejercicios`
--

/*!50001 DROP VIEW IF EXISTS `nivel_ejercicios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nivel_ejercicios` AS select `nivel`.`id_nivel` AS `id_nivel`,`expresion`.`palabra` AS `palabra`,`expresion`.`foto_palabra` AS `foto_palabra` from ((`nivel` join `expresion`) join `ejercicio`) where ((`nivel`.`id_nivel` = `ejercicio`.`id_nivel`) and (`expresion`.`id_expresion` = `ejercicio`.`id_expresion`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `puntajeusuario`
--

/*!50001 DROP VIEW IF EXISTS `puntajeusuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `puntajeusuario` AS select distinct `r`.`id_usuario` AS `id_usuario`,(select sum(`realizo`.`puntaje`) from `realizo` where (`r`.`id_usuario` = `realizo`.`id_usuario`)) AS `Name_exp_2` from `realizo` `r` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-11 15:58:19
