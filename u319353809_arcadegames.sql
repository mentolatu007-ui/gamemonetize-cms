-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 13, 2026 at 03:48 PM
-- Server version: 11.8.6-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u319353809_arcadegames`
--

-- --------------------------------------------------------

--
-- Table structure for table `gm_account`
--

CREATE TABLE `gm_account` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `admin` enum('0','1') NOT NULL DEFAULT '0',
  `email` varchar(250) NOT NULL,
  `avatar_id` int(11) NOT NULL,
  `xp` int(11) NOT NULL,
  `language` varchar(250) NOT NULL,
  `profile_theme` varchar(250) NOT NULL DEFAULT 'style-1',
  `ip` varchar(250) NOT NULL,
  `registration_date` int(11) NOT NULL,
  `last_logged` int(11) NOT NULL,
  `last_update_info` int(11) NOT NULL,
  `active` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_ads`
--

CREATE TABLE `gm_ads` (
  `id` int(11) NOT NULL,
  `728x90` varchar(700) NOT NULL,
  `300x250` varchar(700) NOT NULL,
  `600x300` varchar(700) NOT NULL,
  `728x90_main` varchar(700) NOT NULL,
  `300x250_main` varchar(700) NOT NULL,
  `ads_video` varchar(700) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_blogs`
--

CREATE TABLE `gm_blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  `post` text DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `is_rewrited` tinyint(1) NOT NULL DEFAULT 0,
  `is_last_rewrite` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_categories`
--

CREATE TABLE `gm_categories` (
  `id` int(11) NOT NULL,
  `category_pilot` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` text NOT NULL,
  `image` varchar(400) NOT NULL,
  `footer_description` text DEFAULT '',
  `show_home` tinyint(1) NOT NULL DEFAULT 0,
  `total_games` int(11) DEFAULT 0,
  `is_rewrited` tinyint(1) NOT NULL DEFAULT 0,
  `is_last_rewrite` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_chatgpt`
--

CREATE TABLE `gm_chatgpt` (
  `id` int(11) NOT NULL,
  `api_key` varchar(200) DEFAULT NULL,
  `llm_provider` varchar(50) NOT NULL DEFAULT 'openai',
  `template_game` text DEFAULT NULL,
  `template_category` text DEFAULT NULL,
  `template_tags` text DEFAULT NULL,
  `template_footer` text DEFAULT NULL,
  `template_blog` text DEFAULT NULL,
  `template_blog_tag` longtext DEFAULT NULL,
  `template_blog_title` longtext DEFAULT NULL,
  `template_blog_related_box` longtext DEFAULT NULL,
  `random_words_before_tags` varchar(1000) DEFAULT NULL,
  `random_words_after_tags` varchar(1000) DEFAULT NULL,
  `chatgpt_model` varchar(100) NOT NULL DEFAULT 'gpt-3.5-turbo',
  `maximum_words` int(11) NOT NULL DEFAULT 0,
  `openai_api_key` text DEFAULT NULL,
  `deepseek_api_key` text DEFAULT NULL,
  `mimo_api_key` text DEFAULT NULL,
  `gemini_api_key` text DEFAULT NULL,
  `openrouter_api_key` text DEFAULT NULL,
  `rewrite_old_games_limit` int(11) NOT NULL DEFAULT 1,
  `cms_ai_key` varchar(255) DEFAULT NULL,
  `cms_ai_domain` varchar(255) DEFAULT NULL,
  `cms_ai_registered` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_footer_description`
--

CREATE TABLE `gm_footer_description` (
  `id` int(11) NOT NULL,
  `page_name` varchar(100) NOT NULL,
  `page_url` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `has_content` enum('1','0') NOT NULL DEFAULT '0',
  `content_value` text DEFAULT '',
  `is_rewrited` tinyint(1) NOT NULL DEFAULT 0,
  `is_last_rewrite` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_games`
--

CREATE TABLE `gm_games` (
  `game_id` int(11) NOT NULL,
  `catalog_id` varchar(250) NOT NULL,
  `game_name` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(500) NOT NULL,
  `import` enum('0','1') NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL,
  `plays` int(11) NOT NULL,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `dislike_count` int(11) NOT NULL DEFAULT 0,
  `favorite_count` int(11) NOT NULL DEFAULT 0,
  `rating` enum('0','0.5','1','1.5','2','2.5','3','3.5','4','4.5','5') NOT NULL DEFAULT '0',
  `description` varchar(15000) NOT NULL,
  `instructions` varchar(600) NOT NULL,
  `file` varchar(500) NOT NULL,
  `game_type` varchar(250) NOT NULL,
  `w` int(10) NOT NULL,
  `h` int(10) NOT NULL,
  `date_added` int(11) NOT NULL,
  `published` enum('0','1') NOT NULL,
  `featured` enum('0','1') NOT NULL DEFAULT '0',
  `mobile` int(255) NOT NULL,
  `featured_sorting` varchar(255) NOT NULL,
  `field_1` varchar(500) NOT NULL,
  `field_2` varchar(500) NOT NULL,
  `field_3` varchar(500) NOT NULL,
  `field_4` varchar(500) NOT NULL,
  `field_5` varchar(500) NOT NULL,
  `field_6` varchar(500) NOT NULL,
  `field_7` varchar(500) NOT NULL,
  `field_8` varchar(500) NOT NULL,
  `field_9` varchar(500) NOT NULL,
  `field_10` varchar(500) NOT NULL,
  `tags_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags_ids`)),
  `video_url` varchar(100) DEFAULT NULL,
  `is_last_rewrite` tinyint(1) NOT NULL DEFAULT 0,
  `wt_video` varchar(255) DEFAULT NULL,
  `cms_update_test_column` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_game_actions`
--

CREATE TABLE `gm_game_actions` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `visitor_token` varchar(100) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `action_type` enum('like','dislike','favorite','play') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_links`
--

CREATE TABLE `gm_links` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_chatgpt` tinyint(1) NOT NULL,
  `language_list` varchar(100) DEFAULT 'de,es,fr,it',
  `rewrite_method` varchar(100) DEFAULT NULL,
  `google_translate_language` varchar(100) DEFAULT NULL,
  `last_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_media`
--

CREATE TABLE `gm_media` (
  `id` int(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `extension` varchar(250) NOT NULL DEFAULT 'none',
  `type` varchar(250) NOT NULL DEFAULT 'none',
  `url` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_redirects`
--

CREATE TABLE `gm_redirects` (
  `id` int(11) NOT NULL,
  `old_url` text NOT NULL,
  `new_url` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `setting_key` varchar(50) DEFAULT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_reports`
--

CREATE TABLE `gm_reports` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `game_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `report_type` enum('Bug','Legal','Harmful') NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `visitor_token` varchar(100) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_setting`
--

CREATE TABLE `gm_setting` (
  `id` int(11) NOT NULL,
  `site_name` varchar(500) NOT NULL,
  `site_url` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `site_theme` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `site_description` varchar(500) NOT NULL DEFAULT 'Best Free Online Games',
  `site_keywords` varchar(500) NOT NULL DEFAULT 'games, online, arcade, html5, gamemonetize',
  `ads_status` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `ad_time` int(11) NOT NULL DEFAULT 10,
  `language` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `featured_game_limit` int(11) NOT NULL,
  `mp_game_limit` int(11) NOT NULL,
  `xp_play` int(11) NOT NULL,
  `xp_report` int(11) NOT NULL,
  `xp_register` int(11) NOT NULL,
  `plays` int(255) NOT NULL,
  `custom_game_feed_url` varchar(1000) DEFAULT NULL,
  `settings_1` varchar(500) NOT NULL,
  `settings_2` varchar(500) NOT NULL,
  `settings_3` varchar(500) NOT NULL,
  `settings_4` varchar(500) NOT NULL,
  `settings_5` varchar(500) NOT NULL,
  `settings_6` varchar(500) NOT NULL,
  `settings_7` varchar(500) NOT NULL,
  `settings_8` varchar(500) NOT NULL,
  `settings_9` varchar(500) NOT NULL,
  `settings_10` varchar(500) NOT NULL,
  `recaptcha_site_key` varchar(100) DEFAULT NULL,
  `recaptcha_secret_key` varchar(100) DEFAULT NULL,
  `is_sidebar_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `tag_card_base_style` varchar(30) NOT NULL DEFAULT 'purple',
  `tag_card_fade_color` varchar(7) NOT NULL DEFAULT '#2A1064'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_sidebar`
--

CREATE TABLE `gm_sidebar` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `category_tags_id` int(11) DEFAULT NULL,
  `custom_link` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `ordering` varchar(3) NOT NULL DEFAULT '999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_sliders`
--

CREATE TABLE `gm_sliders` (
  `id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `category_tags_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_tags`
--

CREATE TABLE `gm_tags` (
  `id` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `footer_description` text DEFAULT '',
  `is_last_rewrite` tinyint(1) NOT NULL DEFAULT 0,
  `is_rewrited` tinyint(1) NOT NULL DEFAULT 0,
  `show_home` tinyint(1) NOT NULL DEFAULT 0,
  `total_games` int(11) DEFAULT 0,
  `cms_update_test_tag_column` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_theme`
--

CREATE TABLE `gm_theme` (
  `theme_id` int(11) NOT NULL,
  `theme_class` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_users`
--

CREATE TABLE `gm_users` (
  `user_id` int(11) NOT NULL,
  `gender` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1',
  `about` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gm_account`
--
ALTER TABLE `gm_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_ads`
--
ALTER TABLE `gm_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_blogs`
--
ALTER TABLE `gm_blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_categories`
--
ALTER TABLE `gm_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_chatgpt`
--
ALTER TABLE `gm_chatgpt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_footer_description`
--
ALTER TABLE `gm_footer_description`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_games`
--
ALTER TABLE `gm_games`
  ADD PRIMARY KEY (`game_id`);

--
-- Indexes for table `gm_game_actions`
--
ALTER TABLE `gm_game_actions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_action` (`game_id`,`visitor_token`,`action_type`),
  ADD KEY `idx_game_id` (`game_id`);

--
-- Indexes for table `gm_links`
--
ALTER TABLE `gm_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_media`
--
ALTER TABLE `gm_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_redirects`
--
ALTER TABLE `gm_redirects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_reports`
--
ALTER TABLE `gm_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_game_id` (`game_id`);

--
-- Indexes for table `gm_setting`
--
ALTER TABLE `gm_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_sidebar`
--
ALTER TABLE `gm_sidebar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`type`,`category_tags_id`,`custom_link`);

--
-- Indexes for table `gm_sliders`
--
ALTER TABLE `gm_sliders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`,`category_tags_id`),
  ADD KEY `idx_ordering` (`ordering`);

--
-- Indexes for table `gm_tags`
--
ALTER TABLE `gm_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `gm_theme`
--
ALTER TABLE `gm_theme`
  ADD PRIMARY KEY (`theme_id`),
  ADD UNIQUE KEY `theme_class` (`theme_class`),
  ADD UNIQUE KEY `theme_class_3` (`theme_class`),
  ADD KEY `theme_class_2` (`theme_class`);

--
-- Indexes for table `gm_users`
--
ALTER TABLE `gm_users`
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gm_account`
--
ALTER TABLE `gm_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gm_blogs`
--
ALTER TABLE `gm_blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gm_categories`
--
ALTER TABLE `gm_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gm_chatgpt`
--
ALTER TABLE `gm_chatgpt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gm_footer_description`
--
ALTER TABLE `gm_footer_description`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gm_games`
--
ALTER TABLE `gm_games`
  MODIFY `game_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gm_game_actions`
--
ALTER TABLE `gm_game_actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gm_links`
--
ALTER TABLE `gm_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gm_media`
--
ALTER TABLE `gm_media`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gm_redirects`
--
ALTER TABLE `gm_redirects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gm_reports`
--
ALTER TABLE `gm_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gm_setting`
--
ALTER TABLE `gm_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gm_sidebar`
--
ALTER TABLE `gm_sidebar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gm_sliders`
--
ALTER TABLE `gm_sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gm_tags`
--
ALTER TABLE `gm_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gm_theme`
--
ALTER TABLE `gm_theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
