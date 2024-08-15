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


-- Dumping database structure for watersystemv2-1
CREATE DATABASE IF NOT EXISTS `watersystemv2-1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `watersystemv2-1`;

-- Dumping structure for table watersystemv2-1.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latest_bill` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_party` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_account_number_foreign` (`account_number`),
  CONSTRAINT `accounts_account_number_foreign` FOREIGN KEY (`account_number`) REFERENCES `customers` (`account_number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table watersystemv2-1.accounts: ~0 rows (approximately)
DELETE FROM `accounts`;

-- Dumping structure for table watersystemv2-1.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middlename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `civil_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barangay` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_option` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meter_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table watersystemv2-1.customers: ~0 rows (approximately)
DELETE FROM `customers`;
INSERT INTO `customers` (`account_number`, `firstname`, `middlename`, `lastname`, `civil_status`, `purok`, `barangay`, `contact_number`, `connection_type`, `connection_status`, `purchase_option`, `org_name`, `meter_number`, `created_at`, `updated_at`) VALUES
	('020-2023-001', 'Kaden', 'Bailey', 'Mayer', 'single', 'Purok Pag-asa', 'Amparo', '09757375747', 'residential', 'active', 'cash', NULL, '123', '2023-08-06 07:29:28', '2023-08-06 07:29:28'),
	('082-2023-0002', 'Keano', 'Nikko', 'Sy', 'married', 'Purok Naga', 'Danao', '09653765828', 'residential', 'inactive', 'cash', 'SLSU', '123456', '2023-08-10 01:05:10', '2023-08-10 01:05:10');

-- Dumping structure for table watersystemv2-1.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table watersystemv2-1.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table watersystemv2-1.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table watersystemv2-1.migrations: ~0 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2021_02_23_090239_create_customers_table', 1),
	(5, '2021_03_22_011714_create_transactions_table', 1),
	(6, '2021_04_27_081704_create_services_table', 1),
	(7, '2021_05_10_012807_create_water_rates_table', 1),
	(8, '2021_05_10_013100_create_surcharges_table', 1),
	(9, '2021_07_02_033927_create_payments_table', 1),
	(10, '2021_08_17_032205_create_transaction_logs_table', 1),
	(11, '2021_09_09_051542_create_payment_work_orders_table', 1),
	(12, '2021_09_22_064924_create_officers_table', 1),
	(13, '2021_12_09_044748_create_accounts_table', 1);

-- Dumping structure for table watersystemv2-1.officers
CREATE TABLE IF NOT EXISTS `officers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table watersystemv2-1.officers: ~0 rows (approximately)
DELETE FROM `officers`;

-- Dumping structure for table watersystemv2-1.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table watersystemv2-1.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;

-- Dumping structure for table watersystemv2-1.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint unsigned NOT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `or_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` double DEFAULT NULL,
  `balance` double NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_or_no_unique` (`or_no`),
  KEY `payments_transaction_id_foreign` (`transaction_id`),
  KEY `payments_user_id_foreign` (`user_id`),
  KEY `payments_customer_id_foreign` (`customer_id`),
  CONSTRAINT `payments_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`account_number`) ON DELETE CASCADE,
  CONSTRAINT `payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table watersystemv2-1.payments: ~0 rows (approximately)
DELETE FROM `payments`;

-- Dumping structure for table watersystemv2-1.payment_work_orders
CREATE TABLE IF NOT EXISTS `payment_work_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_id` bigint unsigned NOT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `or_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_amount` double NOT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_work_orders_or_no_unique` (`or_no`),
  KEY `payment_work_orders_service_id_foreign` (`service_id`),
  KEY `payment_work_orders_user_id_foreign` (`user_id`),
  CONSTRAINT `payment_work_orders_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_work_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table watersystemv2-1.payment_work_orders: ~0 rows (approximately)
DELETE FROM `payment_work_orders`;
INSERT INTO `payment_work_orders` (`id`, `service_id`, `customer_id`, `or_no`, `payment_amount`, `remarks`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '020-2023-001', '123456', 1300, NULL, 2, '2023-08-06 07:34:06', '2023-08-06 07:34:06');

-- Dumping structure for table watersystemv2-1.services
CREATE TABLE IF NOT EXISTS `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_of_service` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_schedule` date DEFAULT NULL,
  `date_completed` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_customer_id_foreign` (`customer_id`),
  CONSTRAINT `services_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`account_number`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table watersystemv2-1.services: ~0 rows (approximately)
DELETE FROM `services`;
INSERT INTO `services` (`id`, `customer_id`, `type_of_service`, `remarks`, `landmarks`, `work_schedule`, `date_completed`, `status`, `start_status`, `request_number`, `created_at`, `updated_at`) VALUES
	(1, '020-2023-001', 'new_connection', 'No remarks', 'Near Bulwagan', '2023-08-06', NULL, 'ready', 'pending_building_inspection', '08062023-9794', '2023-08-06 07:29:28', '2023-08-06 07:34:06');

-- Dumping structure for table watersystemv2-1.surcharges
CREATE TABLE IF NOT EXISTS `surcharges` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table watersystemv2-1.surcharges: ~0 rows (approximately)
DELETE FROM `surcharges`;
INSERT INTO `surcharges` (`id`, `rate`, `created_at`, `updated_at`) VALUES
	(1, 0.1, '2023-08-06 07:29:28', '2023-08-06 07:29:28');

-- Dumping structure for table watersystemv2-1.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period_covered` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reading_date` date NOT NULL,
  `reading_meter` double NOT NULL,
  `reading_consumption` double NOT NULL,
  `billing_amount` double DEFAULT NULL,
  `billing_surcharge` double DEFAULT NULL,
  `billing_meter_ips` double DEFAULT '0',
  `billing_total` double DEFAULT NULL,
  `posted_by` bigint unsigned DEFAULT NULL,
  `payment_or_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` double DEFAULT NULL,
  `balance` double NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_posted_by_foreign` (`posted_by`),
  KEY `transactions_user_id_foreign` (`user_id`),
  KEY `transactions_customer_id_foreign` (`customer_id`),
  CONSTRAINT `transactions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`account_number`) ON DELETE CASCADE,
  CONSTRAINT `transactions_posted_by_foreign` FOREIGN KEY (`posted_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table watersystemv2-1.transactions: ~0 rows (approximately)
DELETE FROM `transactions`;
INSERT INTO `transactions` (`id`, `customer_id`, `period_covered`, `reading_date`, `reading_meter`, `reading_consumption`, `billing_amount`, `billing_surcharge`, `billing_meter_ips`, `billing_total`, `posted_by`, `payment_or_no`, `payment_date`, `payment_amount`, `balance`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, '082-2023-0002', 'Beginning Balance', '2023-08-01', 11, 0, 100, 0, 0, 100, 1, NULL, NULL, NULL, 100, 1, '2023-08-10 01:05:10', '2023-08-10 01:05:10');

-- Dumping structure for table watersystemv2-1.transaction_logs
CREATE TABLE IF NOT EXISTS `transaction_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_organization_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_middlename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_of_transaction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issued_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_logs_issued_by_foreign` (`issued_by`),
  CONSTRAINT `transaction_logs_issued_by_foreign` FOREIGN KEY (`issued_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table watersystemv2-1.transaction_logs: ~0 rows (approximately)
DELETE FROM `transaction_logs`;

-- Dumping structure for table watersystemv2-1.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` tinyint NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table watersystemv2-1.users: ~6 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `username`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Melissa Oberbrunner', 'admin', '2023-08-06 07:29:27', '$2y$10$TxuQI4FOb0JrrGrysDWUlenEeh.lXqUsHUhVjb.kJCcoEpu0hu3Uu', 1, 'EtlZGFpIZqHYCLY0qVHaO71WJA7UkZvqTyeUdXeNKTxb1R6IW1lnhXd9g8po', '2023-08-06 07:29:27', '2023-08-06 07:29:27'),
	(2, 'Laverne Kilback', 'cashier', '2023-08-06 07:29:27', '$2y$10$pVyMWMpS5zR5kay7L/880eexK7Z2hSKCmXDeS.uRYpyDrfdQR2lHK', 2, 'Uya5EUDQ571F366P6L8D6AhaLIh3xnrCOT599hUYzBivc1JR2XllAy26YxMW', '2023-08-06 07:29:27', '2023-08-06 07:29:27'),
	(3, 'Abbie Murray', 'building', '2023-08-06 07:29:27', '$2y$10$qhEHa0Y8uEeIZACH2xuPM.1PD0m0vRbG2.QRSkq.A/9vVhVVOgM/S', 4, 'z94gQalrdQRLuFOT8Vlbs420jPDNOZRDPrGDeDJj6VCE8VLCyqZEdOUuVcJD', '2023-08-06 07:29:28', '2023-08-06 07:29:28'),
	(4, 'Ms. Hilma Weber I', 'reader', '2023-08-06 07:29:28', '$2y$10$j6N6ksXTOlxdgZ8Lb4OnbOrLoADqMrQ4Noor6SLl7CT01aEZeTTcm', 3, 'OjSXoZSdskypoeG48mQbB6eQ7PE0a2K3wsecds9Dz1YvBw7SuN4Mwa5FHHYB', '2023-08-06 07:29:28', '2023-08-06 07:29:28'),
	(5, 'Katelyn Connelly', 'waterworks', '2023-08-06 07:29:28', '$2y$10$qdbToUUqUHvsBY2/.WJ.kOWnS82FtxaLNeyTBBuWY8UnPocNzcXQO', 5, 'NkG7qENlgiCZwm6c82WD2t2GCQc33iIHi80N6BgtkUnyei6u50CIdDrBEPjM', '2023-08-06 07:29:28', '2023-08-06 07:29:28'),
	(6, 'Prof. Toy White MD', 'engineer', '2023-08-06 07:29:28', '$2y$10$80APlAswjRVIoP6Kvnq28.aGWorqQk24uqFUfaxWBe.UsKPnAXE8K', 6, 'sdRaRq332zdaiUbTy53eUg1K080d7KIrekKpvlkky3zCnJ75MOqr51NPcycU', '2023-08-06 07:29:28', '2023-08-06 07:29:28');

-- Dumping structure for table watersystemv2-1.water_rates
CREATE TABLE IF NOT EXISTS `water_rates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumption_max_range` int unsigned NOT NULL,
  `min_rate` double NOT NULL,
  `excess_rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table watersystemv2-1.water_rates: ~3 rows (approximately)
DELETE FROM `water_rates`;
INSERT INTO `water_rates` (`id`, `type`, `consumption_max_range`, `min_rate`, `excess_rate`, `created_at`, `updated_at`) VALUES
	(1, 'Residential', 10, 65, 10, '2023-08-06 07:29:28', '2023-08-06 07:29:28'),
	(2, 'Institutional', 10, 65, 10, '2023-08-06 07:29:28', '2023-08-06 07:29:28'),
	(3, 'Commercial', 10, 110, 15, '2023-08-06 07:29:28', '2023-08-06 07:29:28');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
