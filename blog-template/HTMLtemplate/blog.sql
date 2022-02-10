-- -------------------------------------------------------------
-- TablePlus 4.5.2(402)
--
-- https://tableplus.com/
--
-- Database: blog
-- Generation Time: 2022-02-10 00:19:16.1960
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'fuga', 'soluta-consequuntur-placeat-sint-omnis-et', '2022-02-09 18:16:19', '2022-02-09 18:16:19'),
(2, 'tenetur', 'omnis-cumque-corrupti-eaque-magni-animi', '2022-02-09 18:16:19', '2022-02-09 18:16:19'),
(3, 'ratione', 'provident-totam-labore-autem-officiis-et', '2022-02-09 18:16:19', '2022-02-09 18:16:19'),
(4, 'sed', 'reiciendis-id-perferendis-id', '2022-02-09 18:16:19', '2022-02-09 18:16:19'),
(5, 'quis', 'odit-non-laboriosam-aliquam-eos-molestiae-labore-iusto', '2022-02-09 18:16:19', '2022-02-09 18:16:19');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_01_15_215412_create_posts_table', 1),
(6, '2022_02_09_162436_create_categories_table', 1);

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `slug`, `excerpt`, `body`, `created_at`, `updated_at`, `published_at`) VALUES
(1, 1, 1, 'Velit quia necessitatibus et quibusdam.', 'ratione-odit-aut-quaerat-eveniet-magnam', 'Enim quia voluptatem consectetur assumenda laboriosam.', '<p>Explicabo expedita ipsa tempore similique veniam non voluptas in. Velit omnis et aut cumque facilis sed odio consectetur. Cumque et omnis ut fuga perferendis dolorem. Eum sit exercitationem totam dolores voluptatem.</p>', '2022-02-09 18:16:19', '2022-02-09 18:16:19', '2022-02-09 18:16:19'),
(2, 1, 2, 'Numquam dolore maxime et ratione iusto et.', 'impedit-necessitatibus-autem-nam-aut-repellendus-aspernatur-expedita-aspernatur', 'Porro provident nihil facere fugit ex et.', '<p>Dolorum dolores facilis consequatur incidunt exercitationem hic rem. Ratione velit consequuntur qui sed architecto optio. Laborum facere saepe error cumque quos eum voluptate. Architecto accusantium ut et magnam.</p>', '2022-02-09 18:16:19', '2022-02-09 18:16:19', '2022-02-09 18:16:19'),
(3, 1, 3, 'Velit vero sint ipsam in iure.', 'enim-laboriosam-hic-suscipit-laudantium-numquam-earum-pariatur-consequatur', 'Suscipit sed praesentium temporibus necessitatibus.', '<p>Praesentium veniam at minima rerum labore labore omnis nostrum. Optio blanditiis ut doloremque numquam quis.</p>', '2022-02-09 18:16:19', '2022-02-09 18:16:19', '2022-02-09 18:16:19'),
(4, 1, 4, 'Amet ut reprehenderit quis repellat rem et.', 'sint-iusto-hic-vero-recusandae', 'Autem blanditiis aut culpa sapiente blanditiis amet.', '<p>At velit quasi consequatur exercitationem. Nostrum harum voluptatem non fuga neque provident. Officiis a maxime consectetur et et odit.</p>', '2022-02-09 18:16:19', '2022-02-09 18:16:19', '2022-02-09 18:16:19'),
(5, 1, 5, 'Laboriosam qui laudantium omnis pariatur laudantium labore.', 'nulla-sint-fugit-quia-laboriosam', 'Optio nam modi qui voluptatum.', '<p>Molestias est rerum doloribus at accusamus ut aut. Molestias sequi provident consequatur distinctio praesentium cum. Occaecati aut placeat mollitia perferendis neque.</p>', '2022-02-09 18:16:19', '2022-02-09 18:16:19', '2022-02-09 18:16:19');

INSERT INTO `users` (`id`, `username`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'aubrey.bernhard', 'Jone Doe', 'qhalvorson@example.com', '2022-02-09 18:16:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TKRLRvMgF1', '2022-02-09 18:16:19', '2022-02-09 18:16:19');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;