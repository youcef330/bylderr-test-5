-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 25, 2024 at 12:44 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admins', 'admin@site.com', 'admin', NULL, '6624ee96387ea1713696406.png', '$2y$12$vc.c.pNxefhOjFzLFNMEW.16i/h1vQCigtZeTLDY12QlIlS0KTWbm', NULL, NULL, '2024-04-21 04:46:46');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `click_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cron_jobs`
--

CREATE TABLE `cron_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cron_schedule_id` int NOT NULL DEFAULT '0',
  `next_run` datetime DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `is_running` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cron_jobs`
--

INSERT INTO `cron_jobs` (`id`, `name`, `alias`, `action`, `url`, `cron_schedule_id`, `next_run`, `last_run`, `is_running`, `is_default`, `created_at`, `updated_at`) VALUES
(5, 'Profit Cron', 'profit_cron', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"profit\"]', NULL, 3, '2024-05-16 11:40:05', '2024-05-15 11:40:05', 1, 1, '2024-05-11 12:45:10', '2024-05-15 05:40:05'),
(6, 'Installment Cron', 'installment', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"installment\"]', NULL, 3, '2024-05-15 09:04:01', '2024-05-14 09:04:01', 1, 1, '2024-05-11 12:45:10', '2024-05-14 03:04:01');

-- --------------------------------------------------------

--
-- Table structure for table `cron_job_logs`
--

CREATE TABLE `cron_job_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `cron_job_id` int UNSIGNED NOT NULL DEFAULT '0',
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `duration` int UNSIGNED NOT NULL DEFAULT '0',
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cron_schedules`
--

CREATE TABLE `cron_schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interval` int UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cron_schedules`
--

INSERT INTO `cron_schedules` (`id`, `name`, `interval`, `status`, `created_at`, `updated_at`) VALUES
(1, '5 Minutes', 300, 1, '2024-03-13 23:34:09', '2024-05-06 04:45:32'),
(3, '10 Minutes', 600, 1, '2024-05-06 04:46:39', '2024-05-06 04:46:39');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `property_id` int UNSIGNED NOT NULL DEFAULT '0',
  `invest_id` int UNSIGNED NOT NULL DEFAULT '0',
  `installment_id` int UNSIGNED NOT NULL DEFAULT '0',
  `payment_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = onetime, 2 = installment 	',
  `method_code` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `invest_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `method_currency` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `final_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `btc_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_try` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT '0',
  `admin_feedback` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `success_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failed_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_cron` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `device_tokens`
--

CREATE TABLE `device_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `is_app` tinyint(1) NOT NULL DEFAULT '0',
  `token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shortcode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'object',
  `support` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, '2019-10-18 11:16:05', '2022-03-21 17:22:24'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"6LdPC88fAAAAADQlUf_DV6Hrvgm-pZuLJFSLDOWV\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"6LdPC88fAAAAAG5SVaRYDnV2NpCrptLg2XLYKRKB\"}}', 'recaptcha.png', 0, '2019-10-18 11:16:05', '2024-05-15 05:23:38'),
(3, 'custom-captcha', 'Custom Captcha', 'Just put any random string', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, '2019-10-18 11:16:05', '2024-05-15 05:23:35'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{measurement_id}}\"></script>\n                <script>\n                  window.dataLayer = window.dataLayer || [];\n                  function gtag(){dataLayer.push(arguments);}\n                  gtag(\"js\", new Date());\n                \n                  gtag(\"config\", \"{{measurement_id}}\");\n                </script>', '{\"measurement_id\":{\"title\":\"Measurement ID\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, '2021-05-03 22:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"---\"}}', 'fb_com.png', 0, NULL, '2024-05-15 05:38:59');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `act`, `form_data`, `created_at`, `updated_at`) VALUES
(7, 'kyc', '{\"full_name\":{\"name\":\"Full Name\",\"label\":\"full_name\",\"is_required\":\"required\",\"instruction\":null,\"extensions\":\"\",\"options\":[],\"type\":\"text\",\"width\":\"6\"},\"email\":{\"name\":\"Email\",\"label\":\"email\",\"is_required\":\"required\",\"instruction\":null,\"extensions\":\"\",\"options\":[],\"type\":\"email\",\"width\":\"6\"},\"gender\":{\"name\":\"Gender\",\"label\":\"gender\",\"is_required\":\"required\",\"instruction\":null,\"extensions\":null,\"options\":[\"Male\",\"Female\",\"Others\"],\"type\":\"select\",\"width\":\"6\"},\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"instruction\":null,\"extensions\":null,\"options\":[],\"type\":\"number\",\"width\":\"6\"},\"nid_photo_front\":{\"name\":\"NID Photo Front\",\"label\":\"nid_photo_front\",\"is_required\":\"required\",\"instruction\":\"Upload the front side of your NID\",\"extensions\":\"jpg,png\",\"options\":[],\"type\":\"file\",\"width\":\"6\"},\"nid_photo_back\":{\"name\":\"NID Photo Back\",\"label\":\"nid_photo_back\",\"is_required\":\"required\",\"instruction\":\"Upload the back side of your NID\",\"extensions\":\"jpg,jpeg,png\",\"options\":[],\"type\":\"file\",\"width\":\"6\"},\"you_hobby\":{\"name\":\"You Hobby\",\"label\":\"you_hobby\",\"is_required\":\"required\",\"instruction\":null,\"extensions\":null,\"options\":[\"Programming\",\"Gardening\",\"Traveling\",\"Others\"],\"type\":\"checkbox\",\"width\":\"12\"}}', '2022-03-17 02:56:14', '2024-05-08 08:27:07');

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint UNSIGNED NOT NULL,
  `data_keys` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tempname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"real estate\",\"real estate investment\",\"investment\",\"property\",\"profit\",\"investment opportunities\",\"investment software\",\"investment website\"],\"description\":\"Introducing RealVest - Real Estate Investment System, the cutting-edge solution for navigating the complexities of real estate investment with unparalleled ease and efficiency. RealVest offers a robust platform developed on advanced technology, designed to meet the needs of both novice investors and seasoned professionals in the real estate industry.\",\"social_title\":\"RealVest - Real Estate Investment System\",\"social_description\":\"Introducing RealVest - Real Estate Investment System, the cutting-edge solution for navigating the complexities of real estate investment with unparalleled ease and efficiency. RealVest offers a robust platform developed on advanced technology, designed to meet the needs of both novice investors and seasoned professionals in the real estate industry.\",\"image\":\"663f5d3c9093f1715428668.png\"}', NULL, NULL, '', '2020-07-04 23:42:52', '2024-05-11 05:57:48'),
(24, 'about.content', '{\"has_image\":\"1\",\"title\":\"About RealVest\",\"heading\":\"About Our Real Estate\",\"subheading\":\"Finding great properties for investment\",\"description\":\"we specialize in providing a streamlined platform for real estate investors to discover lucrative opportunities. Our user-friendly interface offers access to a diverse range of properties, complete with detailed analytics and expert guidance to help you make informed decisions. Whether you\'re a seasoned investor or just getting started, RealVest is your trusted partner for success in the real estate market\",\"button_text\":\"Discover More\",\"button_url\":\"about\",\"top_card_title\":\"Average Profit Upto\",\"top_card_number\":\"20%\",\"bottom_card_title\":\"Investors\",\"bottom_card_number\":\"3K+\",\"image\":\"663f5dddc8a4e1715428829.jpg\",\"group_image\":\"663f5ddddcfe81715428829.png\"}', NULL, 'basic', '', '2020-10-28 00:51:20', '2024-05-11 06:00:29'),
(25, 'blog.content', '{\"title\":\"Our Blogs\",\"heading\":\"Latest News & Articles\"}', NULL, 'basic', '', '2020-10-28 00:51:34', '2024-05-15 05:50:05'),
(27, 'contact_us.content', '{\"has_image\":\"1\",\"title\":\"Get in Touch\",\"heading\":\"Let\'s ask your questions\",\"address_icon\":\"<i class=\\\"fas fa-map-marker-alt\\\"><\\/i>\",\"address_title\":\"Location\",\"address\":\"123 Main Street, London\",\"email_icon\":\"<i class=\\\"fas fa-envelope\\\"><\\/i>\",\"email_title\":\"Email\",\"email\":\"support@realvest.com\",\"mobile_icon\":\"<i class=\\\"fas fa-phone\\\"><\\/i>\",\"mobile_title\":\"Phone\",\"mobile_number\":\"+44 20 1234 5678\",\"image\":\"663f61df0806a1715429855.png\"}', NULL, 'basic', '', '2020-10-28 00:59:19', '2024-05-11 06:17:35'),
(33, 'feature.content', '{\"title\":\"Built to help smart investors invest smarter\",\"heading\":\"Why Invest in Real Estate?\"}', NULL, 'basic', '', '2021-01-03 23:40:54', '2024-05-11 06:28:03'),
(34, 'feature.element', '{\"title\":\"Secure Investment\",\"description\":\"Rest assured with our secure investment solutions, your financial future is protected\",\"feature_icon\":\"<i class=\\\"las la-hand-holding-usd\\\"><\\/i>\"}', NULL, 'basic', '', '2021-01-03 23:41:02', '2024-05-11 06:28:21'),
(41, 'cookie.data', '{\"short_desc\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.\",\"description\":\"<h4>Cookie Policy<\\/h4>\\r\\n\\r\\n<p>This Cookie Policy explains how to use cookies and similar technologies to recognize you when you visit our website. It explains what these technologies are and why we use them, as well as your rights to control our use of them.<\\/p>\\r\\n<br>\\r\\n<h4>What are cookies?<\\/h4>\\r\\n\\r\\n<p>Cookies are small pieces of data stored on your computer or mobile device when you visit a website. Cookies are widely used by website owners to make their websites work, or to work more efficiently, as well as to provide reporting information.<\\/p>\\r\\n<br>\\r\\n<h4>Why do we use cookies?<\\/h4>\\r\\n\\r\\n<p>We use cookies for several reasons. Some cookies are required for technical reasons for our Website to operate, and we refer to these as \\\"essential\\\" or \\\"strictly necessary\\\" cookies. Other cookies enable us to track and target the interests of our users to enhance the experience on our Website. Third parties serve cookies through our Website for advertising, analytics, and other purposes.<\\/p>\\r\\n<br>\\r\\n<h4>What types of cookies do we use?<\\/h4>\\r\\n\\r\\n<div>\\r\\n    <ul style=\\\"list-style: unset;\\\">\\r\\n        <li>\\r\\n            <strong>Essential Website Cookies:<\\/strong> \\r\\n            These cookies are strictly necessary to provide you with services available through our Website and to use some of its features.\\r\\n        <\\/li>\\r\\n        <li>\\r\\n            <strong>Analytics and Performance Cookies:<\\/strong> \\r\\n            These cookies allow us to count visits and traffic sources to measure and improve our Website\'s performance.\\r\\n        <\\/li>\\r\\n        <li>\\r\\n            <strong>Advertising Cookies:<\\/strong> \\r\\n            These cookies make advertising messages more relevant to you and your interests. They perform functions like preventing the same ad from continuously reappearing, ensuring that ads are properly displayed, and in some cases selecting advertisements that are based on your interests.\\r\\n        <\\/li>\\r\\n    <\\/ul>\\r\\n<\\/div>\\r\\n<br>\\r\\n<h4>Data Collected by Cookies<\\/h4>\\r\\n<p>Cookies may collect various types of data, including but not limited to:<\\/p>\\r\\n<ul style=\\\"list-style: unset;\\\">\\r\\n    <li>IP addresses<\\/li>\\r\\n    <li>Browser and device information<\\/li>\\r\\n    <li>Referring website addresses<\\/li>\\r\\n    <li>Pages visited on our website<\\/li>\\r\\n    <li>Interactions with our website, such as clicks and mouse movements<\\/li>\\r\\n    <li>Time spent on our website<\\/li>\\r\\n<\\/ul>\\r\\n<br>\\r\\n<h4>How We Use Collected Data<\\/h4>\\r\\n\\r\\n<p>We may use data collected by cookies for the following purposes:<\\/p>\\r\\n<ul style=\\\"list-style: unset;\\\">\\r\\n    <li>To personalize your experience on our website<\\/li>\\r\\n    <li>To improve our website\'s functionality and performance<\\/li>\\r\\n    <li>To analyze trends and gather demographic information about our user base<\\/li>\\r\\n    <li>To deliver targeted advertising based on your interests<\\/li>\\r\\n    <li>To prevent fraudulent activity and enhance website security<\\/li>\\r\\n<\\/ul>\\r\\n<br>\\r\\n<h4>Third-party cookies<\\/h4>\\r\\n\\r\\n<p>In addition to our cookies, we may also use various third-party cookies to report usage statistics of our Website, deliver advertisements on and through our Website, and so on.<\\/p>\\r\\n<br>\\r\\n<h4>How can we control cookies?<\\/h4>\\r\\n\\r\\n<p>You have the right to decide whether to accept or reject cookies. You can exercise your cookie preferences by clicking on the \\\"Cookie Settings\\\" link in the footer of our website. You can also set or amend your web browser controls to accept or refuse cookies. If you choose to reject cookies, you may still use our Website though your access to some functionality and areas of our Website may be restricted.<\\/p>\\r\\n<br>\\r\\n<h4>Changes to our Cookie Policy<\\/h4>\\r\\n\\r\\n<p>We may update our Cookie Policy from time to time. We will notify you of any changes by posting the new Cookie Policy on this page.<\\/p>\",\"status\":1}', NULL, NULL, NULL, '2020-07-04 23:42:52', '2024-04-25 06:26:36'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<h4>Introduction<\\/h4>\\r\\n        <p>\\r\\n            This Privacy Policy describes how we collects, uses, and discloses information, including personal information, in connection with your use of our website.\\r\\n        <\\/p>\\r\\n        <br \\/>\\r\\n        <h4>Information We Collect<\\/h4>\\r\\n        <p>We collect two main types of information on the Website:<\\/p>\\r\\n        <ul>\\r\\n            <li><p><strong>Personal Information: <\\/strong>This includes data that can identify you as an individual, such as your name, email address, phone number, or mailing address. We only collect this information when you voluntarily provide it to us, like signing up for a newsletter, contacting us through a form, or making a purchase.<\\/p><\\/li>\\r\\n            <li><p><strong>Non-Personal Information: <\\/strong>This data cannot be used to identify you directly. It includes details like your browser type, device type, operating system, IP address, browsing activity, and usage statistics. We collect this information automatically through cookies and other tracking technologies.<\\/p><\\/li>\\r\\n        <\\/ul>\\r\\n        <br \\/>\\r\\n        <h4>How We Use Information<\\/h4>\\r\\n        <p>The information we collect allows us to:<\\/p>\\r\\n        <ul>\\r\\n            <li>Operate and maintain the Website effectively.<\\/li>\\r\\n            <li>Send you newsletters or marketing communications, but only with your consent.<\\/li>\\r\\n            <li>Respond to your inquiries and fulfill your requests.<\\/li>\\r\\n            <li>Improve the Website and your user experience.<\\/li>\\r\\n            <li>Personalize your experience on the Website based on your browsing habits.<\\/li>\\r\\n            <li>Analyze how the Website is used to improve our services.<\\/li>\\r\\n            <li>Comply with legal and regulatory requirements.<\\/li>\\r\\n        <\\/ul>\\r\\n        <br \\/>\\r\\n        <h4>Sharing of Information<\\/h4>\\r\\n        <p>We may share your information with trusted third-party service providers who assist us in operating the Website and delivering our services. These providers are obligated by contract to keep your information confidential and use it only for the specific purposes we disclose it for.<\\/p>\\r\\n        <p>We will never share your personal information with any third parties for marketing purposes without your explicit consent.<\\/p>\\r\\n        <br \\/>\\r\\n        <h4>Data Retention<\\/h4>\\r\\n        <p>We retain your personal information only for as long as necessary to fulfill the purposes it was collected for. We may retain it for longer periods only if required or permitted by law.<\\/p>\\r\\n        <br \\/>\\r\\n        <h4>Security Measures<\\/h4>\\r\\n        <p>We take reasonable precautions to protect your information from unauthorized access, disclosure, alteration, or destruction. However, complete security cannot be guaranteed for any website or internet transmission.<\\/p>\\r\\n        <br \\/>\\r\\n        <h4>Changes to this Privacy Policy<\\/h4>\\r\\n        <p>We may update this Privacy Policy periodically. We will notify you of any changes by posting the revised policy on the Website. We recommend reviewing this policy regularly to stay informed of any updates.<\\/p>\\r\\n        <p><strong>Remember:<\\/strong>  This is a sample policy and may need adjustments to comply with specific laws and reflect your website\'s unique data practices. Consider consulting with a legal professional to ensure your policy is fully compliant.<\\/p>\"}', '{\"image\":null,\"description\":null,\"social_title\":null,\"social_description\":null,\"keywords\":null}', 'basic', 'privacy-policy', '2021-06-09 08:50:42', '2024-04-24 05:43:19'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<h4>Introduction<\\/h4>\\r\\n        <p>\\r\\n            This Privacy Policy describes how we collects, uses, and discloses information, including personal information, in connection with your use of our website.\\r\\n        <\\/p>\\r\\n        <br \\/>\\r\\n        <h4>Information We Collect<\\/h4>\\r\\n        <p>We collect two main types of information on the Website:<\\/p>\\r\\n        <ul>\\r\\n            <li><p><strong>Personal Information: <\\/strong>This includes data that can identify you as an individual, such as your name, email address, phone number, or mailing address. We only collect this information when you voluntarily provide it to us, like signing up for a newsletter, contacting us through a form, or making a purchase.<\\/p><\\/li>\\r\\n            <li><p><strong>Non-Personal Information: <\\/strong>This data cannot be used to identify you directly. It includes details like your browser type, device type, operating system, IP address, browsing activity, and usage statistics. We collect this information automatically through cookies and other tracking technologies.<\\/p><\\/li>\\r\\n        <\\/ul>\\r\\n        <br \\/>\\r\\n        <h4>How We Use Information<\\/h4>\\r\\n        <p>The information we collect allows us to:<\\/p>\\r\\n        <ul>\\r\\n            <li>Operate and maintain the Website effectively.<\\/li>\\r\\n            <li>Send you newsletters or marketing communications, but only with your consent.<\\/li>\\r\\n            <li>Respond to your inquiries and fulfill your requests.<\\/li>\\r\\n            <li>Improve the Website and your user experience.<\\/li>\\r\\n            <li>Personalize your experience on the Website based on your browsing habits.<\\/li>\\r\\n            <li>Analyze how the Website is used to improve our services.<\\/li>\\r\\n            <li>Comply with legal and regulatory requirements.<\\/li>\\r\\n        <\\/ul>\\r\\n        <br \\/>\\r\\n        <h4>Sharing of Information<\\/h4>\\r\\n        <p>We may share your information with trusted third-party service providers who assist us in operating the Website and delivering our services. These providers are obligated by contract to keep your information confidential and use it only for the specific purposes we disclose it for.<\\/p>\\r\\n        <p>We will never share your personal information with any third parties for marketing purposes without your explicit consent.<\\/p>\\r\\n        <br \\/>\\r\\n        <h4>Data Retention<\\/h4>\\r\\n        <p>We retain your personal information only for as long as necessary to fulfill the purposes it was collected for. We may retain it for longer periods only if required or permitted by law.<\\/p>\\r\\n        <br \\/>\\r\\n        <h4>Security Measures<\\/h4>\\r\\n        <p>We take reasonable precautions to protect your information from unauthorized access, disclosure, alteration, or destruction. However, complete security cannot be guaranteed for any website or internet transmission.<\\/p>\\r\\n        <br \\/>\\r\\n        <h4>Changes to this Privacy Policy<\\/h4>\\r\\n        <p>We may update this Privacy Policy periodically. We will notify you of any changes by posting the revised policy on the Website. We recommend reviewing this policy regularly to stay informed of any updates.<\\/p>\\r\\n        <p><strong>Remember:<\\/strong>  This is a sample policy and may need adjustments to comply with specific laws and reflect your website\'s unique data practices. Consider consulting with a legal professional to ensure your policy is fully compliant.<\\/p>\"}', '{\"image\":\"6635d5d9618e71714804185.png\",\"description\":null,\"social_title\":null,\"social_description\":null,\"keywords\":null}', 'basic', 'terms-of-service', '2021-06-09 08:51:18', '2024-05-04 00:29:45'),
(44, 'maintenance.data', '{\"description\":\"Our site is undergoing maintenance to provide you with an enhanced experience. We apologize for any inconvenience caused during this period. Rest assured, our team is working diligently to bring you a better platform. Thank you for your patience and understanding. We look forward to serving you better soon.\",\"image\":\"65c73f28b723e1707556648.png\"}', NULL, NULL, NULL, '2020-07-04 23:42:52', '2024-05-11 06:48:51'),
(52, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Important Tips for Real Estate Investing Career\",\"description\":\"<p>\\u00a0 \\u00a0Embarking on a journey into real estate investing demands a comprehensive\\r\\n  approach that encompasses various critical factors. Here are ten essential\\r\\n  tips to consider as you set foot into this dynamic and potentially lucrative\\r\\n  field.\\r\\n<\\/p>\\r\\n\\r\\n<h6>Prioritize Education<\\/h6>\\r\\n<p>Real estate investing isn\'t merely about buying and selling \\r\\nproperties; it\'s about understanding market dynamics, financial \\r\\nanalysis, risk assessment, and legal considerations. Equip yourself with\\r\\n knowledge through books, seminars, online courses, and mentorship \\r\\nprograms.<\\/p>\\r\\n\\r\\n<h6>Define Clear Goals<\\/h6>\\r\\n<p>Clarity in goals is paramount. Define your investment objectives with\\r\\n precision. Are you seeking short-term gains through property flipping, \\r\\nor do you aim for long-term wealth accumulation via rental properties? \\r\\nEstablishing clear goals will provide direction and focus amidst the \\r\\ndiverse opportunities in the real estate market.<\\/p>\\r\\n\\r\\n<h6>Build a Robust Network<\\/h6>\\r\\n<p>Surround yourself with professionals who can offer valuable insights \\r\\nand support, including real estate agents, lenders, contractors, and \\r\\nfellow investors. Cultivating these relationships can provide access to \\r\\nopportunities and resources that may otherwise remain inaccessible.<\\/p>\\r\\n\\r\\n<h6>Conduct Thorough Market Research<\\/h6>\\r\\n<p>Stay abreast of local market trends, economic indicators, and \\r\\ndemographic shifts that influence property values and rental demand. \\r\\nConduct thorough analyses to identify emerging opportunities and \\r\\npotential risks in your target areas.<\\/p>\\r\\n\\r\\n<h6>Start Small<\\/h6>\\r\\n<p>Beginning with manageable investments such as single-family homes or \\r\\nduplexes allows you to gain valuable experience and mitigate risks as \\r\\nyou gradually expand your portfolio.<\\/p>\\r\\n\\r\\n<h6>Prioritize Cash Flow<\\/h6>\\r\\n<p>Invest in properties that generate positive cash flow from rental \\r\\nincome, ensuring a steady stream of revenue that exceeds expenses.<\\/p>\\r\\n\\r\\n<h6>Manage Risks<\\/h6>\\r\\n<p>Conduct comprehensive due diligence before making investment \\r\\ndecisions and mitigate risks through careful planning and contingency \\r\\nmeasures.<\\/p>\\r\\n\\r\\n<h6>Persistence and Patience<\\/h6>\\r\\n<p>Success in real estate investing requires dedication, resilience, and\\r\\n a willingness to weather challenges and setbacks along the way.<\\/p>\\r\\n\\r\\n<h6>Continuously Learn<\\/h6>\\r\\n<p>Stay curious, seek out new knowledge, and adapt to evolving market trends, regulations, and investment strategies<\\/p>\\r\\n\\r\\n<h6>Seek Professional Guidance<\\/h6>\\r\\n<p>Consult with experts such as real estate attorneys, tax advisors, and\\r\\n financial planners to ensure informed decision-making aligned with your\\r\\n financial objectives.<\\/p>\\r\\n\\r\\n<p>In conclusion, launching a successful real estate investing career \\r\\nrequires a holistic approach that encompasses education, goal-setting, \\r\\nnetworking, market research, risk management, patience, continuous \\r\\nlearning, and professional guidance. By embracing these essential tips \\r\\nand committing to your growth as an investor, you can embark on a \\r\\nrewarding journey towards financial success in real estate.<\\/p>\",\"image\":\"663f5e99687181715429017.png\"}', '{\"image\":\"65ffcda2669481711263138.jpg\",\"description\":null,\"social_title\":\"test\",\"social_description\":null,\"keywords\":null}', 'basic', 'important-tips-for-real-estate-investing-career', '2024-03-24 06:52:04', '2024-05-11 23:55:05'),
(64, 'banner.content', '{\"has_image\":\"1\",\"title\":\"Smart & secure real estate investment platform\",\"heading\":\"Invest in The Future of Real Estate\",\"button_text\":\"Get Started\",\"button_url\":\"user\\/register\",\"image\":\"663f5e38b1bae1715428920.png\"}', NULL, 'basic', '', '2024-05-01 00:06:45', '2024-05-11 06:02:00'),
(65, 'faq.element', '{\"question\":\"What is real estate investment?\",\"answer\":\"Real estate investment involves purchasing, owning, managing, renting, or selling properties for the purpose of generating income or profit.\"}', NULL, 'basic', '', '2024-05-04 00:21:20', '2024-05-11 06:21:09'),
(66, 'register_disable.content', '{\"has_image\":\"1\",\"heading\":\"Registration Currently Disabled\",\"subheading\":\"Page you are looking for doesn\'t exists or an other error occurred or temporarily unavailable.\",\"button_name\":\"Go to Home\",\"button_url\":\"#\",\"image\":\"663a0f20ecd0b1715080992.png\"}', NULL, 'basic', '', '2024-05-07 05:23:12', '2024-05-26 23:16:53'),
(67, 'banned.content', '{\"has_image\":\"1\",\"heading\":\"You are banned\",\"image\":\"663f5e07348ba1715428871.png\"}', NULL, 'basic', '', '2024-05-11 06:01:11', '2024-05-11 06:01:11'),
(68, 'banner.element', '{\"title\":\"Member\",\"count\":\"9K+\"}', NULL, 'basic', '', '2024-05-11 06:02:14', '2024-05-11 06:02:14'),
(69, 'banner.element', '{\"title\":\"Investors\",\"count\":\"3K+\"}', NULL, 'basic', '', '2024-05-11 06:02:27', '2024-05-11 06:02:27'),
(70, 'banner.element', '{\"title\":\"Average Profit Upto\",\"count\":\"20%\"}', NULL, 'basic', '', '2024-05-11 06:02:40', '2024-05-11 06:02:40'),
(71, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"What is Turn Key Real Estate Investing?\",\"description\":\"<h6>Investing in Real Estate: A Guide to Turnkey Investing<\\/h6>\\r\\n<p>Investing in real estate can be a lucrative venture, but it often \\r\\nrequires significant time, effort, and expertise to find, purchase, \\r\\nrenovate, and manage properties successfully. However, turnkey real \\r\\nestate investing offers an alternative approach that appeals to many \\r\\ninvestors seeking passive income and minimal involvement in the \\r\\nday-to-day operations of property management.<\\/p>\\r\\n\\r\\n<h6>Understanding Turnkey Real Estate Investing<\\/h6>\\r\\n<p>Turnkey real estate investing involves purchasing properties that are\\r\\n fully renovated, leased, and managed by a third-party company. \\r\\nInvestors typically buy these properties from turnkey providers who \\r\\nspecialize in identifying, acquiring, renovating, and renting out \\r\\nproperties in desirable locations. The turnkey provider handles all \\r\\naspects of the investment, from property acquisition and renovation to \\r\\ntenant placement and ongoing management.<\\/p>\\r\\n\\r\\n<h6>The Benefits of Turnkey Real Estate Investing<\\/h6>\\r\\n<p>One of the primary benefits of turnkey real estate investing is its \\r\\nhands-off nature. Investors can leverage the expertise of turnkey \\r\\nproviders to acquire rental properties without the need to personally \\r\\noversee renovations, tenant screening, or property management tasks. \\r\\nThis passive approach appeals to busy professionals, retirees, and \\r\\ninvestors looking to diversify their portfolios without committing \\r\\nsignificant time and resources.<\\/p>\\r\\n\\r\\n<h6>Immediate Income Generation<\\/h6>\\r\\n<p>Additionally, turnkey properties are often marketed as \\r\\n\\\"income-producing\\\" assets from day one. Since these properties are \\r\\ntypically already leased to tenants, investors can start generating \\r\\nrental income immediately after purchasing them. This immediate cash \\r\\nflow can provide a steady stream of passive income, making turnkey real \\r\\nestate investing an attractive option for those seeking regular returns \\r\\non their investment.<\\/p>\\r\\n\\r\\n<h6>Geographic Diversification and Stability<\\/h6>\\r\\n<p>Another advantage of turnkey investing is its potential for \\r\\ngeographic diversification. Turnkey providers often operate in multiple \\r\\nmarkets, allowing investors to spread their risk across different \\r\\nlocations and property types. This diversification can help mitigate the\\r\\n impact of local market fluctuations and economic downturns, providing a\\r\\n more stable investment strategy.<\\/p>\\r\\n\\r\\n<h6>Turnkey Properties: Fully Renovated and Move-In Ready<\\/h6>\\r\\n<p>Furthermore, turnkey properties are usually fully renovated and in \\r\\nmove-in condition, eliminating the need for costly and time-consuming \\r\\nrepairs or upgrades. This aspect not only saves investors the hassle of \\r\\nmanaging renovations but also reduces the risk of unexpected maintenance\\r\\n expenses in the early stages of ownership.<\\/p>\\r\\n\\r\\n<h6>Considerations and Potential Drawbacks<\\/h6>\\r\\n<p>However, despite its benefits, turnkey real estate investing is not \\r\\nwithout its drawbacks. One potential downside is the higher upfront cost\\r\\n associated with purchasing fully renovated and leased properties. \\r\\nCompared to traditional real estate investing, where investors can buy \\r\\nproperties at lower prices and potentially add value through \\r\\nrenovations, turnkey properties typically come with a premium price tag.<\\/p>\\r\\n\\r\\n<h6>Thorough Due Diligence is Key<\\/h6>\\r\\n<p>Moreover, investors must conduct thorough due diligence before \\r\\nchoosing a turnkey provider. Not all turnkey companies are created \\r\\nequal, and some may cut corners or fail to deliver on their promises. \\r\\nIt\'s essential to research potential providers carefully, evaluate their\\r\\n track record, and assess the quality of their properties and services \\r\\nbefore making any investment decisions.<\\/p>\\r\\n\\r\\n\\r\\n<p>In conclusion, turnkey real estate investing offers a convenient and \\r\\npotentially profitable way for investors to acquire rental properties \\r\\nwith minimal hassle and involvement. By leveraging the expertise of \\r\\nturnkey providers, investors can enjoy passive income, immediate cash \\r\\nflow, and geographic diversification while avoiding the complexities of \\r\\nproperty management. However, like any investment strategy, turnkey \\r\\ninvesting requires careful consideration and due diligence to ensure \\r\\nsuccess.<\\/p>\",\"image\":\"663f5eb92cc0a1715429049.png\"}', NULL, 'basic', 'what-is-turn-key-real-estate-investing', '2024-05-11 06:04:09', '2024-09-25 05:17:03'),
(72, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"How to Build Your Real Estate Portfolio\",\"description\":\"<p>\\u00a0 \\u00a0Are you tired of renting and dreaming of owning multiple properties?\\r\\n  Transitioning from being a renter to becoming a real estate investor can be a\\r\\n  transformative journey. It\'s not just about owning a home; it\'s about building\\r\\n  a portfolio that generates passive income and secures your financial future.\\r\\n  Here\'s a guide on how to embark on this exciting path\\r\\n<\\/p>\\r\\n\\r\\n<h6>Educate Yourself: Understanding the Financial Aspects<\\/h6>\\r\\n<p>\\r\\n  Firstly, before diving into real estate investing, it\'s crucial to educate\\r\\n  yourself about the financial aspects. Understand concepts like leverage, cash\\r\\n  flow, appreciation, and the risks associated with real estate investment. Take\\r\\n  courses, read books, and seek guidance from experienced investors or financial\\r\\n  advisors\\r\\n<\\/p>\\r\\n\\r\\n<h6>Set Clear Goals: Defining Your Objectives<\\/h6>\\r\\n<p>\\r\\n  Once you\'ve gained a solid understanding of the financial fundamentals, set\\r\\n  clear goals for your real estate investment journey. Determine your\\r\\n  objectives\\u2014are you aiming for long-term wealth accumulation, immediate cash\\r\\n  flow, or a combination of both? Define your risk tolerance, investment\\r\\n  horizon, and target returns. Having clear goals will guide your investment\\r\\n  decisions and help you stay focused amidst market fluctuations\\r\\n<\\/p>\\r\\n\\r\\n<h6>Assess Your Financial Situation: Establishing a Solid Foundation<\\/h6>\\r\\n<p>\\r\\n  With your goals in mind, assess your current financial situation and establish\\r\\n  a solid foundation before diving into real estate. Pay off high-interest debt,\\r\\n  build an emergency fund, and ensure you have a stable source of income to\\r\\n  cover your living expenses. Having financial stability will provide a safety\\r\\n  net as you navigate the challenges of real estate investment\\r\\n<\\/p>\\r\\n\\r\\n<h6>Start Small: Beginning with Manageable Investments<\\/h6>\\r\\n<p>\\r\\n  When you\'re ready to start investing, consider beginning with manageable\\r\\n  investments. Start small with a single-family home, duplex, or small\\r\\n  multi-unit property. Starting small allows you to gain hands-on experience,\\r\\n  learn the ropes of property management, and minimize your financial exposure\\r\\n<\\/p>\\r\\n\\r\\n<h6>Location Matters: Conducting Thorough Research<\\/h6>\\r\\n<p>\\r\\n  Location is paramount in real estate investment. Conduct thorough research to\\r\\n  identify markets with strong fundamentals, such as job growth, population\\r\\n  expansion, and infrastructure development. Analyze local market trends,\\r\\n  vacancy rates, rental demand, and comparable property prices to make informed\\r\\n  investment decisions\\r\\n<\\/p>\\r\\n\\r\\n<h6>Financial Analysis: Evaluating Potential Investment Properties<\\/h6>\\r\\n<p>\\r\\n  Perform comprehensive financial analysis for each potential investment\\r\\n  property. Calculate the potential rental income, operating expenses, vacancy\\r\\n  rates, and projected cash flow. Factor in property taxes, insurance,\\r\\n  maintenance costs, and potential capital expenditures. Ensure that the\\r\\n  property\'s cash flow aligns with your investment goals and risk tolerance\\r\\n<\\/p>\\r\\n\\r\\n<h6>Build Relationships: Networking within the Real Estate Community<\\/h6>\\r\\n<p>\\r\\n  Building relationships within the real estate community is essential for\\r\\n  success. Attend networking events, join real estate investment clubs, and\\r\\n  connect with other investors, agents, lenders, and property managers.\\r\\n  Collaborating with experienced professionals can provide valuable insights and\\r\\n  open doors to potential partnerships or deals\\r\\n<\\/p>\\r\\n\\r\\n<h6>Due Diligence: Conducting Thorough Research<\\/h6>\\r\\n<p>\\r\\n  Conduct thorough due diligence before finalizing any real estate transaction.\\r\\n  Inspect the property, review financial statements, assess market comparables,\\r\\n  and verify legal documents. Consider hiring professionals, such as inspectors,\\r\\n  appraisers, and attorneys, to assist with the due diligence process and\\r\\n  mitigate risks\\r\\n<\\/p>\\r\\n\\r\\n<h6>Explore Financing Options: Evaluating Available Choices<\\/h6>\\r\\n<p>\\r\\n  Explore various financing options available for real estate investment, such\\r\\n  as conventional mortgages, FHA loans, private lenders, or partnerships.\\r\\n  Evaluate the terms, interest rates, and repayment schedules to choose the most\\r\\n  suitable financing option for your investment strategy\\r\\n<\\/p>\\r\\n\\r\\n<h6>Stay Informed: Adapting to Market Changes<\\/h6>\\r\\n<p>\\r\\n  Real estate investment is a dynamic and evolving field. Stay updated on market\\r\\n  trends, regulatory changes, and investment strategies through ongoing\\r\\n  education and networking. Be flexible and willing to adapt your investment\\r\\n  approach based on changing market conditions and opportunities\\r\\n<\\/p>\\r\\n\\r\\nIn conclusion, transitioning from a renter to a real estate investor requires\\r\\ncareful planning, financial education, and strategic decision-making. By\\r\\nsetting clear goals, starting small, conducting thorough research, and\\r\\nbuilding a network of professionals, you can gradually build a successful real\\r\\nestate portfolio that generates passive income and creates long-term wealth<br \\/>\",\"image\":\"663f5edd8229f1715429085.png\"}', NULL, 'basic', 'how-to-build-your-real-estate-portfolio', '2024-05-11 06:04:45', '2024-05-11 23:54:23'),
(73, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The Ultimate Guide to Real Estate Investing\",\"description\":\"<p>Real estate investing has long been hailed as one of the most \\r\\nlucrative avenues for wealth accumulation. It offers a tangible asset \\r\\nthat can appreciate over time, generate passive income, and provide \\r\\nnumerous tax benefits. However, navigating the complex world of real \\r\\nestate requires knowledge, strategy, and a solid understanding of the \\r\\nmarket. In \\\"Unlocking Wealth: The Ultimate Guide to Real Estate \\r\\nInvesting,\\\" we delve into the fundamental principles and strategies that\\r\\n can help both novice and seasoned investors unlock the full potential \\r\\nof real estate.<\\/p>\\r\\n\\r\\n<h6>Understanding Market Dynamics<\\/h6>\\r\\n<p>At its core, successful real estate investing requires a thorough \\r\\nunderstanding of the market dynamics. This includes analyzing supply and\\r\\n demand trends, assessing economic indicators, and identifying emerging \\r\\nopportunities. Whether it\'s residential properties, commercial real \\r\\nestate, or niche markets like vacation rentals or fix-and-flip \\r\\nproperties, investors must conduct extensive research to make informed \\r\\ndecisions.<\\/p>\\r\\n\\r\\n<h6>The Importance of Location<\\/h6>\\r\\n<p>One of the key principles emphasized in our guide is the importance \\r\\nof location. The adage \\\"location, location, location\\\" rings true in real\\r\\n estate investing. A property\'s location not only determines its \\r\\npotential for appreciation but also influences its rental income and \\r\\noverall demand. Factors such as proximity to amenities, schools, \\r\\nemployment centers, and transportation hubs can significantly impact the\\r\\n property\'s desirability and long-term value.<\\/p>\\r\\n\\r\\n<h6>Financial Aspects of Real Estate Investing<\\/h6>\\r\\n<p>In addition to location, investors must also consider the financial \\r\\naspects of real estate investing. This includes evaluating the \\r\\nproperty\'s cash flow potential, assessing its return on investment \\r\\n(ROI), and understanding financing options. From traditional mortgages \\r\\nto creative financing strategies like seller financing or private \\r\\nlending, there are various ways to fund real estate investments. Our \\r\\nguide provides insights into the pros and cons of each approach, helping\\r\\n investors choose the most suitable financing strategy for their goals \\r\\nand risk tolerance.<\\/p>\\r\\n\\r\\n<h6>Effective Property Management<\\/h6>\\r\\n<p>Moreover, successful real estate investing requires a proactive \\r\\napproach to property management. Whether you\'re a hands-on investor \\r\\nmanaging your properties directly or you opt for a hands-off approach by\\r\\n hiring a property management company, effective management is essential\\r\\n for maximizing returns and minimizing risks. This involves ensuring \\r\\ntimely rent collection, conducting regular maintenance and repairs, and \\r\\nstaying updated on landlord-tenant laws and regulations.<\\/p>\\r\\n\\r\\n<h6>Diversification<\\/h6>\\r\\n<p>Furthermore, \\\"Unlocking Wealth: The Ultimate Guide to Real Estate \\r\\nInvesting\\\" explores the importance of diversification in building a \\r\\nrobust real estate portfolio. While investing in residential properties \\r\\nmay offer stability and consistent cash flow, diversifying into \\r\\ncommercial real estate or alternative asset classes can provide \\r\\nadditional sources of income and hedge against market volatility.<\\/p>\\r\\n\\r\\n<h6>Continuous Learning and Adaptation<\\/h6>\\r\\n<p>Lastly, our guide emphasizes the significance of continuous learning \\r\\nand adaptation in the ever-evolving real estate landscape. Markets \\r\\nfluctuate, economic conditions change, and new technologies emerge, \\r\\nreshaping the way we invest in real estate. By staying informed, \\r\\nremaining agile, and continuously honing their skills, investors can \\r\\nnavigate challenges and seize opportunities in any market environment.<\\/p>\\r\\n\\r\\n<p>In conclusion, real estate investing offers a pathway to wealth \\r\\ncreation for those willing to educate themselves, take calculated risks,\\r\\n and stay committed for the long term. \\\"Unlocking Wealth: The Ultimate \\r\\nGuide to Real Estate Investing\\\" serves as a comprehensive resource for \\r\\ninvestors looking to harness the power of real estate to achieve their \\r\\nfinancial goals and unlock lasting prosperity.<\\/p>\",\"image\":\"663f5ef969b2b1715429113.png\"}', NULL, 'basic', 'the-ultimate-guide-to-real-estate-investing', '2024-05-11 06:05:13', '2024-05-15 05:49:57'),
(74, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Inspiring Stories from Real Estate Investors\",\"description\":\"<p>In the dynamic world of real estate investing, success stories \\r\\nabound, each one a testament to the vision, dedication, and resilience \\r\\nof individuals who dared to chase their dreams. One such tale of triumph\\r\\n belongs to Sarah, a determined investor who defied the odds to carve \\r\\nher niche in the competitive real estate market. Starting with modest \\r\\nsavings and a burning desire to build wealth, Sarah embarked on her \\r\\njourney with unwavering determination. Despite facing initial hurdles \\r\\nand skepticism from peers, she remained steadfast in her pursuit, \\r\\nleveraging her keen eye for opportunities and willingness to take \\r\\ncalculated risks.<\\/p>\\r\\n\\r\\n\\r\\n<h6>Michael: Transformative Power of Passion<\\/h6>\\r\\n<p>Similarly, the story of Michael serves as a testament to the \\r\\ntransformative power of passion and persistence. Coming from humble \\r\\nbeginnings, Michael harbored a lifelong fascination with real estate, \\r\\nviewing it not merely as a means to financial gain but as a vehicle for \\r\\ncommunity revitalization and social impact. Armed with this vision, he \\r\\nembarked on a mission to breathe new life into neglected neighborhoods, \\r\\none property at a time. Despite facing skepticism and naysayers, Michael\\r\\n remained undeterred, pouring his heart and soul into revitalization \\r\\nprojects that revitalized communities and provided much-needed \\r\\naffordable housing. His commitment to sustainable development and \\r\\ncommunity engagement earned him not only financial success but also the \\r\\nrespect and admiration of his peers.<\\/p>\\r\\n\\r\\n\\r\\n<h6>Maria: Overcoming Adversity<\\/h6>\\r\\n<p>Then there\'s the story of Maria, a single mother who overcame \\r\\nadversity to build a thriving real estate empire from scratch. Juggling \\r\\nmultiple jobs and familial responsibilities, Maria refused to let her \\r\\ncircumstances define her destiny. With unwavering determination and a \\r\\nlaser focus on her goals, she embarked on a journey of self-discovery \\r\\nand empowerment. Through sheer grit and resourcefulness, Maria navigated\\r\\n the complexities of the real estate market, leveraging her unique \\r\\nperspective and life experiences to identify lucrative investment \\r\\nopportunities. Her journey serves as a testament to the indomitable \\r\\nspirit of individuals who refuse to be bound by limitations, turning \\r\\nadversity into opportunity and paving the way for a brighter future.<\\/p>\\r\\n\\r\\n\\r\\n<p>These are just a few examples of the countless inspiring stories that\\r\\n illuminate the landscape of real estate investing. Each one is a \\r\\nreminder that success is not merely the result of luck or circumstance \\r\\nbut of vision, perseverance, and unwavering determination. As we \\r\\ncelebrate these achievements, let us draw inspiration from their \\r\\njourneys and embark on our own paths towards greatness. After all, in \\r\\nthe world of real estate investing, the possibilities are as limitless \\r\\nas our imagination and determination to succeed.<\\/p>\",\"image\":\"663f5f14136bc1715429140.png\"}', '{\"image\":null,\"description\":null,\"social_title\":null,\"social_description\":null,\"keywords\":null}', 'basic', 'inspiring-stories-from-real-estate-investors', '2024-05-11 06:05:40', '2024-05-15 04:27:02'),
(75, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Overcoming Common Challenges in Real Estate Investment\",\"description\":\"<p>Investing in real estate can be a lucrative venture, but it\'s not \\r\\nwithout its challenges. From market fluctuations to regulatory hurdles, \\r\\nnavigating the world of real estate investment requires skill, \\r\\nknowledge, and perseverance. In this blog, we\'ll explore some of the \\r\\ncommon barriers that investors face and discuss strategies for \\r\\novercoming them.<\\/p>\\r\\n\\r\\n<h6>Market Volatility: A Natural Challenge<\\/h6>\\r\\n<p>One of the most significant challenges in real estate investment is \\r\\nmarket volatility. The real estate market is subject to fluctuations \\r\\ninfluenced by factors such as economic conditions, interest rates, and \\r\\nconsumer confidence. These fluctuations can make it difficult for \\r\\ninvestors to predict future returns and plan their investments \\r\\naccordingly. However, savvy investors understand that market volatility \\r\\nis a natural part of the investment landscape and take steps to mitigate\\r\\n its impact.One strategy for overcoming market volatility is \\r\\ndiversification. By spreading their investments across different \\r\\nproperties and geographic locations, investors can reduce their exposure\\r\\n to risk. Diversification allows investors to capitalize on \\r\\nopportunities in different markets while minimizing the impact of \\r\\ndownturns in any one area.<\\/p>\\r\\n\\r\\n<h6>Financing: Overcoming Barriers to Capital<\\/h6>\\r\\n<p>Another common challenge in real estate investment is financing. \\r\\nSecuring funding for real estate projects can be challenging, especially\\r\\n for new investors or those with less-than-perfect credit. Traditional \\r\\nlenders may require large down payments and extensive documentation, \\r\\nmaking it difficult for some investors to access the capital they \\r\\nneed.To overcome financing barriers, investors can explore alternative \\r\\nfinancing options such as private lenders, crowdfunding platforms, or \\r\\nseller financing. These alternative sources of funding may offer more \\r\\nflexible terms and faster approval processes, allowing investors to \\r\\nseize opportunities quickly and efficiently.<\\/p>\\r\\n\\r\\n<h6>Navigating Regulatory Hurdles<\\/h6>\\r\\n<p>Regulatory hurdles are another obstacle that investors may encounter \\r\\nin real estate investment. Local zoning laws, building codes, and \\r\\npermitting requirements can vary widely from one jurisdiction to \\r\\nanother, making it essential for investors to understand and comply with\\r\\n all applicable regulations.To navigate regulatory barriers, investors \\r\\nshould conduct thorough due diligence and work closely with experienced \\r\\nreal estate professionals who understand the local market and regulatory\\r\\n landscape. Building relationships with local officials and stakeholders\\r\\n can also help investors streamline the permitting process and avoid \\r\\ncostly delays.\\r\\n<\\/p>\\r\\n\\r\\n<h6>Property Management: A Critical Component<\\/h6>\\r\\n<p>Effective property management is critical to the long-term success of\\r\\n a real estate investment. Investors must ensure that their properties \\r\\nare well-maintained, attract and retain quality tenants, and generate \\r\\nconsistent cash flow. This may require outsourcing property management \\r\\ntasks to professionals or investing in technology solutions that \\r\\nstreamline the management process.\\r\\nMaintaining positive tenant relations is another key aspect of \\r\\nsuccessful real estate investment. Happy tenants are more likely to \\r\\nrenew their leases, take care of the property, and recommend it to \\r\\nothers. Investors should strive to provide responsive and attentive \\r\\ncustomer service, address tenant concerns promptly, and maintain open \\r\\nlines of communication.<\\/p>\\r\\n\\r\\n<h6>Preparing for the Unexpected<\\/h6>\\r\\n<p>Finally, investors must be prepared to deal with unexpected expenses \\r\\nsuch as repairs, vacancies, or changes in market conditions. Building a \\r\\nfinancial cushion and conducting regular property inspections can help \\r\\ninvestors anticipate and mitigate these expenses, ensuring the long-term\\r\\n profitability of their investments.<\\/p>\\r\\n\\r\\n<p>In conclusion, while real estate investment presents numerous \\r\\nchallenges, savvy investors can overcome these barriers and achieve \\r\\nsuccess in the market. By diversifying their portfolios, exploring \\r\\nalternative financing options, understanding and complying with \\r\\nregulatory requirements, and adopting effective property management \\r\\npractices, investors can build a resilient and profitable real estate \\r\\nportfolio. With diligence, patience, and perseverance, breaking barriers\\r\\n in real estate investment is not only possible but highly achievable.<\\/p>\",\"image\":\"663f5f2adbcc81715429162.png\"}', NULL, 'basic', 'overcoming-common-challenges-in-real-estate-investment', '2024-05-11 06:06:02', '2024-05-11 23:53:55'),
(76, 'brands.element', '{\"has_image\":\"1\",\"image\":\"663f5fdb0c0341715429339.png\"}', NULL, 'basic', '', '2024-05-11 06:08:59', '2024-05-11 06:08:59'),
(77, 'brands.element', '{\"has_image\":\"1\",\"image\":\"663f5fe175d8d1715429345.png\"}', NULL, 'basic', '', '2024-05-11 06:09:05', '2024-05-11 06:09:05'),
(78, 'brands.element', '{\"has_image\":\"1\",\"image\":\"663f5feb099261715429355.png\"}', NULL, 'basic', '', '2024-05-11 06:09:15', '2024-05-11 06:09:15'),
(79, 'brands.element', '{\"has_image\":\"1\",\"image\":\"663f6018ee6d21715429400.png\"}', NULL, 'basic', '', '2024-05-11 06:10:00', '2024-05-11 06:10:00'),
(80, 'brands.element', '{\"has_image\":\"1\",\"image\":\"663f601f2c6881715429407.png\"}', NULL, 'basic', '', '2024-05-11 06:10:07', '2024-05-11 06:10:07'),
(81, 'brands.element', '{\"has_image\":\"1\",\"image\":\"663f6026946cb1715429414.png\"}', NULL, 'basic', '', '2024-05-11 06:10:14', '2024-05-11 06:10:14'),
(82, 'brands.element', '{\"has_image\":\"1\",\"image\":\"663f602c596651715429420.png\"}', NULL, 'basic', '', '2024-05-11 06:10:20', '2024-05-11 06:10:20'),
(83, 'brands.element', '{\"has_image\":\"1\",\"image\":\"663f6034ee1761715429428.png\"}', NULL, 'basic', '', '2024-05-11 06:10:28', '2024-05-11 06:10:28'),
(84, 'brands.element', '{\"has_image\":\"1\",\"image\":\"663f603a8f0811715429434.png\"}', NULL, 'basic', '', '2024-05-11 06:10:34', '2024-05-11 06:10:34'),
(85, 'brands.element', '{\"has_image\":\"1\",\"image\":\"663f6040848071715429440.png\"}', NULL, 'basic', '', '2024-05-11 06:10:40', '2024-05-11 06:10:40'),
(86, 'brands.element', '{\"has_image\":\"1\",\"image\":\"663f6046a31ba1715429446.png\"}', NULL, 'basic', '', '2024-05-11 06:10:46', '2024-05-11 06:10:46'),
(87, 'breadcrumb.content', '{\"has_image\":\"1\",\"background_image\":\"663f60dbb6e921715429595.png\"}', NULL, 'basic', '', '2024-05-11 06:13:15', '2024-05-11 06:13:15'),
(88, 'cities.content', '{\"title\":\"Cities\",\"heading\":\"Explore By Cities\"}', NULL, 'basic', '', '2024-05-11 06:16:22', '2024-05-11 06:16:22'),
(89, 'faq.element', '{\"question\":\"What types of real estate investments are available?\",\"answer\":\"Common types of real estate investments include residential properties (such as single-family homes, condos, and apartments), commercial properties (such as office buildings, retail spaces, and warehouses), industrial properties, and vacant land.\"}', NULL, 'basic', '', '2024-05-11 06:26:54', '2024-05-11 06:26:54'),
(90, 'faq.element', '{\"question\":\"How do I get started with real estate investment?\",\"answer\":\"To get started, you can educate yourself about the market, develop a clear investment strategy, conduct thorough research, build a network of professionals (such as real estate agents, lenders, and contractors), and consider working with experienced mentors or advisors.\"}', NULL, 'basic', '', '2024-05-11 06:27:04', '2024-05-11 06:27:04'),
(91, 'faq.element', '{\"question\":\"How much money do I need to invest in real estate?\",\"answer\":\"The amount of money needed depends on various factors, including the type of property, its location, market conditions, financing options, and your investment goals. You can invest directly or indirectly through real estate investment trusts (REITs) or crowdfunding platforms, which may require lower initial investments.\"}', NULL, 'basic', '', '2024-05-11 06:27:15', '2024-05-11 06:27:15'),
(92, 'faq.element', '{\"question\":\"How much money do I need to invest in real estate?\",\"answer\":\"The amount of money needed depends on various factors, including the type of property, its location, market conditions, financing options, and your investment goals. You can invest directly or indirectly through real estate investment trusts (REITs) or crowdfunding platforms, which may require lower initial investments.\"}', NULL, 'basic', '', '2024-05-11 06:27:26', '2024-05-11 06:27:26'),
(93, 'feature.element', '{\"title\":\"Transparent Platform\",\"description\":\"Experience the confidence of a transparent platform for your peace of mind\",\"feature_icon\":\"<i class=\\\"lab la-gg-circle\\\"><\\/i>\"}', NULL, 'basic', '', '2024-05-11 06:28:34', '2024-05-11 06:28:34'),
(94, 'feature.element', '{\"title\":\"Passive Income\",\"description\":\"Explore opportunities for generating passive income streams\",\"feature_icon\":\"<i class=\\\"las la-cloud-meatball\\\"><\\/i>\"}', NULL, 'basic', '', '2024-05-11 06:28:47', '2024-05-11 06:28:47');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `created_at`, `updated_at`) VALUES
(95, 'feature.element', '{\"title\":\"Support\",\"description\":\"Count on our dedicated support team for prompt and reliable assistance\",\"feature_icon\":\"<i class=\\\"las la-headset\\\"><\\/i>\"}', NULL, 'basic', '', '2024-05-11 06:29:02', '2024-05-11 06:29:02'),
(96, 'featured_property.content', '{\"title\":\"Featured properties\",\"heading\":\"All Properties Spotlight\"}', NULL, 'basic', '', '2024-05-11 06:29:21', '2024-05-11 06:29:21'),
(97, 'footer.content', '{\"description\":\"RailVest offers a seamless avenue for establishing a cutting-edge investment platform without necessitating coding expertise within a short time.\"}', NULL, 'basic', '', '2024-05-11 06:29:37', '2024-05-11 06:29:37'),
(98, 'footer.element', '{\"social_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"social_link\":\"https:\\/\\/www.instagram.com\\/\"}', NULL, 'basic', '', '2024-05-11 06:29:48', '2024-05-11 06:29:48'),
(99, 'footer.element', '{\"social_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"social_link\":\"https:\\/\\/www.facebook.com\\/\"}', NULL, 'basic', '', '2024-05-11 06:30:02', '2024-05-11 06:30:02'),
(100, 'footer.element', '{\"social_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"social_link\":\"https:\\/\\/twitter.com\\/\"}', NULL, 'basic', '', '2024-05-11 06:30:19', '2024-05-11 06:30:19'),
(101, 'footer.element', '{\"social_icon\":\"<i class=\\\"fab fa-linkedin\\\"><\\/i>\",\"social_link\":\"https:\\/\\/www.linkedin.com\\/\"}', NULL, 'basic', '', '2024-05-11 06:30:30', '2024-05-11 06:30:30'),
(102, 'kyc_instruction.content', '{\"kyc_required\":\"Complete KYC to unlock the full potential of our platform! KYC helps us verify your identity and keep things secure. It is quick and easy just follow the on-screen instructions. Get started with KYC verification now!\",\"kyc_pending\":\"Your KYC verification is being reviewed. We might need some additional information. You will get an email update soon. In the meantime, explore our platform with limited features.\",\"kyc_reject\":\"We regret to inform you that the Know Your Customer (KYC) information provided has been reviewed and unfortunately, it has not met our verification standards.\"}', NULL, 'basic', '', '2024-05-11 06:30:46', '2024-05-18 03:48:38'),
(103, 'latest_property.content', '{\"title\":\"Latest properties\",\"heading\":\"Explore Latest Properties\"}', NULL, 'basic', '', '2024-05-11 06:30:59', '2024-05-11 06:30:59'),
(104, 'login.content', '{\"heading\":\"Account Login\"}', NULL, 'basic', '', '2024-05-11 06:31:09', '2024-05-11 06:31:09'),
(105, 'referral.content', '{\"title\":\"Refer & Enjoy the Bonus\",\"description\":\"You\'ll get commission against your referral\'s activities. Level has been decided by the RealVest authority. If you reach the level, you\'ll get commission.\"}', NULL, 'basic', '', '2024-05-11 06:32:15', '2024-05-11 06:32:15'),
(106, 'register.content', '{\"heading\":\"Create an Account\"}', NULL, 'basic', '', '2024-05-11 06:32:26', '2024-05-11 06:32:26'),
(107, 'subscribe.content', '{\"heading\":\"Subscribe for updates\",\"subheading\":\"Stay on top of the latest blog posts, news and announcements\"}', NULL, 'basic', '', '2024-05-11 06:32:39', '2024-05-11 06:32:39'),
(108, 'testimonial.content', '{\"title\":\"Investors trust us\",\"heading\":\"Trusted by Over 3000+ Investors\"}', NULL, 'basic', '', '2024-05-11 06:32:53', '2024-05-11 06:32:53'),
(109, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Sarah Johnson\",\"address\":\"Cir. Shiloh, Hawaii\",\"review\":\"Exceptional service! The team goes above and beyond to ensure their clients\' success. From start to finish, they provided thorough guidance and support, making my investment journey smooth and rewarding.\",\"image\":\"663f6593cb4dc1715430803.png\"}', NULL, 'basic', '', '2024-05-11 06:33:23', '2024-05-11 06:33:23'),
(110, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Michael Thompson\",\"address\":\"Berlin\",\"review\":\"I\'ve tried various investment platforms, but none compare to the professionalism and expertise offered here. Their attention to detail and commitment to client satisfaction sets them apart. Highly recommend!\",\"image\":\"663f65b041f531715430832.png\"}', NULL, 'basic', '', '2024-05-11 06:33:52', '2024-05-11 06:33:52'),
(111, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Emily Hughes\",\"address\":\"Australia\",\"review\":\"Five stars all the way! This platform helped me diversify my investment portfolio with real estate, and I couldn\'t be happier with the results. Trustworthy, knowledgeable, and always available to address any concerns.\",\"image\":\"663f65cc890b01715430860.png\"}', NULL, 'basic', '', '2024-05-11 06:34:20', '2024-05-11 06:34:20'),
(112, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Rachel Lewis\",\"address\":\"Paris\",\"review\":\"I\'ve been with this platform for years, and they consistently deliver exceptional results. Their transparent communication and strategic investment advice have earned my trust and loyalty.\",\"image\":\"663f65ea68f9b1715430890.png\"}', NULL, 'basic', '', '2024-05-11 06:34:50', '2024-05-11 06:34:50'),
(113, 'faq.content', '{\"title\":\"All Your Concern\"}', NULL, 'basic', '', '2024-05-15 04:34:05', '2024-05-15 04:34:05');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` int UNSIGNED NOT NULL DEFAULT '0',
  `code` int DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `supported_currencies` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `crypto` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `image`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 101, 'Paypal', 'Paypal', '663a38d7b455d1715091671.png', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-owud61543012@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2024-05-07 08:21:11'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', '663a3920e30a31715091744.png', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"hR26aw02Q1eEeUPSIfuwNypXX\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2024-05-07 08:22:24'),
(3, 0, 103, 'Stripe Hosted', 'Stripe', '663a39861cb9d1715091846.png', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2024-05-07 08:24:06'),
(4, 0, 104, 'Skrill', 'Skrill', '663a39494c4a91715091785.png', 1, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2024-05-07 08:23:05'),
(5, 0, 105, 'PayTM', 'Paytm', '663a390f601191715091727.png', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"bKMfNxPPf_QdZppa\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2024-05-07 08:22:07'),
(6, 0, 106, 'Payeer', 'Payeer', '663a38c9e2e931715091657.png', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}', NULL, '2019-09-14 13:14:22', '2024-05-07 08:20:57'),
(7, 0, 107, 'PayStack', 'Paystack', '663a38fc814e91715091708.png', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2024-05-07 08:21:48'),
(9, 0, 109, 'Flutterwave', 'Flutterwave', '663a36c2c34d61715091138.png', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2024-05-07 08:12:18'),
(10, 0, 110, 'RazorPay', 'Razorpay', '663a393a527831715091770.png', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_test_kiOtejPbRZU90E\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"osRDebzEqbsE1kbyQJ4y0re7\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2024-05-07 08:22:50'),
(11, 0, 111, 'Stripe Storefront', 'StripeJs', '663a3995417171715091861.png', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2024-05-07 08:24:21'),
(12, 0, 112, 'Instamojo', 'Instamojo', '663a384d54a111715091533.png', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_2241633c3bc44a3de84a3b33969\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"test_279f083f7bebefd35217feef22d\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2024-05-07 08:18:53'),
(13, 0, 501, 'Blockchain', 'Blockchain', '663a35efd0c311715090927.png', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"55529946-05ca-48ff-8710-f279d86b1cc5\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2024-05-07 08:08:47'),
(15, 0, 503, 'CoinPayments', 'Coinpayments', '663a36a8d8e1d1715091112.png', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"---------------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"---------------------\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2024-05-07 08:11:52'),
(16, 0, 504, 'CoinPayments Fiat', 'CoinpaymentsFiat', '663a36b7b841a1715091127.png', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"6515561\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2024-05-07 08:12:07'),
(17, 0, 505, 'Coingate', 'Coingate', '663a368e753381715091086.png', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"6354mwVCEw5kHzRJ6thbGo-N\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2024-05-07 08:11:26'),
(18, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', '663a367e46ae51715091070.png', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2024-05-07 08:11:10'),
(24, 0, 113, 'Paypal Express', 'PaypalSdk', '663a38ed101a61715091693.png', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2024-05-07 08:21:33'),
(25, 0, 114, 'Stripe Checkout', 'StripeV3', '663a39afb519f1715091887.png', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2024-05-07 08:24:47'),
(27, 0, 115, 'Mollie', 'Mollie', '663a387ec69371715091582.png', 1, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"vi@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2024-05-07 08:19:42'),
(30, 0, 116, 'Cashmaal', 'Cashmaal', '663a361b16bd11715090971.png', 1, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.Cashmaal\"}}', NULL, NULL, '2024-05-07 08:09:31'),
(36, 0, 119, 'Mercado Pago', 'MercadoPago', '663a386c714a91715091564.png', 1, '{\"access_token\":{\"title\":\"Access Token\",\"global\":true,\"value\":\"APP_USR-7924565816849832-082312-21941521997fab717db925cf1ea2c190-1071840315\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2024-05-07 08:19:24'),
(37, 0, 120, 'Authorize.net', 'Authorize', '663a35b9ca5991715090873.png', 1, '{\"login_id\":{\"title\":\"Login ID\",\"global\":true,\"value\":\"59e4P9DBcZv\"},\"transaction_key\":{\"title\":\"Transaction Key\",\"global\":true,\"value\":\"47x47TJyLw2E7DbR\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2024-05-07 08:07:53'),
(46, 0, 121, 'NMI', 'NMI', '663a3897754cf1715091607.png', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"2F822Rw39fx762MaV7Yy86jXGTC7sCDy\"}}', '{\"AED\":\"AED\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"RUB\":\"RUB\",\"SEC\":\"SEC\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2024-05-07 08:20:07'),
(50, 0, 507, 'BTCPay', 'BTCPay', '663a35cd25a8d1715090893.png', 1, '{\"store_id\":{\"title\":\"Store Id\",\"global\":true,\"value\":\"HsqFVTXSeUFJu7caoYZc3CTnP8g5LErVdHhEXPVTheHf\"},\"api_key\":{\"title\":\"Api Key\",\"global\":true,\"value\":\"4436bd706f99efae69305e7c4eff4780de1335ce\"},\"server_name\":{\"title\":\"Server Name\",\"global\":true,\"value\":\"https:\\/\\/testnet.demo.btcpayserver.org\"},\"secret_code\":{\"title\":\"Secret Code\",\"global\":true,\"value\":\"SUCdqPn9CDkY7RmJHfpQVHP2Lf2\"}}', '{\"BTC\":\"Bitcoin\",\"LTC\":\"Litecoin\"}', 1, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.BTCPay\"}}', NULL, NULL, '2024-05-07 08:08:13'),
(51, 0, 508, 'Now payments hosted', 'NowPaymentsHosted', '663a38b8d57a81715091640.png', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"--------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"------------\"}}', '{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}', 1, '', NULL, NULL, '2024-05-07 08:20:40'),
(52, 0, 509, 'Now payments checkout', 'NowPaymentsCheckout', '663a38a59d2541715091621.png', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"---------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 1, '', NULL, NULL, '2024-05-07 08:20:21'),
(53, 0, 122, '2Checkout', 'TwoCheckout', '663a39b8e64b91715091896.png', 1, '{\"merchant_code\":{\"title\":\"Merchant Code\",\"global\":true,\"value\":\"253248016872\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"eQM)ID@&vG84u!O*g[p+\"}}', '{\"AFN\": \"AFN\",\"ALL\": \"ALL\",\"DZD\": \"DZD\",\"ARS\": \"ARS\",\"AUD\": \"AUD\",\"AZN\": \"AZN\",\"BSD\": \"BSD\",\"BDT\": \"BDT\",\"BBD\": \"BBD\",\"BZD\": \"BZD\",\"BMD\": \"BMD\",\"BOB\": \"BOB\",\"BWP\": \"BWP\",\"BRL\": \"BRL\",\"GBP\": \"GBP\",\"BND\": \"BND\",\"BGN\": \"BGN\",\"CAD\": \"CAD\",\"CLP\": \"CLP\",\"CNY\": \"CNY\",\"COP\": \"COP\",\"CRC\": \"CRC\",\"HRK\": \"HRK\",\"CZK\": \"CZK\",\"DKK\": \"DKK\",\"DOP\": \"DOP\",\"XCD\": \"XCD\",\"EGP\": \"EGP\",\"EUR\": \"EUR\",\"FJD\": \"FJD\",\"GTQ\": \"GTQ\",\"HKD\": \"HKD\",\"HNL\": \"HNL\",\"HUF\": \"HUF\",\"INR\": \"INR\",\"IDR\": \"IDR\",\"ILS\": \"ILS\",\"JMD\": \"JMD\",\"JPY\": \"JPY\",\"KZT\": \"KZT\",\"KES\": \"KES\",\"LAK\": \"LAK\",\"MMK\": \"MMK\",\"LBP\": \"LBP\",\"LRD\": \"LRD\",\"MOP\": \"MOP\",\"MYR\": \"MYR\",\"MVR\": \"MVR\",\"MRO\": \"MRO\",\"MUR\": \"MUR\",\"MXN\": \"MXN\",\"MAD\": \"MAD\",\"NPR\": \"NPR\",\"TWD\": \"TWD\",\"NZD\": \"NZD\",\"NIO\": \"NIO\",\"NOK\": \"NOK\",\"PKR\": \"PKR\",\"PGK\": \"PGK\",\"PEN\": \"PEN\",\"PHP\": \"PHP\",\"PLN\": \"PLN\",\"QAR\": \"QAR\",\"RON\": \"RON\",\"RUB\": \"RUB\",\"WST\": \"WST\",\"SAR\": \"SAR\",\"SCR\": \"SCR\",\"SGD\": \"SGD\",\"SBD\": \"SBD\",\"ZAR\": \"ZAR\",\"KRW\": \"KRW\",\"LKR\": \"LKR\",\"SEK\": \"SEK\",\"CHF\": \"CHF\",\"SYP\": \"SYP\",\"THB\": \"THB\",\"TOP\": \"TOP\",\"TTD\": \"TTD\",\"TRY\": \"TRY\",\"UAH\": \"UAH\",\"AED\": \"AED\",\"USD\": \"USD\",\"VUV\": \"VUV\",\"VND\": \"VND\",\"XOF\": \"XOF\",\"YER\": \"YER\"}', 0, '{\"approved_url\":{\"title\": \"Approved URL\",\"value\":\"ipn.TwoCheckout\"}}', NULL, NULL, '2024-05-07 08:24:56'),
(54, 0, 123, 'Checkout', 'Checkout', '663a3628733351715090984.png', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"------\"},\"public_key\":{\"title\":\"PUBLIC KEY\",\"global\":true,\"value\":\"------\"},\"processing_channel_id\":{\"title\":\"PROCESSING CHANNEL\",\"global\":true,\"value\":\"------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"AUD\":\"AUD\",\"CAN\":\"CAN\",\"CHF\":\"CHF\",\"SGD\":\"SGD\",\"JPY\":\"JPY\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2024-05-07 08:09:44'),
(56, 0, 510, 'Binance', 'Binance', '663a35db4fd621715090907.png', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"tsu3tjiq0oqfbtmlbevoeraxhfbp3brejnm9txhjxcp4to29ujvakvfl1ibsn3ja\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"jzngq4t04ltw8d4iqpi7admfl8tvnpehxnmi34id1zvfaenbwwvsvw7llw3zdko8\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"231129033\"}}', '{\"BTC\":\"Bitcoin\",\"USD\":\"USD\",\"BNB\":\"BNB\"}', 1, '{\"cron\":{\"title\": \"Cron Job URL\",\"value\":\"ipn.Binance\"}}', NULL, NULL, '2024-05-07 08:08:27'),
(57, 0, 124, 'SslCommerz', 'SslCommerz', '663a397a70c571715091834.png', 1, '{\"store_id\":{\"title\":\"Store ID\",\"global\":true,\"value\":\"---------\"},\"store_password\":{\"title\":\"Store Password\",\"global\":true,\"value\":\"----------\"}}', '{\"BDT\":\"BDT\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"SGD\":\"SGD\",\"INR\":\"INR\",\"MYR\":\"MYR\"}', 0, NULL, NULL, NULL, '2024-05-07 08:23:54'),
(58, 0, 125, 'Aamarpay', 'Aamarpay', '663a34d5d1dfc1715090645.png', 1, '{\"store_id\":{\"title\":\"Store ID\",\"global\":true,\"value\":\"---------\"},\"signature_key\":{\"title\":\"Signature Key\",\"global\":true,\"value\":\"----------\"}}', '{\"BDT\":\"BDT\"}', 0, NULL, NULL, NULL, '2024-05-07 08:04:05');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_code` int DEFAULT NULL,
  `gateway_alias` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `max_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `percent_charge` decimal(5,2) NOT NULL DEFAULT '0.00',
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `gateway_parameter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `site_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'email configuration',
  `sms_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `firebase_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `global_shortcodes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `kv` tinyint(1) NOT NULL DEFAULT '0',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'sms notification, 0 - dont send, 1 - send',
  `pn` tinyint(1) NOT NULL DEFAULT '1',
  `force_ssl` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT '0',
  `secure_password` tinyint(1) NOT NULL DEFAULT '0',
  `agree` tinyint(1) NOT NULL DEFAULT '0',
  `multi_language` tinyint(1) NOT NULL DEFAULT '1',
  `registration` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socialite_credentials` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contract_shortcodes` text COLLATE utf8mb4_unicode_ci,
  `contract_template` longtext COLLATE utf8mb4_unicode_ci,
  `last_cron` datetime DEFAULT NULL,
  `available_version` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_customized` tinyint(1) NOT NULL DEFAULT '0',
  `paginate_number` int NOT NULL DEFAULT '0',
  `currency_format` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>Both\r\n2=>Text Only\r\n3=>Symbol Only',
  `deposit_commission` tinyint(1) NOT NULL DEFAULT '1',
  `invest_commission` tinyint(1) NOT NULL DEFAULT '1',
  `profit_commission` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_from_name`, `email_template`, `sms_template`, `sms_from`, `push_title`, `push_template`, `base_color`, `mail_config`, `sms_config`, `firebase_config`, `global_shortcodes`, `kv`, `ev`, `en`, `sv`, `sn`, `pn`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `multi_language`, `registration`, `active_template`, `socialite_credentials`, `contract_shortcodes`, `contract_template`, `last_cron`, `available_version`, `system_customized`, `paginate_number`, `currency_format`, `deposit_commission`, `invest_commission`, `profit_commission`, `created_at`, `updated_at`) VALUES
(1, 'RealVest', 'USD', '$', 'info@viserlab.com', '{{site_name}}', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.ibb.co/rw2fTRM/logo-dark.png\" width=\"220\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello {{fullname}} ({{username}})</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2024 <a href=\"#\">{{site_name}}</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'hi {{fullname}} ({{username}}), {{message}}', '{{site_name}}', '{{site_name}}', 'hi {{fullname}} ({{username}}), {{message}}', 'FF6600', '{\"name\":\"php\"}', '{\"name\":\"clickatell\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname.com\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\"apiKey\":\"----------\",\"authDomain\":\"-------------\",\"projectId\":\"------------\",\"storageBucket\":\"-----------\",\"messagingSenderId\":\"------------\",\"appId\":\"--------------\",\"measurementId\":\"-------------\",\"serverKey\":\"-----------------\"}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 'basic', '{\"google\":{\"client_id\":\"------------\",\"client_secret\":\"-------------\",\"status\":1},\"facebook\":{\"client_id\":\"------\",\"client_secret\":\"------\",\"status\":1},\"linkedin\":{\"client_id\":\"-----\",\"client_secret\":\"-----\",\"status\":1}}', '{\n \"buyer_name\": \"Investor full name\",\n \"buyer_address\": \"Investor full address\",\n \"buyer_contact_number\": \"Investor contact number\",\n \"buyer_email\": \"Investor email address\",\n \"property_title\": \"Property name\",\n \"profit_schedule\": \"Profit schedule with profit schedule period and repeat times\",\n \"profit_back\": \"Time for investor start to get profit\",\n \"total_invest_amount\": \"Amount invested by user\",\n \"investment_id\": \"Investment Id\",\n \"investment_date\": \"Date of investment\",\n \"signature\": \"Investor signature\",\"logo\":\"Site logo\"\n}\n', '<meta charset=\"UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<title> PDF </title>\n<style>\n    @import url(\'https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap\');\n\n    :root {\n        --black: 0, 0, 0;\n        --text-color: 107, 107, 107;\n        --white: 255, 255, 255;\n        --bg-color: 250, 250, 252;\n        --base: 255, 193, 7;\n        --primary: 0, 102, 255;\n        --info: 0, 163, 204;\n        --success: 59, 191, 0;\n        --danger: 230, 57, 70;\n        --warning: 255, 204, 0;\n    }\n\n    @page {\n        /* size: 8.27in 11.7in; */\n        size: 49.625rem 70.188rem;\n    }\n\n    .badge {\n        background-color: var(--red);\n        border-radius: 6px;\n        padding: 6px 10px;\n        font-weight: 500;\n        position: relative;\n        text-align: center;\n        font-size: 0.75rem;\n    }\n\n    .badge--base {\n        background-color: rgb(var(--base), .15);\n        color: rgb(var(--base));\n    }\n\n    .badge--primary {\n        background-color: rgb(var(--primary), .15);\n        color: rgb(var(--primary));\n    }\n\n    .badge--success {\n        background-color: rgb(var(--success), .15);\n        color: rgb(var(--success));\n    }\n\n    .badge--danger {\n        background-color: rgb(var(--danger), .15);\n        color: rgb(var(--danger));\n    }\n\n    .badge--warning {\n        background-color: rgb(var(--warning), .15);\n        color: rgb(var(--warning));\n    }\n\n    .badge--info {\n        background-color: rgb(var(--info), .15);\n        color: rgb(var(--info));\n    }\n\n    .fs-10 {\n        font-size: 10px;\n    }\n\n    .fs-11 {\n        font-size: 11px;\n    }\n\n    .fs-12 {\n        font-size: 12px;\n    }\n\n    .fs-13 {\n        font-size: 13px;\n    }\n\n    .fs-14 {\n        font-size: 14px;\n    }\n\n    .fs-15 {\n        font-size: 15px;\n    }\n\n    .fs-16 {\n        font-size: 16px;\n    }\n\n    .fs-17 {\n        font-size: 17px;\n    }\n\n    .fs-18 {\n        font-size: 18px;\n    }\n\n    .fs-19 {\n        font-size: 19px;\n    }\n\n    .fs-20 {\n        font-size: 17px;\n    }\n\n    .fw-bold {\n        font-weight: 700;\n    }\n\n    .fw-semibold {\n        font-weight: 600;\n    }\n\n    .fw-medium {\n        font-weight: 500;\n    }\n\n    .text-uppercase {\n        text-transform: uppercase;\n    }\n\n    .text-start {\n        text-align: left;\n    }\n\n    .text-end {\n        text-align: right;\n    }\n\n    .text-center {\n        text-align: center;\n    }\n\n    .d-block {\n        display: block;\n    }\n\n    .mt-0 {\n        margin-top: 0;\n    }\n\n    .ms-auto {\n        margin-left: auto;\n    }\n\n    .me-auto {\n        margin-right: auto;\n    }\n\n    .mx-auto {\n        margin: 0 auto;\n    }\n\n    .m-0 {\n        margin: 0;\n    }\n\n    .mt-3 {\n        margin-top: 16px;\n    }\n\n    .mt-4 {\n        margin-top: 24px;\n    }\n\n    .mt-5 {\n        margin-top: 32px;\n    }\n\n    .mb-3 {\n        margin-bottom: 16px;\n    }\n\n    .mb-4 {\n        margin-bottom: 24px;\n    }\n\n    .mb-5 {\n        margin-bottom: 32px;\n    }\n\n    * {\n        padding: 0;\n        margin: 0;\n    }\n\n    h1,\n    h2,\n    h3,\n    h4,\n    h5,\n    h6 {\n        font-weight: 600;\n        color: rgb(var(--black));\n    }\n\n    h1 {\n        font-size: 50px;\n    }\n\n    h2 {\n        font-size: 40px;\n    }\n\n    h3 {\n        font-size: 32px;\n    }\n\n    h4 {\n        font-size: 24px;\n    }\n\n    h5 {\n        font-size: 20px;\n    }\n\n    h6 {\n        font-size: 18px;\n    }\n\n    .font {\n        font-family: \"Inter\", sans-serif;\n    }\n\n    .custom--container {\n        /* width: 7.27in; */\n        margin: 0 auto;\n    }\n\n    @media (max-width:1399px) {\n        .custom--container {\n            max-width: 1020px;\n        }\n    }\n\n    @media (max-width:1199px) {\n        .custom--container {\n            max-width: 900px;\n        }\n    }\n\n    @media (max-width:991px) {\n        .custom--container {\n            max-width: 740px;\n        }\n    }\n\n    @media (max-width:767px) {\n        .custom--container {\n            max-width: 550px;\n        }\n    }\n\n    @media (max-width:575px) {\n        .custom--container {\n            max-width: 550px;\n            padding: 0 15px;\n        }\n    }\n\n    .table-wrapper__title {\n        margin-bottom: 20px;\n    }\n\n    .table-wrapper {\n        margin-top: 30px;\n    }\n\n    table tbody tr {\n        width: 100%;\n    }\n\n    table {\n        margin: 0;\n        border-collapse: collapse;\n        border-collapse: separate;\n        border-spacing: 0px 0px;\n        width: 100%;\n    }\n\n    .header table {\n        width: 100%;\n        border-top: 7px solid rgb(var(--base));\n    }\n\n    .header table tbody tr td {\n        background-color: rgb(var(--black));\n        color: rgb(var(--white));\n        padding: 20px 30px;\n    }\n\n    /* .header table tbody tr td:last-child {\n        background-color: rgb(var(--base), .5);\n        border: 5px solid rgb(var(--black));\n    } */\n    .table-thumb {\n        margin-left: auto;\n    }\n\n    .table-thumb img {\n        max-width: 200px;\n    }\n\n    .main-wrapper {\n        /* border: 1px solid rgb(var(--black), .2); */\n    }\n\n    .main-wrapper__content {\n        padding: 60px 40px;\n    }\n\n    @media (max-width:575px) {\n        .main-wrapper__content {\n            padding: 30px;\n        }\n\n        .table-thumb img {\n            max-width: 120px;\n        }\n\n        .table-title {\n            font-size: 24px;\n        }\n\n        .header table tbody tr td {\n            padding: 20px;\n        }\n    }\n\n    .table-wrapper table tbody tr .table-title {\n        color: rgb(var(--black));\n        font-weight: 600;\n        font-size: 18px;\n    }\n\n    .table-wrapper table tbody tr td:first-child {\n        background-color: rgb(var(--black), .09);\n        font-weight: 600;\n        padding: 10px;\n        height: 100%;\n    }\n\n    .table-wrapper table tbody tr .table-text {\n        color: rgb(var(--black), .7);\n    }\n\n    .table-wrapper tr td:last-child {\n        background-color: rgb(var(--black), .04);\n        padding: 10px;\n        height: 100%;\n        font-size: 18px;\n    }\n\n    .footer {\n        margin-top: 50px;\n        padding: 30px;\n        background-color: rgb(var(--black), .09);\n        border-bottom: 7px solid rgb(var(--base));\n    }\n\n    .footer-title {\n        margin-bottom: 10px;\n        font-weight: 600;\n    }\n\n    .footer-table tbody tr .footer-table__icon img {\n        max-width: 40px;\n    }\n\n    .footer-table {\n        margin-top: 20px;\n    }\n\n    .table-title {\n        color: rgb(var(--white));\n    }\n\n    .item__desc {\n        margin-top: 8px;\n        font-size: 18px;\n        font-weight: 500;\n    }\n\n    .item {\n        margin-bottom: 40px;\n    }\n\n    .item:last-child {\n        margin-bottom: 0px;\n    }\n\n    .table-inner {\n        background-color: rgb(var(--base));\n        border-radius: 25px;\n        overflow: hidden;\n        padding: 0;\n        border: 0;\n        padding-right: 20px;\n    }\n\n    .table-inner tr,\n    .table-inner tr td {\n        padding: 0;\n        border-radius: 0;\n    }\n\n    .table-inner .number {\n        padding: 15px 35px;\n        display: inline-block;\n        border-radius: 24px;\n        background-color: black;\n        color: white;\n\n    }\n\n    .bar {\n        height: 4px;\n        width: 32px;\n        background-color: black;\n        display: block;\n    }\n\n    .table-inner .title {\n        font-size: 24px;\n        padding-left: 10px;\n    }\n\n    .main-content__border {\n        border-bottom: 7px solid rgb(var(--base));\n    }\n\n    .main-content {\n        padding: 0px 40px;\n    }\n\n    .order-list {\n        padding: 0 30px;\n        margin-top: 15px;\n    }\n\n    .order-list__item {\n        margin-bottom: 8px;\n    }\n\n    .order-list__item:last-child {\n        margin-bottom: 0;\n    }\n\n    .order-list__item .title {\n        color: hsl(var(--black));\n        font-weight: 700;\n    }\n\n    .main-content__top {\n        margin-bottom: 40px;\n    }\n\n    .main-content__top .top-title {\n        padding-bottom: 10px;\n        border-bottom: 1px solid rgb(var(--black), .1);\n        margin-bottom: 25px;\n    }\n\n    .main-content__title {\n        text-align: center;\n        margin-bottom: 35px;\n        margin-top: 50px;\n    }\n\n    .content__desc .title {\n        color: rgb(var(--black));\n        font-weight: 600;\n    }\n\n    .content__desc {\n        margin-bottom: 10px;\n    }\n\n    .content__desc:last-child {\n        margin-bottom: 0;\n    }\n\n    .signature-table {\n        margin-top: 40px;\n    }\n\n    table tbody tr {\n        width: 100%;\n    }\n\n    .header table tbody tr td {\n        background-color: rgb(var(--black));\n        color: rgb(var(--white));\n        padding: 20px 30px;\n    }\n\n    .signature-list {\n        text-align: center;\n        max-width: 260px;\n        margin: 0 auto;\n    }\n\n    .signature-list__content {\n        border-top: 1px solid rgb(var(--black));\n        padding-top: 20px;\n        margin-top: 20px;\n    }\n\n    .signature-list__name {\n        margin-bottom: 10px;\n    }\n\n    .signature-list__thumb {\n        max-width: 130px;\n        margin: 0 auto;\n    }\n\n    .signature-list__thumb img {\n        width: 100%;\n    }\n\n    .signature-list__title {\n        margin-bottom: 30px;\n    }\n\n    .document-table {\n        background: rgb(var(--base));\n        border-radius: 100px;\n        padding: 35px 25px;\n        margin-top: 150px;\n    }\n\n    .document-table__title {\n        font-size: 28px;\n        font-weight: 700;\n    }\n\n    .document-table__text {\n        font-style: italic;\n        line-height: 1.3;\n        font-size: 18px;\n    }\n</style>\n\n\n\n<div class=\"custom--container\">\n    <div class=\"header\">\n        <table>\n            <tbody>\n                <tr>\n                    <td style=\"width: 80%\">\n                        <h2 class=\"table-title\">Investment Agreement\n                        </h2>\n                    </td>\n                    <td style=\"width: 20%\">\n                        <div class=\"table-thumb\">\n                            <img src=\"{{logo}}\" alt=\"\">\n                        </div>\n                    </td>\n                </tr>\n            </tbody>\n        </table>\n    </div>\n    <div class=\"main-wrapper\">\n        <div class=\"main-wrapper__content\">\n            <p class=\"text\">\n                This Real Estate Investment Agreement is entered into on {{investment_date}}\n                between {{buyer_name}} and {{site_name}}. The purpose of this\n                Agreement is to establish the terms and conditions under which the Investor will invest in the\n                property known as {{property_title}}. The Agreement specifies the investment amount, profit-sharing\n                schedule, and the rights and obligations of both parties.\n            </p>\n            <p class=\"text\">\n                The Investor agrees to provide financial capital in the amount of\n                {{currency_symbol}}{{total_invest_amount}} in exchange for a potential profit, as outlined in the\n                {{profit_schedule}} and subject to market conditions. The Company agrees to manage the investment\n                and ensure compliance with applicable laws and regulations.\n            </p>\n            <p class=\"text\">\n                This Agreement is legally binding and serves to protect both parties by ensuring that each party\n                upholds their respective duties and responsibilities. It outlines the payment schedules, profit\n                distribution, dispute resolution processes, and other critical investment terms.\n            </p>\n            <p class=\"text\">\n                By entering into this Agreement, both parties acknowledge that they have read, understood, and\n                agreed to the terms contained herein, with the understanding that the success of the investment is\n                contingent upon market performance, as well as the adherence to this Agreement by both the Investor\n                and the Company.\n            </p><p class=\"text\"><br></p>\n\n            <div>\n    <h3 style=\"font-size: 24px; font-weight: bold; margin-bottom: 15px;\">Buyer</h3>\n    <table style=\"width: 100%; border-collapse: collapse; font-family: Arial, sans-serif;\">\n        <tbody>\n            <tr>\n                <td style=\"padding: 8px; border: 1px solid #000; background-color: rgb(var(--base)); font-weight: bold;\">Name</td>\n                <td style=\"padding: 8px; border: 1px solid #000;\">{{buyer_name}}</td>\n            </tr>\n            <tr>\n                <td style=\"padding: 8px; border: 1px solid #000; background-color: rgb(var(--base)); font-weight: bold;\">Address</td>\n                <td style=\"padding: 8px; border: 1px solid #000;\">{{buyer_address}}</td>\n            </tr>\n            <tr>\n                <td style=\"padding: 8px; border: 1px solid #000; background-color: rgb(var(--base)); font-weight: bold;\">Phone</td>\n                <td style=\"padding: 8px; border: 1px solid #000;\">{{buyer_contact_number}}</td>\n            </tr>\n            <tr>\n                <td style=\"padding: 8px; border: 1px solid #000; background-color: rgb(var(--base)); font-weight: bold;\">Email</td>\n                <td style=\"padding: 8px; border: 1px solid #000;\">{{buyer_email}}</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n\n        </div>\n\n\n        <div class=\"main-content\">\n            <div class=\"item\">\n                <table class=\"table-inner\">\n                    <tbody>\n                        <tr>\n                            <td style=\"width: 7%\"> <span class=\"number\">1</span> </td>\n                            <td style=\"width: 89%\">\n                                <p class=\"title\">Investment Details</p>\n                            </td>\n                            <td style=\"width: 4%\"> <span class=\"bar\"></span> </td>\n                        </tr>\n                    </tbody>\n                </table>\n                <p class=\"item__desc\">\n                    This Investment Agreement outlines the specific terms and conditions governing the investment made by the Buyer in association with {{site_name}}. The agreement is effective as of {{investment_date}} and is binding upon both parties.\n                </p>\n                <ul class=\"order-list\">\n                    <li class=\"order-list__item\"> <span class=\"title\">Property Title: </span>\n                        <span class=\"text\">{{property_title}}</span>\n                    </li>\n                    <li class=\"order-list__item\"> <span class=\"title\">Investment ID: </span>\n                        <span class=\"text\">{{investment_id}}</span>\n                    </li>\n                    <li class=\"order-list__item\"> <span class=\"title\">Total Investment Amount: </span>\n                        <span class=\"text\">{{currency_symbol}}{{total_invest_amount}} (in {{site_currency}})</span>\n                    </li>\n                    <li class=\"order-list__item\"> <span class=\"title\">Profit Schedule: </span>\n                        <span class=\"text\">{{profit_schedule}} </span>\n                    </li>\n                    <li class=\"order-list__item\"> <span class=\"title\">Expected Profit Back: </span><span class=\"text\">{{profit_back}}</span>\n                    </li>\n                    <li class=\"order-list__item\"> <span class=\"title\">Investment Date: </span>\n                        <span class=\"text\">{{investment_date}}</span>\n                    </li>\n                </ul>\n            </div>\n            <div class=\"item\">\n                <table class=\"table-inner\">\n                    <tbody>\n                        <tr>\n                            <td style=\"width: 7%\"> <span class=\"number\">2</span> </td>\n                            <td style=\"width: 89%\">\n                                <p class=\"title\">Terms &amp; Conditions:</p>\n                            </td>\n                            <td style=\"width: 4%\"> <span class=\"bar\"></span> </td>\n                        </tr>\n                    </tbody>\n                </table>\n                <p class=\"item__desc\">\n                    </p><div><font size=\"5\"><b>Investment Commitment:</b></font></div>\n                    <div><br></div><div>Investment Amount:&nbsp;</div><div>The Buyer agrees to invest a total of {{currency_symbol}}{{total_invest_amount}} in the property titled {{property_title}}. This amount will be allocated as specified in the investment plan.</div><div>Payment: The investment amount shall be paid by the Buyer to the Seller within X days of the execution of this agreement. Payments should be made via [specified payment method] to the account details provided by the Seller.</div><div>Profit Distribution:</div><div><br></div><div>Profit Schedule: Profits from the investment will be distributed according to the agreed schedule of {{profit_schedule}}. For example, profits might be distributed monthly, quarterly, or annually.</div><div>Profit Calculation: Profits will be calculated based on the net revenue generated by the investment, after deducting all associated costs, fees, and expenses.</div><div>Payment of Profits: Profit payments will be made to the Buyer within X days after the end of each profit distribution period.</div><div>Risk Acknowledgment:</div><div><br></div><div>Market Risk: The Buyer acknowledges that real estate investments are subject to market risks, including fluctuations in property value and rental income. The Seller does not guarantee a specific rate of return.</div><div>Operational Risk: The Buyer understands that the investment\'s performance may be affected by operational issues, including but not limited to property management challenges, unforeseen maintenance, or changes in market conditions.</div><div>Duration and Withdrawal:</div><div><br></div><div>Investment Duration: The minimum duration of the investment is X years from {{investment_date}}. During this period, the Buyer agrees not to request any withdrawal of the investment principal.</div><div>Early Withdrawal: Early withdrawal of the investment may be permitted under exceptional circumstances, subject to a penalty of X% of the invested amount. Any early withdrawal request must be submitted in writing with X days notice.</div><div>Exit Strategy:</div><div><br></div><div>End of Investment Period: Upon reaching the end of the investment period, the Buyer may choose one of the following options:</div><div>Reinvestment: Reinvest the principal and/or profits into new projects or opportunities as offered by the Seller.</div><div>Withdrawal: Request the withdrawal of the principal amount and any accrued profits. The withdrawal will be processed within X days of receipt of the request.</div><div>Notice Requirement: A written notice of X days is required for any withdrawal or reinvestment request.</div><div>Legal and Tax Responsibilities:</div><div><br></div><div>Compliance: The Buyer is responsible for complying with all applicable local, state, and federal laws regarding their investment.</div><div>Taxation: The Buyer is responsible for all taxes related to their investment income, including profits and capital gains. The Seller will not withhold or pay any taxes on behalf of the Buyer.</div><div>Confidentiality:</div><div><br></div><div>Confidential Information: Both parties agree to keep confidential any proprietary information related to the investment, including financial details and business strategies.</div><div>Disclosure: Confidential information may only be disclosed with prior written consent from the other party or as required by law.</div><div>Dispute Resolution:</div><div><br></div><div>Arbitration: Any disputes arising out of or relating to this agreement shall be resolved through binding arbitration in accordance with the rules of [Arbitration Association].</div><div>Jurisdiction: The arbitration shall be conducted in [City, Country], and the laws of [Country] shall govern the agreement.</div><div>Termination:</div><div><br></div><div>Mutual Agreement: This agreement may be terminated by mutual written consent of both parties.</div><div>Default: The Seller may terminate the agreement if the Buyer fails to fulfill their financial obligations or breaches any term of the agreement. In such cases, the Buyer may forfeit any profits earned up to the point of termination.</div><div>Amendments:</div><div><br></div><div>Modifications: Any amendments or modifications to this agreement must be made in writing and signed by both parties.</div><div>Entire Agreement: This document constitutes the entire agreement between the parties and supersedes any prior agreements or understandings, whether written or oral.</div>\n                <p></p>\n            </div>\n            \n            <h4 class=\"main-content__title\"> [SIGNATURES FOLLOW PAGE] </h4>\n            <p class=\"content__desc\">\n            </p><div>By signing this Agreement, both parties affirm that they have read, understood, and agree to all terms and conditions specified herein. This Agreement represents the entire understanding between the parties and supersedes all prior negotiations, representations, or agreements, whether written or oral.</div><div><br></div><div>Both parties acknowledge that they have the authority to enter into this Agreement and that this Agreement constitutes a legally binding contract. Any amendments or modifications to this Agreement must be made in writing and signed by both parties.</div>\n            <p></p>\n\n            <table class=\"signature-table\">\n                <tbody>\n                    <tr>\n                        <td style=\"width: 50%\">\n                            <div class=\"signature-list\">\n                                <h6 class=\"signature-list__title\">Seller</h6>\n                                <div class=\"signature-list__thumb\">\n                                    <img src=\"\" alt=\"\">\n                                </div>\n                                <div class=\"signature-list__content\">\n                                    <h6 class=\"signature-list__name\"> RealVest </h6>\n                                </div>\n                            </div>\n                        </td>\n                        <td style=\"width: 50%\">\n                            <div class=\"signature-list\">\n                                <h6 class=\"signature-list__title\">Investor</h6>\n                                <div class=\"signature-list__thumb\">\n                                    <img src=\"{{signature}}\" alt=\"\">\n                                </div>\n                                <div class=\"signature-list__content\">\n                                    <h6 class=\"signature-list__name\">{{buyer_name}}</h6>\n                                </div>\n                            </div>\n                        </td>\n                    </tr>\n                </tbody>\n            </table>\n            <table class=\"document-table\">\n                <tbody>\n                    <tr>\n                        <td style=\"width: 30%\">\n                            <h5 class=\"document-table__title\">\n                                Disclaimer\n                            </h5>\n                        </td>\n                        <td style=\"width: 70%\">\n                        <p class=\"document-table__text\" style=\"text-align: left;\"><font size=\"3\">\n                        The information and terms provided in this agreement are for general informational purposes only and do not constitute financial or legal advice. The Buyer acknowledges that real estate investments involve risks, including but not limited to market fluctuations and changes in property values, and that past performance is not indicative of future results. The Seller makes no guarantees or representations regarding the future performance or profitability of the investment. It is recommended that the Buyer consult with a financial advisor or legal professional to fully understand the implications and risks associated with this investment.\n                    </font></p>\n                        </td>\n                    </tr>\n                </tbody>\n            </table>\n        </div>\n    </div>\n</div>', '2024-05-15 11:40:05', '0', 0, 20, 1, 0, 1, 1, NULL, '2024-05-27 00:49:31');

-- --------------------------------------------------------

--
-- Table structure for table `installments`
--

CREATE TABLE `installments` (
  `id` bigint UNSIGNED NOT NULL,
  `invest_id` int UNSIGNED NOT NULL DEFAULT '0',
  `paid_time` timestamp NULL DEFAULT NULL,
  `next_time` timestamp NULL DEFAULT NULL,
  `late_fee` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=Success,2=Pending\r\n',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invests`
--

CREATE TABLE `invests` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `property_id` int UNSIGNED NOT NULL DEFAULT '0',
  `investment_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total_invest_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `initial_invest_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `paid_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `due_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `per_installment_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `invest_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = running, 2 = completed',
  `next_profit_date` timestamp NULL DEFAULT NULL,
  `profit_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '3 = investment running, 1 = running, 2 = complete',
  `should_pay` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `total_profit` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `get_profit_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: not default language, 1: default language',
  `image` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `is_default`, `image`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, '660b94fa876ac1712035066.png', '2020-07-06 03:47:55', '2024-04-01 23:17:46');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_06_14_061757_create_support_tickets_table', 3),
(5, '2020_06_14_061837_create_support_messages_table', 3),
(6, '2020_06_14_061904_create_support_attachments_table', 3),
(7, '2020_06_14_062359_create_admins_table', 3),
(8, '2020_06_14_064604_create_transactions_table', 4),
(9, '2020_06_14_065247_create_general_settings_table', 5),
(12, '2014_10_12_100000_create_password_resets_table', 6),
(13, '2020_06_14_060541_create_user_logins_table', 6),
(14, '2020_06_14_071708_create_admin_password_resets_table', 7),
(15, '2020_09_14_053026_create_countries_table', 8),
(16, '2021_03_15_084721_create_admin_notifications_table', 9),
(17, '2016_06_01_000001_create_oauth_auth_codes_table', 10),
(18, '2016_06_01_000002_create_oauth_access_tokens_table', 10),
(19, '2016_06_01_000003_create_oauth_refresh_tokens_table', 10),
(20, '2016_06_01_000004_create_oauth_clients_table', 10),
(21, '2016_06_01_000005_create_oauth_personal_access_clients_table', 10),
(22, '2021_05_08_103925_create_sms_gateways_table', 11),
(23, '2019_12_14_000001_create_personal_access_tokens_table', 12),
(24, '2021_05_23_111859_create_email_logs_table', 13),
(25, '2022_02_26_061836_create_forms_table', 14),
(26, '2023_06_15_144908_create_update_logs_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sender` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_to` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notification_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_read` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `push_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shortcodes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_status` tinyint(1) NOT NULL DEFAULT '1',
  `email_sent_from_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent_from_address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_status` tinyint(1) NOT NULL DEFAULT '1',
  `sms_sent_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subject`, `push_title`, `email_body`, `sms_body`, `push_body`, `shortcodes`, `email_status`, `email_sent_from_name`, `email_sent_from_address`, `sms_status`, `sms_sent_from`, `push_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '{{site_name}} - Balance Added', '<div style=\"font-family: Montserrat, sans-serif;\"><div>We\'re writing to inform you that an amount of {{amount}} {{site_currency}} has been successfully added to your account.</div><div><br></div><div>Here are the details of the transaction:</div><div><br></div><div><b>Transaction Number: </b>{{trx}}</div><div><b>Current Balance:</b> {{post_balance}} {{site_currency}}</div><div><b>Admin Note:</b> {{remark}}</div><div><br></div><div>If you have any questions or require further assistance, please don\'t hesitate to contact us. We\'re here to assist you.</div></div>', 'We\'re writing to inform you that an amount of {{amount}} {{site_currency}} has been successfully added to your account.', '{{amount}} {{site_currency}} has been successfully added to your account.', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, '{{site_name}} Finance', NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2024-05-11 05:35:59'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '{{site_name}} - Balance Subtracted', '<div style=\"font-family: Montserrat, sans-serif;\"><div>We wish to inform you that an amount of {{amount}} {{site_currency}} has been successfully deducted from your account.</div><div><br></div><div>Below are the details of the transaction:</div><div><br></div><div><b>Transaction Number:</b> {{trx}}</div><div><b>Current Balance: </b>{{post_balance}} {{site_currency}}</div><div><b>Admin Note:</b> {{remark}}</div><div><br></div><div>Should\r\n you require any further clarification or assistance, please do not \r\nhesitate to reach out to us. We are here to assist you in any way we \r\ncan.</div><div><br></div><div>Thank you for your continued trust in {{site_name}}.</div></div>', 'We wish to inform you that an amount of {{amount}} {{site_currency}} has been successfully deducted from your account.', '{{amount}} {{site_currency}} debited from your account.', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, '{{site_name}} Finance', NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2024-05-11 05:37:09'),
(3, 'DEPOSIT_COMPLETE', 'Deposit - Automated - Successful', 'Deposit Completed Successfully', '{{site_name}} - Deposit successful', '<div><div>We\'re delighted to inform you that your deposit of {{amount}} {{site_currency}} via {{method_name}} has been completed.</div><div><br></div><div>Below, you\'ll find the details of your deposit:</div><div><br></div><div><b>Amount:</b> {{amount}} {{site_currency}}</div><div><b>Charge: </b>{{charge}} {{site_currency}}</div><div><b>Conversion Rate:</b> 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div><b>Received:</b> {{method_amount}} {{method_currency}}</div><div><b>Paid via:</b> {{method_name}}</div><div><b>Transaction Number:</b> {{trx}}</div><div><br></div><div>Your current balance stands at {{post_balance}} {{site_currency}}.</div><div><br></div><div>If\r\n you have any questions or need further assistance, feel free to reach \r\nout to our support team. We\'re here to assist you in any way we can.</div></div>', 'We\'re delighted to inform you that your deposit of {{amount}} {{site_currency}} via {{method_name}} has been completed.', 'Deposit Completed Successfully', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, '{{site_name}} Billing', NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2024-05-11 05:40:25'),
(4, 'DEPOSIT_APPROVE', 'Deposit - Manual - Approved', 'Your Deposit is Approved', '{{site_name}} - Deposit Request Approved', '<div style=\"font-family: Montserrat, sans-serif;\"><div>We are pleased to inform you that your deposit request of {{amount}} {{site_currency}} via {{method_name}} has been approved.</div><div><br></div><div>Here are the details of your deposit:</div><div><br></div><div><b>Amount:</b> {{amount}} {{site_currency}}</div><div><b>Charge: </b>{{charge}} {{site_currency}}</div><div><b>Conversion Rate:</b> 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div><b>Received: </b>{{method_amount}} {{method_currency}}</div><div><b>Paid via: </b>{{method_name}}</div><div><b>Transaction Number: </b>{{trx}}</div><div><br></div><div>Your current balance now stands at {{post_balance}} {{site_currency}}.</div><div><br></div><div>Should you have any questions or require further assistance, please feel free to contact our support team. We\'re here to help.</div></div>', 'We are pleased to inform you that your deposit request of {{amount}} {{site_currency}} via {{method_name}} has been approved.', 'Deposit of {{amount}} {{site_currency}} via {{method_name}} has been approved.', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, '{{site_name}} Billing', NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2024-05-11 05:41:21'),
(5, 'DEPOSIT_REJECT', 'Deposit - Manual - Rejected', 'Your Deposit Request is Rejected', '{{site_name}} - Deposit Request Rejected', '<div style=\"font-family: Montserrat, sans-serif;\"><div>We regret to inform you that your deposit request of {{amount}} {{site_currency}} via {{method_name}} has been rejected.</div><div><br></div><div>Here are the details of the rejected deposit:</div><div><br></div><div><b>Conversion Rate:</b> 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div><b>Received:</b> {{method_amount}} {{method_currency}}</div><div><b>Paid via:</b> {{method_name}}</div><div><b>Charge:</b> {{charge}}</div><div><b>Transaction Number:</b> {{trx}}</div><div><br></div><div>If you have any questions or need further clarification, please don\'t hesitate to contact us. We\'re here to assist you.</div><div><br></div><div>Rejection Reason:</div><div>{{rejection_message}}</div><div><br></div><div>Thank you for your understanding.</div></div>', 'We regret to inform you that your deposit request of {{amount}} {{site_currency}} via {{method_name}} has been rejected.', 'Your deposit request of {{amount}} {{site_currency}} via {{method_name}} has been rejected.', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, '{{site_name}} Billing', NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2024-05-11 05:42:32'),
(6, 'DEPOSIT_REQUEST', 'Deposit - Manual - Requested', 'Deposit Request Submitted Successfully', NULL, '<div><div>We are pleased to confirm that your deposit request of {{amount}} \r\n{{site_currency}} via {{method_name}} has been submitted successfully.</div><div><br></div><div>Below are the details of your deposit:</div><div><br></div><div><b>Amount:</b> {{amount}} {{site_currency}}</div><div><b>Charge:</b> {{charge}} {{site_currency}}</div><div><b>Conversion Rate:</b> 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div><b>Payable:</b> {{method_amount}} {{method_currency}}</div><div><b>Pay via: </b>{{method_name}}</div><div><b>Transaction Number:</b> {{trx}}</div><div><br></div><div>Should\r\n you have any questions or require further assistance, please feel free \r\nto reach out to our support team. We\'re here to assist you.</div></div>', 'We are pleased to confirm that your deposit request of {{amount}} {{site_currency}} via {{method_name}} has been submitted successfully.', 'Your deposit request of {{amount}} {{site_currency}} via {{method_name}} submitted successfully.', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, '{{site_name}} Billing', NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2024-05-11 05:43:22'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', NULL, '<div style=\"font-family: Montserrat, sans-serif;\"><div>We\'ve received a request to reset the password for your account on <b>{{time}}</b>. The request originated from\r\n            the following IP address: <b>{{ip}}</b>, using <b>{{browser}}</b> on <b>{{operating_system}}</b>.\r\n    </div><br>\r\n    <div>To proceed with the password reset, please use the following account recovery code: <b><font size=\"6\">{{code}}</font></b></div><br>\r\n    <div>If you did not initiate this password reset request, please disregard this message. Your account security\r\n            remains our top priority, and we advise you to take appropriate action if you suspect any unauthorized\r\n            access to your account.</div></div>', 'To proceed with the password reset, please use the following account recovery code: {{code}}', 'To proceed with the password reset, please use the following account recovery code: {{code}}', '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, '{{site_name}} Authentication Center', NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2024-05-11 05:46:47'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', NULL, '<div><div>We are writing to inform you that the password reset for\r\n your account was successful. This action was completed at {{time}} from\r\n the following browser: {{browser}}on {{operating_system}}, with the IP address: {{ip}}.</div><br><div>Your\r\n account security is our utmost priority, and we are committed to \r\nensuring the safety of your information. If you did not initiate this \r\npassword reset or notice any suspicious activity on your account, please\r\n contact our support team immediately for further assistance.</div></div>', 'We are writing to inform you that the password reset for your account was successful.', 'We are writing to inform you that the password reset for your account was successful.', '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, '{{site_name}} Authentication Center', NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2024-05-11 05:47:47'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Re: {{ticket_subject}} - Ticket #{{ticket_id}}', '{{site_name}} - Support Ticket Replied', '<div><div>\r\n    <div>Thank you for reaching out to us regarding your support ticket with the subject:\r\n        \"{{ticket_subject}}\"&nbsp;and ticket ID: {{ticket_id}}.</div><br>\r\n    <div>We have carefully reviewed your inquiry, and we are pleased to provide you with the following\r\n            response:</div><br>\r\n    <div>{{reply}}</div><br>\r\n    <div>If you have any further questions or need additional assistance, please feel free to reply by clicking on\r\n            the following link: <a href=\"http://localhost/laramin_v5_changalab/admin/notification/template/edit/email/%7B%7Blink%7D%7D\" title=\"\" target=\"_blank\">{{link}}</a>. This link will take you to\r\n            the ticket thread where you can provide further information or ask for clarification.</div><br>\r\n    <div>Thank you for your patience and cooperation as we worked to address your concerns.</div></div></div>', 'Thank you for reaching out to us regarding your support ticket with the subject: \"{{ticket_subject}}\" and ticket ID: {{ticket_id}}. We have carefully reviewed your inquiry. To check the response, please go to the following link: {{link}}', 'Re: {{ticket_subject}} - Ticket #{{ticket_id}}', '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, '{{site_name}} Support Team', NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2024-05-11 05:48:59'),
(10, 'EVER_CODE', 'Verification - Email', 'Email Verification Code', NULL, '<div>\r\n    <div>Thank you for taking the time to verify your email address with us. Your email verification code\r\n            is: <b><font size=\"6\">{{code}}</font></b></div><br>\r\n    <div>Please enter this code in the designated field on our platform to complete the verification\r\n            process.</div><br>\r\n    <div>If you did not request this verification code, please disregard this email. Your account security is our\r\n            top priority, and we advise you to take appropriate measures if you suspect any unauthorized access.\r\n    </div><br>\r\n    <div>If you have any questions or encounter any issues during the verification process, please don\'t hesitate\r\n            to contact our support team for assistance.</div><br>\r\n    <div>Thank you for choosing us.</div></div>', '---', NULL, '{\"code\":\"Email verification code\"}', 1, '{{site_name}} Verification Center', NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2024-05-11 05:49:49'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', NULL, '---', 'Your mobile verification code is {{code}}. Please enter this code in the appropriate field to verify your mobile number. If you did not request this code, please ignore this message.', NULL, '{\"code\":\"SMS Verification Code\"}', 0, '{{site_name}} Verification Center', NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2024-05-11 05:50:34'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdrawal Confirmation: Your Request Processed Successfully', '{{site_name}} - Withdrawal Request Approved', '<div style=\"font-family: Montserrat, sans-serif;\"><div>We are writing to inform you that your withdrawal request of \r\n{{amount}} {{site_currency}} via {{method_name}} has been processed \r\nsuccessfully.</div><div><br></div><div>Below are the details of your withdrawal:</div><div><br></div><div><b>Amount:</b> {{amount}} {{site_currency}}</div><div><b>Charge:</b> {{charge}} {{site_currency}}</div><div><b>Conversion Rate:</b> 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div><b>You will receive:</b> {{method_amount}} {{method_currency}}</div><div><b>Via:</b> {{method_name}}</div><div><b>Transaction Number:</b> {{trx}}</div><div><br></div><hr><div><br></div><div><b>Details of Processed Payment:</b></div><div>{{admin_details}}</div><div><br></div><div>Should you have any questions or require further assistance, feel free to reach out to our support team. We\'re here to help.</div></div>', 'We are writing to inform you that your withdrawal request of {{amount}} {{site_currency}} via {{method_name}} has been processed successfully.', 'Withdrawal Confirmation: Your Request Processed Successfully', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}', 1, '{{site_name}} Finance', NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2024-05-11 05:51:35'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdrawal Request Rejected', '{{site_name}} - Withdrawal Request Rejected', '<div style=\"font-family: Montserrat, sans-serif;\"><div>We regret to inform you that your withdrawal request of {{amount}} {{site_currency}} via {{method_name}} has been rejected.</div><div><br></div><div>Here are the details of your withdrawal:</div><div><br></div><div><b>Amount:</b> {{amount}} {{site_currency}}</div><div><b>Charge:</b> {{charge}} {{site_currency}}</div><div><b>Conversion Rate:</b> 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div><b>Expected Amount:</b> {{method_amount}} {{method_currency}}</div><div><b>Via:</b> {{method_name}}</div><div><b>Transaction Number:</b> {{trx}}</div><div><br></div><hr><div><br></div><div><b>Refund Details:</b></div><div>{{amount}} {{site_currency}} has been refunded to your account, and your current balance is {{post_balance}} {{site_currency}}.</div><div><br></div><hr><div><br></div><div><b>Reason for Rejection:</b></div><div>{{admin_details}}</div><div><br></div><div>If\r\n you have any questions or concerns regarding this rejection or need \r\nfurther assistance, please do not hesitate to contact our support team. \r\nWe apologize for any inconvenience this may have caused.</div></div><div></div><div></div>', 'We regret to inform you that your withdrawal request of {{amount}} {{site_currency}} via {{method_name}} has been rejected.', 'Withdrawal Request Rejected', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}', 1, '{{site_name}} Finance', NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2024-05-11 05:52:25'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdrawal Request Confirmation', '{{site_name}} - Requested for withdrawal', '<div style=\"font-family: Montserrat, sans-serif;\"><div>We are pleased to inform you that your withdrawal request of \r\n{{amount}} {{site_currency}} via {{method_name}} has been submitted \r\nsuccessfully.</div><div><br></div><div>Here are the details of your withdrawal:</div><div><br></div><div><b>Amount:</b> {{amount}} {{site_currency}}</div><div><b>Charge:</b> {{charge}} {{site_currency}}</div><div><b>Conversion Rate:</b> 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div><b>Expected Amount:</b> {{method_amount}} {{method_currency}}</div><div><b>Via:</b> {{method_name}}</div><div><b>Transaction Number:</b> {{trx}}</div><div><br></div><div>Your current balance is {{post_balance}} {{site_currency}}.</div><div><br></div><div>Should you have any questions or require further assistance, feel free to reach out to our support team. We\'re here to help.</div></div>', 'We are pleased to inform you that your withdrawal request of {{amount}} {{site_currency}} via {{method_name}} has been submitted successfully.', 'Withdrawal request submitted successfully', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\"}', 1, '{{site_name}} Finance', NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2024-05-11 05:53:18'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', NULL, '{{message}}', '{{message}}', NULL, '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, NULL, NULL, 1, NULL, 0, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(16, 'KYC_APPROVE', 'KYC Approved', 'KYC has been approved', '{{site_name}} - KYC Approved', '<div><div>We are pleased to inform you that your Know Your \r\nCustomer (KYC) information has been successfully reviewed and approved. \r\nThis means that you are now eligible to conduct any payout operations \r\nwithin our system.</div><br><div>Your commitment to \r\ncompleting the KYC process promptly is greatly appreciated, as it helps \r\nus ensure the security and integrity of our platform for all users.</div><br><div>With\r\n your KYC verification now complete, you can proceed with confidence to \r\ncarry out any payout transactions you require. Should you encounter any \r\nissues or have any questions along the way, please don\'t hesitate to \r\nreach out to our support team. We\'re here to assist you every step of \r\nthe way.</div><br><div>Thank you once again for choosing {{site_name}} and for your cooperation in this matter.</div></div>', 'We are pleased to inform you that your Know Your Customer (KYC) information has been successfully reviewed and approved. This means that you are now eligible to conduct any payout operations within our system.', 'Your  Know Your Customer (KYC) information has been approved successfully', '[]', 1, '{{site_name}} Verification Center', NULL, 1, NULL, 0, NULL, '2024-05-11 05:45:04'),
(17, 'KYC_REJECT', 'KYC Rejected Successfully', 'KYC has been rejected', '{{site_name}} - KYC Rejected', '<div><div>We regret to inform you that the Know Your Customer \r\n(KYC) information provided has been reviewed and unfortunately, it has \r\nnot met our verification standards. As a result, we are unable to \r\napprove your KYC submission at this time.</div><br><div>We \r\nunderstand that this news may be disappointing, and we want to assure \r\nyou that we take these matters seriously to maintain the security and \r\nintegrity of our platform.</div><br><div>Reasons for \r\nrejection may include discrepancies or incomplete information in the \r\ndocumentation provided. If you believe there has been a misunderstanding\r\n or if you would like further clarification on why your KYC was \r\nrejected, please don\'t hesitate to contact our support team.</div><br><div>We\r\n encourage you to review your submitted information and ensure that all \r\ndetails are accurate and up-to-date. Once any necessary adjustments have\r\n been made, you are welcome to resubmit your KYC information for review.</div><br><div>We apologize for any inconvenience this may cause and appreciate your understanding and cooperation in this matter.</div><br><div>Rejection Reason:</div><div>{{reason}}</div><div><br></div><div>Thank you for your continued support and patience.</div></div>', 'We regret to inform you that the Know Your Customer (KYC) information provided has been reviewed and unfortunately, it has not met our verification standards. As a result, we are unable to approve your KYC submission at this time. We encourage you to review your submitted information and ensure that all details are accurate and up-to-date. Once any necessary adjustments have been made, you are welcome to resubmit your KYC information for review.', 'Your  Know Your Customer (KYC) information has been rejected', '[]', 1, '{{site_name}} Verification Center', NULL, 1, NULL, 0, NULL, '2024-05-11 05:45:52'),
(18, 'INVESTMENT', 'Investment', 'Investment successfully completed', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">Your&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;investment successfully completed.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Investment:</span></div><div style=\"font-family: Montserrat, sans-serif;\">Invested Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"color: rgb(33, 37, 41);\">Property name: {{property_name}}</span></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Your {{amount}} {{site_currency}} investment successfully completed. Property name: {{property_name}}.', NULL, '{\r\n    \"amount\": \"Amount paid by the user\",\"paid_amount\":\"Total paid amount\",\"due_amount\":\"Total due amount\",\"property_name\": \"Property name\",\"post_balance\": \"Balance of the user after this transaction\"\r\n}', 1, NULL, NULL, 1, NULL, 0, '2023-09-07 05:47:27', '2024-02-29 06:10:04'),
(19, 'REFERRAL_COMMISSION', 'Referral Commission', 'Referral Commission', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">You got&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;referral commission.</div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your referral commission:</span></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">{{type}} referral commission</div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"color: rgb(33, 37, 41);\">Transaction Number : {{trx}}</span><br></div><div style=\"font-family: Montserrat, sans-serif;\">{{level}} level referral commission.</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Your got {{amount}} {{site_currency}} referral commission from {{ref_username}}.', NULL, '{\r\n \"trx\": \"Transaction number for the interest\",\r\n \"amount\": \"Amount inserted by the user\",\r\n \"type\": \"Commission type\",\r\n \"level\": \"Which level referral commission\",\r\n \"post_balance\": \"Balance of the user after this transaction\"\r\n}', 1, NULL, NULL, 1, NULL, 0, '2023-09-07 05:47:55', '2023-09-07 05:47:55'),
(20, 'DOWN_PAYMENT', 'Down Payment', 'Down payment successful', NULL, '<div style=\"font-family: Montserrat, sans-serif;\"><div>Your&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;down payment successfully completed.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Down payment:</span></div><div>Paid Amount : {{amount}} {{site_currency}}</div><div><div><span style=\"color: rgb(33, 37, 41);\">Property Name: {{property_name}}</span></div><div>Transaction Number : {{trx}}</div><div><br></div></div><div>Total Invested Amount :&nbsp;{{invested_amount}}&nbsp;{{site_currency}}</div><div>Total Paid Amount :&nbsp;{{paid_amount}}&nbsp;{{site_currency}}</div><div>Total Due Amount :&nbsp;{{due_amount}}&nbsp;{{site_currency}}</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div></div>', 'Your {{amount}} {{site_currency}} down payment successfully completed. Property name: {{property_name}}. Trx: {{trx}}', NULL, '{\r\n    \"trx\": \"Transaction number for the interest\",\"amount\": \"Down payment by the user\",\"invested_amount\":\"Total invested amount\",\"paid_amount\":\"Total paid amount\",\"due_amount\":\"Total due amount\",\"property_name\": \"Property name\",\"post_balance\": \"Balance of the user after this transaction\"\r\n}', 1, '{{site_name}}', NULL, 1, NULL, 0, '2023-09-16 04:54:13', '2024-05-11 05:44:13'),
(21, 'INSTALLMENT', 'Installment', 'Installment successful', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">Your&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;installment successfully completed.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Installment:</span></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"color: rgb(33, 37, 41);\">Property name: {{property_name}}</span></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><div>Total Invested Amount :&nbsp;{{invested_amount}}&nbsp;{{site_currency}}</div><div>Total Paid Amount :&nbsp;{{paid_amount}}&nbsp;{{site_currency}}</div><div>Total Due Amount :&nbsp;{{due_amount}}&nbsp;{{site_currency}}</div></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Your {{amount}} {{site_currency}} installment successfully completed. Property name: {{property_name}}. Trx: {{trx}}', NULL, '{\r\n    \"trx\": \"Transaction number for the interest\",\"amount\": \"Installment payment by the user\",\"invested_amount\":\"Total invested amount\",\"paid_amount\":\"Total paid amount\",\"due_amount\":\"Total due amount\",\"property_name\": \"Property name\",\"post_balance\": \"Balance of the user after this transaction\"\r\n}', 1, NULL, NULL, 1, NULL, 0, NULL, '2024-02-29 06:25:46'),
(22, 'PROFIT', 'Profit', 'Profit added to your balance', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">You got&nbsp;<span style=\"font-size: 1rem; text-align: var(--bs-body-text-align); font-weight: bolder;\">{{amount}} {{site_currency}}</span><span style=\"color: rgb(33, 37, 41); font-size: 1rem; text-align: var(--bs-body-text-align);\">&nbsp;profit.</span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Profit:</span></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Property Name: {{property_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'You got {{amount}} {{site_currency}} profit. Property: {{property_name}}. Trx: {{trx}}', NULL, '{\r\n    \"trx\": \"Transaction number for the interest\",\r\n    \"amount\": \"Profit amount\",\r\n    \"property_name\": \"Property name\",\r\n    \"post_balance\": \"Balance of the user after this transaction\"\r\n}', 1, NULL, NULL, 1, NULL, 0, '2023-09-20 09:17:20', '2024-03-16 06:17:57'),
(23, 'CAPITAL_BACK', 'Capital back', 'Invested amount added to your balance', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">You got&nbsp;<span style=\"font-size: 1rem; text-align: var(--bs-body-text-align); font-weight: bolder;\">{{amount}} {{site_currency}}</span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Capital back:</span></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Property Name: {{property_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'You got {{amount}} {{site_currency}} capital back. Property: {{property_name}}. Trx: {{trx}}', NULL, '{\r\n    \"trx\": \"Transaction number for the capital back\",\r\n    \"amount\": \"Amount invested by the user\",\r\n    \"property_name\": \"Property name\",\r\n    \"post_balance\": \"Balance of the user after this transaction\"\r\n}', 1, '{{site_name}} Finance', NULL, 1, '{{site_name}} Finance', 0, '2023-09-20 09:17:20', '2024-05-11 05:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `seo_content`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', '/', 'templates.basic.', '[\"feature\",\"latest_property\",\"about\",\"cities\",\"featured_property\",\"testimonial\",\"blog\"]', NULL, 1, '2020-07-11 06:23:58', '2024-05-15 04:43:15'),
(4, 'Blogs', 'blog', 'templates.basic.', NULL, NULL, 1, '2020-10-22 01:14:43', '2024-05-15 04:49:25'),
(5, 'Contact', 'contact', 'templates.basic.', '[\"faq\"]', NULL, 1, '2020-10-22 01:14:53', '2024-05-15 04:49:58'),
(19, 'Property', 'property', 'templates.basic.', NULL, NULL, 1, '2023-11-18 13:15:54', '2024-05-15 04:52:09'),
(27, 'About', 'about', 'templates.basic.', '[\"about\"]', NULL, 0, '2024-03-20 22:35:53', '2024-05-15 04:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profits`
--

CREATE TABLE `profits` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `property_id` int UNSIGNED NOT NULL DEFAULT '0',
  `invest_id` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = pending, 1 = success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `location_id` int UNSIGNED NOT NULL DEFAULT '0',
  `invest_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = onetime, 2 = installment',
  `total_share` int NOT NULL DEFAULT '0',
  `per_share_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `is_capital_back` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = yes, 2 = no',
  `profit_back` int NOT NULL DEFAULT '0',
  `total_installment` int NOT NULL DEFAULT '0',
  `per_installment_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `down_payment` decimal(5,2) NOT NULL DEFAULT '0.00',
  `installment_late_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `installment_duration` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'time_settings_id',
  `profit_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = fixed, 2 = range',
  `profit_amount_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = fixed, 2 = percent',
  `profit_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `minimum_profit_amount` decimal(28,8) DEFAULT '0.00000000',
  `maximum_profit_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `profit_schedule` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = lifetime, 2 = repeated time, 3 = onetime',
  `profit_schedule_period` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'time_setting_id',
  `profit_repeat_time` int NOT NULL DEFAULT '0',
  `profit_distribution` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = manual, 2 = auto',
  `auto_profit_distribution_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `map_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `amenities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `goal_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `invested_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `invest_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = running, 2= completed',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `thumb_image` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `video` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `complete_step` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Completed Property Setting,2=Completed Investment \r\nSetting',
  `keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `seo_content` longtext COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_galleries`
--

CREATE TABLE `property_galleries` (
  `id` bigint UNSIGNED NOT NULL,
  `property_id` int UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint UNSIGNED NOT NULL,
  `commission_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` int NOT NULL DEFAULT '0',
  `percent` decimal(5,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `support_message_id` int UNSIGNED NOT NULL DEFAULT '0',
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `support_ticket_id` int UNSIGNED NOT NULL DEFAULT '0',
  `admin_id` int UNSIGNED NOT NULL DEFAULT '0',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_settings`
--

CREATE TABLE `time_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `invest_id` int UNSIGNED NOT NULL DEFAULT '0',
  `installment_id` int UNSIGNED NOT NULL DEFAULT '0',
  `profit_id` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `post_balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `trx_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `update_logs`
--

CREATE TABLE `update_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `version` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `update_logs`
--

INSERT INTO `update_logs` (`id`, `version`, `update_log`, `created_at`, `updated_at`) VALUES
(1, '2.0', '[\r\n\"[ADD] Push notification\",\r\n\"[ADD] Binance payment gateway\",\r\n\"[ADD] Aamarpay payment gateway\",\r\n\"[ADD] SslCommerz payment gateway\",\r\n\"[ADD] Slug management for Blogs\",\r\n\"[ADD] SEO content management for Blog\",\r\n\"[ADD] Slug management for Policy Pages\",\r\n\"[ADD] SEO content management for Policy Pages\",\r\n\"[ADD] Input type number, url, date, and time in the Form Generator\",\r\n\"[ADD] Configurable input field width in the Form Generator\",\r\n\"[ADD] Configurable hints/instructions for input fields in the Form Generator\",\r\n\"[ADD] Sorting option for input fields in the Form Generator\",\r\n\"[ADD] Controllable login system with Google, Facebook, Linkedin\",\r\n\"[ADD] Automatic system update\",\r\n\"[ADD] Image on deposit and withdraw method\",\r\n\"[ADD] Configurable number of items per page for pagination\",\r\n\"[ADD] Configurable currency display format\",\r\n\"[ADD] Redirecting to intended location when required\",\r\n\"[ADD] Resend code countdown on verification pages\",\r\n\"[UPDATE] Admin dashboard widget design\",\r\n\"[UPDATE] Cron job instruction UI\",\r\n\"[UPDATE] Notification sending process\",\r\n\"[UPDATE] User experience of the admin sidebar\",\r\n\"[UPDATE] Improved menu searching functionality on the admin panel\",\r\n\"[UPDATE] User experience of the select fields of the admin panel\",\r\n\"[UPDATE] Centralized settings system\",\r\n\"[UPDATE] Form Generator UI on the admin panel\",\r\n\"[UPDATE] Google Analytics script\",\r\n\"[UPDATE] Notification toaster UI\",\r\n\"[UPDATE] Support ticket attachment upload UI\",\r\n\"[UPDATE] Notification template content configuration\",\r\n\"[UPDATE] Configurable email from name and address for each template\",\r\n\"[UPDATE] Configurable SMS from for each template\",\r\n\"[UPDATE] Overall user interface of the admin panel\",\r\n\"[PATCH] Laravel 11\",\r\n\"[PATCH] PHP 8.3\",\r\n\"[PATCH] Latest System Patch\",\r\n\"[PATCH] Latest Security Patch\"\r\n]', '2024-05-27 12:00:18', '2024-05-27 12:00:18'),
(2, '2.1', '[\r\n\"[ADD] Contract Builder with signature support\",\r\n\"[ADD] Bulk Payment Release based on plan\",\r\n\"[ADD] Improved Profit Calculation\",\r\n\"[ADD] Investment & Interest Statistics for properties\",\r\n\"[ADD] Unique Property Slugs for SEO-friendly URLs\",\r\n\"[ADD] SEO Configuration for property details\",\r\n\"[ADD] Property Planning Video support\"\r\n]', '2024-09-25 12:01:33', '2024-09-25 12:01:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `firstname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dial_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` int UNSIGNED NOT NULL DEFAULT '0',
  `balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: banned, 1: active',
  `kyc_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `kyc_rejection_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: mobile unverified, 1: mobile verified',
  `profile_complete` tinyint(1) NOT NULL DEFAULT '0',
  `ver_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ban_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `signature` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint UNSIGNED NOT NULL,
  `method_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `currency` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `trx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `after_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `withdraw_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_limit` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `max_limit` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cron_jobs`
--
ALTER TABLE `cron_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cron_job_logs`
--
ALTER TABLE `cron_job_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cron_schedules`
--
ALTER TABLE `cron_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_tokens`
--
ALTER TABLE `device_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `installments`
--
ALTER TABLE `installments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invests`
--
ALTER TABLE `invests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `profits`
--
ALTER TABLE `profits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_galleries`
--
ALTER TABLE `property_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_settings`
--
ALTER TABLE `time_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `update_logs`
--
ALTER TABLE `update_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cron_jobs`
--
ALTER TABLE `cron_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cron_job_logs`
--
ALTER TABLE `cron_job_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cron_schedules`
--
ALTER TABLE `cron_schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `device_tokens`
--
ALTER TABLE `device_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `installments`
--
ALTER TABLE `installments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invests`
--
ALTER TABLE `invests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profits`
--
ALTER TABLE `profits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_galleries`
--
ALTER TABLE `property_galleries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_settings`
--
ALTER TABLE `time_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `update_logs`
--
ALTER TABLE `update_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
