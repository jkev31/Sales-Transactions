-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for toko
CREATE DATABASE IF NOT EXISTS `toko` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `toko`;

-- Dumping structure for table toko.items
CREATE TABLE IF NOT EXISTS `items` (
  `kodepr` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `namapr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `satuan` varchar(20) DEFAULT NULL,
  `hbeli` double DEFAULT NULL,
  `hjual` double DEFAULT NULL,
  PRIMARY KEY (`kodepr`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table toko.items: ~5 rows (approximately)
INSERT INTO `items` (`kodepr`, `namapr`, `satuan`, `hbeli`, `hjual`) VALUES
	('m001', 'produk 01', 'pcs', 50000, 59000),
	('m002', 'produk 02', 'pcs', 10000, 19000),
	('m003', 'produk 03', 'pcs', 85000, 91000),
	('m004', 'produk 04', 'pcs', 30000, 39000),
	('m005', 'produk 05', 'pcs', 40000, 50000);

-- Dumping structure for table toko.suppliers
CREATE TABLE IF NOT EXISTS `suppliers` (
  `kode-sup` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama-sup` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `alamat-sup` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `kota-sup` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ket-sup` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telp-sup` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`kode-sup`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table toko.suppliers: ~2 rows (approximately)
INSERT INTO `suppliers` (`kode-sup`, `nama-sup`, `alamat-sup`, `kota-sup`, `ket-sup`, `telp-sup`) VALUES
	('p001', 'kazuta', 'xxx', 'xxx', 'xxx', '08'),
	('p002', 'alicia', 'vvv', 'vvv', 'vvv', '08');

-- Dumping structure for table toko.masterpembelian
CREATE TABLE IF NOT EXISTS `masterpembelian` (
  `kodepb` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kode-sup` varchar(10) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `grandtotal` double DEFAULT NULL,
  PRIMARY KEY (`kodepb`,`kode-sup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table toko.masterpembelian: ~0 rows (approximately)
INSERT INTO `masterpembelian` (`kodepb`, `kode-sup`, `tanggal`, `total`, `diskon`, `grandtotal`) VALUES
	('pb2026062401005894', 'p001', '2026-06-24', 50000, 0, 50000),
	('pb2026062401252615', 'p002', '2026-06-24', 50000, 0, 50000),
	('pb2026062402262888', 'p001', '2026-06-24', 50000, 0, 50000),
	('pb2026062408092231', 'p001', '2026-06-24', 125000, 62500, 62500);

-- Dumping structure for table toko.masterpenjualan
CREATE TABLE IF NOT EXISTS `masterpenjualan` (
  `kodepj` varchar(20) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `konsumen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telp-kn` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ket-kn` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `total` double DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `grandtotal` double DEFAULT NULL,
  PRIMARY KEY (`kodepj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table toko.masterpenjualan: ~12 rows (approximately)
INSERT INTO `masterpenjualan` (`kodepj`, `tanggal`, `konsumen`, `telp-kn`, `ket-kn`, `total`, `diskon`, `grandtotal`) VALUES
	('pj2026061010504621', '2026-06-10', 'c', '08', 'xxx', 10600, 0, 10600),
	('pj2026061011121631', '2026-06-27', 'v', '08', 'ccc', 10000, 500, 9500),
	('pj2026061012183542', '2026-06-20', 'b', '08', 'zzz', 135000, 13500, 121500),
	('pj2026061804310619', '2026-06-18', 'w', '08', 'bbb', 118000, 0, 118000),
	('pj2026061804322963', '2026-06-18', 'q', '08', 'qqq', 118000, 0, 118000),
	('pj2026061804324791', '2026-06-18', 'q', '08', 'qqq', 118000, 0, 118000),
	('pj2026061804335874', '2026-06-18', 'q', '08', 'qqq', 118000, 0, 118000),
	('pj2026061804340010', '2026-06-18', 'q', '08', 'qqq', 118000, 0, 118000),
	('pj2026061804342670', '2026-06-18', 'q', '08', 'qqq', 118000, 0, 118000),
	('pj2026061804364442', '2026-06-18', 'q', '08', 'qqq', 118000, 0, 118000),
	('pj2026061804422729', '2026-06-18', 'q', '08', 'qqq', 78000, 0, 78000),
	('pj2026062412365696', '2026-06-24', 'l', '08', 'mmm', 78000, 39000, 39000);

-- Dumping structure for table toko.detailpembelian
CREATE TABLE IF NOT EXISTS `detailpembelian` (
  `kodepb` varchar(20) NOT NULL,
  `kodepr` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hbeli` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  PRIMARY KEY (`kodepb`,`kodepr`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table toko.detailpembelian: ~5 rows (approximately)
INSERT INTO `detailpembelian` (`kodepb`, `kodepr`, `hbeli`, `qty`, `subtotal`) VALUES
	('pb2026062401005894', 'm001', 50000, 1, 50000),
	('pb2026062401252615', 'm001', 50000, 1, 50000),
	('pb2026062402262888', 'm001', 50000, 1, 50000),
	('pb2026062408092231', 'm003', 85000, 1, 85000),
	('pb2026062408092231', 'm005', 40000, 1, 40000);

-- Dumping structure for table toko.detailpenjualan
CREATE TABLE IF NOT EXISTS `detailpenjualan` (
  `kodepj` varchar(20) NOT NULL,
  `kodepr` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hjual` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  PRIMARY KEY (`kodepj`,`kodepr`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table toko.detailpenjualan: ~16 rows (approximately)
INSERT INTO `detailpenjualan` (`kodepj`, `kodepr`, `hjual`, `qty`, `subtotal`) VALUES
	('pj2026061010504621', 'p03', 10000, 1, 10000),
	('pj2026061010504621', 'p04', 200, 3, 600),
	('pj2026061011121631', 'p03', 10000, 1, 10000),
	('pj2026061012183542', 'm001', 59000, 1, 59000),
	('pj2026061012183542', 'm002', 19000, 4, 76000),
	('pj2026061804310619', 'm001', 59000, 1, 59000),
	('pj2026061804322963', 'm001', 59000, 1, 59000),
	('pj2026061804324791', 'm001', 59000, 1, 59000),
	('pj2026061804335874', 'm001', 59000, 1, 59000),
	('pj2026061804340010', 'm001', 59000, 1, 59000),
	('pj2026061804342670', 'm001', 59000, 1, 59000),
	('pj2026061804364442', 'm001', 59000, 1, 59000),
	('pj2026061804422729', 'm001', 59000, 1, 59000),
	('pj2026061804422729', 'm002', 19000, 1, 19000),
	('pj2026062412365696', 'm001', 59000, 1, 59000),
	('pj2026062412365696', 'm002', 19000, 1, 19000),
	('pj20265816112', 'm002', 3000, 5, 15000),
	('pj20265816112', 'm004', 7000, 5, 35000);


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
