-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: asistenciaalumnos
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `idAlumno` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `dni` varchar(10) DEFAULT NULL,
  `fechaNacimiento` datetime DEFAULT NULL,
  `domicilio` varchar(45) DEFAULT NULL,
  `idLocalidad` int DEFAULT NULL,
  `idCarrera` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAlumno`),
  KEY `fk_carreras_idx` (`idCarrera`),
  KEY `fk_localidades_idx` (`idLocalidad`),
  CONSTRAINT `fk_carreras` FOREIGN KEY (`idCarrera`) REFERENCES `carreras` (`idCarrera`),
  CONSTRAINT `fk_localidades` FOREIGN KEY (`idLocalidad`) REFERENCES `localidades` (`idLocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `idAsistencia` int NOT NULL AUTO_INCREMENT,
  `IdMateriaAlumno` int DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAsistencia`),
  KEY `fk_asistencia_idx` (`IdMateriaAlumno`),
  CONSTRAINT `fk_asistencia` FOREIGN KEY (`IdMateriaAlumno`) REFERENCES `materias_alumnos` (`IdMateriaAlumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carreras` (
  `idCarrera` int NOT NULL AUTO_INCREMENT,
  `idMateria` int DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCarrera`),
  KEY `fk_materia_Carrera_idx` (`idMateria`),
  CONSTRAINT `fk_materia_Carrera` FOREIGN KEY (`idMateria`) REFERENCES `materias` (`idMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades` (
  `idLocalidad` int NOT NULL AUTO_INCREMENT,
  `localidad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idLocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias` (
  `idMateria` int NOT NULL AUTO_INCREMENT,
  `idCarrera` int DEFAULT NULL,
  `idProfesor` int DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `idAlumno` int DEFAULT NULL,
  PRIMARY KEY (`idMateria`),
  KEY `fk_profesor_idx` (`idProfesor`),
  KEY `fk_carreras_Materias_idx` (`idCarrera`),
  CONSTRAINT `fk_carreras_Materias` FOREIGN KEY (`idCarrera`) REFERENCES `carreras` (`idCarrera`),
  CONSTRAINT `fk_profesor` FOREIGN KEY (`idProfesor`) REFERENCES `profesores` (`idProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias_alumnos`
--

DROP TABLE IF EXISTS `materias_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias_alumnos` (
  `IdMateriaAlumno` int NOT NULL AUTO_INCREMENT,
  `IdMateria` int DEFAULT NULL,
  `IdAlumno` int DEFAULT NULL,
  `CicloLectivo` year DEFAULT NULL,
  PRIMARY KEY (`IdMateriaAlumno`),
  KEY `fk_Alumnos_MateriasAlm_idx` (`IdAlumno`),
  KEY `fk_Materias_MateriasAlm_idx` (`IdMateria`),
  CONSTRAINT `fk_Alumnos_MateriasAlm` FOREIGN KEY (`IdAlumno`) REFERENCES `alumnos` (`idAlumno`),
  CONSTRAINT `fk_Materias_MateriasAlm` FOREIGN KEY (`IdMateria`) REFERENCES `materias` (`idMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias_alumnos`
--

LOCK TABLES `materias_alumnos` WRITE;
/*!40000 ALTER TABLE `materias_alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `materias_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `idProfesor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `dni` varchar(10) DEFAULT NULL,
  `fechaNacimiento` datetime DEFAULT NULL,
  `domicilio` varchar(45) DEFAULT NULL,
  `idLocalidad` int DEFAULT NULL,
  `idMateria` int DEFAULT NULL,
  `idUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idProfesor`),
  KEY `fk_materias_Profesores_idx` (`idMateria`),
  KEY `fk_localidad_Profesores_idx` (`idLocalidad`),
  KEY `fk_usuario_profesores_idx` (`idUsuario`),
  CONSTRAINT `fk_Localidad_Profesores` FOREIGN KEY (`idLocalidad`) REFERENCES `localidades` (`idLocalidad`),
  CONSTRAINT `fk_materias_Profesores` FOREIGN KEY (`idMateria`) REFERENCES `materias` (`idMateria`),
  CONSTRAINT `fk_usuario_profesores` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposusuarios`
--

DROP TABLE IF EXISTS `tiposusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposusuarios` (
  `idTipoUsuario` int NOT NULL,
  `TipoUsuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposusuarios`
--

LOCK TABLES `tiposusuarios` WRITE;
/*!40000 ALTER TABLE `tiposusuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiposusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombreusuario` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `idTipoUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_TipodeUsuarios_Usuarios_idx` (`idTipoUsuario`),
  CONSTRAINT `fk_TipodeUsuarios_Usuarios` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tiposusuarios` (`idTipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-27 21:26:12
