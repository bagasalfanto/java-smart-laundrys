-- MySQL dump 10.13  Distrib 9.4.0, for macos15.4 (arm64)
--
-- Host: localhost    Database: smart_laundry
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `smart_laundry`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `smart_laundry` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `smart_laundry`;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `activity` varchar(255) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_activity_logs_user_id` (`user_id`),
  KEY `idx_activity_logs_created_at` (`created_at`),
  CONSTRAINT `fk_activity_logs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` VALUES (1,1,'Login Berhasil','0:0:0:0:0:0:0:1','2026-06-27 20:55:28'),(2,1,'Login Berhasil','0:0:0:0:0:0:0:1','2026-06-27 20:56:05'),(3,2,'Login Berhasil','127.0.0.1','2026-06-27 21:05:35'),(4,1,'Login Berhasil','127.0.0.1','2026-06-27 21:05:48'),(5,1,'Login Berhasil','0:0:0:0:0:0:0:1','2026-06-27 21:16:37'),(6,1,'Login Berhasil','0:0:0:0:0:0:0:1','2026-06-27 21:16:58'),(7,1,'Login Berhasil','127.0.0.1','2026-06-27 21:25:31');
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_profiles`
--

DROP TABLE IF EXISTS `admin_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_profiles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `nama` varchar(150) NOT NULL,
  `kode_otoritas` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_admin_profiles_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_profiles`
--

LOCK TABLES `admin_profiles` WRITE;
/*!40000 ALTER TABLE `admin_profiles` DISABLE KEYS */;
INSERT INTO `admin_profiles` VALUES (1,1,'Administrator','ADM-001','2026-06-27 20:49:00','2026-06-27 20:49:00');
/*!40000 ALTER TABLE `admin_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
INSERT INTO `flyway_schema_history` VALUES (1,'1','create user and master tables','SQL','V1__create_user_and_master_tables.sql',-768909635,'root','2026-06-27 13:48:58',53,1),(2,'2','create transaction tables','SQL','V2__create_transaction_tables.sql',-2127229851,'root','2026-06-27 13:48:58',40,1),(3,'3','create reporting and logs','SQL','V3__create_reporting_and_logs.sql',-431656302,'root','2026-06-27 13:48:58',26,1),(4,'4','alter inventaris stok decimal','SQL','V4__alter_inventaris_stok_decimal.sql',-826898703,'root','2026-06-27 13:48:58',12,1),(5,'5','update order status','SQL','V5__update_order_status.sql',119537667,'root','2026-06-27 13:48:58',3,1),(6,'6','alter order status check','SQL','V6__alter_order_status_check.sql',1925703742,'root','2026-06-27 13:48:58',24,1);
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventaris`
--

DROP TABLE IF EXISTS `inventaris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventaris` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(100) NOT NULL,
  `stok` decimal(10,2) NOT NULL DEFAULT '0.00',
  `satuan` varchar(30) NOT NULL DEFAULT 'pcs',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nama_barang` (`nama_barang`),
  CONSTRAINT `chk_inventaris_stok` CHECK ((`stok` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventaris`
--

LOCK TABLES `inventaris` WRITE;
/*!40000 ALTER TABLE `inventaris` DISABLE KEYS */;
INSERT INTO `inventaris` VALUES (1,'Deterjen',50.00,'kg','2026-06-27 20:49:01','2026-06-27 20:49:01'),(2,'Pewangi Sabun',50.00,'liter','2026-06-27 20:49:01','2026-06-27 20:49:01'),(3,'Pewangi Setrika',200.00,'liter','2026-06-27 20:49:01','2026-06-27 20:49:01'),(4,'Plastik',100.00,'pcs','2026-06-27 20:49:01','2026-06-27 20:49:01'),(5,'Kantong Kresek',50.00,'pcs','2026-06-27 20:49:01','2026-06-27 20:49:01');
/*!40000 ALTER TABLE `inventaris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laporan`
--

DROP TABLE IF EXISTS `laporan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laporan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `periode` varchar(30) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `total_pendapatan` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_laporan_periode` (`periode`),
  KEY `idx_laporan_tanggal` (`tanggal_mulai`,`tanggal_selesai`),
  CONSTRAINT `chk_laporan_total` CHECK ((`total_pendapatan` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laporan`
--

LOCK TABLES `laporan` WRITE;
/*!40000 ALTER TABLE `laporan` DISABLE KEYS */;
/*!40000 ALTER TABLE `laporan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layanan`
--

DROP TABLE IF EXISTS `layanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layanan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nama_paket` varchar(100) NOT NULL,
  `harga_per_kg` decimal(12,2) NOT NULL,
  `estimasi_waktu` int NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nama_paket` (`nama_paket`),
  CONSTRAINT `chk_layanan_estimasi` CHECK ((`estimasi_waktu` >= 0)),
  CONSTRAINT `chk_layanan_harga` CHECK ((`harga_per_kg` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layanan`
--

LOCK TABLES `layanan` WRITE;
/*!40000 ALTER TABLE `layanan` DISABLE KEYS */;
INSERT INTO `layanan` VALUES (1,'Cuci Setrika Reguler',5000.00,36,1,'2026-06-27 20:49:01','2026-06-27 20:49:01'),(2,'Cuci Setrika Kilat',7500.00,24,1,'2026-06-27 20:49:01','2026-06-27 20:49:01'),(3,'Cuci Setrika Express',10000.00,12,1,'2026-06-27 20:49:01','2026-06-27 20:49:01');
/*!40000 ALTER TABLE `layanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelanggan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nama` varchar(150) NOT NULL,
  `no_telp` varchar(30) NOT NULL,
  `is_member` tinyint(1) NOT NULL DEFAULT '0',
  `poin` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_telp` (`no_telp`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
INSERT INTO `pelanggan` VALUES (1,'jhon doeee','0823234832',0,0,'2026-06-27 21:09:23','2026-06-27 21:09:23'),(2,'Budi Santoso','081234560001',1,120,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(3,'Siti Nurhaliza','081234560002',1,85,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(4,'Ahmad Wijaya','081334560003',1,40,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(5,'Dewi Lestari','081334560004',1,200,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(6,'Eko Prasetyo','082134560005',1,15,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(7,'Rina Wati','082134560006',1,60,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(8,'Joko Susilo','085234560007',1,95,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(9,'Sri Wahyuni','085634560008',1,30,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(10,'Agus Setiawan','087834560009',1,150,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(11,'Indah Permatasari','089634560010',1,75,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(12,'Bambang Sutrisno','081234560011',0,0,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(13,'Ani Yulianti','081334560012',0,0,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(14,'Hendra Gunawan','082134560013',0,0,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(15,'Maya Sari','082234560014',0,0,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(16,'Rudi Hartono','085234560015',0,0,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(17,'Fitri Handayani','085634560016',0,0,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(18,'Dedi Kurniawan','085734560017',0,0,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(19,'Lina Marlina','087834560018',0,0,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(20,'Wawan Setiawan','089634560019',0,0,'2026-06-27 21:15:01','2026-06-27 21:15:01'),(21,'Nur Aini','081234560020',0,0,'2026-06-27 21:15:01','2026-06-27 21:15:01');
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_profiles`
--

DROP TABLE IF EXISTS `staff_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_profiles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `nama` varchar(150) NOT NULL,
  `jumlah_shift` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_staff_profiles_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_profiles`
--

LOCK TABLES `staff_profiles` WRITE;
/*!40000 ALTER TABLE `staff_profiles` DISABLE KEYS */;
INSERT INTO `staff_profiles` VALUES (1,2,'Staff Laundry',1,'2026-06-27 20:49:01','2026-06-27 20:49:01');
/*!40000 ALTER TABLE `staff_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaksi` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(50) NOT NULL,
  `pelanggan_id` bigint NOT NULL,
  `layanan_id` bigint NOT NULL,
  `staff_id` bigint NOT NULL,
  `berat` decimal(8,2) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `diskon` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total_bayar` decimal(12,2) NOT NULL,
  `order_status` varchar(20) NOT NULL DEFAULT 'ANTRIAN',
  `payment_status` varchar(20) NOT NULL DEFAULT 'BELUM_LUNAS',
  `tanggal_masuk` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tanggal_selesai` datetime DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `fk_transaksi_pelanggan` (`pelanggan_id`),
  KEY `fk_transaksi_layanan` (`layanan_id`),
  KEY `fk_transaksi_staff` (`staff_id`),
  KEY `idx_transaksi_order_status` (`order_status`),
  KEY `idx_transaksi_payment_status` (`payment_status`),
  KEY `idx_transaksi_paid_at` (`paid_at`),
  KEY `idx_transaksi_tanggal_masuk` (`tanggal_masuk`),
  CONSTRAINT `fk_transaksi_layanan` FOREIGN KEY (`layanan_id`) REFERENCES `layanan` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_transaksi_pelanggan` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_transaksi_staff` FOREIGN KEY (`staff_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `chk_transaksi_berat` CHECK ((`berat` > 0)),
  CONSTRAINT `chk_transaksi_diskon` CHECK ((`diskon` >= 0)),
  CONSTRAINT `chk_transaksi_order_status` CHECK ((`order_status` in (_utf8mb4'ANTRIAN',_utf8mb4'PROSES_CUCI',_utf8mb4'PROSES_SETRIKA',_utf8mb4'SELESAI'))),
  CONSTRAINT `chk_transaksi_payment_status` CHECK ((`payment_status` in (_utf8mb4'BELUM_LUNAS',_utf8mb4'LUNAS'))),
  CONSTRAINT `chk_transaksi_subtotal` CHECK ((`subtotal` >= 0)),
  CONSTRAINT `chk_transaksi_total` CHECK ((`total_bayar` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
INSERT INTO `transaksi` VALUES (1,'INV-20260627105800-00C5',5,1,2,3.00,15000.00,750.00,14250.00,'ANTRIAN','BELUM_LUNAS','2026-06-27 10:58:00',NULL,NULL,'2026-06-27 10:58:00','2026-06-27 21:16:03'),(2,'INV-20260627094000-81CB',9,2,1,2.50,18750.00,937.50,17812.50,'PROSES_CUCI','BELUM_LUNAS','2026-06-27 09:40:00',NULL,NULL,'2026-06-27 09:40:00','2026-06-27 21:16:03'),(3,'INV-20260627091500-EC2C',20,1,2,5.00,25000.00,0.00,25000.00,'PROSES_SETRIKA','LUNAS','2026-06-27 09:15:00',NULL,'2026-06-27 10:15:00','2026-06-27 09:15:00','2026-06-27 21:16:03'),(4,'INV-20260627113800-BCD8',5,3,1,1.50,15000.00,750.00,14250.00,'SELESAI','LUNAS','2026-06-27 11:38:00','2026-06-27 23:38:00','2026-06-27 15:38:00','2026-06-27 11:38:00','2026-06-27 21:16:03'),(5,'INV-20260627084700-2751',2,2,2,4.00,30000.00,1500.00,28500.00,'SELESAI','LUNAS','2026-06-27 08:47:00','2026-06-28 08:47:00','2026-06-27 19:47:00','2026-06-27 08:47:00','2026-06-27 21:16:03'),(6,'INV-20260626120800-1EDC',14,1,1,6.00,30000.00,0.00,30000.00,'SELESAI','LUNAS','2026-06-26 12:08:00','2026-06-28 00:08:00','2026-06-27 00:08:00','2026-06-26 12:08:00','2026-06-27 21:16:03'),(7,'INV-20260625144400-5083',18,2,2,3.50,26250.00,0.00,26250.00,'PROSES_SETRIKA','BELUM_LUNAS','2026-06-25 14:44:00',NULL,NULL,'2026-06-25 14:44:00','2026-06-27 21:16:03'),(8,'INV-20260624121200-28F7',4,1,2,2.00,10000.00,500.00,9500.00,'SELESAI','LUNAS','2026-06-24 12:12:00','2026-06-26 00:12:00','2026-06-25 03:12:00','2026-06-24 12:12:00','2026-06-27 21:16:03'),(9,'INV-20260622122900-C946',20,3,2,4.50,45000.00,0.00,45000.00,'SELESAI','LUNAS','2026-06-22 12:29:00','2026-06-23 00:29:00','2026-06-23 00:29:00','2026-06-22 12:29:00','2026-06-27 21:16:03'),(10,'INV-20260621102500-7FD1',16,1,1,7.00,35000.00,0.00,35000.00,'SELESAI','BELUM_LUNAS','2026-06-21 10:25:00','2026-06-22 22:25:00',NULL,'2026-06-21 10:25:00','2026-06-27 21:16:03'),(11,'INV-20260619083500-2B78',20,2,1,3.00,22500.00,0.00,22500.00,'SELESAI','LUNAS','2026-06-19 08:35:00','2026-06-20 08:35:00','2026-06-19 12:35:00','2026-06-19 08:35:00','2026-06-27 21:16:03'),(12,'INV-20260617090500-0C79',18,1,2,5.50,27500.00,0.00,27500.00,'SELESAI','LUNAS','2026-06-17 09:05:00','2026-06-18 21:05:00','2026-06-18 02:05:00','2026-06-17 09:05:00','2026-06-27 21:16:03'),(13,'INV-20260615085800-B4B1',15,3,2,2.50,25000.00,0.00,25000.00,'SELESAI','LUNAS','2026-06-15 08:58:00','2026-06-15 20:58:00','2026-06-16 01:58:00','2026-06-15 08:58:00','2026-06-27 21:16:03'),(14,'INV-20260612124100-1FD7',20,1,2,4.00,20000.00,0.00,20000.00,'SELESAI','LUNAS','2026-06-12 12:41:00','2026-06-14 00:41:00','2026-06-12 17:41:00','2026-06-12 12:41:00','2026-06-27 21:16:03'),(15,'INV-20260609144500-F543',18,2,1,6.50,48750.00,0.00,48750.00,'SELESAI','LUNAS','2026-06-09 14:45:00','2026-06-10 14:45:00','2026-06-10 10:45:00','2026-06-09 14:45:00','2026-06-27 21:16:03'),(16,'INV-20260607140000-480F',17,1,2,3.50,17500.00,0.00,17500.00,'SELESAI','LUNAS','2026-06-07 14:00:00','2026-06-09 02:00:00','2026-06-07 22:00:00','2026-06-07 14:00:00','2026-06-27 21:16:03'),(17,'INV-20260603084500-56A8',16,1,2,2.00,10000.00,0.00,10000.00,'SELESAI','LUNAS','2026-06-03 08:45:00','2026-06-04 20:45:00','2026-06-04 02:45:00','2026-06-03 08:45:00','2026-06-27 21:16:03'),(18,'INV-20260531094800-1CD8',19,3,1,8.00,80000.00,0.00,80000.00,'SELESAI','LUNAS','2026-05-31 09:48:00','2026-05-31 21:48:00','2026-05-31 19:48:00','2026-05-31 09:48:00','2026-06-27 21:16:03'),(19,'INV-20260528101800-DF09',14,2,2,3.00,22500.00,0.00,22500.00,'SELESAI','LUNAS','2026-05-28 10:18:00','2026-05-29 10:18:00','2026-05-28 20:18:00','2026-05-28 10:18:00','2026-06-27 21:16:03'),(20,'INV-20260525162100-5747',2,1,1,4.50,22500.00,1125.00,21375.00,'SELESAI','LUNAS','2026-05-25 16:21:00','2026-05-27 04:21:00','2026-05-26 12:21:00','2026-05-25 16:21:00','2026-06-27 21:16:03'),(21,'INV-20260523090700-0D07',18,1,2,5.00,25000.00,0.00,25000.00,'SELESAI','LUNAS','2026-05-23 09:07:00','2026-05-24 21:07:00','2026-05-23 16:07:00','2026-05-23 09:07:00','2026-06-27 21:16:03'),(22,'INV-20260518085800-1731',17,2,1,2.50,18750.00,0.00,18750.00,'SELESAI','LUNAS','2026-05-18 08:58:00','2026-05-19 08:58:00','2026-05-19 00:58:00','2026-05-18 08:58:00','2026-06-27 21:16:03');
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `chk_users_role` CHECK ((`role` in (_utf8mb4'ADMIN',_utf8mb4'STAFF')))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2a$12$LCERaVDtefhl./PENbb6Pek44hlaRq3u5s6T7nbPiPP41jCpyIRcS','ADMIN',1,'2026-06-27 20:49:00','2026-06-27 20:49:00'),(2,'staff','$2a$12$TnVJQG9rCpZbTJ.txCKYeO2FIgOA.hOa3UVLcc.fCJF8gAwl0zNX6','STAFF',1,'2026-06-27 20:49:01','2026-06-27 20:49:01');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-27 21:44:01
