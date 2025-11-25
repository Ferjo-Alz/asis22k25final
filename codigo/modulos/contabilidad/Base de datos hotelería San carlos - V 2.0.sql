CREATE DATABASE  IF NOT EXISTS `bd_hoteleria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_hoteleria`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bd_hoteleria
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `tbl_activosfijos`
--

DROP TABLE IF EXISTS `tbl_activosfijos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_activosfijos` (
  `Pk_Activo_ID` int NOT NULL AUTO_INCREMENT,
  `Cmp_Nombre_Activo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Descripcion` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Grupo_Activo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Otros',
  `Cmp_Fecha_Adquisicion` date NOT NULL,
  `Cmp_Costo_Adquisicion` decimal(15,2) NOT NULL,
  `Cmp_Valor_Residual` decimal(15,2) NOT NULL,
  `Cmp_Vida_Util` int NOT NULL,
  `Cmp_Estado` bit(1) NOT NULL DEFAULT b'1',
  `Cmp_CtaActivo` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_CtaDepreciacion` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_CtaGastoDepreciacion` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Pk_Activo_ID`),
  KEY `Cmp_CtaActivo` (`Cmp_CtaActivo`),
  KEY `Cmp_CtaDepreciacion` (`Cmp_CtaDepreciacion`),
  KEY `Cmp_CtaGastoDepreciacion` (`Cmp_CtaGastoDepreciacion`),
  CONSTRAINT `tbl_activosfijos_ibfk_1` FOREIGN KEY (`Cmp_CtaActivo`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`),
  CONSTRAINT `tbl_activosfijos_ibfk_2` FOREIGN KEY (`Cmp_CtaDepreciacion`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`),
  CONSTRAINT `tbl_activosfijos_ibfk_3` FOREIGN KEY (`Cmp_CtaGastoDepreciacion`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_activosfijos`
--

LOCK TABLES `tbl_activosfijos` WRITE;
/*!40000 ALTER TABLE `tbl_activosfijos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_activosfijos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_anticipos`
--

DROP TABLE IF EXISTS `tbl_anticipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_anticipos` (
  `Cmp_iId_Anticipo` int NOT NULL AUTO_INCREMENT,
  `Cmp_iId_Empleado` int NOT NULL,
  `Cmp_deMonto_Anticipo` decimal(10,2) DEFAULT NULL,
  `Cmp_dFecha_Anticipo` datetime DEFAULT NULL,
  `Cmp_sMotivo_Anticipo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_deSaldoPendiente_Anticipo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Cmp_iId_Anticipo`),
  KEY `Ix_Anticipos_IdEmpleado` (`Cmp_iId_Empleado`),
  CONSTRAINT `Fk_Anticipos_Empleados` FOREIGN KEY (`Cmp_iId_Empleado`) REFERENCES `tbl_empleados` (`Cmp_iId_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_anticipos`
--

LOCK TABLES `tbl_anticipos` WRITE;
/*!40000 ALTER TABLE `tbl_anticipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_anticipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_aplicacion`
--

DROP TABLE IF EXISTS `tbl_aplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_aplicacion` (
  `Pk_Id_Aplicacion` int NOT NULL,
  `Fk_Id_Reporte_Aplicacion` int DEFAULT NULL,
  `Cmp_Nombre_Aplicacion` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Descripcion_Aplicacion` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Estado_Aplicacion` bit(1) NOT NULL,
  PRIMARY KEY (`Pk_Id_Aplicacion`),
  KEY `Fk_Aplicacion_Reporte` (`Fk_Id_Reporte_Aplicacion`),
  CONSTRAINT `Fk_Aplicacion_Reporte` FOREIGN KEY (`Fk_Id_Reporte_Aplicacion`) REFERENCES `tbl_reportes` (`Pk_Id_Reporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aplicacion`
--

LOCK TABLES `tbl_aplicacion` WRITE;
/*!40000 ALTER TABLE `tbl_aplicacion` DISABLE KEYS */;
INSERT INTO `tbl_aplicacion` VALUES (1,NULL,'Registros','Registro de acciones en el sistema',_binary ''),(301,NULL,'Empleados','Control de empleados de la hoteleria',_binary ''),(302,NULL,'Usuarios','Control de usuarios de empleados',_binary ''),(303,NULL,'Perfiles','Perfiles que se asignan a usuarios',_binary ''),(304,NULL,'Modulos','Mantenimiento de modulos',_binary ''),(305,NULL,'Aplicacion','Mantenimiento de aplicaciones',_binary ''),(306,NULL,'Asig Aplicacion Usuario','Asigna permisos a usuarios',_binary ''),(307,NULL,'Asig aplicacion Perfil','Asigna permisos a perfiles',_binary ''),(308,NULL,'Asig Perfiles','Asigna los perfiles a usuarios',_binary ''),(309,NULL,'Bitacora','Da acceso a bitacora',_binary ''),(401,NULL,'Puestos','Puestos',_binary ''),(402,NULL,'Departamentos','Departamentos',_binary ''),(403,NULL,'Conceptos de nomina','Conceptos de nomina',_binary ''),(404,NULL,'Empleados Nominas','Empleados Nominas',_binary ''),(405,NULL,'Asistencia','Asistencia',_binary ''),(406,NULL,'Vacaciones','Vacaciones',_binary ''),(407,NULL,'Horas Extra','Horas Extra',_binary ''),(408,NULL,'Anticipos','Anticipos',_binary ''),(409,NULL,'Ingreso de percepciones','Ingreso de percepciones',_binary ''),(410,NULL,'Ingreso de deducciones','Ingreso de deducciones',_binary ''),(411,NULL,'Ingreso de polizas','Ingreso de polizas',_binary ''),(412,NULL,'Generación de nominas','Generación de nominas',_binary ''),(413,NULL,'Reporteria','Reporteria',_binary ''),(1401,NULL,'Mantenimientos','Mantenimientos',_binary ''),(1402,NULL,'Movimiento Bancario','Movimiento Bancario',_binary ''),(1403,NULL,'Conciliación Bancaria','Conciliación Bancaria',_binary ''),(1404,NULL,'Polizas/Enlace Contabilidad','Polizas/Enlace Contabilidad',_binary ''),(1405,NULL,'Cierre bancario','Cierre bancario',_binary ''),(1406,NULL,'Disponibilidad diaria y tipo de cambio','Disponibilidad diaria y tipo de cambio',_binary ''),(1407,NULL,'Proceso de autorización de órdenes de compra','Proceso de autorización de órdenes de compra',_binary ''),(1408,NULL,'Proceso de generación de cheques para plantilla','Proceso de generación de cheques para plantilla',_binary ''),(1409,NULL,'Reportes Bancarios','Reportes Bancarios',_binary ''),(2401,NULL,'Polizas Locales','Polizas locales',_binary ''),(2402,NULL,'actualizar saldos','actualizar saldos',_binary ''),(2403,NULL,'cierre mes','cierre mes',_binary ''),(2404,NULL,'cierre año','cierre año',_binary ''),(2405,NULL,'Presupuesto','Presupuesto',_binary ''),(2406,NULL,'Activos Fijos','Activos Fijos',_binary ''),(2407,NULL,'Cierre contable','Cierre contable',_binary ''),(2408,NULL,'Estado de resultados','Estado de resultados',_binary ''),(2409,NULL,'Balance de saldos','Balance de saldos',_binary ''),(2410,NULL,'Balance general','Balance general',_binary ''),(2411,NULL,'Flujo de efectivo','Flujo de efectivo',_binary ''),(2412,NULL,'estado de financieros','estado de financieros',_binary ''),(2413,NULL,'Catalogos de cuenta','Catalogos de cuenta',_binary ''),(2414,NULL,'Gestion Fianciero','Gestion Fianciero',_binary ''),(2415,NULL,'Procesos','Procesos',_binary ''),(3401,NULL,'Huespedes','Huespedes',_binary ''),(3402,NULL,'Check In','Check In',_binary ''),(3403,NULL,'Check Out','Check Out',_binary ''),(3404,NULL,'Area','Area',_binary ''),(3405,NULL,'Detalle Folio','Detalle Folio',_binary ''),(3406,NULL,'Tipo Habitaciones','Tipo Habitaciones',_binary ''),(3407,NULL,'Habitaciones','Habitaciones',_binary ''),(3408,NULL,'Servicios Habitacionales','Servicios Habitacionales',_binary ''),(3409,NULL,'Estadia','Estadia',_binary ''),(3410,NULL,'Asignacion Servicios Cuartos','Asignacion Servicios Cuartos',_binary ''),(3411,NULL,'Tipo de Habitacion','Tipo de Habitacion',_binary ''),(3412,NULL,'Promociones','Promociones',_binary '');
/*!40000 ALTER TABLE `tbl_aplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_area`
--

DROP TABLE IF EXISTS `tbl_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_area` (
  `Pk_Id_Area` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Folio` int DEFAULT NULL,
  `Cmp_Nombre_Area` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Descripcion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Tipo_Movimiento` enum('Cargo','Abono') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Monto` decimal(10,2) DEFAULT NULL,
  `Cmp_Fecha_Movimiento` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Pk_Id_Area`),
  KEY `Fk_Id_Folio` (`Fk_Id_Folio`),
  CONSTRAINT `tbl_area_ibfk_1` FOREIGN KEY (`Fk_Id_Folio`) REFERENCES `tbl_folio` (`Pk_Id_Folio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_area`
--

LOCK TABLES `tbl_area` WRITE;
/*!40000 ALTER TABLE `tbl_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_asignacion_habitacion_servicio`
--

DROP TABLE IF EXISTS `tbl_asignacion_habitacion_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_asignacion_habitacion_servicio` (
  `Fk_ID_Habitacion` int NOT NULL,
  `Fk_Id_Servicio` int NOT NULL,
  PRIMARY KEY (`Fk_ID_Habitacion`,`Fk_Id_Servicio`),
  KEY `Fk_Id_Servicio` (`Fk_Id_Servicio`),
  CONSTRAINT `tbl_asignacion_habitacion_servicio_ibfk_1` FOREIGN KEY (`Fk_ID_Habitacion`) REFERENCES `tbl_habitaciones` (`PK_ID_Habitaciones`),
  CONSTRAINT `tbl_asignacion_habitacion_servicio_ibfk_2` FOREIGN KEY (`Fk_Id_Servicio`) REFERENCES `tbl_servicios_habitacion` (`PK_ID_Servicio_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_asignacion_habitacion_servicio`
--

LOCK TABLES `tbl_asignacion_habitacion_servicio` WRITE;
/*!40000 ALTER TABLE `tbl_asignacion_habitacion_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_asignacion_habitacion_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_asignacion_modulo_aplicacion`
--

DROP TABLE IF EXISTS `tbl_asignacion_modulo_aplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_asignacion_modulo_aplicacion` (
  `Fk_Id_Modulo` int NOT NULL,
  `Fk_Id_Aplicacion` int NOT NULL,
  PRIMARY KEY (`Fk_Id_Modulo`,`Fk_Id_Aplicacion`),
  KEY `Fk_AsigAplicacion` (`Fk_Id_Aplicacion`),
  CONSTRAINT `Fk_AsigAplicacion` FOREIGN KEY (`Fk_Id_Aplicacion`) REFERENCES `tbl_aplicacion` (`Pk_Id_Aplicacion`),
  CONSTRAINT `Fk_AsigModulo` FOREIGN KEY (`Fk_Id_Modulo`) REFERENCES `tbl_modulo` (`Pk_Id_Modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_asignacion_modulo_aplicacion`
--

LOCK TABLES `tbl_asignacion_modulo_aplicacion` WRITE;
/*!40000 ALTER TABLE `tbl_asignacion_modulo_aplicacion` DISABLE KEYS */;
INSERT INTO `tbl_asignacion_modulo_aplicacion` VALUES (4,301),(4,302),(4,303),(4,304),(4,305),(4,306),(4,307),(4,308),(4,309),(5,401),(5,402),(5,403),(5,404),(5,405),(5,406),(5,407),(5,408),(5,409),(5,410),(5,411),(5,412),(5,413),(6,1401),(6,1402),(6,1403),(6,1404),(6,1405),(6,1406),(6,1407),(6,1408),(6,1409),(7,2401),(7,2402),(7,2403),(7,2404),(7,2405),(7,2406),(7,2407),(7,2408),(7,2409),(7,2410),(7,2411),(7,2412),(7,2413),(7,2414),(7,2415),(8,3401),(8,3402),(8,3403),(8,3404),(8,3405),(8,3406),(8,3407),(8,3408),(8,3409),(8,3410),(8,3411),(8,3412);
/*!40000 ALTER TABLE `tbl_asignacion_modulo_aplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_asignar_perfil_cliente`
--

DROP TABLE IF EXISTS `tbl_asignar_perfil_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_asignar_perfil_cliente` (
  `Fk_Id_Perfil` int NOT NULL,
  `Fk_Id_Cliente` int NOT NULL,
  PRIMARY KEY (`Fk_Id_Perfil`,`Fk_Id_Cliente`),
  KEY `Fk_AsigCliente` (`Fk_Id_Cliente`),
  CONSTRAINT `Fk_AsigCliente` FOREIGN KEY (`Fk_Id_Cliente`) REFERENCES `tbl_cliente` (`Pk_Id_Cliente`),
  CONSTRAINT `Fk_AsigPerfil` FOREIGN KEY (`Fk_Id_Perfil`) REFERENCES `tbl_perfil` (`Pk_Id_Perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_asignar_perfil_cliente`
--

LOCK TABLES `tbl_asignar_perfil_cliente` WRITE;
/*!40000 ALTER TABLE `tbl_asignar_perfil_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_asignar_perfil_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_asistencias`
--

DROP TABLE IF EXISTS `tbl_asistencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_asistencias` (
  `Cmp_iId_Asistencia` int NOT NULL AUTO_INCREMENT,
  `Cmp_iId_Empleado` int NOT NULL,
  `Cmp_dFecha_Asistencia` datetime DEFAULT NULL,
  `Cmp_tHoraEntrada_Asistencia` time DEFAULT NULL,
  `Cmp_tHoraSalida_Asistencia` time DEFAULT NULL,
  PRIMARY KEY (`Cmp_iId_Asistencia`),
  KEY `Ix_Asistencias_IdEmpleado` (`Cmp_iId_Empleado`),
  CONSTRAINT `Fk_Asistencias_Empleados` FOREIGN KEY (`Cmp_iId_Empleado`) REFERENCES `tbl_empleados` (`Cmp_iId_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_asistencias`
--

LOCK TABLES `tbl_asistencias` WRITE;
/*!40000 ALTER TABLE `tbl_asistencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_asistencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ausenciaspermisos`
--

DROP TABLE IF EXISTS `tbl_ausenciaspermisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ausenciaspermisos` (
  `Cmp_iId_AusenciaPermiso` int NOT NULL AUTO_INCREMENT,
  `Cmp_iId_Empleado` int NOT NULL,
  `Cmp_dFecha_AusenciaPermiso` datetime DEFAULT NULL,
  `Cmp_sTipo_AusenciaPermiso` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_bJustificada_AusenciaPermiso` bit(1) DEFAULT NULL,
  `Cmp_sMotivo_AusenciaPermiso` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_sObservacion_AusenciaPermiso` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Cmp_iId_AusenciaPermiso`),
  KEY `Ix_AusenciasPermisos_IdEmpleado` (`Cmp_iId_Empleado`),
  CONSTRAINT `Fk_AusenciasPermisos_Empleados` FOREIGN KEY (`Cmp_iId_Empleado`) REFERENCES `tbl_empleados` (`Cmp_iId_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ausenciaspermisos`
--

LOCK TABLES `tbl_ausenciaspermisos` WRITE;
/*!40000 ALTER TABLE `tbl_ausenciaspermisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ausenciaspermisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bancos`
--

DROP TABLE IF EXISTS `tbl_bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bancos` (
  `Pk_Id_Banco` int NOT NULL AUTO_INCREMENT,
  `Cmp_CodigoBanco` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_NombreBanco` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Direccion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Telefono` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Pk_Id_Banco`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bancos`
--

LOCK TABLES `tbl_bancos` WRITE;
/*!40000 ALTER TABLE `tbl_bancos` DISABLE KEYS */;
INSERT INTO `tbl_bancos` VALUES (1,'B01','Banco Industrial',NULL,NULL,1),(2,'B02','Banco G&T Continental',NULL,NULL,1),(3,'B03','Banco Reformador',NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bitacora`
--

DROP TABLE IF EXISTS `tbl_bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bitacora` (
  `Pk_Id_Bitacora` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Usuario` int DEFAULT NULL,
  `Fk_Id_Aplicacion` int DEFAULT NULL,
  `Cmp_Fecha` datetime DEFAULT NULL,
  `Cmp_Accion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Ip` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Nombre_Pc` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Login_Estado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Bitacora`),
  KEY `Fk_Bitacora_Usuario` (`Fk_Id_Usuario`),
  KEY `Fk_Bitacora_Aplicacion` (`Fk_Id_Aplicacion`),
  CONSTRAINT `Fk_Bitacora_Aplicacion` FOREIGN KEY (`Fk_Id_Aplicacion`) REFERENCES `tbl_aplicacion` (`Pk_Id_Aplicacion`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Fk_Bitacora_Usuario` FOREIGN KEY (`Fk_Id_Usuario`) REFERENCES `tbl_usuario` (`Pk_Id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bitacora`
--

LOCK TABLES `tbl_bitacora` WRITE;
/*!40000 ALTER TABLE `tbl_bitacora` DISABLE KEYS */;
INSERT INTO `tbl_bitacora` VALUES (1,23,NULL,'2025-11-12 18:52:37','Ingreso','192.168.137.1','COMPU_CESAR',_binary ''),(2,23,1,'2025-11-12 18:56:57','Guardó el módulo: Contabilidad','192.168.137.1','COMPU_CESAR',_binary ''),(3,23,1,'2025-11-12 18:57:24','Guardó el módulo: Nominas','192.168.137.1','COMPU_CESAR',_binary ''),(4,23,1,'2025-11-12 18:57:44','Guardó el módulo: Bancos','192.168.137.1','COMPU_CESAR',_binary ''),(5,23,1,'2025-11-12 18:58:29','Guardó el módulo: Hoteleria','192.168.137.1','COMPU_CESAR',_binary ''),(6,23,1,'2025-11-12 18:59:02','Guardó el módulo: Comercial','192.168.137.1','COMPU_CESAR',_binary ''),(7,23,1,'2025-11-12 19:09:05','Guardó aplicación: Polizas Locales','192.168.137.1','COMPU_CESAR',_binary ''),(8,23,1,'2025-11-12 19:12:20','Guardó aplicación: actualizar saldos','192.168.137.1','COMPU_CESAR',_binary ''),(9,23,1,'2025-11-12 19:12:43','Guardó aplicación: cierre mes','192.168.137.1','COMPU_CESAR',_binary ''),(10,23,1,'2025-11-12 19:13:03','Guardó aplicación: cierre año','192.168.137.1','COMPU_CESAR',_binary ''),(11,23,1,'2025-11-12 19:13:56','Guardó aplicación: Presupuesto','192.168.137.1','COMPU_CESAR',_binary ''),(12,23,1,'2025-11-12 19:14:23','Guardó aplicación: Activos Fijos','192.168.137.1','COMPU_CESAR',_binary ''),(13,23,1,'2025-11-12 19:14:54','Guardó aplicación: Cierre contable','192.168.137.1','COMPU_CESAR',_binary ''),(14,23,1,'2025-11-12 19:15:15','Guardó aplicación: Estado de resultados','192.168.137.1','COMPU_CESAR',_binary ''),(15,23,1,'2025-11-12 19:15:37','Guardó aplicación: Balance de saldos','192.168.137.1','COMPU_CESAR',_binary ''),(16,23,1,'2025-11-12 19:16:01','Guardó aplicación: Balance general','192.168.137.1','COMPU_CESAR',_binary ''),(17,23,1,'2025-11-12 19:16:59','Guardó aplicación: Flujo de efectivo','192.168.137.1','COMPU_CESAR',_binary ''),(18,23,1,'2025-11-12 19:17:35','Guardó aplicación: estado de financieros','192.168.137.1','COMPU_CESAR',_binary ''),(19,23,1,'2025-11-12 19:18:01','Guardó aplicación: Catalogos de cuenta','192.168.137.1','COMPU_CESAR',_binary ''),(20,23,1,'2025-11-12 19:18:32','Guardó aplicación: Gestion Fianciero','192.168.137.1','COMPU_CESAR',_binary ''),(21,23,1,'2025-11-12 19:20:15','Guardó aplicación: Procesos','192.168.137.1','COMPU_CESAR',_binary ''),(22,23,1,'2025-11-12 19:21:39','Guardó aplicación: Huespedes','192.168.137.1','COMPU_CESAR',_binary ''),(23,23,1,'2025-11-12 19:22:04','Guardó aplicación: Check In','192.168.137.1','COMPU_CESAR',_binary ''),(24,23,1,'2025-11-12 19:22:30','Guardó aplicación: Check Out','192.168.137.1','COMPU_CESAR',_binary ''),(25,23,1,'2025-11-12 19:22:48','Guardó aplicación: Area','192.168.137.1','COMPU_CESAR',_binary ''),(26,23,1,'2025-11-12 19:23:20','Guardó aplicación: Detalle Folio','192.168.137.1','COMPU_CESAR',_binary ''),(27,23,1,'2025-11-12 19:34:22','Guardó aplicación: Tipo Habitaciones','192.168.137.1','COMPU_CESAR',_binary ''),(28,23,1,'2025-11-12 19:34:46','Guardó aplicación: Habitaciones ','192.168.137.1','COMPU_CESAR',_binary ''),(29,23,1,'2025-11-12 19:35:07','Guardó aplicación: Servicios Habitacionales','192.168.137.1','COMPU_CESAR',_binary ''),(30,23,1,'2025-11-12 19:35:24','Guardó aplicación: Estadia','192.168.137.1','COMPU_CESAR',_binary ''),(31,23,1,'2025-11-12 19:38:38','Guardó aplicación: Tipo de Habitacion','192.168.137.1','COMPU_CESAR',_binary ''),(32,23,1,'2025-11-12 19:38:57','Guardó aplicación: Promociones','192.168.137.1','COMPU_CESAR',_binary ''),(33,23,1,'2025-11-12 19:41:44','Guardó aplicación: Asignacion Servicios Cuartos','192.168.137.1','COMPU_CESAR',_binary ''),(34,23,1,'2025-11-12 19:42:13','Guardó aplicación: Mantenimientos','192.168.137.1','COMPU_CESAR',_binary ''),(35,23,1,'2025-11-12 19:42:28','Guardó aplicación: Movimiento Bancario','192.168.137.1','COMPU_CESAR',_binary ''),(36,23,1,'2025-11-12 19:42:48','Guardó aplicación: Conciliación Bancaria','192.168.137.1','COMPU_CESAR',_binary ''),(37,23,1,'2025-11-12 19:43:15','Guardó aplicación: Polizas/Enlace Contabilidad','192.168.137.1','COMPU_CESAR',_binary ''),(38,23,1,'2025-11-12 19:43:31','Guardó aplicación: Cierre bancario','192.168.137.1','COMPU_CESAR',_binary ''),(39,23,1,'2025-11-12 19:44:55','Guardó aplicación: Disponibilidad diaria y tipo de cambio','192.168.137.1','COMPU_CESAR',_binary ''),(40,23,1,'2025-11-12 19:45:15','Guardó aplicación: Proceso de autorización de órdenes de compra','192.168.137.1','COMPU_CESAR',_binary ''),(41,23,1,'2025-11-12 19:45:41','Guardó aplicación: Proceso de generación de cheques para plantilla','192.168.137.1','COMPU_CESAR',_binary ''),(42,23,1,'2025-11-12 19:46:57','Guardó aplicación: Puestos','192.168.137.1','COMPU_CESAR',_binary ''),(43,23,1,'2025-11-12 19:47:10','Guardó aplicación: Departamentos','192.168.137.1','COMPU_CESAR',_binary ''),(44,23,1,'2025-11-12 19:47:31','Guardó aplicación: Conceptos de nomina','192.168.137.1','COMPU_CESAR',_binary ''),(45,23,1,'2025-11-12 19:48:44','Guardó aplicación: Reportes Bancarios','192.168.137.1','COMPU_CESAR',_binary ''),(46,23,1,'2025-11-12 19:50:24','Guardó aplicación: Empleados Nominas','192.168.137.1','COMPU_CESAR',_binary ''),(47,23,1,'2025-11-12 19:51:33','Guardó aplicación: Asistencia','192.168.137.1','COMPU_CESAR',_binary ''),(48,23,1,'2025-11-12 19:51:47','Guardó aplicación: Vacaciones','192.168.137.1','COMPU_CESAR',_binary ''),(49,23,1,'2025-11-12 19:52:05','Guardó aplicación: Horas Extra','192.168.137.1','COMPU_CESAR',_binary ''),(50,23,1,'2025-11-12 19:52:53','Guardó aplicación: Anticipos','192.168.137.1','COMPU_CESAR',_binary ''),(51,23,1,'2025-11-12 19:53:09','Guardó aplicación: Ingreso de percepciones','192.168.137.1','COMPU_CESAR',_binary ''),(52,23,1,'2025-11-12 19:53:26','Guardó aplicación:  Ingreso de deducciones','192.168.137.1','COMPU_CESAR',_binary ''),(53,23,1,'2025-11-12 19:53:42','Guardó aplicación: Ingreso de polizas','192.168.137.1','COMPU_CESAR',_binary ''),(54,23,1,'2025-11-12 19:53:56','Guardó aplicación: Generación de nominas','192.168.137.1','COMPU_CESAR',_binary ''),(55,23,1,'2025-11-12 19:54:14','Guardó aplicación: Reporteria','192.168.137.1','COMPU_CESAR',_binary ''),(56,23,1401,'2025-11-12 19:58:21','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Mantenimientos\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(57,23,1402,'2025-11-12 19:58:22','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Movimiento Bancario\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(58,23,1403,'2025-11-12 19:58:22','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Conciliación Bancaria\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(59,23,1404,'2025-11-12 19:58:22','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Polizas/Enlace Contabilidad\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(60,23,1405,'2025-11-12 19:58:22','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Cierre bancario\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(61,23,1406,'2025-11-12 19:58:22','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Disponibilidad diaria y tipo de cambio\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(62,23,1407,'2025-11-12 19:58:22','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Proceso de autorización de órdenes de compra\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(63,23,1408,'2025-11-12 19:58:22','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Proceso de generación de cheques para plantilla\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(64,23,1409,'2025-11-12 19:58:22','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Reportes Bancarios\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(65,23,2401,'2025-11-12 20:02:30','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Polizas Locales\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(66,23,2402,'2025-11-12 20:02:30','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'actualizar saldos\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(67,23,2403,'2025-11-12 20:02:30','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'cierre mes\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(68,23,2404,'2025-11-12 20:02:31','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'cierre año\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(69,23,2405,'2025-11-12 20:02:31','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Presupuesto\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(70,23,2406,'2025-11-12 20:02:31','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Activos Fijos\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(71,23,2407,'2025-11-12 20:02:31','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Cierre contable\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(72,23,2408,'2025-11-12 20:02:31','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Estado de resultados\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(73,23,2409,'2025-11-12 20:02:31','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Balance de saldos\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(74,23,2410,'2025-11-12 20:02:32','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Balance general\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(75,23,2411,'2025-11-12 20:02:32','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Flujo de efectivo\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(76,23,2412,'2025-11-12 20:02:32','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'estado de financieros\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(77,23,2413,'2025-11-12 20:02:32','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Catalogos de cuenta\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(78,23,2414,'2025-11-12 20:02:32','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Gestion Fianciero\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(79,23,2415,'2025-11-12 20:02:32','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Procesos\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(80,23,401,'2025-11-12 20:09:50','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Puestos\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(81,23,402,'2025-11-12 20:09:50','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Departamentos\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(82,23,403,'2025-11-12 20:09:50','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Conceptos de nomina\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(83,23,404,'2025-11-12 20:09:50','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Empleados Nominas\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(84,23,405,'2025-11-12 20:09:50','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Asistencia\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(85,23,406,'2025-11-12 20:09:50','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Vacaciones\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(86,23,407,'2025-11-12 20:09:51','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Horas Extra\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(87,23,408,'2025-11-12 20:09:51','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Anticipos\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(88,23,409,'2025-11-12 20:09:51','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Ingreso de percepciones\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(89,23,410,'2025-11-12 20:09:51','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Ingreso de deducciones\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(90,23,411,'2025-11-12 20:09:51','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Ingreso de polizas\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(91,23,412,'2025-11-12 20:09:51','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Generación de nominas\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(92,23,413,'2025-11-12 20:09:52','Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Reporteria\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir','192.168.137.1','COMPU_CESAR',_binary ''),(93,23,NULL,'2025-11-12 20:10:02','Cierre de sesión','192.168.137.1','COMPU_CESAR',_binary '\0'),(94,23,NULL,'2025-11-12 20:10:04','Cierre de sesión','192.168.137.1','COMPU_CESAR',_binary '\0');
/*!40000 ALTER TABLE `tbl_bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bloqueo_usuario`
--

DROP TABLE IF EXISTS `tbl_bloqueo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bloqueo_usuario` (
  `Pk_Id_Bloqueo` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Usuario` int DEFAULT NULL,
  `Fk_Id_Bitacora` int DEFAULT NULL,
  `Cmp_Fecha_Inicio_Bloqueo_Usuario` datetime DEFAULT NULL,
  `Cmp_Fecha_Fin_Bloqueo_Usuario` datetime DEFAULT NULL,
  `Cmp_Motivo__Bloqueo_Usuario` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Bloqueo`),
  KEY `Fk_Bloqueo_Usuario` (`Fk_Id_Usuario`),
  KEY `Fk_Bloqueo_Bitacora` (`Fk_Id_Bitacora`),
  CONSTRAINT `Fk_Bloqueo_Bitacora` FOREIGN KEY (`Fk_Id_Bitacora`) REFERENCES `tbl_bitacora` (`Pk_Id_Bitacora`),
  CONSTRAINT `Fk_Bloqueo_Usuario` FOREIGN KEY (`Fk_Id_Usuario`) REFERENCES `tbl_usuario` (`Pk_Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bloqueo_usuario`
--

LOCK TABLES `tbl_bloqueo_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_bloqueo_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bloqueo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_buffet`
--

DROP TABLE IF EXISTS `tbl_buffet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_buffet` (
  `Pk_Id_Buffet` int NOT NULL AUTO_INCREMENT,
  `Cmp_Tipo_Buffet` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Descripcion` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Incluido_En_Reserva` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Buffet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_buffet`
--

LOCK TABLES `tbl_buffet` WRITE;
/*!40000 ALTER TABLE `tbl_buffet` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_buffet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_catalogo_cuentas`
--

DROP TABLE IF EXISTS `tbl_catalogo_cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_catalogo_cuentas` (
  `Pk_Codigo_Cuenta` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_CtaNombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_CtaMadre` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_CtaSaldoInicial` decimal(15,2) DEFAULT '0.00',
  `Cmp_CtaCargoMes` decimal(15,2) DEFAULT '0.00',
  `Cmp_CtaAbonoMes` decimal(15,2) DEFAULT '0.00',
  `Cmp_CtaSaldoActual` decimal(15,2) DEFAULT '0.00',
  `Cmp_CtaCargoActual` decimal(15,2) DEFAULT '0.00',
  `Cmp_CtaAbonoActual` decimal(15,2) DEFAULT '0.00',
  `Cmp_CtaTipo` bit(1) NOT NULL,
  `Cmp_CtaNaturaleza` bit(1) NOT NULL,
  PRIMARY KEY (`Pk_Codigo_Cuenta`),
  KEY `Fk_CtaMadre` (`Cmp_CtaMadre`),
  CONSTRAINT `Fk_CtaMadre` FOREIGN KEY (`Cmp_CtaMadre`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_catalogo_cuentas`
--

LOCK TABLES `tbl_catalogo_cuentas` WRITE;
/*!40000 ALTER TABLE `tbl_catalogo_cuentas` DISABLE KEYS */;
INSERT INTO `tbl_catalogo_cuentas` VALUES ('1','ACTIVO',NULL,0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary ''),('1.1','Activo disponible','1',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary ''),('1.1.1','Caja general','1.1',0.00,0.00,0.00,600.00,0.00,0.00,_binary '',_binary ''),('1.1.2','Caja chica','1.1',0.00,0.00,0.00,400.00,0.00,0.00,_binary '',_binary ''),('1.2','Bancos','1',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary ''),('1.2.1','Banco G&T','1.2',0.00,0.00,0.00,700.00,0.00,0.00,_binary '',_binary ''),('1.2.2','Banco BI','1.2',0.00,0.00,0.00,500.00,0.00,0.00,_binary '',_binary ''),('1.3','Cuentas por cobrar','1',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary ''),('1.3.1','Clientes nacionales','1.3',0.00,0.00,0.00,1200.00,0.00,0.00,_binary '',_binary ''),('1.3.2','Clientes extranjeros','1.3',0.00,0.00,0.00,800.00,0.00,0.00,_binary '',_binary ''),('1.4','Inventarios','1',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary ''),('1.4.1','Mercadería','1.4',0.00,0.00,0.00,3000.00,0.00,0.00,_binary '',_binary ''),('1.4.2','Materia prima','1.4',0.00,0.00,0.00,1500.00,0.00,0.00,_binary '',_binary ''),('1.5','Activos fijos','1',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary ''),('1.5.1','Mobiliario y equipo','1.5',0.00,0.00,0.00,4000.00,0.00,0.00,_binary '',_binary ''),('1.5.2','Equipo de cómputo','1.5',0.00,0.00,0.00,2500.00,0.00,0.00,_binary '',_binary ''),('1.5.3','Vehículos','1.5',0.00,0.00,0.00,3500.00,0.00,0.00,_binary '',_binary ''),('1.6','Depreciaciones acumuladas','1',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary '\0'),('1.6.1','Dep. acumulada mobiliario y equipo','1.6',0.00,0.00,0.00,0.00,0.00,0.00,_binary '',_binary '\0'),('1.6.2','Dep. acumulada equipo de cómputo','1.6',0.00,0.00,0.00,0.00,0.00,0.00,_binary '',_binary '\0'),('1.6.3','Dep. acumulada vehículos','1.6',0.00,0.00,0.00,0.00,0.00,0.00,_binary '',_binary '\0'),('1110','BANCOS',NULL,0.00,0.00,0.00,0.00,0.00,0.00,_binary '',_binary ''),('1111','BANCO INDUSTRIAL','1110',0.00,0.00,0.00,0.00,0.00,0.00,_binary '',_binary ''),('1112','BANCO G&T','1110',0.00,0.00,0.00,0.00,0.00,0.00,_binary '',_binary ''),('2','PASIVO',NULL,0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary '\0'),('2.1','Cuentas por pagar','2',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary '\0'),('2.1.1','Proveedores locales','2.1',0.00,0.00,0.00,1500.00,0.00,0.00,_binary '',_binary '\0'),('2.1.2','Proveedores extranjeros','2.1',0.00,0.00,0.00,1000.00,0.00,0.00,_binary '',_binary '\0'),('2.2','Obligaciones bancarias','2',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary '\0'),('2.2.1','Préstamo Banco G&T','2.2',0.00,0.00,0.00,2000.00,0.00,0.00,_binary '',_binary '\0'),('2.2.2','Préstamo Banco BI','2.2',0.00,0.00,0.00,1500.00,0.00,0.00,_binary '',_binary '\0'),('2.3','Impuestos por pagar','2',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary '\0'),('2.3.1','IVA por pagar','2.3',0.00,0.00,0.00,800.00,0.00,0.00,_binary '',_binary '\0'),('2.3.2','ISR por pagar','2.3',0.00,0.00,0.00,1200.00,0.00,0.00,_binary '',_binary '\0'),('2.3.3','Retenciones por pagar','2.3',0.00,0.00,0.00,300.00,0.00,0.00,_binary '',_binary '\0'),('2.3.4','IGSS por pagar','2.3',0.00,0.00,0.00,500.00,0.00,0.00,_binary '',_binary '\0'),('2.4','Otras obligaciones','2',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary '\0'),('2.4.1','Acreedores varios','2.4',0.00,0.00,0.00,400.00,0.00,0.00,_binary '',_binary '\0'),('2110','SUELDOS POR PAGAR',NULL,0.00,0.00,0.00,0.00,0.00,0.00,_binary '',_binary '\0'),('3','CAPITAL',NULL,0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary '\0'),('3.1','Capital social','3',0.00,0.00,0.00,3000.00,0.00,0.00,_binary '',_binary '\0'),('3.2','Utilidades retenidas','3',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary '\0'),('3.2.1','Ejercicio anterior','3.2',0.00,0.00,0.00,2000.00,0.00,0.00,_binary '',_binary '\0'),('3.2.2','Ejercicio actual','3.2',0.00,0.00,0.00,0.00,0.00,0.00,_binary '',_binary '\0'),('4','INGRESOS',NULL,0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary '\0'),('4.1','Ventas','4',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary '\0'),('4.1.1','Ventas nacionales','4.1',0.00,0.00,0.00,25000.00,0.00,0.00,_binary '',_binary '\0'),('4.1.2','Ventas exportación','4.1',0.00,0.00,0.00,8000.00,0.00,0.00,_binary '',_binary '\0'),('4.2','Otros ingresos','4',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary '\0'),('4.2.1','Descuentos obtenidos','4.2',0.00,0.00,0.00,500.00,0.00,0.00,_binary '',_binary '\0'),('4.2.2','Intereses ganados','4.2',0.00,0.00,0.00,300.00,0.00,0.00,_binary '',_binary '\0'),('4.3','Devoluciones sobre compras','4',0.00,0.00,0.00,200.00,0.00,0.00,_binary '',_binary '\0'),('4110','INGRESOS POR VENTAS',NULL,0.00,0.00,0.00,0.00,0.00,0.00,_binary '',_binary '\0'),('5','COSTOS',NULL,0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary ''),('5.1','Costos operativos','5',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary ''),('5.1.1','Costo de ventas','5.1',0.00,0.00,0.00,18000.00,0.00,0.00,_binary '',_binary ''),('5.1.2','Transporte de mercadería','5.1',0.00,0.00,0.00,1200.00,0.00,0.00,_binary '',_binary ''),('5.2','Costos de producción','5',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary ''),('5.2.1','Materia prima consumida','5.2',0.00,0.00,0.00,2800.00,0.00,0.00,_binary '',_binary ''),('5.2.2','Mano de obra directa','5.2',0.00,0.00,0.00,4000.00,0.00,0.00,_binary '',_binary ''),('5110','GASTOS ADMINISTRATIVOS',NULL,0.00,0.00,0.00,0.00,0.00,0.00,_binary '',_binary ''),('6','GASTOS',NULL,0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary ''),('6.1','Gastos operativos','6',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary ''),('6.1.1','Sueldos administrativos','6.1',0.00,0.00,0.00,3000.00,0.00,0.00,_binary '',_binary ''),('6.1.2','Energía eléctrica','6.1',0.00,0.00,0.00,900.00,0.00,0.00,_binary '',_binary ''),('6.1.3','Papelería y útiles','6.1',0.00,0.00,0.00,600.00,0.00,0.00,_binary '',_binary ''),('6.1.4','Publicidad','6.1',0.00,0.00,0.00,1200.00,0.00,0.00,_binary '',_binary ''),('6.1.5','Gastos de depreciacion','6.1',0.00,0.00,0.00,0.00,0.00,0.00,_binary '',_binary ''),('6.2','Gastos financieros','6',0.00,0.00,0.00,0.00,0.00,0.00,_binary '\0',_binary ''),('6.2.1','Intereses bancarios','6.2',0.00,0.00,0.00,800.00,0.00,0.00,_binary '',_binary ''),('6.3','Gasto por impuesto ISR','6',0.00,0.00,0.00,1200.00,0.00,0.00,_binary '',_binary '');
/*!40000 ALTER TABLE `tbl_catalogo_cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_check_in`
--

DROP TABLE IF EXISTS `tbl_check_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_check_in` (
  `Pk_Id_Check_in` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Huesped` int DEFAULT NULL,
  `Fk_Id_Reserva` int DEFAULT NULL,
  `Cmp_Fecha_Check_In` date DEFAULT NULL,
  `Cmp_Estado` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Check_in`),
  KEY `Fk_Id_Huesped` (`Fk_Id_Huesped`),
  KEY `Fk_Id_Reserva` (`Fk_Id_Reserva`),
  CONSTRAINT `tbl_check_in_ibfk_1` FOREIGN KEY (`Fk_Id_Huesped`) REFERENCES `tbl_huesped` (`Pk_Id_Huesped`),
  CONSTRAINT `tbl_check_in_ibfk_2` FOREIGN KEY (`Fk_Id_Reserva`) REFERENCES `tbl_reserva` (`Pk_Id_Reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_check_in`
--

LOCK TABLES `tbl_check_in` WRITE;
/*!40000 ALTER TABLE `tbl_check_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_check_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_check_out`
--

DROP TABLE IF EXISTS `tbl_check_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_check_out` (
  `Pk_Id_Check_out` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Check_In` int DEFAULT NULL,
  `Cmp_Fecha_Check_Out` date DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Check_out`),
  KEY `Fk_Id_Check_In` (`Fk_Id_Check_In`),
  CONSTRAINT `tbl_check_out_ibfk_1` FOREIGN KEY (`Fk_Id_Check_In`) REFERENCES `tbl_check_in` (`Pk_Id_Check_in`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_check_out`
--

LOCK TABLES `tbl_check_out` WRITE;
/*!40000 ALTER TABLE `tbl_check_out` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_check_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cierre_diario`
--

DROP TABLE IF EXISTS `tbl_cierre_diario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cierre_diario` (
  `Pk_Id_Cierre` int NOT NULL AUTO_INCREMENT,
  `Cmp_Fecha_Corte` datetime NOT NULL,
  `Cmp_Descripcion` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Total_Ingresos` decimal(12,2) DEFAULT '0.00',
  `Cmp_Total_Egresos` decimal(12,2) DEFAULT '0.00',
  `Cmp_Saldo_Final` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`Pk_Id_Cierre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cierre_diario`
--

LOCK TABLES `tbl_cierre_diario` WRITE;
/*!40000 ALTER TABLE `tbl_cierre_diario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cierre_diario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cierrebancario`
--

DROP TABLE IF EXISTS `tbl_cierrebancario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cierrebancario` (
  `Pk_Id_Cierre` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_CuentaBancaria` int NOT NULL,
  `Cmp_AnioCierre` int NOT NULL,
  `Cmp_MesCierre` int NOT NULL,
  `Cmp_SaldoInicial` decimal(18,2) NOT NULL DEFAULT '0.00',
  `Cmp_SaldoFinal` decimal(18,2) NOT NULL DEFAULT '0.00',
  `Cmp_SaldoConciliado` decimal(18,2) DEFAULT '0.00',
  `Cmp_Estado` varchar(20) COLLATE utf8mb4_general_ci DEFAULT 'PENDIENTE',
  `Cmp_FechaCierre` date DEFAULT NULL,
  `Cmp_Observaciones` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_UsuarioRegistro` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_FechaRegistro` datetime DEFAULT CURRENT_TIMESTAMP,
  `Cmp_UsuarioModifico` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_FechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Cierre`),
  KEY `Fk_Id_CuentaBancaria` (`Fk_Id_CuentaBancaria`),
  CONSTRAINT `tbl_cierrebancario_ibfk_1` FOREIGN KEY (`Fk_Id_CuentaBancaria`) REFERENCES `tbl_cuentasbancarias` (`Pk_Id_CuentaBancaria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cierrebancario`
--

LOCK TABLES `tbl_cierrebancario` WRITE;
/*!40000 ALTER TABLE `tbl_cierrebancario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cierrebancario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cliente`
--

DROP TABLE IF EXISTS `tbl_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cliente` (
  `Pk_Id_Cliente` int NOT NULL,
  `Cmp_Nombres_Cliente` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Apellidos_Cliente` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Dni_Cliente` bigint DEFAULT NULL,
  `Cmp_Fecha_Registro_Cliente` datetime DEFAULT NULL,
  `Cmp_Estado_Cliente` bit(1) DEFAULT NULL,
  `Cmp_Nacionalidad_Cliente` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cliente`
--

LOCK TABLES `tbl_cliente` WRITE;
/*!40000 ALTER TABLE `tbl_cliente` DISABLE KEYS */;
INSERT INTO `tbl_cliente` VALUES (1,'Cliente','Prueba',9876543210101,'2025-09-21 23:00:51',_binary '','Guatemalteco');
/*!40000 ALTER TABLE `tbl_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_conceptosnomina`
--

DROP TABLE IF EXISTS `tbl_conceptosnomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_conceptosnomina` (
  `Cmp_iId_ConceptoNomina` int NOT NULL AUTO_INCREMENT,
  `Cmp_sNombre_ConceptoNomina` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_sDescripcion_ConceptoNomina` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_sTipo_ConceptoNomina` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_sTipoCalculo_ConceptoNomina` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'MULT',
  `Cmp_deValor_ConceptoNomina` decimal(10,4) DEFAULT NULL,
  `Cmp_bAplicaAutomatico_ConceptoNomina` bit(1) DEFAULT b'0',
  PRIMARY KEY (`Cmp_iId_ConceptoNomina`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_conceptosnomina`
--

LOCK TABLES `tbl_conceptosnomina` WRITE;
/*!40000 ALTER TABLE `tbl_conceptosnomina` DISABLE KEYS */;
INSERT INTO `tbl_conceptosnomina` VALUES (1,'Bono Trimestral','Bono Trimestral','PERCEPCION','FIJO',550.0000,_binary '\0'),(2,'Horas Extra','Monto de horas extra','PERCEPCION','MULTIPLICACION',0.0000,_binary ''),(3,'Ausencias','Monto de ausencias','DEDUCCION','MULTIPLICACION',0.0000,_binary ''),(4,'Anticipos','Monto de anticipos','DEDUCCION','FIJO',0.0000,_binary ''),(5,'Vacaciones','Monto de vacaciones','PERCEPCION','MULTIPLICACION',0.0000,_binary ''),(6,'Comisiones','Monto de comisiones','PERCEPCION','FIJO',0.0000,_binary '\0'),(7,'Sueldo Base','Pago base mensual del empleado','PERCEPCION','FIJO',0.0000,_binary ''),(8,'IGSS','Aporte laboral al IGSS','DEDUCCION','MULTIPLICACION',0.0483,_binary ''),(9,'ISR','Retención de impuesto sobre la renta','DEDUCCION','MULTIPLICACION',0.0500,_binary '');
/*!40000 ALTER TABLE `tbl_conceptosnomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_conciliacionbancaria`
--

DROP TABLE IF EXISTS `tbl_conciliacionbancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_conciliacionbancaria` (
  `Pk_Id_Conciliacion` int NOT NULL AUTO_INCREMENT,
  `Cmp_AnioConciliacion` int NOT NULL,
  `Cmp_MesConciliacion` int NOT NULL,
  `Cmp_FechaConciliacion` date NOT NULL,
  `Fk_Id_CuentaBancaria` int NOT NULL,
  `Cmp_SaldoBanco` decimal(18,2) NOT NULL DEFAULT '0.00',
  `Cmp_SaldoSistema` decimal(18,2) NOT NULL DEFAULT '0.00',
  `Cmp_Diferencia` decimal(18,2) GENERATED ALWAYS AS ((`Cmp_SaldoBanco` - `Cmp_SaldoSistema`)) STORED,
  `Cmp_Observaciones` varchar(500) DEFAULT NULL,
  `Cmp_EstadoConciliacion` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Pk_Id_Conciliacion`),
  KEY `Fk_Id_CuentaBancaria` (`Fk_Id_CuentaBancaria`),
  CONSTRAINT `tbl_conciliacionbancaria_ibfk_1` FOREIGN KEY (`Fk_Id_CuentaBancaria`) REFERENCES `tbl_cuentasbancarias` (`Pk_Id_CuentaBancaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_conciliacionbancaria`
--

LOCK TABLES `tbl_conciliacionbancaria` WRITE;
/*!40000 ALTER TABLE `tbl_conciliacionbancaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_conciliacionbancaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_correo_cliente`
--

DROP TABLE IF EXISTS `tbl_correo_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_correo_cliente` (
  `Pk_Id_Correo` int NOT NULL,
  `Fk_Id_Cliente` int DEFAULT NULL,
  `Cmp_Correo_Cliente` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Correo`),
  KEY `Fk_Correo_Cliente` (`Fk_Id_Cliente`),
  CONSTRAINT `Fk_Correo_Cliente` FOREIGN KEY (`Fk_Id_Cliente`) REFERENCES `tbl_cliente` (`Pk_Id_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_correo_cliente`
--

LOCK TABLES `tbl_correo_cliente` WRITE;
/*!40000 ALTER TABLE `tbl_correo_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_correo_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cuentasbancarias`
--

DROP TABLE IF EXISTS `tbl_cuentasbancarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cuentasbancarias` (
  `Pk_Id_CuentaBancaria` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Banco` int NOT NULL,
  `Cmp_NumeroCuenta` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_TipoCuenta` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Moneda` varchar(10) COLLATE utf8mb4_general_ci DEFAULT 'GTQ',
  `Cmp_SaldoDisponible` decimal(18,2) DEFAULT '0.00',
  `Cmp_SaldoContable` decimal(18,2) DEFAULT '0.00',
  `Cmp_Estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Pk_Id_CuentaBancaria`),
  KEY `Fk_Id_Banco` (`Fk_Id_Banco`),
  CONSTRAINT `tbl_cuentasbancarias_ibfk_1` FOREIGN KEY (`Fk_Id_Banco`) REFERENCES `tbl_bancos` (`Pk_Id_Banco`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cuentasbancarias`
--

LOCK TABLES `tbl_cuentasbancarias` WRITE;
/*!40000 ALTER TABLE `tbl_cuentasbancarias` DISABLE KEYS */;
INSERT INTO `tbl_cuentasbancarias` VALUES (1,1,'123456789','CORRIENTE','GTQ',50000.00,50000.00,1),(2,2,'987654321','AHORRO','GTQ',25000.00,25000.00,1);
/*!40000 ALTER TABLE `tbl_cuentasbancarias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_departamentos`
--

DROP TABLE IF EXISTS `tbl_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_departamentos` (
  `Cmp_iId_Departamento` int NOT NULL AUTO_INCREMENT,
  `Cmp_sNombre_Departamento` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_sDescripcion_Departamento` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Cmp_iId_Departamento`),
  UNIQUE KEY `Cmp_sNombre_Departamento` (`Cmp_sNombre_Departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_departamentos`
--

LOCK TABLES `tbl_departamentos` WRITE;
/*!40000 ALTER TABLE `tbl_departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_depreciacionactivos`
--

DROP TABLE IF EXISTS `tbl_depreciacionactivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_depreciacionactivos` (
  `Pk_Depreciacion_ID` int NOT NULL AUTO_INCREMENT,
  `Fk_Activo_ID` int NOT NULL,
  `Cmp_Anio` int NOT NULL,
  `Cmp_Valor_En_Libros` decimal(15,2) NOT NULL,
  `Cmp_Depreciacion_Anual` decimal(15,2) NOT NULL,
  `Cmp_Depreciacion_Acumulada` decimal(15,2) NOT NULL,
  PRIMARY KEY (`Pk_Depreciacion_ID`),
  KEY `Fk_Activo_ID` (`Fk_Activo_ID`),
  CONSTRAINT `tbl_depreciacionactivos_ibfk_1` FOREIGN KEY (`Fk_Activo_ID`) REFERENCES `tbl_activosfijos` (`Pk_Activo_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_depreciacionactivos`
--

LOCK TABLES `tbl_depreciacionactivos` WRITE;
/*!40000 ALTER TABLE `tbl_depreciacionactivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_depreciacionactivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalle_cierre_diario`
--

DROP TABLE IF EXISTS `tbl_detalle_cierre_diario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalle_cierre_diario` (
  `Pk_Id_Detalle` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Cierre` int DEFAULT NULL,
  `Fk_Id_Folio` int DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Detalle`),
  KEY `Fk_Id_Cierre` (`Fk_Id_Cierre`),
  KEY `Fk_Id_Folio` (`Fk_Id_Folio`),
  CONSTRAINT `tbl_detalle_cierre_diario_ibfk_1` FOREIGN KEY (`Fk_Id_Cierre`) REFERENCES `tbl_cierre_diario` (`Pk_Id_Cierre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_detalle_cierre_diario_ibfk_2` FOREIGN KEY (`Fk_Id_Folio`) REFERENCES `tbl_folio` (`Pk_Id_Folio`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalle_cierre_diario`
--

LOCK TABLES `tbl_detalle_cierre_diario` WRITE;
/*!40000 ALTER TABLE `tbl_detalle_cierre_diario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detalle_cierre_diario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalle_cierre_salones`
--

DROP TABLE IF EXISTS `tbl_detalle_cierre_salones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalle_cierre_salones` (
  `Pk_Id_Detalle_Salon` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Cierre` int DEFAULT NULL,
  `Fk_Id_Folio_Salon` int DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Detalle_Salon`),
  KEY `Fk_Id_Cierre` (`Fk_Id_Cierre`),
  KEY `Fk_Id_Folio_Salon` (`Fk_Id_Folio_Salon`),
  CONSTRAINT `tbl_detalle_cierre_salones_ibfk_1` FOREIGN KEY (`Fk_Id_Cierre`) REFERENCES `tbl_cierre_diario` (`Pk_Id_Cierre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_detalle_cierre_salones_ibfk_2` FOREIGN KEY (`Fk_Id_Folio_Salon`) REFERENCES `tbl_folio_salones` (`Pk_Id_Folio_Salones`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalle_cierre_salones`
--

LOCK TABLES `tbl_detalle_cierre_salones` WRITE;
/*!40000 ALTER TABLE `tbl_detalle_cierre_salones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detalle_cierre_salones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalle_folio`
--

DROP TABLE IF EXISTS `tbl_detalle_folio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalle_folio` (
  `Pk_Id_Detalle_Folio` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Folio` int DEFAULT NULL,
  `Fk_Id_Area` int DEFAULT NULL,
  `Cmp_Descripciones` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Estado` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'Activo',
  PRIMARY KEY (`Pk_Id_Detalle_Folio`),
  KEY `Fk_Id_Folio` (`Fk_Id_Folio`),
  KEY `Fk_Id_Area` (`Fk_Id_Area`),
  CONSTRAINT `Tbl_Detalle_Folio_ibfk_1` FOREIGN KEY (`Fk_Id_Folio`) REFERENCES `tbl_folio` (`Pk_Id_Folio`),
  CONSTRAINT `Tbl_Detalle_Folio_ibfk_2` FOREIGN KEY (`Fk_Id_Area`) REFERENCES `tbl_area` (`Pk_Id_Area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalle_folio`
--

LOCK TABLES `tbl_detalle_folio` WRITE;
/*!40000 ALTER TABLE `tbl_detalle_folio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detalle_folio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalle_ordenes_menu`
--

DROP TABLE IF EXISTS `tbl_detalle_ordenes_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalle_ordenes_menu` (
  `Pk_Id_Detalle_Orden` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Orden_Produccion` int DEFAULT NULL,
  `Fk_Id_Menu` int DEFAULT NULL,
  `Cmp_Cantidad_Platillos` int DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Detalle_Orden`),
  KEY `Fk_Id_Orden_Produccion` (`Fk_Id_Orden_Produccion`),
  KEY `Fk_Id_Menu` (`Fk_Id_Menu`),
  CONSTRAINT `tbl_detalle_ordenes_menu_ibfk_1` FOREIGN KEY (`Fk_Id_Orden_Produccion`) REFERENCES `tbl_ordenes_produccion` (`Pk_Id_Orden_Produccion`),
  CONSTRAINT `tbl_detalle_ordenes_menu_ibfk_2` FOREIGN KEY (`Fk_Id_Menu`) REFERENCES `tbl_menu` (`Pk_Id_Menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalle_ordenes_menu`
--

LOCK TABLES `tbl_detalle_ordenes_menu` WRITE;
/*!40000 ALTER TABLE `tbl_detalle_ordenes_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detalle_ordenes_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalle_ordenes_mobiliario`
--

DROP TABLE IF EXISTS `tbl_detalle_ordenes_mobiliario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalle_ordenes_mobiliario` (
  `Pk_Id_Detalle_Orden_Mobiliario` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Orden_Produccion` int DEFAULT NULL,
  `Fk_Id_Mobiliario` int DEFAULT NULL,
  `Cmp_Cantidad_Mobiliario` int DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Detalle_Orden_Mobiliario`),
  KEY `Fk_Id_Orden_Produccion` (`Fk_Id_Orden_Produccion`),
  KEY `Fk_Id_Mobiliario` (`Fk_Id_Mobiliario`),
  CONSTRAINT `tbl_detalle_ordenes_mobiliario_ibfk_1` FOREIGN KEY (`Fk_Id_Orden_Produccion`) REFERENCES `tbl_ordenes_produccion` (`Pk_Id_Orden_Produccion`),
  CONSTRAINT `tbl_detalle_ordenes_mobiliario_ibfk_2` FOREIGN KEY (`Fk_Id_Mobiliario`) REFERENCES `tbl_mobiliario` (`Pk_Id_Mobiliario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalle_ordenes_mobiliario`
--

LOCK TABLES `tbl_detalle_ordenes_mobiliario` WRITE;
/*!40000 ALTER TABLE `tbl_detalle_ordenes_mobiliario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detalle_ordenes_mobiliario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detallelotecheques`
--

DROP TABLE IF EXISTS `tbl_detallelotecheques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detallelotecheques` (
  `Pk_Id_Detalle` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Lote` int NOT NULL,
  `Cmp_NumeroCheque` varchar(50) NOT NULL,
  `Cmp_NombreEmpleado` varchar(100) NOT NULL,
  `Cmp_Monto` decimal(18,2) NOT NULL,
  `Cmp_Banco` int DEFAULT NULL,
  `Cmp_Estado` tinyint DEFAULT NULL,
  `Cmp_FechaRegistro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Pk_Id_Detalle`),
  KEY `Fk_Id_Lote` (`Fk_Id_Lote`),
  CONSTRAINT `tbl_detallelotecheques_ibfk_1` FOREIGN KEY (`Fk_Id_Lote`) REFERENCES `tbl_lotescheques` (`Pk_Id_Lote`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detallelotecheques`
--

LOCK TABLES `tbl_detallelotecheques` WRITE;
/*!40000 ALTER TABLE `tbl_detallelotecheques` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detallelotecheques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detallepoliza`
--

DROP TABLE IF EXISTS `tbl_detallepoliza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detallepoliza` (
  `PkFk_EncCodigo_Poliza` int NOT NULL,
  `PkFk_Fecha_Poliza` date NOT NULL,
  `PkFk_Codigo_Cuenta` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Tipo_Poliza` tinyint(1) NOT NULL,
  `Cmp_Valor_Poliza` decimal(15,2) NOT NULL,
  PRIMARY KEY (`PkFk_EncCodigo_Poliza`,`PkFk_Fecha_Poliza`,`PkFk_Codigo_Cuenta`),
  KEY `fk_detalle_poliza_cuenta` (`PkFk_Codigo_Cuenta`),
  CONSTRAINT `fk_detalle_poliza_cuenta` FOREIGN KEY (`PkFk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_poliza_encabezado` FOREIGN KEY (`PkFk_EncCodigo_Poliza`, `PkFk_Fecha_Poliza`) REFERENCES `tbl_encabezadopoliza` (`Pk_EncCodigo_Poliza`, `Pk_Fecha_Poliza`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_detallepoliza_chk_1` CHECK ((`Cmp_Valor_Poliza` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detallepoliza`
--

LOCK TABLES `tbl_detallepoliza` WRITE;
/*!40000 ALTER TABLE `tbl_detallepoliza` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detallepoliza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detallesnomina`
--

DROP TABLE IF EXISTS `tbl_detallesnomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detallesnomina` (
  `Cmp_iId_DetalleNomina` int NOT NULL AUTO_INCREMENT,
  `Cmp_iId_Nomina` int NOT NULL,
  `Cmp_iId_Empleado` int NOT NULL,
  `Cmp_iAusencias_DetalleNomina` int DEFAULT NULL,
  `Cmp_iDiasLaborados_DetalleNomina` int DEFAULT NULL,
  `Cmp_dePercepciones_DetalleNomina` decimal(10,2) DEFAULT NULL,
  `Cmp_deDeducciones_DetalleNomina` decimal(10,2) DEFAULT NULL,
  `Cmp_deSueldoLiquido_DetalleNomina` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Cmp_iId_DetalleNomina`),
  KEY `Fk_DetallesNomina_Nomina` (`Cmp_iId_Nomina`),
  KEY `Ix_DetallesNomina_IdEmpleado` (`Cmp_iId_Empleado`),
  CONSTRAINT `Fk_DetallesNomina_Empleados` FOREIGN KEY (`Cmp_iId_Empleado`) REFERENCES `tbl_empleados` (`Cmp_iId_Empleado`),
  CONSTRAINT `Fk_DetallesNomina_Nomina` FOREIGN KEY (`Cmp_iId_Nomina`) REFERENCES `tbl_nomina` (`Cmp_iId_Nomina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detallesnomina`
--

LOCK TABLES `tbl_detallesnomina` WRITE;
/*!40000 ALTER TABLE `tbl_detallesnomina` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detallesnomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_disponibilidad_diaria`
--

DROP TABLE IF EXISTS `tbl_disponibilidad_diaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_disponibilidad_diaria` (
  `Pk_Id_Disponibilidad` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_CuentaBancaria` int NOT NULL,
  `Cmp_Fecha_Disponibilidad` date NOT NULL,
  `Cmp_Saldo_Inicial_Disponibilidad` decimal(12,2) DEFAULT '0.00',
  `Cmp_Ingresos_Disponibilidad` decimal(12,2) DEFAULT '0.00',
  `Cmp_Egresos_Disponibilidad` decimal(12,2) DEFAULT '0.00',
  `Cmp_Saldo_Final_Disponibilidad` decimal(12,2) DEFAULT '0.00',
  `Cmp_Estado_Disponibilidad` bit(1) DEFAULT b'1',
  PRIMARY KEY (`Pk_Id_Disponibilidad`),
  KEY `Fk_Disponibilidad_Cuenta` (`Fk_Id_CuentaBancaria`),
  CONSTRAINT `Fk_Disponibilidad_Cuenta` FOREIGN KEY (`Fk_Id_CuentaBancaria`) REFERENCES `tbl_cuentasbancarias` (`Pk_Id_CuentaBancaria`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_disponibilidad_diaria`
--

LOCK TABLES `tbl_disponibilidad_diaria` WRITE;
/*!40000 ALTER TABLE `tbl_disponibilidad_diaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_disponibilidad_diaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_empleado`
--

DROP TABLE IF EXISTS `tbl_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_empleado` (
  `Pk_Id_Empleado` int NOT NULL AUTO_INCREMENT,
  `Cmp_Nombres_Empleado` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Apellidos_Empleado` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Dpi_Empleado` bigint DEFAULT NULL,
  `Cmp_Nit_Empleado` bigint DEFAULT NULL,
  `Cmp_Correo_Empleado` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Telefono_Empleado` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Genero_Empleado` bit(1) DEFAULT NULL,
  `Cmp_Fecha_Nacimiento_Empleado` date DEFAULT NULL,
  `Cmp_Fecha_Contratacion__Empleado` date DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=5001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_empleado`
--

LOCK TABLES `tbl_empleado` WRITE;
/*!40000 ALTER TABLE `tbl_empleado` DISABLE KEYS */;
INSERT INTO `tbl_empleado` VALUES (2,'Juan','Pérez López',1234567890101,9876542,'juan.perez@example.com','5555-1234',_binary '','1995-08-20','2025-09-21'),(3,'Juan','pruebas',1234,123,'@pruebas','1234',_binary '','2025-09-26','2025-09-26');
/*!40000 ALTER TABLE `tbl_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_empleado_autorizado`
--

DROP TABLE IF EXISTS `tbl_empleado_autorizado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_empleado_autorizado` (
  `Pk_Id_Empleado` int NOT NULL AUTO_INCREMENT,
  `Cmp_Nombre_Empleado` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Puesto` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Departamento` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Correo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Estado` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_empleado_autorizado`
--

LOCK TABLES `tbl_empleado_autorizado` WRITE;
/*!40000 ALTER TABLE `tbl_empleado_autorizado` DISABLE KEYS */;
INSERT INTO `tbl_empleado_autorizado` VALUES (1,'María Morales','Encargada de Compras','Finanzas','mmorales@empresa.com',NULL),(2,'Kevin Natareno','Jefe de Compras','Comercial','knatareno@empresa.com',NULL);
/*!40000 ALTER TABLE `tbl_empleado_autorizado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_empleados`
--

DROP TABLE IF EXISTS `tbl_empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_empleados` (
  `Cmp_iId_Empleado` int NOT NULL AUTO_INCREMENT,
  `Cmp_sNombre_Empleado` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_sApellido_Empleado` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_sDpi_Empleado` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_iNit_Empleado` int DEFAULT NULL,
  `Cmp_sCorreo_Empleado` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_sTelefono_Empleado` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_bGenero_Empleado` bit(1) DEFAULT NULL,
  `Cmp_dFechaNacimiento_Empleado` date DEFAULT NULL,
  `Cmp_dFechaIngreso_Empleado` datetime DEFAULT NULL,
  `Cmp_deSalario_Empleado` decimal(10,2) DEFAULT NULL,
  `Cmp_iId_Puesto` int NOT NULL,
  `Cmp_bEstado_Empleado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Cmp_iId_Empleado`),
  UNIQUE KEY `Cmp_sDpi_Empleado` (`Cmp_sDpi_Empleado`),
  KEY `Ix_Empleados_IdPuesto` (`Cmp_iId_Puesto`),
  CONSTRAINT `Fk_Empleados_Puestos` FOREIGN KEY (`Cmp_iId_Puesto`) REFERENCES `tbl_puestos` (`Cmp_iId_Puesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_empleados`
--

LOCK TABLES `tbl_empleados` WRITE;
/*!40000 ALTER TABLE `tbl_empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_encabezadopoliza`
--

DROP TABLE IF EXISTS `tbl_encabezadopoliza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_encabezadopoliza` (
  `Pk_EncCodigo_Poliza` int NOT NULL,
  `Pk_Fecha_Poliza` date NOT NULL,
  `Cmp_Concepto_Poliza` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Valor_Poliza` decimal(15,2) DEFAULT '0.00',
  `Cmp_Estado_Poliza` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Pk_EncCodigo_Poliza`,`Pk_Fecha_Poliza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_encabezadopoliza`
--

LOCK TABLES `tbl_encabezadopoliza` WRITE;
/*!40000 ALTER TABLE `tbl_encabezadopoliza` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_encabezadopoliza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estadia`
--

DROP TABLE IF EXISTS `tbl_estadia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estadia` (
  `Pk_Id_Estadia` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Habitaciones` int DEFAULT NULL,
  `Fk_Id_Huesped_Checkin` int DEFAULT NULL,
  `Cmp_Num_Huespedes` int DEFAULT NULL,
  `Cmp_Fecha_Check_In` date DEFAULT NULL,
  `Cmp_Fecha_Check_Out` date DEFAULT NULL,
  `Cmp_Tiene_Reservacion` tinyint(1) DEFAULT NULL,
  `Cmp_Monto_Total_Pago` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Estadia`),
  KEY `Fk_Id_Habitaciones` (`Fk_Id_Habitaciones`),
  KEY `Fk_Id_Huesped_Checkin` (`Fk_Id_Huesped_Checkin`),
  CONSTRAINT `tbl_estadia_ibfk_1` FOREIGN KEY (`Fk_Id_Habitaciones`) REFERENCES `tbl_habitaciones` (`PK_ID_Habitaciones`),
  CONSTRAINT `tbl_estadia_ibfk_2` FOREIGN KEY (`Fk_Id_Huesped_Checkin`) REFERENCES `tbl_huesped` (`Pk_Id_Huesped`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estadia`
--

LOCK TABLES `tbl_estadia` WRITE;
/*!40000 ALTER TABLE `tbl_estadia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_estadia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado_autorizacion`
--

DROP TABLE IF EXISTS `tbl_estado_autorizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estado_autorizacion` (
  `Pk_Id_Estado_Autorizacion` int NOT NULL AUTO_INCREMENT,
  `Cmp_Nombre_Estado` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Pk_Id_Estado_Autorizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado_autorizacion`
--

LOCK TABLES `tbl_estado_autorizacion` WRITE;
/*!40000 ALTER TABLE `tbl_estado_autorizacion` DISABLE KEYS */;
INSERT INTO `tbl_estado_autorizacion` VALUES (1,'Pendiente'),(2,'Aprobada'),(3,'Rechazada');
/*!40000 ALTER TABLE `tbl_estado_autorizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_factura`
--

DROP TABLE IF EXISTS `tbl_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_factura` (
  `Pk_Id_Factura` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Reserva` int NOT NULL,
  `Cmp_Fecha_Emision` date DEFAULT NULL,
  `Cmp_Total_Factura` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Factura`),
  KEY `Fk_Id_Reserva` (`Fk_Id_Reserva`),
  CONSTRAINT `tbl_factura_ibfk_1` FOREIGN KEY (`Fk_Id_Reserva`) REFERENCES `tbl_reserva` (`Pk_Id_Reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_factura`
--

LOCK TABLES `tbl_factura` WRITE;
/*!40000 ALTER TABLE `tbl_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_folio`
--

DROP TABLE IF EXISTS `tbl_folio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_folio` (
  `Pk_Id_Folio` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Check_In` int DEFAULT NULL,
  `Fk_Id_Check_Out` int DEFAULT NULL,
  `Fk_Id_Habitacion` int DEFAULT NULL,
  `Cmp_Fecha_Creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `Cmp_Fecha_Cierre` datetime DEFAULT NULL,
  `Cmp_Total_Cargos` decimal(10,2) DEFAULT '0.00',
  `Cmp_Total_Abonos` decimal(10,2) DEFAULT '0.00',
  `Cmp_Saldo_Final` decimal(10,2) DEFAULT '0.00',
  `Cmp_Estado` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'Abierto',
  PRIMARY KEY (`Pk_Id_Folio`),
  KEY `Fk_Id_Check_In` (`Fk_Id_Check_In`),
  KEY `Fk_Id_Check_Out` (`Fk_Id_Check_Out`),
  KEY `Fk_Id_Habitacion` (`Fk_Id_Habitacion`),
  CONSTRAINT `tbl_folio_ibfk_1` FOREIGN KEY (`Fk_Id_Check_In`) REFERENCES `tbl_check_in` (`Pk_Id_Check_in`),
  CONSTRAINT `tbl_folio_ibfk_2` FOREIGN KEY (`Fk_Id_Check_Out`) REFERENCES `tbl_check_out` (`Pk_Id_Check_out`),
  CONSTRAINT `tbl_folio_ibfk_3` FOREIGN KEY (`Fk_Id_Habitacion`) REFERENCES `tbl_habitaciones` (`PK_ID_Habitaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_folio`
--

LOCK TABLES `tbl_folio` WRITE;
/*!40000 ALTER TABLE `tbl_folio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_folio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_folio_salones`
--

DROP TABLE IF EXISTS `tbl_folio_salones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_folio_salones` (
  `Pk_Id_Folio_Salones` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Reserva_Salon` int DEFAULT NULL,
  `Cmp_Fecha_Pago` datetime DEFAULT NULL,
  `Cmp_Pago_Total` decimal(10,2) DEFAULT NULL,
  `Cmp_Estado` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Metodo_Pago` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Folio_Salones`),
  KEY `Fk_Id_Reserva_Salon` (`Fk_Id_Reserva_Salon`),
  CONSTRAINT `tbl_folio_salones_ibfk_1` FOREIGN KEY (`Fk_Id_Reserva_Salon`) REFERENCES `tbl_reservas_salones` (`Pk_Id_Reserva_Salon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_folio_salones`
--

LOCK TABLES `tbl_folio_salones` WRITE;
/*!40000 ALTER TABLE `tbl_folio_salones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_folio_salones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_habitaciones`
--

DROP TABLE IF EXISTS `tbl_habitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_habitaciones` (
  `PK_ID_Habitaciones` int NOT NULL,
  `FK_ID_Tipo_Habitaciones` int DEFAULT NULL,
  `Cmp_Piso_Habitacion` int DEFAULT NULL,
  `Cmp_Descripcion_Habitacion` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Tamaño_Habitacion_m2` varchar(75) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Capacidad_Habitacion` int DEFAULT NULL,
  `Cmp_Estado_Habitacion` tinyint(1) DEFAULT NULL,
  `Cmp_Tarifa_Noche` double DEFAULT NULL,
  PRIMARY KEY (`PK_ID_Habitaciones`),
  KEY `FK_ID_Tipo_Habitaciones` (`FK_ID_Tipo_Habitaciones`),
  CONSTRAINT `tbl_habitaciones_ibfk_1` FOREIGN KEY (`FK_ID_Tipo_Habitaciones`) REFERENCES `tbl_tipo_habitacion` (`Pk_ID_Tipo_Habitaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_habitaciones`
--

LOCK TABLES `tbl_habitaciones` WRITE;
/*!40000 ALTER TABLE `tbl_habitaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_habitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_historial_autorizacion`
--

DROP TABLE IF EXISTS `tbl_historial_autorizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_historial_autorizacion` (
  `Pk_Id_Historial` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Autorizacion` int NOT NULL,
  `Cmp_Fecha_Cambio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Cmp_Accion` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Detalle` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Historial`),
  KEY `FK_Historial_Autorizacion` (`Fk_Id_Autorizacion`),
  CONSTRAINT `FK_Historial_Autorizacion` FOREIGN KEY (`Fk_Id_Autorizacion`) REFERENCES `tbl_orden_compra_autorizada` (`Pk_Id_Autorizacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_historial_autorizacion`
--

LOCK TABLES `tbl_historial_autorizacion` WRITE;
/*!40000 ALTER TABLE `tbl_historial_autorizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_historial_autorizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_historico_catalogo_cuentas`
--

DROP TABLE IF EXISTS `tbl_historico_catalogo_cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_historico_catalogo_cuentas` (
  `Cmp_Anio` int NOT NULL,
  `Cmp_Mes` tinyint NOT NULL,
  `Pk_Codigo_Cuenta` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_CtaNombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_CtaMadre` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_CtaSaldoInicial` decimal(15,2) NOT NULL DEFAULT '0.00',
  `Cmp_CtaCargoMes` decimal(15,2) NOT NULL DEFAULT '0.00',
  `Cmp_CtaAbonoMes` decimal(15,2) NOT NULL DEFAULT '0.00',
  `Cmp_CtaSaldoActual` decimal(15,2) NOT NULL DEFAULT '0.00',
  `Cmp_CtaCargoActual` decimal(15,2) NOT NULL DEFAULT '0.00',
  `Cmp_CtaAbonoActual` decimal(15,2) NOT NULL DEFAULT '0.00',
  `Cmp_CtaTipo` bit(1) NOT NULL,
  `Cmp_CtaNaturaleza` bit(1) NOT NULL,
  PRIMARY KEY (`Cmp_Anio`,`Cmp_Mes`,`Pk_Codigo_Cuenta`) USING BTREE,
  KEY `Idx_Historico_Cuenta` (`Pk_Codigo_Cuenta`) USING BTREE,
  CONSTRAINT `Fk_Historico_Cuenta` FOREIGN KEY (`Pk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Fk_Historico_Periodo` FOREIGN KEY (`Cmp_Anio`, `Cmp_Mes`) REFERENCES `tbl_periodoscontables` (`Cmp_Anio`, `Cmp_Mes`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_historico_catalogo_cuentas`
--

LOCK TABLES `tbl_historico_catalogo_cuentas` WRITE;
/*!40000 ALTER TABLE `tbl_historico_catalogo_cuentas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_historico_catalogo_cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_horasextra`
--

DROP TABLE IF EXISTS `tbl_horasextra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_horasextra` (
  `Cmp_iId_HoraExtra` int NOT NULL AUTO_INCREMENT,
  `Cmp_iId_Empleado` int NOT NULL,
  `Cmp_dFecha_HoraExtra` datetime DEFAULT NULL,
  `Cmp_iCantidad_HoraExtra` int DEFAULT NULL,
  `Cmp_sMotivo_HoraExtra` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_bAprobado_HoraExtra` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Cmp_iId_HoraExtra`),
  KEY `Ix_HorasExtra_IdEmpleado` (`Cmp_iId_Empleado`),
  CONSTRAINT `Fk_HorasExtra_Empleados` FOREIGN KEY (`Cmp_iId_Empleado`) REFERENCES `tbl_empleados` (`Cmp_iId_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_horasextra`
--

LOCK TABLES `tbl_horasextra` WRITE;
/*!40000 ALTER TABLE `tbl_horasextra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_horasextra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_huesped`
--

DROP TABLE IF EXISTS `tbl_huesped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_huesped` (
  `Pk_Id_Huesped` int NOT NULL AUTO_INCREMENT,
  `Cmp_Nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Apellido` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Telefono` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Pais` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Viaja_Por_Trabajo` tinyint(1) DEFAULT NULL,
  `Cmp_Nombre_Empresa` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Numero_Documento` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Tipo_Documento` enum('DPI','Pasaporte') COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Huesped`),
  UNIQUE KEY `Cmp_Numero_Documento` (`Cmp_Numero_Documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_huesped`
--

LOCK TABLES `tbl_huesped` WRITE;
/*!40000 ALTER TABLE `tbl_huesped` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_huesped` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lotescheques`
--

DROP TABLE IF EXISTS `tbl_lotescheques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_lotescheques` (
  `Pk_Id_Lote` int NOT NULL AUTO_INCREMENT,
  `Cmp_FechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Cmp_UsuarioCrea` varchar(50) NOT NULL,
  `Cmp_TotalCheques` decimal(18,2) NOT NULL DEFAULT '0.00',
  `Cmp_Estado` varchar(20) NOT NULL DEFAULT 'Pendiente',
  `Cmp_Observaciones` varchar(255) DEFAULT NULL,
  `Cmp_FechaModificacion` datetime DEFAULT NULL,
  `Cmp_UsuarioModifico` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lotescheques`
--

LOCK TABLES `tbl_lotescheques` WRITE;
/*!40000 ALTER TABLE `tbl_lotescheques` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_lotescheques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mantenimiento`
--

DROP TABLE IF EXISTS `tbl_mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mantenimiento` (
  `Pk_Id_Mantenimiento` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Salon` int DEFAULT NULL,
  `Fk_Id_Habitacion` int DEFAULT NULL,
  `Fk_Id_Empleado` int DEFAULT NULL,
  `Cmp_Tipo_Mantenimiento` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Descripcion_Mantenimiento` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Estado` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Fecha_Inicio_Mantenimiento` date DEFAULT NULL,
  `Cmp_Fecha_Fin_Mantenimiento` date DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Mantenimiento`),
  KEY `Fk_Id_Salon` (`Fk_Id_Salon`),
  KEY `Fk_Id_Habitacion` (`Fk_Id_Habitacion`),
  KEY `Fk_Id_Empleado` (`Fk_Id_Empleado`),
  CONSTRAINT `tbl_mantenimiento_ibfk_1` FOREIGN KEY (`Fk_Id_Salon`) REFERENCES `tbl_salones` (`Pk_Id_Salon`),
  CONSTRAINT `tbl_mantenimiento_ibfk_2` FOREIGN KEY (`Fk_Id_Habitacion`) REFERENCES `tbl_habitaciones` (`PK_ID_Habitaciones`),
  CONSTRAINT `tbl_mantenimiento_ibfk_3` FOREIGN KEY (`Fk_Id_Empleado`) REFERENCES `tbl_empleado` (`Pk_Id_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mantenimiento`
--

LOCK TABLES `tbl_mantenimiento` WRITE;
/*!40000 ALTER TABLE `tbl_mantenimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_materia_prima`
--

DROP TABLE IF EXISTS `tbl_materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_materia_prima` (
  `Pk_Id_Materia_Prima` int NOT NULL AUTO_INCREMENT,
  `Cmp_Materia_Prima` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Pk_Id_Materia_Prima`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_materia_prima`
--

LOCK TABLES `tbl_materia_prima` WRITE;
/*!40000 ALTER TABLE `tbl_materia_prima` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_materia_prima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_menu`
--

DROP TABLE IF EXISTS `tbl_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_menu` (
  `Pk_Id_Menu` int NOT NULL AUTO_INCREMENT,
  `Cmp_Nombre_Platillo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Descripcion_Platillo` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Precio` decimal(10,2) NOT NULL,
  `Fk_Id_Tipo_Menu` int DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Menu`),
  KEY `Fk_Id_Tipo_Menu` (`Fk_Id_Tipo_Menu`),
  CONSTRAINT `tbl_menu_ibfk_1` FOREIGN KEY (`Fk_Id_Tipo_Menu`) REFERENCES `tbl_tipo_menu` (`Pk_Id_Tipo_Menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_menu`
--

LOCK TABLES `tbl_menu` WRITE;
/*!40000 ALTER TABLE `tbl_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mobiliario`
--

DROP TABLE IF EXISTS `tbl_mobiliario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mobiliario` (
  `Pk_Id_Mobiliario` int NOT NULL AUTO_INCREMENT,
  `Cmp_Mobiliario` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Pk_Id_Mobiliario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mobiliario`
--

LOCK TABLES `tbl_mobiliario` WRITE;
/*!40000 ALTER TABLE `tbl_mobiliario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_mobiliario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_modulo`
--

DROP TABLE IF EXISTS `tbl_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_modulo` (
  `Pk_Id_Modulo` int NOT NULL,
  `Cmp_Nombre_Modulo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Descripcion_Modulo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Estado_Modulo` bit(1) NOT NULL,
  PRIMARY KEY (`Pk_Id_Modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_modulo`
--

LOCK TABLES `tbl_modulo` WRITE;
/*!40000 ALTER TABLE `tbl_modulo` DISABLE KEYS */;
INSERT INTO `tbl_modulo` VALUES (4,'Seguridad','Modulo de seguridad de la hoteleria',_binary ''),(5,'Nominas','Modulo de nominas',_binary '\0'),(6,'Bancos','Modulo de bancos',_binary '\0'),(7,'Contabilidad','Modulo de contabilidad',_binary ''),(8,'Hoteleria','Modulo de Hoteleria',_binary '\0'),(9,'Comercial','Modulo de Comercial',_binary '\0');
/*!40000 ALTER TABLE `tbl_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_monedas`
--

DROP TABLE IF EXISTS `tbl_monedas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_monedas` (
  `Pk_Id_Moneda` int NOT NULL AUTO_INCREMENT,
  `Cmp_CodigoMoneda` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_NombreMoneda` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Simbolo` varchar(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Pk_Id_Moneda`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_monedas`
--

LOCK TABLES `tbl_monedas` WRITE;
/*!40000 ALTER TABLE `tbl_monedas` DISABLE KEYS */;
INSERT INTO `tbl_monedas` VALUES (1,'GTQ','Quetzal','Q',1),(2,'USD','Dólar Americano','$',1);
/*!40000 ALTER TABLE `tbl_monedas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_movimientobancariodetalle`
--

DROP TABLE IF EXISTS `tbl_movimientobancariodetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_movimientobancariodetalle` (
  `Fk_Id_Movimiento` int NOT NULL,
  `Fk_Id_CuentaOrigen` int NOT NULL,
  `Fk_Id_Operacion` int NOT NULL,
  `Pk_Id_Detalle` int NOT NULL,
  `Fk_Id_CuentaContable` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_TipoOperacion` enum('D','C') COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Valor` decimal(18,2) NOT NULL,
  `Cmp_Descripcion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_OrdenDetalle` int NOT NULL DEFAULT '1',
  `Cmp_UsuarioRegistro` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_FechaRegistro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fk_Id_Movimiento`,`Fk_Id_CuentaOrigen`,`Fk_Id_Operacion`,`Pk_Id_Detalle`),
  KEY `idx_fk_cta` (`Fk_Id_CuentaContable`),
  CONSTRAINT `fk_det_cta` FOREIGN KEY (`Fk_Id_CuentaContable`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`),
  CONSTRAINT `fk_det_enc` FOREIGN KEY (`Fk_Id_Movimiento`, `Fk_Id_CuentaOrigen`, `Fk_Id_Operacion`) REFERENCES `tbl_movimientobancarioencabezado` (`Pk_Id_Movimiento`, `Fk_Id_CuentaOrigen`, `Fk_Id_Operacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_movimientobancariodetalle`
--

LOCK TABLES `tbl_movimientobancariodetalle` WRITE;
/*!40000 ALTER TABLE `tbl_movimientobancariodetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_movimientobancariodetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_movimientobancarioencabezado`
--

DROP TABLE IF EXISTS `tbl_movimientobancarioencabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_movimientobancarioencabezado` (
  `Pk_Id_Movimiento` int NOT NULL,
  `Fk_Id_CuentaOrigen` int NOT NULL,
  `Fk_Id_Operacion` int NOT NULL,
  `Cmp_NumeroDocumento` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Fecha` date NOT NULL,
  `Cmp_Concepto` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_MontoTotal` decimal(18,2) NOT NULL,
  `Fk_Id_TipoPago` int DEFAULT NULL,
  `Fk_Id_CuentaDestino` int DEFAULT NULL,
  `Cmp_Beneficiario` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Estado` varchar(20) COLLATE utf8mb4_general_ci DEFAULT 'ACTIVO',
  `Cmp_Conciliado` int DEFAULT '0',
  `Cmp_UsuarioRegistro` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_FechaRegistro` datetime DEFAULT CURRENT_TIMESTAMP,
  `Cmp_UsuarioModifico` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_FechaModificacion` datetime DEFAULT NULL,
  `Fk_Id_Moneda` int DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Movimiento`,`Fk_Id_CuentaOrigen`,`Fk_Id_Operacion`),
  KEY `Fk_Id_CuentaOrigen` (`Fk_Id_CuentaOrigen`),
  KEY `Fk_Id_Operacion` (`Fk_Id_Operacion`),
  KEY `Fk_Id_TipoPago` (`Fk_Id_TipoPago`),
  KEY `Fk_Id_CuentaDestino` (`Fk_Id_CuentaDestino`),
  KEY `Fk_Id_Moneda` (`Fk_Id_Moneda`),
  CONSTRAINT `tbl_movimientobancarioencabezado_ibfk_1` FOREIGN KEY (`Fk_Id_CuentaOrigen`) REFERENCES `tbl_cuentasbancarias` (`Pk_Id_CuentaBancaria`),
  CONSTRAINT `tbl_movimientobancarioencabezado_ibfk_2` FOREIGN KEY (`Fk_Id_Operacion`) REFERENCES `tbl_transaccionesbancarias` (`Pk_Id_Transaccion`),
  CONSTRAINT `tbl_movimientobancarioencabezado_ibfk_3` FOREIGN KEY (`Fk_Id_TipoPago`) REFERENCES `tbl_tipospago` (`Pk_Id_TipoPago`),
  CONSTRAINT `tbl_movimientobancarioencabezado_ibfk_4` FOREIGN KEY (`Fk_Id_CuentaDestino`) REFERENCES `tbl_cuentasbancarias` (`Pk_Id_CuentaBancaria`),
  CONSTRAINT `tbl_movimientobancarioencabezado_ibfk_5` FOREIGN KEY (`Fk_Id_Moneda`) REFERENCES `tbl_monedas` (`Pk_Id_Moneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_movimientobancarioencabezado`
--

LOCK TABLES `tbl_movimientobancarioencabezado` WRITE;
/*!40000 ALTER TABLE `tbl_movimientobancarioencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_movimientobancarioencabezado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_movimientosnomina`
--

DROP TABLE IF EXISTS `tbl_movimientosnomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_movimientosnomina` (
  `Cmp_iId_MovimientoNomina` int NOT NULL AUTO_INCREMENT,
  `Cmp_iId_Nomina` int NOT NULL,
  `Cmp_iId_ConceptoNomina` int NOT NULL,
  `Cmp_deMonto_MovimientoNomina` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Cmp_iId_MovimientoNomina`),
  KEY `Fk_MovimientosNomina_Conceptos` (`Cmp_iId_ConceptoNomina`),
  KEY `Ix_MovimientosNomina_IdNomina` (`Cmp_iId_Nomina`),
  CONSTRAINT `Fk_MovimientosNomina_Conceptos` FOREIGN KEY (`Cmp_iId_ConceptoNomina`) REFERENCES `tbl_conceptosnomina` (`Cmp_iId_ConceptoNomina`),
  CONSTRAINT `Fk_MovimientosNomina_Nomina` FOREIGN KEY (`Cmp_iId_Nomina`) REFERENCES `tbl_nomina` (`Cmp_iId_Nomina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_movimientosnomina`
--

LOCK TABLES `tbl_movimientosnomina` WRITE;
/*!40000 ALTER TABLE `tbl_movimientosnomina` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_movimientosnomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nit_cliente`
--

DROP TABLE IF EXISTS `tbl_nit_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_nit_cliente` (
  `Pk_Id_Nit` int NOT NULL,
  `Fk_Id_Cliente` int DEFAULT NULL,
  `Cmp_Nit_Cliente` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Nit`),
  KEY `Fk_Nit_Cliente` (`Fk_Id_Cliente`),
  CONSTRAINT `Fk_Nit_Cliente` FOREIGN KEY (`Fk_Id_Cliente`) REFERENCES `tbl_cliente` (`Pk_Id_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nit_cliente`
--

LOCK TABLES `tbl_nit_cliente` WRITE;
/*!40000 ALTER TABLE `tbl_nit_cliente` DISABLE KEYS */;
INSERT INTO `tbl_nit_cliente` VALUES (1,1,'0901-22-2929');
/*!40000 ALTER TABLE `tbl_nit_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nomina`
--

DROP TABLE IF EXISTS `tbl_nomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_nomina` (
  `Cmp_iId_Nomina` int NOT NULL AUTO_INCREMENT,
  `Cmp_dPeriodoInicio_Nomina` datetime DEFAULT NULL,
  `Cmp_dPeriodoFin_Nomina` datetime DEFAULT NULL,
  `Cmp_dFechaGeneracion_Nomina` datetime DEFAULT NULL,
  `Cmp_sTipo_Nomina` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_sEstado_Nomina` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Cmp_iId_Nomina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nomina`
--

LOCK TABLES `tbl_nomina` WRITE;
/*!40000 ALTER TABLE `tbl_nomina` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_nomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_numero_cliente`
--

DROP TABLE IF EXISTS `tbl_numero_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_numero_cliente` (
  `Pk_Id_Numero` int NOT NULL,
  `Fk_Id_Cliente` int DEFAULT NULL,
  `Cmp_Telefono_Cliente` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Numero`),
  KEY `Fk_Numero_Cliente` (`Fk_Id_Cliente`),
  CONSTRAINT `Fk_Numero_Cliente` FOREIGN KEY (`Fk_Id_Cliente`) REFERENCES `tbl_cliente` (`Pk_Id_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_numero_cliente`
--

LOCK TABLES `tbl_numero_cliente` WRITE;
/*!40000 ALTER TABLE `tbl_numero_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_numero_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_objetos_perdidos`
--

DROP TABLE IF EXISTS `tbl_objetos_perdidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_objetos_perdidos` (
  `Pk_Id_Objeto` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Mantenimiento` int DEFAULT NULL,
  `Fk_Id_Folio` int DEFAULT NULL,
  `Fk_Id_Folio_Salon` int DEFAULT NULL,
  `Fk_Id_Huesped` int DEFAULT NULL,
  `Cmp_Nombre_Objeto` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Descripcion_Objeto` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Tipo_Objeto` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Fecha_Encontrado` date NOT NULL,
  `Cmp_Entregado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Pk_Id_Objeto`),
  KEY `Fk_OP_Mantenimiento` (`Fk_Id_Mantenimiento`),
  KEY `Fk_OP_Folio` (`Fk_Id_Folio`),
  KEY `Fk_OP_Folio_Salon` (`Fk_Id_Folio_Salon`),
  KEY `Fk_OP_Huesped` (`Fk_Id_Huesped`),
  CONSTRAINT `Fk_OP_Folio` FOREIGN KEY (`Fk_Id_Folio`) REFERENCES `tbl_folio` (`Pk_Id_Folio`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Fk_OP_Folio_Salon` FOREIGN KEY (`Fk_Id_Folio_Salon`) REFERENCES `tbl_folio_salones` (`Pk_Id_Folio_Salones`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Fk_OP_Huesped` FOREIGN KEY (`Fk_Id_Huesped`) REFERENCES `tbl_huesped` (`Pk_Id_Huesped`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Fk_OP_Mantenimiento` FOREIGN KEY (`Fk_Id_Mantenimiento`) REFERENCES `tbl_mantenimiento` (`Pk_Id_Mantenimiento`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_objetos_perdidos`
--

LOCK TABLES `tbl_objetos_perdidos` WRITE;
/*!40000 ALTER TABLE `tbl_objetos_perdidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_objetos_perdidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orden_compra`
--

DROP TABLE IF EXISTS `tbl_orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_orden_compra` (
  `Pk_Id_Orden_Compra` int NOT NULL AUTO_INCREMENT,
  `Cmp_Descripcion_Orden_Compra` varchar(255) NOT NULL,
  `Cmp_Monto_Solicitado` decimal(12,2) NOT NULL,
  PRIMARY KEY (`Pk_Id_Orden_Compra`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orden_compra`
--

LOCK TABLES `tbl_orden_compra` WRITE;
/*!40000 ALTER TABLE `tbl_orden_compra` DISABLE KEYS */;
INSERT INTO `tbl_orden_compra` VALUES (1,'Compra de escritorio',1250.00),(2,'Compra Grande',70000.00),(3,'Compra de sillas',3000.00);
/*!40000 ALTER TABLE `tbl_orden_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orden_compra_autorizada`
--

DROP TABLE IF EXISTS `tbl_orden_compra_autorizada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_orden_compra_autorizada` (
  `Pk_Id_Autorizacion` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Orden_Compra` int NOT NULL,
  `Fk_Id_Banco` int NOT NULL,
  `Fk_Id_Empleado` int DEFAULT NULL,
  `Cmp_Fecha_Autorizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Cmp_Monto_Autorizado` decimal(12,2) NOT NULL COMMENT 'Se llena automáticamente con el monto solicitado de la orden',
  `Fk_Id_Estado_Autorizacion` int NOT NULL,
  `Cmp_Observaciones` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Autorizacion`),
  KEY `FK_Autorizada_Orden` (`Fk_Id_Orden_Compra`),
  KEY `FK_Autorizada_Banco` (`Fk_Id_Banco`),
  KEY `FK_Autorizada_Empleado` (`Fk_Id_Empleado`),
  KEY `FK_Autorizada_Estado` (`Fk_Id_Estado_Autorizacion`),
  CONSTRAINT `FK_Autorizada_Banco` FOREIGN KEY (`Fk_Id_Banco`) REFERENCES `tbl_bancos` (`Pk_Id_Banco`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_Autorizada_Empleado` FOREIGN KEY (`Fk_Id_Empleado`) REFERENCES `tbl_empleado_autorizado` (`Pk_Id_Empleado`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_Autorizada_Estado` FOREIGN KEY (`Fk_Id_Estado_Autorizacion`) REFERENCES `tbl_estado_autorizacion` (`Pk_Id_Estado_Autorizacion`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_Autorizada_Orden` FOREIGN KEY (`Fk_Id_Orden_Compra`) REFERENCES `tbl_orden_compra` (`Pk_Id_Orden_Compra`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orden_compra_autorizada`
--

LOCK TABLES `tbl_orden_compra_autorizada` WRITE;
/*!40000 ALTER TABLE `tbl_orden_compra_autorizada` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_orden_compra_autorizada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ordenes_produccion`
--

DROP TABLE IF EXISTS `tbl_ordenes_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ordenes_produccion` (
  `Pk_Id_Orden_Produccion` int NOT NULL AUTO_INCREMENT,
  `Cmp_Fecha_Solicitud` date DEFAULT NULL,
  `Cmp_Fecha_Registro` date DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Orden_Produccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenes_produccion`
--

LOCK TABLES `tbl_ordenes_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_ordenes_produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ordenes_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pago`
--

DROP TABLE IF EXISTS `tbl_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pago` (
  `Pk_Id_Pago` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Folio` int NOT NULL,
  `Cmp_Metodo_Pago` enum('Tarjeta','Efectivo','Transferencia','Cheque') COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Fecha_Pago` datetime DEFAULT CURRENT_TIMESTAMP,
  `Cmp_Monto_Total` decimal(10,2) NOT NULL,
  `Cmp_Estado_Pago` enum('Pagado','Pendiente','Cancelado') COLLATE utf8mb4_general_ci DEFAULT 'Pendiente',
  PRIMARY KEY (`Pk_Id_Pago`),
  KEY `Fk_Id_Folio` (`Fk_Id_Folio`),
  CONSTRAINT `tbl_pago_ibfk_1` FOREIGN KEY (`Fk_Id_Folio`) REFERENCES `tbl_folio` (`Pk_Id_Folio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pago`
--

LOCK TABLES `tbl_pago` WRITE;
/*!40000 ALTER TABLE `tbl_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pago_cheque`
--

DROP TABLE IF EXISTS `tbl_pago_cheque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pago_cheque` (
  `Fk_Id_Pago` int NOT NULL,
  `Cmp_Numero_Cheque` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Banco_Emisor` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Nombre_Titular` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Fecha_Emision` date DEFAULT NULL,
  `Cmp_Fecha_Cobro` date DEFAULT NULL,
  `Cmp_Estado_Cheque` enum('Emitido','Cobrado','Devuelto') COLLATE utf8mb4_general_ci DEFAULT 'Emitido',
  PRIMARY KEY (`Fk_Id_Pago`),
  CONSTRAINT `tbl_pago_cheque_ibfk_1` FOREIGN KEY (`Fk_Id_Pago`) REFERENCES `tbl_pago` (`Pk_Id_Pago`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pago_cheque`
--

LOCK TABLES `tbl_pago_cheque` WRITE;
/*!40000 ALTER TABLE `tbl_pago_cheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pago_cheque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pago_efectivo`
--

DROP TABLE IF EXISTS `tbl_pago_efectivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pago_efectivo` (
  `Fk_Id_Pago` int NOT NULL,
  `Cmp_Numero_Recibo` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Observaciones` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Fk_Id_Pago`),
  CONSTRAINT `tbl_pago_efectivo_ibfk_1` FOREIGN KEY (`Fk_Id_Pago`) REFERENCES `tbl_pago` (`Pk_Id_Pago`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pago_efectivo`
--

LOCK TABLES `tbl_pago_efectivo` WRITE;
/*!40000 ALTER TABLE `tbl_pago_efectivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pago_efectivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pago_tarjeta`
--

DROP TABLE IF EXISTS `tbl_pago_tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pago_tarjeta` (
  `Fk_Id_Pago` int NOT NULL,
  `Cmp_Nombre_Titular` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Numero_Tarjeta` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Fecha_Vencimiento` date DEFAULT NULL,
  `Cmp_CVC` int DEFAULT NULL,
  `Cmp_Codigo_Postal` int DEFAULT NULL,
  PRIMARY KEY (`Fk_Id_Pago`),
  CONSTRAINT `tbl_pago_tarjeta_ibfk_1` FOREIGN KEY (`Fk_Id_Pago`) REFERENCES `tbl_pago` (`Pk_Id_Pago`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pago_tarjeta`
--

LOCK TABLES `tbl_pago_tarjeta` WRITE;
/*!40000 ALTER TABLE `tbl_pago_tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pago_tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pago_transferencia`
--

DROP TABLE IF EXISTS `tbl_pago_transferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pago_transferencia` (
  `Fk_Id_Pago` int NOT NULL,
  `Cmp_Numero_Transferencia` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Banco_Origen` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Cuenta_Origen` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Fk_Id_Pago`),
  CONSTRAINT `tbl_pago_transferencia_ibfk_1` FOREIGN KEY (`Fk_Id_Pago`) REFERENCES `tbl_pago` (`Pk_Id_Pago`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pago_transferencia`
--

LOCK TABLES `tbl_pago_transferencia` WRITE;
/*!40000 ALTER TABLE `tbl_pago_transferencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pago_transferencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_parametroscheques`
--

DROP TABLE IF EXISTS `tbl_parametroscheques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_parametroscheques` (
  `Pk_Id_Parametro` int NOT NULL AUTO_INCREMENT,
  `Cmp_Parametro` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Valor` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Descripcion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Modulo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'BANCOS',
  `Cmp_Estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Pk_Id_Parametro`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_parametroscheques`
--

LOCK TABLES `tbl_parametroscheques` WRITE;
/*!40000 ALTER TABLE `tbl_parametroscheques` DISABLE KEYS */;
INSERT INTO `tbl_parametroscheques` VALUES (1,'TRANSACCION CHEQUES','2','Código de transacción para cheques por nómina','BANCOS',1),(2,'CUENTA SUELDOS PAGAR','2110','Cuenta contable para sueldos por pagar','BANCOS',1),(3,'CUENTA BANCO PRINCIPAL','1110','Cuenta contable del banco principal','BANCOS',1);
/*!40000 ALTER TABLE `tbl_parametroscheques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedidos_menu`
--

DROP TABLE IF EXISTS `tbl_pedidos_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pedidos_menu` (
  `Pk_Id_Pedido_Menu` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Reserva_Salon` int DEFAULT NULL,
  `Fk_Id_Menu` int DEFAULT NULL,
  `Cmp_Cantidad_Platillos` int DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Pedido_Menu`),
  KEY `Fk_Id_Reserva_Salon` (`Fk_Id_Reserva_Salon`),
  KEY `Fk_Id_Menu` (`Fk_Id_Menu`),
  CONSTRAINT `tbl_pedidos_menu_ibfk_1` FOREIGN KEY (`Fk_Id_Reserva_Salon`) REFERENCES `tbl_reservas_salones` (`Pk_Id_Reserva_Salon`),
  CONSTRAINT `tbl_pedidos_menu_ibfk_2` FOREIGN KEY (`Fk_Id_Menu`) REFERENCES `tbl_menu` (`Pk_Id_Menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedidos_menu`
--

LOCK TABLES `tbl_pedidos_menu` WRITE;
/*!40000 ALTER TABLE `tbl_pedidos_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pedidos_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perfil`
--

DROP TABLE IF EXISTS `tbl_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_perfil` (
  `Pk_Id_Perfil` int NOT NULL AUTO_INCREMENT,
  `Cmp_Puesto_Perfil` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Descripcion_Perfil` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Estado_Perfil` bit(1) NOT NULL,
  `Cmp_Tipo_Perfil` int DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perfil`
--

LOCK TABLES `tbl_perfil` WRITE;
/*!40000 ALTER TABLE `tbl_perfil` DISABLE KEYS */;
INSERT INTO `tbl_perfil` VALUES (1,'Administrador','Perfil con todos los permisos',_binary '',1),(12,'Probador','Persona que prueba codigo',_binary '',1),(22,'Pruebadef','pufa',_binary '',1),(33,'tester','provee',_binary '',1);
/*!40000 ALTER TABLE `tbl_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_periodoscontables`
--

DROP TABLE IF EXISTS `tbl_periodoscontables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_periodoscontables` (
  `Pk_Id_Periodo` int NOT NULL AUTO_INCREMENT,
  `Cmp_Anio` int NOT NULL,
  `Cmp_Mes` tinyint DEFAULT NULL,
  `Cmp_FechaInicio` date NOT NULL,
  `Cmp_FechaFin` date NOT NULL,
  `Cmp_Estado` tinyint(1) NOT NULL DEFAULT '1',
  `Cmp_ModoActualizacion` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Pk_Id_Periodo`),
  UNIQUE KEY `Uk_Periodo` (`Cmp_Anio`,`Cmp_Mes`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_periodoscontables`
--

LOCK TABLES `tbl_periodoscontables` WRITE;
/*!40000 ALTER TABLE `tbl_periodoscontables` DISABLE KEYS */;
INSERT INTO `tbl_periodoscontables` VALUES (1,2025,7,'2025-07-01','2025-07-31',0,0),(2,2025,8,'2025-08-01','2025-08-31',0,1),(3,2025,9,'2025-09-01','2025-09-30',0,0),(4,2025,10,'2025-10-01','2025-10-31',0,1),(5,2025,11,'2025-11-01','2025-11-30',1,0);
/*!40000 ALTER TABLE `tbl_periodoscontables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_permiso_perfil_aplicacion`
--

DROP TABLE IF EXISTS `tbl_permiso_perfil_aplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_permiso_perfil_aplicacion` (
  `Fk_Id_Perfil` int NOT NULL,
  `Fk_Id_Modulo` int NOT NULL,
  `Fk_Id_Aplicacion` int NOT NULL,
  `Cmp_Ingresar_Permisos_Aplicacion_Perfil` bit(1) DEFAULT NULL,
  `Cmp_Consultar_Permisos_Aplicacion_Perfil` bit(1) DEFAULT NULL,
  `Cmp_Modificar_Permisos_Aplicacion_Perfil` bit(1) DEFAULT NULL,
  `Cmp_Eliminar_Permisos_Aplicacion_Perfil` bit(1) DEFAULT NULL,
  `Cmp_Imprimir_Permisos_Aplicacion_Perfil` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Fk_Id_Perfil`,`Fk_Id_Modulo`,`Fk_Id_Aplicacion`),
  KEY `Fk_PermisoPerfil_ModuloAplicacion` (`Fk_Id_Modulo`,`Fk_Id_Aplicacion`),
  CONSTRAINT `Fk_PermisoPerfil` FOREIGN KEY (`Fk_Id_Perfil`) REFERENCES `tbl_perfil` (`Pk_Id_Perfil`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Fk_PermisoPerfil_ModuloAplicacion` FOREIGN KEY (`Fk_Id_Modulo`, `Fk_Id_Aplicacion`) REFERENCES `tbl_asignacion_modulo_aplicacion` (`Fk_Id_Modulo`, `Fk_Id_Aplicacion`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_permiso_perfil_aplicacion`
--

LOCK TABLES `tbl_permiso_perfil_aplicacion` WRITE;
/*!40000 ALTER TABLE `tbl_permiso_perfil_aplicacion` DISABLE KEYS */;
INSERT INTO `tbl_permiso_perfil_aplicacion` VALUES (12,4,303,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0'),(12,4,306,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(22,4,301,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(22,4,302,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(22,4,303,_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0'),(22,4,304,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(22,4,305,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(22,4,306,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(22,4,307,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(22,4,308,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(22,4,309,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `tbl_permiso_perfil_aplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_permiso_usuario_aplicacion`
--

DROP TABLE IF EXISTS `tbl_permiso_usuario_aplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_permiso_usuario_aplicacion` (
  `Fk_Id_Usuario` int NOT NULL,
  `Fk_Id_Modulo` int NOT NULL,
  `Fk_Id_Aplicacion` int NOT NULL,
  `Cmp_Ingresar_Permiso_Aplicacion_Usuario` bit(1) DEFAULT NULL,
  `Cmp_Consultar_Permiso_Aplicacion_Usuario` bit(1) DEFAULT NULL,
  `Cmp_Modificar_Permiso_Aplicacion_Usuario` bit(1) DEFAULT NULL,
  `Cmp_Eliminar_Permiso_Aplicacion_Usuario` bit(1) DEFAULT NULL,
  `Cmp_Imprimir_Permiso_Aplicacion_Usuario` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Fk_Id_Usuario`,`Fk_Id_Modulo`,`Fk_Id_Aplicacion`),
  KEY `Fk_Permiso_Modulo_Aplicacion` (`Fk_Id_Modulo`,`Fk_Id_Aplicacion`),
  CONSTRAINT `Fk_Permiso_Modulo_Aplicacion` FOREIGN KEY (`Fk_Id_Modulo`, `Fk_Id_Aplicacion`) REFERENCES `tbl_asignacion_modulo_aplicacion` (`Fk_Id_Modulo`, `Fk_Id_Aplicacion`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Fk_Permiso_Usuario` FOREIGN KEY (`Fk_Id_Usuario`) REFERENCES `tbl_usuario` (`Pk_Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_permiso_usuario_aplicacion`
--

LOCK TABLES `tbl_permiso_usuario_aplicacion` WRITE;
/*!40000 ALTER TABLE `tbl_permiso_usuario_aplicacion` DISABLE KEYS */;
INSERT INTO `tbl_permiso_usuario_aplicacion` VALUES (4,4,301,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,4,302,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,4,303,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0'),(4,4,304,_binary '',_binary '',_binary '\0',_binary '\0',_binary '\0'),(4,4,305,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,4,306,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,4,307,_binary '',_binary '',_binary '',_binary '',_binary ''),(4,4,308,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,301,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,302,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,303,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,304,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,305,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,306,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,307,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,308,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,4,309,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,401,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,402,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,403,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,404,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,405,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,406,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,407,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,408,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,409,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,410,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,411,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,412,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,5,413,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,6,1401,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,6,1402,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,6,1403,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,6,1404,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,6,1405,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,6,1406,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,6,1407,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,6,1408,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,6,1409,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,7,2401,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,7,2402,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,7,2403,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,7,2404,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,7,2405,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,7,2406,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,7,2407,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,7,2408,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,7,2409,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,7,2410,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,7,2411,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,7,2412,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,7,2413,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,7,2414,_binary '',_binary '',_binary '',_binary '',_binary ''),(23,7,2415,_binary '',_binary '',_binary '',_binary '',_binary '');
/*!40000 ALTER TABLE `tbl_permiso_usuario_aplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prestamos`
--

DROP TABLE IF EXISTS `tbl_prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_prestamos` (
  `Cmp_iId_Prestamo` int NOT NULL AUTO_INCREMENT,
  `Cmp_iId_Empleado` int NOT NULL,
  `Cmp_deMonto_Prestamo` decimal(10,2) DEFAULT NULL,
  `Cmp_dFecha_Prestamo` datetime DEFAULT NULL,
  `Cmp_deSaldoPendiente_Prestamo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Cmp_iId_Prestamo`),
  KEY `Ix_Prestamos_IdEmpleado` (`Cmp_iId_Empleado`),
  CONSTRAINT `Fk_Prestamos_Empleados` FOREIGN KEY (`Cmp_iId_Empleado`) REFERENCES `tbl_empleados` (`Cmp_iId_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prestamos`
--

LOCK TABLES `tbl_prestamos` WRITE;
/*!40000 ALTER TABLE `tbl_prestamos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_promociones`
--

DROP TABLE IF EXISTS `tbl_promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_promociones` (
  `Pk_Id_Promociones` int NOT NULL AUTO_INCREMENT,
  `Cmp_Nombre_Promocion` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Descripcion` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Porcentaje_Descuento` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Pk_Id_Promociones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER TABLE Tbl_Promociones
ADD COLUMN Cmp_Fecha_Inicio DATE AFTER Cmp_Porcentaje_Descuento,
ADD COLUMN Cmp_Fecha_Final DATE AFTER Cmp_Fecha_Inicio;
--


INSERT INTO Tbl_Habitaciones 
(PK_ID_Habitaciones, FK_ID_Tipo_Habitaciones, Cmp_Piso_Habitacion, 
 Cmp_Descripcion_Habitacion, Cmp_Tamaño_Habitacion_m2, 
 Cmp_Capacidad_Habitacion, Cmp_Estado_Habitacion, Cmp_Tarifa_Noche)
VALUES
(5, 3, 3, 'Habitación Familiar #301', '60', 4, 1, 1250),
(6, 3, 3, 'Habitación Familiar con balcón #302', '62', 5, 0, 1300),
(7, 4, 4, 'Habitación Presidencial #401', '80', 4, 0, 2000),
(8, 4, 4, 'Suite Panorámica con terraza #402', '75', 3, 1, 1800),
(9, 5, 5, 'Habitación Matrimonial Romántica #501', '35', 2, 0, 950),
(10, 5, 5, 'Habitación Doble Premium #502', '40', 3, 1, 1100),
(11, 1, 1, 'Habitación Económica #103', '20', 1, 0, 350),
(12, 1, 1, 'Habitación Económica Doble #104', '22', 2, 1, 400),
(13, 2, 2, 'Suite Junior con escritorio #203', '38', 2, 0, 800),
(14, 3, 3, 'Habitación Familiar Deluxe #303', '65', 6, 0, 1400),
(15, 4, 4, 'Suite Ejecutiva con vista al mar #403', '70', 3, 0, 1600),
(16, 5, 5, 'Habitación Familiar Premium #504', '68', 5, 1, 1500),
(17, 2, 2, 'Suite Ejecutiva Doble #204', '48', 3, 0, 1150),
(18, 3, 3, 'Habitación Familiar Estándar #305', '58', 4, 0, 1100),
(19, 1, 1, 'Habitación Sencilla #105', '28', 1, 1, 500),
(20, 4, 4, 'Suite Real con piscina privada #405', '95', 5, 0, 2500);
-- Dumping data for table `tbl_promociones`
--

LOCK TABLES `tbl_promociones` WRITE;
/*!40000 ALTER TABLE `tbl_promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_puestos`
--

DROP TABLE IF EXISTS `tbl_puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_puestos` (
  `Cmp_iId_Puesto` int NOT NULL AUTO_INCREMENT,
  `Cmp_sNombre_Puesto` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_sDescripcion_Puesto` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_iId_Departamento` int NOT NULL,
  PRIMARY KEY (`Cmp_iId_Puesto`),
  KEY `Ix_Puestos_IdDepartamento` (`Cmp_iId_Departamento`),
  CONSTRAINT `Fk_Puestos_Departamentos` FOREIGN KEY (`Cmp_iId_Departamento`) REFERENCES `tbl_departamentos` (`Cmp_iId_Departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_puestos`
--

LOCK TABLES `tbl_puestos` WRITE;
/*!40000 ALTER TABLE `tbl_puestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_puntos_huesped`
--

DROP TABLE IF EXISTS `tbl_puntos_huesped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_puntos_huesped` (
  `Pk_Id_Puntos_Huesped` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Huesped` int NOT NULL,
  `Cmp_Puntos_Acumulados` int DEFAULT '0',
  `Cmp_Puntos_Obtenidos` int DEFAULT '0',
  `Cmp_Puntos_Canjeados` int DEFAULT '0',
  `Cmp_Fecha_Ultima_Actualizacion` date DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Puntos_Huesped`),
  KEY `Fk_Id_Huesped` (`Fk_Id_Huesped`),
  CONSTRAINT `tbl_puntos_huesped_ibfk_1` FOREIGN KEY (`Fk_Id_Huesped`) REFERENCES `tbl_huesped` (`Pk_Id_Huesped`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_puntos_huesped`
--

LOCK TABLES `tbl_puntos_huesped` WRITE;
/*!40000 ALTER TABLE `tbl_puntos_huesped` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_puntos_huesped` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_receta`
--

DROP TABLE IF EXISTS `tbl_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_receta` (
  `Pk_Id_Receta` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Menu` int DEFAULT NULL,
  `Fk_Id_Materia_Prima` int DEFAULT NULL,
  `Cmp_Cantidad` decimal(10,2) NOT NULL,
  `Cmp_Unidad_Medida` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Receta`),
  KEY `Fk_Id_Menu` (`Fk_Id_Menu`),
  KEY `Fk_Id_Materia_Prima` (`Fk_Id_Materia_Prima`),
  CONSTRAINT `tbl_receta_ibfk_1` FOREIGN KEY (`Fk_Id_Menu`) REFERENCES `tbl_menu` (`Pk_Id_Menu`),
  CONSTRAINT `tbl_receta_ibfk_2` FOREIGN KEY (`Fk_Id_Materia_Prima`) REFERENCES `tbl_materia_prima` (`Pk_Id_Materia_Prima`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_receta`
--

LOCK TABLES `tbl_receta` WRITE;
/*!40000 ALTER TABLE `tbl_receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reporte_balance_general`
--

DROP TABLE IF EXISTS `tbl_reporte_balance_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reporte_balance_general` (
  `Pk_Id_Reporte` int NOT NULL AUTO_INCREMENT,
  `Fk_Codigo_Cuenta` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Nombre_Cuenta` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Tipo_Cuenta` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Valor` decimal(15,2) DEFAULT '0.00',
  `Cmp_Periodo` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Fecha_Reporte` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Pk_Id_Reporte`),
  KEY `Fk_Codigo_Cuenta` (`Fk_Codigo_Cuenta`),
  CONSTRAINT `tbl_reporte_balance_general_ibfk_1` FOREIGN KEY (`Fk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reporte_balance_general`
--

LOCK TABLES `tbl_reporte_balance_general` WRITE;
/*!40000 ALTER TABLE `tbl_reporte_balance_general` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reporte_balance_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reporte_balance_saldos`
--

DROP TABLE IF EXISTS `tbl_reporte_balance_saldos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reporte_balance_saldos` (
  `Pk_Id_Reporte` int NOT NULL AUTO_INCREMENT,
  `Fk_Codigo_Cuenta` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Nombre_Cuenta` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Debe` decimal(15,2) DEFAULT '0.00',
  `Cmp_Haber` decimal(15,2) DEFAULT '0.00',
  `Cmp_Saldo` decimal(15,2) DEFAULT '0.00',
  `Cmp_Periodo` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Fecha_Reporte` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Pk_Id_Reporte`),
  KEY `Fk_Codigo_Cuenta` (`Fk_Codigo_Cuenta`),
  CONSTRAINT `tbl_reporte_balance_saldos_ibfk_1` FOREIGN KEY (`Fk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reporte_balance_saldos`
--

LOCK TABLES `tbl_reporte_balance_saldos` WRITE;
/*!40000 ALTER TABLE `tbl_reporte_balance_saldos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reporte_balance_saldos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reporte_estado_resultados`
--

DROP TABLE IF EXISTS `tbl_reporte_estado_resultados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reporte_estado_resultados` (
  `Pk_Id_Reporte` int NOT NULL AUTO_INCREMENT,
  `Fk_Codigo_Cuenta` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Nombre_Cuenta` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Tipo_Cuenta` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Valor` decimal(15,2) DEFAULT '0.00',
  `Cmp_Periodo` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Fecha_Reporte` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Pk_Id_Reporte`),
  KEY `Fk_Codigo_Cuenta` (`Fk_Codigo_Cuenta`),
  CONSTRAINT `tbl_reporte_estado_resultados_ibfk_1` FOREIGN KEY (`Fk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reporte_estado_resultados`
--

LOCK TABLES `tbl_reporte_estado_resultados` WRITE;
/*!40000 ALTER TABLE `tbl_reporte_estado_resultados` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reporte_estado_resultados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reporte_flujo_efectivo`
--

DROP TABLE IF EXISTS `tbl_reporte_flujo_efectivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reporte_flujo_efectivo` (
  `Pk_Id_Reporte` int NOT NULL AUTO_INCREMENT,
  `Fk_Codigo_Cuenta` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Nombre_Cuenta` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Tipo_Actividad` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Entrada` decimal(15,2) DEFAULT '0.00',
  `Cmp_Salida` decimal(15,2) DEFAULT '0.00',
  `Cmp_Periodo` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Fecha_Reporte` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Pk_Id_Reporte`),
  KEY `Fk_Codigo_Cuenta` (`Fk_Codigo_Cuenta`),
  CONSTRAINT `tbl_reporte_flujo_efectivo_ibfk_1` FOREIGN KEY (`Fk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reporte_flujo_efectivo`
--

LOCK TABLES `tbl_reporte_flujo_efectivo` WRITE;
/*!40000 ALTER TABLE `tbl_reporte_flujo_efectivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reporte_flujo_efectivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reportes`
--

DROP TABLE IF EXISTS `tbl_reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reportes` (
  `Pk_Id_Reporte` int NOT NULL AUTO_INCREMENT,
  `Cmp_Titulo_Reporte` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Ruta_Reporte` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Fecha_Reporte` date DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Reporte`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reportes`
--

LOCK TABLES `tbl_reportes` WRITE;
/*!40000 ALTER TABLE `tbl_reportes` DISABLE KEYS */;
INSERT INTO `tbl_reportes` VALUES (1,'Reporte Inicial','ruta/reporte.pdf','2025-01-01');
/*!40000 ALTER TABLE `tbl_reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reserva`
--

DROP TABLE IF EXISTS `tbl_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reserva` (
  `Pk_Id_Reserva` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Huesped` int NOT NULL,
  `Fk_Id_Habitacion` int DEFAULT NULL,
  `Fk_Id_Promociones` int DEFAULT NULL,
  `Fk_Id_Buffet` int DEFAULT NULL,
  `Cmp_Fecha_Reserva` date DEFAULT NULL,
  `Cmp_Fecha_Entrada` date DEFAULT NULL,
  `Cmp_Fecha_Salida` date DEFAULT NULL,
  `Cmp_Num_Huespedes` int DEFAULT NULL,
  `Cmp_Peticiones_Especiales` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Estado_Reserva` enum('Pendiente','Confirmada','Cancelada','Finalizada') COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Total_Reserva` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Reserva`),
  KEY `Fk_Id_Huesped` (`Fk_Id_Huesped`),
  KEY `Fk_Id_Buffet` (`Fk_Id_Buffet`),
  KEY `Fk_Id_Habitacion` (`Fk_Id_Habitacion`),
  KEY `Fk_Id_Promociones` (`Fk_Id_Promociones`),
  CONSTRAINT `tbl_reserva_ibfk_1` FOREIGN KEY (`Fk_Id_Huesped`) REFERENCES `tbl_huesped` (`Pk_Id_Huesped`),
  CONSTRAINT `tbl_reserva_ibfk_2` FOREIGN KEY (`Fk_Id_Buffet`) REFERENCES `tbl_buffet` (`Pk_Id_Buffet`),
  CONSTRAINT `tbl_reserva_ibfk_3` FOREIGN KEY (`Fk_Id_Habitacion`) REFERENCES `tbl_habitaciones` (`PK_ID_Habitaciones`),
  CONSTRAINT `tbl_reserva_ibfk_4` FOREIGN KEY (`Fk_Id_Promociones`) REFERENCES `tbl_promociones` (`Pk_Id_Promociones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reserva`
--

LOCK TABLES `tbl_reserva` WRITE;
/*!40000 ALTER TABLE `tbl_reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reservas_alacarta`
--

DROP TABLE IF EXISTS `tbl_reservas_alacarta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reservas_alacarta` (
  `PK_Id_Reserva` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Huesped` int DEFAULT NULL,
  `Fk_Id_Habitacion` int DEFAULT NULL,
  `Fk_Id_Salon` int DEFAULT NULL,
  `Cmp_Fecha_Reserva` date DEFAULT NULL,
  `Cmp_Hora_reserva` time DEFAULT NULL,
  `Cmp_Numero_Comensales` int DEFAULT NULL,
  `Cmp_Estado` int DEFAULT NULL,
  PRIMARY KEY (`PK_Id_Reserva`),
  KEY `Fk_Id_Huesped` (`Fk_Id_Huesped`),
  KEY `Fk_Id_Habitacion` (`Fk_Id_Habitacion`),
  KEY `Fk_Id_Salon` (`Fk_Id_Salon`),
  CONSTRAINT `tbl_reservas_alacarta_ibfk_1` FOREIGN KEY (`Fk_Id_Huesped`) REFERENCES `tbl_huesped` (`Pk_Id_Huesped`),
  CONSTRAINT `tbl_reservas_alacarta_ibfk_2` FOREIGN KEY (`Fk_Id_Habitacion`) REFERENCES `tbl_habitaciones` (`PK_ID_Habitaciones`),
  CONSTRAINT `tbl_reservas_alacarta_ibfk_3` FOREIGN KEY (`Fk_Id_Salon`) REFERENCES `tbl_salones` (`Pk_Id_Salon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reservas_alacarta`
--

LOCK TABLES `tbl_reservas_alacarta` WRITE;
/*!40000 ALTER TABLE `tbl_reservas_alacarta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reservas_alacarta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reservas_salones`
--

DROP TABLE IF EXISTS `tbl_reservas_salones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reservas_salones` (
  `Pk_Id_Reserva_Salon` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Huesped` int DEFAULT NULL,
  `Fk_Id_Salon` int DEFAULT NULL,
  `Fk_Id_Promociones` int DEFAULT NULL,
  `Cmp_Fecha_Reserva` date DEFAULT NULL,
  `Cmp_Hora_Inicio` time DEFAULT NULL,
  `Cmp_Hora_Fin` time DEFAULT NULL,
  `Cmp_Cantidad_Personas` int DEFAULT NULL,
  `Cmp_Monto_Total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Reserva_Salon`),
  KEY `Fk_Id_Huesped` (`Fk_Id_Huesped`),
  KEY `Fk_Id_Salon` (`Fk_Id_Salon`),
  KEY `Fk_Id_Promociones` (`Fk_Id_Promociones`),
  CONSTRAINT `tbl_reservas_salones_ibfk_1` FOREIGN KEY (`Fk_Id_Huesped`) REFERENCES `tbl_huesped` (`Pk_Id_Huesped`),
  CONSTRAINT `tbl_reservas_salones_ibfk_2` FOREIGN KEY (`Fk_Id_Salon`) REFERENCES `tbl_salones` (`Pk_Id_Salon`),
  CONSTRAINT `tbl_reservas_salones_ibfk_3` FOREIGN KEY (`Fk_Id_Promociones`) REFERENCES `tbl_promociones` (`Pk_Id_Promociones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reservas_salones`
--

LOCK TABLES `tbl_reservas_salones` WRITE;
/*!40000 ALTER TABLE `tbl_reservas_salones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reservas_salones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_room_service`
--

DROP TABLE IF EXISTS `tbl_room_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_room_service` (
  `Pk_Id_Room` int NOT NULL AUTO_INCREMENT,
  `FK_Id_Huesped` int DEFAULT NULL,
  `Fk_Id_Habitacion` int DEFAULT NULL,
  `Cmp_Fecha_Orden` datetime DEFAULT NULL,
  `Cmp_Estado` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Room`),
  KEY `FK_Id_Huesped` (`FK_Id_Huesped`),
  KEY `Fk_Id_Habitacion` (`Fk_Id_Habitacion`),
  CONSTRAINT `tbl_room_service_ibfk_1` FOREIGN KEY (`FK_Id_Huesped`) REFERENCES `tbl_huesped` (`Pk_Id_Huesped`),
  CONSTRAINT `tbl_room_service_ibfk_2` FOREIGN KEY (`Fk_Id_Habitacion`) REFERENCES `tbl_habitaciones` (`PK_ID_Habitaciones`),
  CONSTRAINT `CHK_Estado_Room_Service` CHECK ((`Cmp_Estado` in (_utf8mb4'Entregado',_utf8mb4'No entregado')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_room_service`
--

LOCK TABLES `tbl_room_service` WRITE;
/*!40000 ALTER TABLE `tbl_room_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_room_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_room_service_detalle`
--

DROP TABLE IF EXISTS `tbl_room_service_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_room_service_detalle` (
  `Pk_Id_Detalle` int NOT NULL AUTO_INCREMENT,
  `FK_Id_Room` int DEFAULT NULL,
  `FK_Id_Menu` int DEFAULT NULL,
  `Cmp_Cantidad` int DEFAULT NULL,
  `Cmp_Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Cmp_Subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Detalle`),
  KEY `FK_Id_Room` (`FK_Id_Room`),
  KEY `FK_Id_Menu` (`FK_Id_Menu`),
  CONSTRAINT `tbl_room_service_detalle_ibfk_1` FOREIGN KEY (`FK_Id_Room`) REFERENCES `tbl_room_service` (`Pk_Id_Room`),
  CONSTRAINT `tbl_room_service_detalle_ibfk_2` FOREIGN KEY (`FK_Id_Menu`) REFERENCES `tbl_menu` (`Pk_Id_Menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_room_service_detalle`
--

LOCK TABLES `tbl_room_service_detalle` WRITE;
/*!40000 ALTER TABLE `tbl_room_service_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_room_service_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_salario_empleado`
--

DROP TABLE IF EXISTS `tbl_salario_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_salario_empleado` (
  `Pk_Id_Salario` int NOT NULL,
  `Fk_Id_Empleado` int DEFAULT NULL,
  `Cmp_Monto_Salario_Empleado` float DEFAULT NULL,
  `Cmp_Fecha_Inicio_Salario_Empleado` datetime DEFAULT NULL,
  `Cmp_Fecha_Fin_Salario_Empleado` datetime DEFAULT NULL,
  `Cmp_Estado_Salario_Empleado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Salario`),
  KEY `Fk_Salario_Empleado` (`Fk_Id_Empleado`),
  CONSTRAINT `Fk_Salario_Empleado` FOREIGN KEY (`Fk_Id_Empleado`) REFERENCES `tbl_empleado` (`Pk_Id_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_salario_empleado`
--

LOCK TABLES `tbl_salario_empleado` WRITE;
/*!40000 ALTER TABLE `tbl_salario_empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_salario_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_salones`
--

DROP TABLE IF EXISTS `tbl_salones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_salones` (
  `Pk_Id_Salon` int NOT NULL AUTO_INCREMENT,
  `Cmp_Nombre_Salon` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Ubicacion` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Capacidad` int DEFAULT NULL,
  `Cmp_Disponibilidad` tinyint(1) NOT NULL,
  PRIMARY KEY (`Pk_Id_Salon`),
  CONSTRAINT `tbl_salones_chk_1` CHECK ((`Cmp_Disponibilidad` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_salones`
--

LOCK TABLES `tbl_salones` WRITE;
/*!40000 ALTER TABLE `tbl_salones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_salones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_servicio_adicional`
--

DROP TABLE IF EXISTS `tbl_servicio_adicional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_servicio_adicional` (
  `Pk_Id_Servicio` int NOT NULL AUTO_INCREMENT,
  `Pk_Id_Reserva` int DEFAULT NULL,
  `Cmp_Tipo_Servicio` varchar(75) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Descripcion` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Costo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_servicio_adicional`
--

LOCK TABLES `tbl_servicio_adicional` WRITE;
/*!40000 ALTER TABLE `tbl_servicio_adicional` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_servicio_adicional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_servicios_habitacion`
--

DROP TABLE IF EXISTS `tbl_servicios_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_servicios_habitacion` (
  `PK_ID_Servicio_habitacion` int NOT NULL AUTO_INCREMENT,
  `Cmp_Nombre_Servicio` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`PK_ID_Servicio_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_servicios_habitacion`
--

LOCK TABLES `tbl_servicios_habitacion` WRITE;
/*!40000 ALTER TABLE `tbl_servicios_habitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_servicios_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_habitacion`
--

DROP TABLE IF EXISTS `tbl_tipo_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_habitacion` (
  `Pk_ID_Tipo_Habitaciones` int NOT NULL AUTO_INCREMENT,
  `Cmp_Tipo_Habitacion` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Descripcion_Tipo_Habitacion` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Pk_ID_Tipo_Habitaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_habitacion`
--

LOCK TABLES `tbl_tipo_habitacion` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_habitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tipo_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_menu`
--

DROP TABLE IF EXISTS `tbl_tipo_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_menu` (
  `Pk_Id_Tipo_Menu` int NOT NULL AUTO_INCREMENT,
  `Cmp_Tipo_Menu` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Pk_Id_Tipo_Menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_menu`
--

LOCK TABLES `tbl_tipo_menu` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tipo_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tiposcambio`
--

DROP TABLE IF EXISTS `tbl_tiposcambio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tiposcambio` (
  `Pk_Id_TipoCambio` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Moneda` int NOT NULL,
  `Cmp_Fecha` date NOT NULL,
  `Cmp_ValorCompra` decimal(10,4) NOT NULL,
  `Cmp_ValorVenta` decimal(10,4) NOT NULL,
  `Cmp_Estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Pk_Id_TipoCambio`),
  KEY `Fk_Id_Moneda` (`Fk_Id_Moneda`),
  CONSTRAINT `tbl_tiposcambio_ibfk_1` FOREIGN KEY (`Fk_Id_Moneda`) REFERENCES `tbl_monedas` (`Pk_Id_Moneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tiposcambio`
--

LOCK TABLES `tbl_tiposcambio` WRITE;
/*!40000 ALTER TABLE `tbl_tiposcambio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tiposcambio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipospago`
--

DROP TABLE IF EXISTS `tbl_tipospago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipospago` (
  `Pk_Id_TipoPago` int NOT NULL AUTO_INCREMENT,
  `Cmp_CodigoTipoPago` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_NombreTipoPago` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Descripcion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Pk_Id_TipoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipospago`
--

LOCK TABLES `tbl_tipospago` WRITE;
/*!40000 ALTER TABLE `tbl_tipospago` DISABLE KEYS */;
INSERT INTO `tbl_tipospago` VALUES (1,'EFECT','Efectivo',NULL,1),(2,'CHEQ','Cheque',NULL,1),(3,'TRANS','Transferencia',NULL,1),(4,'TARJ','Tarjeta',NULL,1);
/*!40000 ALTER TABLE `tbl_tipospago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_token_restaurarcontrasena`
--

DROP TABLE IF EXISTS `tbl_token_restaurarcontrasena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_token_restaurarcontrasena` (
  `Pk_Id_Token` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Usuario` int DEFAULT NULL,
  `Cmp_Token` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Fecha_Creacion_Restaurar_Contrasenea` datetime DEFAULT NULL,
  `Cmp_Expiracion_Restaurar_Contrasenea` datetime DEFAULT NULL,
  `Cmp_Utilizado_Restaurar_Contrasenea` bit(1) DEFAULT NULL,
  `Cmp_Fecha_Uso_Restaurar_Contrasenea` datetime DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Token`),
  KEY `Fk_Token_Usuario` (`Fk_Id_Usuario`),
  CONSTRAINT `Fk_Token_Usuario` FOREIGN KEY (`Fk_Id_Usuario`) REFERENCES `tbl_usuario` (`Pk_Id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_token_restaurarcontrasena`
--

LOCK TABLES `tbl_token_restaurarcontrasena` WRITE;
/*!40000 ALTER TABLE `tbl_token_restaurarcontrasena` DISABLE KEYS */;
INSERT INTO `tbl_token_restaurarcontrasena` VALUES (23,4,'B07EF449','2025-10-18 12:07:34','2025-10-18 12:12:34',_binary '','2025-10-18 12:08:27'),(24,4,'0C76A696','2025-10-18 17:08:53','2025-10-18 17:13:53',_binary '','2025-10-18 17:09:11');
/*!40000 ALTER TABLE `tbl_token_restaurarcontrasena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_transaccionesbancarias`
--

DROP TABLE IF EXISTS `tbl_transaccionesbancarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_transaccionesbancarias` (
  `Pk_Id_Transaccion` int NOT NULL,
  `Cmp_NombreTransaccion` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Efecto` enum('POSITIVO','NEGATIVO') COLLATE utf8mb4_general_ci NOT NULL,
  `Cmp_Estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Pk_Id_Transaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transaccionesbancarias`
--

LOCK TABLES `tbl_transaccionesbancarias` WRITE;
/*!40000 ALTER TABLE `tbl_transaccionesbancarias` DISABLE KEYS */;
INSERT INTO `tbl_transaccionesbancarias` VALUES (1,'DEPÓSITO','POSITIVO',1),(2,'CHEQUE','NEGATIVO',1),(3,'NOTA_CRÉDITO','POSITIVO',1),(4,'NOTA_DÉBITO','NEGATIVO',1),(5,'TRANSFERENCIA ENVIADA','NEGATIVO',1),(6,'TRANSFERENCIA RECIBIDA','POSITIVO',1);
/*!40000 ALTER TABLE `tbl_transaccionesbancarias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuario` (
  `Pk_Id_Usuario` int NOT NULL AUTO_INCREMENT,
  `Fk_Id_Empleado` int DEFAULT NULL,
  `Cmp_Nombre_Usuario` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Contrasena_Usuario` varchar(65) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cmp_Intentos_Fallidos_Usuario` int DEFAULT NULL,
  `Cmp_Estado_Usuario` bit(1) DEFAULT NULL,
  `Cmp_FechaCreacion_Usuario` datetime DEFAULT NULL,
  `Cmp_Ultimo_Cambio_Contrasenea` datetime DEFAULT NULL,
  `Cmp_Pidio_Cambio_Contrasenea` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Usuario`),
  KEY `Fk_Usuario_Empleado` (`Fk_Id_Empleado`),
  CONSTRAINT `Fk_Usuario_Empleado` FOREIGN KEY (`Fk_Id_Empleado`) REFERENCES `tbl_empleado` (`Pk_Id_Empleado`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
INSERT INTO `tbl_usuario` VALUES (4,2,'brandon','45297c633d331e6ac35169ebaaf75bc7fafd206ebb59ba4efd80566936e46eb0',0,_binary '','2025-09-21 20:49:54','2025-10-18 17:09:11',_binary '\0'),(23,3,'admin','240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9',0,_binary '','2025-09-26 20:45:53','2025-09-26 20:45:53',_binary '\0');
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario_perfil`
--

DROP TABLE IF EXISTS `tbl_usuario_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuario_perfil` (
  `Fk_Id_Usuario` int NOT NULL,
  `Fk_Id_Perfil` int NOT NULL,
  PRIMARY KEY (`Fk_Id_Usuario`,`Fk_Id_Perfil`),
  KEY `Fk_UsuarioPerfil_Perfil` (`Fk_Id_Perfil`),
  CONSTRAINT `Fk_UsuarioPerfil_Perfil` FOREIGN KEY (`Fk_Id_Perfil`) REFERENCES `tbl_perfil` (`Pk_Id_Perfil`),
  CONSTRAINT `Fk_UsuarioPerfil_Usuario` FOREIGN KEY (`Fk_Id_Usuario`) REFERENCES `tbl_usuario` (`Pk_Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario_perfil`
--

LOCK TABLES `tbl_usuario_perfil` WRITE;
/*!40000 ALTER TABLE `tbl_usuario_perfil` DISABLE KEYS */;
INSERT INTO `tbl_usuario_perfil` VALUES (4,1);
/*!40000 ALTER TABLE `tbl_usuario_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vacaciones`
--

DROP TABLE IF EXISTS `tbl_vacaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_vacaciones` (
  `Cmp_iId_Vacacion` int NOT NULL AUTO_INCREMENT,
  `Cmp_iId_Empleado` int NOT NULL,
  `Cmp_dFechaInicio_Vacacion` datetime DEFAULT NULL,
  `Cmp_dFechaFin_Vacacion` datetime DEFAULT NULL,
  `Cmp_iDias_Vacacion` int DEFAULT NULL,
  `Cmp_bAprobada_Vacacion` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Cmp_iId_Vacacion`),
  KEY `Ix_Vacaciones_IdEmpleado` (`Cmp_iId_Empleado`),
  CONSTRAINT `Fk_Vacaciones_Empleados` FOREIGN KEY (`Cmp_iId_Empleado`) REFERENCES `tbl_empleados` (`Cmp_iId_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vacaciones`
--

LOCK TABLES `tbl_vacaciones` WRITE;
/*!40000 ALTER TABLE `tbl_vacaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_vacaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-12 20:11:51

-- -----------------------------------------------------------------------------------------------------------------------------------
--  										COMERCIAL
-- -----------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Tbl_Metodo_Pago (
    Cmp_Id_Metodo_Pago INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Nombre_Metodo_Pago VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Documento_Cmp_Estado_Hist (
    Cmp_Id_Cmp_Estado_Hist INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Documento INT,
    Cmp_Estado VARCHAR(20),
    Cmp_Fecha_Cambio DATETIME,
    Cmp_Id_Usuario INT) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Secuencia (
    Cmp_Id_Secuencia INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Nombre_Documento VARCHAR(50),
    Cmp_Ultimo_Numero INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Export_Contable (
    Cmp_Id_Export_Contable INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Nombre_Cmp_Modulo VARCHAR(50),
    Cmp_Id_Documento INT,
    Cmp_Estado_Exportacion VARCHAR(20),
    Cmp_Fecha_Exportacion DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ================================
-- SUBMÓDULO: INVENTARIO
-- ================================

CREATE TABLE Tbl_Categoria_Producto (
    Cmp_Id_Categoria_Producto INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Nombre_Categoria VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Unidad_Medida (
    Cmp_Id_Unidad_Medida INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Nombre_Unidad VARCHAR(50),
    Cmp_Abreviatura VARCHAR(10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Producto (
    Cmp_Id_Producto INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Codigo_Producto VARCHAR(20) NOT NULL UNIQUE,
    Cmp_Nombre_Producto VARCHAR(100) NOT NULL,
    Cmp_Marca VARCHAR(50),
    Cmp_Descripcion VARCHAR(255),
    Cmp_Fecha_Vencimiento DATE,
    Cmp_Id_Categoria_Producto INT NOT NULL,
    Cmp_Id_Unidad_Base INT NOT NULL,
    Cmp_Activo TINYINT NOT NULL DEFAULT 1,
    Cmp_PrecioUnitario DECIMAL(14,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (Cmp_Id_Categoria_Producto) REFERENCES Tbl_Categoria_Producto(Cmp_Id_Categoria_Producto),
    FOREIGN KEY (Cmp_Id_Unidad_Base) REFERENCES Tbl_Unidad_Medida(Cmp_Id_Unidad_Medida)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DESCRIBE Tbl_Producto;

CREATE TABLE Tbl_Producto_UM (
    Cmp_Id_Producto_UM INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Producto INT,
    Cmp_Id_Unidad_Medida INT,
    Cmp_Factor_Conversion DECIMAL(10,4),
    Cmp_Tipo_Uso VARCHAR(20),
    FOREIGN KEY (Cmp_Id_Producto) REFERENCES Tbl_Producto(Cmp_Id_Producto),
    FOREIGN KEY (Cmp_Id_Unidad_Medida) REFERENCES Tbl_Unidad_Medida(Cmp_Id_Unidad_Medida)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Almacen (
    Cmp_Id_Almacen INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Nombre_Almacen VARCHAR(100),
    Cmp_Ubicacion VARCHAR(150)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Existencia (
    Cmp_Id_Existencia INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Producto INT,
    Cmp_Id_Almacen INT,
    Cmp_Cantidad DECIMAL(12,4),
    Cmp_Cantidad_Minima DECIMAL(12,4) NOT NULL DEFAULT 0.0000,
    Cmp_Cantidad_Maxima DECIMAL(12,4) NOT NULL DEFAULT 0.0000,
    FOREIGN KEY (Cmp_Id_Producto) REFERENCES Tbl_Producto(Cmp_Id_Producto),
    FOREIGN KEY (Cmp_Id_Almacen) REFERENCES Tbl_Almacen(Cmp_Id_Almacen)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Tipo_Movimiento_Inv (
    Cmp_Id_Tipo_Movimiento_Inv INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Nombre_Tipo VARCHAR(50),
    Cmp_Afecta_Existencia BIT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Mov_Inv (
    Cmp_Id_Mov_Inv INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Fecha_Movimiento DATE,
    Cmp_Id_Tipo_Movimiento_Inv INT,
    Cmp_Referencia VARCHAR(50),
    Cmp_Observaciones VARCHAR(255),
    Cmp_Id_Usuario INT,
    FOREIGN KEY (Cmp_Id_Tipo_Movimiento_Inv) REFERENCES Tbl_Tipo_Movimiento_Inv(Cmp_Id_Tipo_Movimiento_Inv)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Mov_Inv_Det (
    Cmp_Id_Mov_Inv_Det INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Mov_Inv INT,
    Cmp_Id_Producto INT,
    Cmp_Id_Almacen INT,
    Cmp_Cantidad DECIMAL(12,4),
    FOREIGN KEY (Cmp_Id_Mov_Inv) REFERENCES Tbl_Mov_Inv(Cmp_Id_Mov_Inv),
    FOREIGN KEY (Cmp_Id_Producto) REFERENCES Tbl_Producto(Cmp_Id_Producto),
    FOREIGN KEY (Cmp_Id_Almacen) REFERENCES Tbl_Almacen(Cmp_Id_Almacen)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Toma_Fisica (
    Cmp_Id_Toma_Fisica INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Fecha_Toma DATE,
    Cmp_Id_Almacen INT,
    Cmp_Id_Usuario INT,
    FOREIGN KEY (Cmp_Id_Almacen) REFERENCES Tbl_Almacen(Cmp_Id_Almacen)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Toma_Fisica_Det (
    Cmp_Id_Toma_Fisica_Det INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Toma_Fisica INT,
    Cmp_Id_Producto INT,
    Cmp_Cantidad_Contada DECIMAL(12,4),
    FOREIGN KEY (Cmp_Id_Toma_Fisica) REFERENCES Tbl_Toma_Fisica(Cmp_Id_Toma_Fisica),
    FOREIGN KEY (Cmp_Id_Producto) REFERENCES Tbl_Producto(Cmp_Id_Producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Cierre_Inventario (
    Cmp_Id_Cierre INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Fecha_Cierre DATE,
    Cmp_Id_Almacen INT,
    Cmp_Observaciones VARCHAR(255),
    FOREIGN KEY (Cmp_Id_Almacen) REFERENCES Tbl_Almacen(Cmp_Id_Almacen)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
select * from Tbl_Cierre_Inventario;
-- ================================
-- SUBMÓDULO: COMPRAS
-- ================================

CREATE TABLE Tbl_Proveedor (
    Cmp_Id_Proveedor INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Nombre_Proveedor VARCHAR(100),
    Cmp_NIT_Proveedor VARCHAR(20),
    Cmp_Direccion VARCHAR(150),
    Cmp_Telefono VARCHAR(15),
    Cmp_Correo_Electronico VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Condicion_Pago (
    Cmp_Id_Condicion_Pago INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Descripcion VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_OC (
    Cmp_Id_OC INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Fecha_OC DATE,
    Cmp_Id_Proveedor INT,
    Cmp_Id_Condicion_Pago INT,
    Cmp_Total_OC DECIMAL(14,2),
    Cmp_Observaciones VARCHAR(255),
    Cmp_Id_Usuario INT,
    FOREIGN KEY (Cmp_Id_Proveedor) REFERENCES Tbl_Proveedor(Cmp_Id_Proveedor),
    FOREIGN KEY (Cmp_Id_Condicion_Pago) REFERENCES Tbl_Condicion_Pago(Cmp_Id_Condicion_Pago));

CREATE TABLE Tbl_OC_Det (
    Cmp_Id_OC_Det INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_OC INT,
    Cmp_Id_Producto INT,
    Cmp_Cantidad DECIMAL(12,4),
    Cmp_Precio_Unitario DECIMAL(14,2),
    Cmp_Total_Linea DECIMAL(14,2),
    FOREIGN KEY (Cmp_Id_OC) REFERENCES Tbl_OC(Cmp_Id_OC),
    FOREIGN KEY (Cmp_Id_Producto) REFERENCES Tbl_Producto(Cmp_Id_Producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Recepcion_Compra (
    Cmp_Id_Recepcion_Compra INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_OC INT,
    Cmp_Fecha_Recepcion DATE,
    Cmp_Observaciones VARCHAR(255),
    Cmp_Id_Usuario INT,
    FOREIGN KEY (Cmp_Id_OC) REFERENCES Tbl_OC(Cmp_Id_OC)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Recepcion_Compra_Det (
    Cmp_Id_Recepcion_Compra_Det INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Recepcion_Compra INT,
    Cmp_Id_Producto INT,
    Cmp_Cantidad_Recibida DECIMAL(12,4),
    FOREIGN KEY (Cmp_Id_Recepcion_Compra) REFERENCES Tbl_Recepcion_Compra(Cmp_Id_Recepcion_Compra),
    FOREIGN KEY (Cmp_Id_Producto) REFERENCES Tbl_Producto(Cmp_Id_Producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Factura_Proveedor (
    Cmp_Id_Factura_Proveedor INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Proveedor INT,
    Cmp_Fecha_Factura DATE,
    Cmp_Numero_Factura VARCHAR(30),
    Cmp_Total_Factura DECIMAL(14,2),
    Cmp_Id_Usuario INT,
    FOREIGN KEY (Cmp_Id_Proveedor) REFERENCES Tbl_Proveedor(Cmp_Id_Proveedor)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Factura_Proveedor_Det (
    Cmp_Id_Factura_Proveedor_Det INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Factura_Proveedor INT,
    Cmp_Id_Producto INT,
    Cmp_Cantidad DECIMAL(12,4),
    Cmp_Precio_Unitario DECIMAL(14,2),
    Cmp_Total_Linea DECIMAL(14,2),
    FOREIGN KEY (Cmp_Id_Factura_Proveedor) REFERENCES Tbl_Factura_Proveedor(Cmp_Id_Factura_Proveedor),
    FOREIGN KEY (Cmp_Id_Producto) REFERENCES Tbl_Producto(Cmp_Id_Producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Devolucion_Proveedor (
    Cmp_Id_Devolucion_Proveedor INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Proveedor INT NOT NULL,
    Cmp_Id_Factura_Proveedor INT,
    Cmp_Tipo_Devolucion ENUM('Devolucion Total', 'Devolucion Parcial') NOT NULL,
    Cmp_Fecha_Devolucion DATE NOT NULL,
    Cmp_Motivo VARCHAR(255),
    Cmp_Monto_Devuelto DECIMAL(14,2) NOT NULL,
    Cmp_Id_Usuario INT,
    FOREIGN KEY (Cmp_Id_Proveedor) REFERENCES Tbl_Proveedor(Cmp_Id_Proveedor),
    FOREIGN KEY (Cmp_Id_Factura_Proveedor) REFERENCES Tbl_Factura_Proveedor(Cmp_Id_Factura_Proveedor)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Devolucion_Proveedor_Det (
    Cmp_Id_Devolucion_Proveedor_Det INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Devolucion_Proveedor INT NOT NULL,
    Cmp_Id_Producto INT NOT NULL,
    Cmp_Cantidad_Devuelta DECIMAL(12,4) NOT NULL,
    Cmp_Precio_Unitario DECIMAL(14,2) NOT NULL,
    Cmp_Subtotal DECIMAL(14,2) GENERATED ALWAYS AS (Cmp_Cantidad_Devuelta * Cmp_Precio_Unitario) STORED,
    FOREIGN KEY (Cmp_Id_Devolucion_Proveedor) REFERENCES Tbl_Devolucion_Proveedor(Cmp_Id_Devolucion_Proveedor),
    FOREIGN KEY (Cmp_Id_Producto) REFERENCES Tbl_Producto(Cmp_Id_Producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ================================
-- SUBMÓDULO: CUENTAS POR COBRAR (CxC)
-- ================================



CREATE TABLE Tbl_CxC_Documento (
    Cmp_Id_CxC_Documento INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Cliente INT,
    Cmp_Tipo_Documento VARCHAR(20),
    Cmp_Fecha_Emision DATE,
    Cmp_Fecha_Vencimiento DATE,
    Cmp_Total_Documento DECIMAL(14,2),
    Cmp_Saldo_Pendiente DECIMAL(14,2),
    Cmp_Descripcion VARCHAR(255)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Recibo (
    Cmp_Id_Recibo INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Fecha_Recibo DATE,
    Cmp_Id_Cliente INT,
    Cmp_Total_Recibo DECIMAL(14,2),
    Cmp_Observaciones VARCHAR(255),
    Cmp_Id_Usuario INT
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Recibo_Det (
    Cmp_Id_Recibo_Det INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Recibo INT,
    Cmp_Id_Metodo_Pago INT,
    Cmp_Monto_Pago DECIMAL(14,2),
    FOREIGN KEY (Cmp_Id_Recibo) REFERENCES Tbl_Recibo(Cmp_Id_Recibo),
    FOREIGN KEY (Cmp_Id_Metodo_Pago) REFERENCES Tbl_Metodo_Pago(Cmp_Id_Metodo_Pago)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Recibo_Aplicacion (
    Cmp_Id_Recibo_Aplicacion INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Recibo INT,
    Cmp_Id_CxC_Documento INT,
    Cmp_Monto_Aplicado DECIMAL(14,2),
    FOREIGN KEY (Cmp_Id_Recibo) REFERENCES Tbl_Recibo(Cmp_Id_Recibo),
    FOREIGN KEY (Cmp_Id_CxC_Documento) REFERENCES Tbl_CxC_Documento(Cmp_Id_CxC_Documento)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Caja_Ingreso (
    Cmp_Id_Caja_Ingreso INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Recibo INT,
    Cmp_Fecha_Ingreso DATE,
    Cmp_Monto_Ingreso DECIMAL(14,2),
    FOREIGN KEY (Cmp_Id_Recibo) REFERENCES Tbl_Recibo(Cmp_Id_Recibo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Nota_Credito_Cliente (
    Cmp_Id_Nota_Credito_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Cliente INT,
    Cmp_Fecha_Nota DATE,
    Cmp_Numero_Nota VARCHAR(30),
    Cmp_Monto DECIMAL(14,2)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Nota_Debito_Cliente (
    Cmp_Id_Nota_Debito_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Cliente INT,
    Cmp_Fecha_Nota DATE,
    Cmp_Numero_Nota VARCHAR(30),
    Cmp_Monto DECIMAL(14,2)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ================================
-- SUBMÓDULO: CUENTAS POR PAGAR (CxP)
-- ================================

CREATE TABLE Tbl_CxP_Documento (
    Cmp_Id_CxP_Documento INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Proveedor INT NOT NULL,
    Cmp_Serie VARCHAR(20) NOT NULL,
    Cmp_Numero VARCHAR(30) NOT NULL,
    Cmp_Tipo_Documento VARCHAR(20),
    Cmp_Fecha_Emision DATE NOT NULL,
    Cmp_Fecha_Vencimiento DATE NOT NULL,
    Cmp_Total_Documento DECIMAL(14,2) NOT NULL,
    Cmp_Saldo_Pendiente DECIMAL(14,2) NOT NULL,
    Cmp_Estado ENUM('Pendiente', 'Parcial', 'Pagado') NOT NULL DEFAULT 'Pendiente',
    Cmp_Descripcion VARCHAR(255),
    Cmp_Id_Usuario_Creacion INT NOT NULL,
    Cmp_Fecha_Creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Cmp_Id_Proveedor) REFERENCES Tbl_Proveedor(Cmp_Id_Proveedor) ON DELETE RESTRICT ON UPDATE CASCADE,
    UNIQUE KEY UK_CxP_Doc_SerieNumeroProveedor (Cmp_Serie, Cmp_Numero, Cmp_Id_Proveedor),
    CHECK (Cmp_Total_Documento >= 0),
    CHECK (Cmp_Saldo_Pendiente >= 0),
    CHECK (Cmp_Fecha_Vencimiento >= Cmp_Fecha_Emision)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Pago_Proveedor (
    Cmp_Id_Pago_Proveedor INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Proveedor INT NOT NULL,
    Cmp_Fecha_Pago DATE NOT NULL,
    Cmp_Total_Pago DECIMAL(14,2) NOT NULL,
    Cmp_Observaciones VARCHAR(255),
    Cmp_Id_Usuario INT NOT NULL,
    Cmp_Fecha_Creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Cmp_Id_Proveedor) REFERENCES Tbl_Proveedor(Cmp_Id_Proveedor) ON DELETE RESTRICT ON UPDATE CASCADE,
    CHECK (Cmp_Total_Pago > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Pago_Proveedor_Det (
    Cmp_Id_Pago_Proveedor_Det INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Pago_Proveedor INT NOT NULL,
    Cmp_Id_Metodo_Pago INT NOT NULL,
    Cmp_Monto DECIMAL(14,2) NOT NULL,
    FOREIGN KEY (Cmp_Id_Pago_Proveedor) REFERENCES Tbl_Pago_Proveedor(Cmp_Id_Pago_Proveedor) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Cmp_Id_Metodo_Pago) REFERENCES Tbl_Metodo_Pago(Cmp_Id_Metodo_Pago) ON DELETE RESTRICT ON UPDATE CASCADE,
    CHECK (Cmp_Monto > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Pago_Proveedor_Aplicacion (
    Cmp_Id_Pago_Proveedor_Aplicacion INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Pago_Proveedor INT NOT NULL,
    Cmp_Id_CxP_Documento INT NOT NULL,
    Cmp_Monto_Aplicado DECIMAL(14,2) NOT NULL,
    FOREIGN KEY (Cmp_Id_Pago_Proveedor) REFERENCES Tbl_Pago_Proveedor(Cmp_Id_Pago_Proveedor) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Cmp_Id_CxP_Documento) REFERENCES Tbl_CxP_Documento(Cmp_Id_CxP_Documento) ON DELETE RESTRICT ON UPDATE CASCADE,
    CHECK (Cmp_Monto_Aplicado > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Caja_Egreso (
    Cmp_Id_Caja_Egreso INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Pago_Proveedor INT,
    Cmp_Fecha_Egreso DATE,
    Cmp_Monto_Egreso DECIMAL(14,2),
    FOREIGN KEY (Cmp_Id_Pago_Proveedor) REFERENCES Tbl_Pago_Proveedor(Cmp_Id_Pago_Proveedor)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Nota_Credito_Proveedor (
    Cmp_Id_Nota_Credito_Proveedor INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Proveedor INT,
    Cmp_Fecha_Nota DATE,
    Cmp_Numero_Nota VARCHAR(30),
    Cmp_Monto DECIMAL(14,2),
    FOREIGN KEY (Cmp_Id_Proveedor) REFERENCES Tbl_Proveedor(Cmp_Id_Proveedor)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_Nota_Debito_Proveedor (
    Cmp_Id_Nota_Debito_Proveedor INT PRIMARY KEY AUTO_INCREMENT,
    Cmp_Id_Proveedor INT,
    Cmp_Fecha_Nota DATE,
    Cmp_Numero_Nota VARCHAR(30),
    Cmp_Monto DECIMAL(14,2),
    FOREIGN KEY (Cmp_Id_Proveedor) REFERENCES Tbl_Proveedor(Cmp_Id_Proveedor)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ================================
-- SUBMÓDULO: VENTAS
-- ================================

CREATE TABLE Tbl_Venta (
  Cmp_IdVenta INT PRIMARY KEY AUTO_INCREMENT,
  Cmp_Fecha DATETIME,
  Cmp_Total DECIMAL(12,2),
  Cmp_Efectivo DECIMAL(12,2),
  Cmp_Devolucion DECIMAL(12,2),
  Cmp_Id_Usuario INT NULL,
  Cmp_Id_Metodo_Pago INT NULL,
  FOREIGN KEY (Cmp_Id_Metodo_Pago) REFERENCES Tbl_Metodo_Pago(Cmp_Id_Metodo_Pago)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Tbl_VentaDet (
  Cmp_IdVentaDet INT PRIMARY KEY AUTO_INCREMENT,
  Cmp_IdVenta INT,
  Cmp_Id_Producto INT,
  Cmp_Cantidad DECIMAL(12,4),
  Cmp_PrecioUnitario DECIMAL(12,2),
  Cmp_Total DECIMAL(12,2),
  FOREIGN KEY (Cmp_IdVenta) REFERENCES Tbl_Venta(Cmp_IdVenta),
  FOREIGN KEY (Cmp_Id_Producto) REFERENCES Tbl_Producto(Cmp_Id_Producto)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


