-- -------------------------------------------------------------
-- TablePlus 4.5.2(402)
--
-- https://tableplus.com/
--
-- Database: blog
-- Generation Time: 2022-02-10 23:36:56.3440
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
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

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'tempora', 'culpa-non-dolor-provident-rerum', '2022-02-10 15:28:38', '2022-02-10 15:28:38'),
(2, 'quisquam', 'ut-voluptatem-quis-odit-debitis', '2022-02-10 15:28:38', '2022-02-10 15:28:38'),
(3, 'autem', 'rerum-et-ut-est-iure', '2022-02-10 15:28:38', '2022-02-10 15:28:38'),
(4, 'velit', 'et-minima-dolores-quod', '2022-02-10 15:28:38', '2022-02-10 15:28:38'),
(5, 'aperiam', 'sunt-non-enim-non-eligendi', '2022-02-10 15:28:38', '2022-02-10 15:28:38'),
(6, 'tempora', 'qui-officia-quis-dolor-tempore-quia-et-et', '2022-02-10 15:28:38', '2022-02-10 15:28:38');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_01_15_215412_create_posts_table', 1),
(6, '2022_02_09_162436_create_categories_table', 1);

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `slug`, `excerpt`, `body`, `created_at`, `updated_at`, `published_at`) VALUES
(1, 1, 1, 'Non voluptates sed minima fugiat voluptates.', 'non-tempora-facere-dolorum-repudiandae-molestiae', 'Nihil modi eaque perferendis et error odio voluptas.', '<p>Explicabo aut laboriosam earum ratione ut. Qui animi officiis et maxime et similique. Quisquam placeat dolor et debitis dolorum aliquam.</p>', '2022-02-10 15:28:38', '2022-02-10 15:28:38', '2022-02-10 15:28:38'),
(2, 1, 2, 'Esse laborum occaecati architecto rerum omnis adipisci dolores consequatur.', 'nulla-rem-inventore-praesentium-et', 'Delectus dolores et sed quam impedit.', '<p>Ut et aut repellat quia. Quos quis suscipit fugit qui.</p>', '2022-02-10 15:28:38', '2022-02-10 15:28:38', '2022-02-10 15:28:38'),
(3, 1, 3, 'Sint voluptate aut quasi eveniet error.', 'sed-ad-voluptatem-sint-asperiores-nihil-dolor', 'Esse et voluptatem aperiam sit quia est.', '<p>Laboriosam minima dolor labore eius consequuntur. Accusamus nihil autem veritatis ut et sint omnis aut. Est illum mollitia iusto saepe quasi. Consequatur pariatur dolorem voluptatibus sequi aspernatur eaque in.</p>', '2022-02-10 15:28:38', '2022-02-10 15:28:38', '2022-02-10 15:28:38'),
(4, 1, 4, 'Minima voluptatem nulla expedita consectetur quaerat.', 'nesciunt-impedit-minima-quo-ut-voluptatem-molestias', 'Corrupti ut nesciunt dolores et impedit.', '<p>Ex molestias deserunt saepe ut voluptatem. Voluptas ab aperiam ut id et dignissimos nisi earum. Voluptatem asperiores nam quae debitis qui.</p>', '2022-02-10 15:28:38', '2022-02-10 15:28:38', '2022-02-10 15:28:38'),
(5, 1, 5, 'Soluta non quia sed incidunt ea quas odio quis.', 'dolorum-provident-aliquam-consequatur-tempora-quia-distinctio-eos-eos', 'Exercitationem ut perspiciatis quia voluptatum vero.', '<p>Autem quam doloremque accusantium maiores quasi ipsa molestiae. Distinctio fugit eum voluptatem quam sit quia aliquam. Illum unde culpa ipsum consequatur quasi aperiam ratione.</p>', '2022-02-10 15:28:38', '2022-02-10 15:28:38', '2022-02-10 15:28:38'),
(6, 1, 6, 'Ab odit sed qui possimus.', 'voluptas-et-adipisci-natus-placeat-facilis-nam', 'Consequuntur sint aspernatur cum minus ducimus.', '<p>Accusamus atque quia similique rerum fuga. Magni esse et quo dolor in repellat. Sint iure hic amet fugit et. Nesciunt libero illum dignissimos commodi nihil architecto perspiciatis quia.</p>', '2022-02-10 15:28:38', '2022-02-10 15:28:38', '2022-02-10 15:28:38');

INSERT INTO `users` (`id`, `username`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'rconroy', 'Jone Doe', 'jarod.muller@example.org', '2022-02-10 15:28:38', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xdm9uHPQeV', '2022-02-10 15:28:38', '2022-02-10 15:28:38');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;