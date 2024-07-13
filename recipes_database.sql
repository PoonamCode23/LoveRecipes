-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2024 at 07:52 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipes_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add recipe', 7, 'add_recipe'),
(26, 'Can change recipe', 7, 'change_recipe'),
(27, 'Can delete recipe', 7, 'delete_recipe'),
(28, 'Can view recipe', 7, 'view_recipe'),
(29, 'Can add tag', 8, 'add_tag'),
(30, 'Can change tag', 8, 'change_tag'),
(31, 'Can delete tag', 8, 'delete_tag'),
(32, 'Can view tag', 8, 'view_tag'),
(33, 'Can add site', 9, 'add_site'),
(34, 'Can change site', 9, 'change_site'),
(35, 'Can delete site', 9, 'delete_site'),
(36, 'Can view site', 9, 'view_site'),
(37, 'Can add email address', 10, 'add_emailaddress'),
(38, 'Can change email address', 10, 'change_emailaddress'),
(39, 'Can delete email address', 10, 'delete_emailaddress'),
(40, 'Can view email address', 10, 'view_emailaddress'),
(41, 'Can add email confirmation', 11, 'add_emailconfirmation'),
(42, 'Can change email confirmation', 11, 'change_emailconfirmation'),
(43, 'Can delete email confirmation', 11, 'delete_emailconfirmation'),
(44, 'Can view email confirmation', 11, 'view_emailconfirmation'),
(45, 'Can add social account', 12, 'add_socialaccount'),
(46, 'Can change social account', 12, 'change_socialaccount'),
(47, 'Can delete social account', 12, 'delete_socialaccount'),
(48, 'Can view social account', 12, 'view_socialaccount'),
(49, 'Can add social application', 13, 'add_socialapp'),
(50, 'Can change social application', 13, 'change_socialapp'),
(51, 'Can delete social application', 13, 'delete_socialapp'),
(52, 'Can view social application', 13, 'view_socialapp'),
(53, 'Can add social application token', 14, 'add_socialtoken'),
(54, 'Can change social application token', 14, 'change_socialtoken'),
(55, 'Can delete social application token', 14, 'delete_socialtoken'),
(56, 'Can view social application token', 14, 'view_socialtoken'),
(57, 'Can add favorite', 15, 'add_favorite'),
(58, 'Can change favorite', 15, 'change_favorite'),
(59, 'Can delete favorite', 15, 'delete_favorite'),
(60, 'Can view favorite', 15, 'view_favorite');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(12, 'pbkdf2_sha256$720000$en0fuCzXGLBbuIdw68sZng$ixumqmokNIXWqSWKb6Glb2PgaJmyfUEO3YlzWXPt9xc=', '2024-07-11 16:07:10.600043', 0, 'Jasmine', '', '', 'jasmine@234gmail.com', 0, 1, '2024-07-01 14:09:35.845140'),
(13, 'pbkdf2_sha256$720000$2evAbcP80N6cVJWWgZ8bms$PKpp7W09Sw43/eCZ0TqElkrp2RRe1RgpFsioXKd1QBI=', '2024-07-12 11:39:44.152583', 0, 'Poonam', '', '', 'poonamkulung2022@gmail.com', 0, 1, '2024-07-01 14:24:23.959530'),
(14, 'pbkdf2_sha256$720000$yRyhdNDjaRofvAw3eSXRNk$Gs2nm3MhupK/gt3fA1NvqwO+J3y6lWsIuXAwB1pg05s=', '2024-07-12 14:31:50.874811', 0, 'Varoof', '', '', 'varoof@gmail.com', 0, 1, '2024-07-01 14:28:37.647590'),
(15, 'pbkdf2_sha256$720000$QQVm6Mz3fJ9bW5YuZcFMcW$jwnNA0kGKTcgnT86IumKHHdbZdj/TaAUy/ofu96YZCA=', '2024-07-11 11:29:11.780928', 0, 'Puchu', '', '', 'puchupuchu@gmail.com', 0, 1, '2024-07-01 15:39:24.462391'),
(16, 'pbkdf2_sha256$720000$99KJl4UjTZYXz0dGGYg7dh$0S1C32mEI0IyhAlBjaLVW4aX6JjWWk7EJNYo9ZPnAwQ=', '2024-07-13 17:17:59.699666', 0, 'ChefMartyl', '', '', 'chefmartyl@gmail.com', 0, 1, '2024-07-08 17:06:10.178890'),
(17, 'pbkdf2_sha256$720000$Exyihsey1NmJDJRx90fxKy$SZAVHtvOCcaiN9A94lYtPpgsxuS2DA6jfGoet0zUqr0=', '2024-07-12 14:57:33.423333', 0, 'Hemanta', '', '', 'hemanta@gmail.com', 0, 1, '2024-07-12 14:54:45.839871');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(10, 'account', 'emailaddress'),
(11, 'account', 'emailconfirmation'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'recipe_manager', 'recipe'),
(8, 'recipe_manager', 'tag'),
(15, 'save_recipe', 'favorite'),
(6, 'sessions', 'session'),
(9, 'sites', 'site'),
(12, 'socialaccount', 'socialaccount'),
(13, 'socialaccount', 'socialapp'),
(14, 'socialaccount', 'socialtoken');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-06-09 09:21:28.839489'),
(2, 'auth', '0001_initial', '2024-06-09 09:21:35.999811'),
(3, 'admin', '0001_initial', '2024-06-09 09:21:37.231168'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-06-09 09:21:37.363453'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-09 09:21:37.570275'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-06-09 09:21:38.224850'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-06-09 09:21:39.076065'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-06-09 09:21:39.447041'),
(9, 'auth', '0004_alter_user_username_opts', '2024-06-09 09:21:39.575175'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-06-09 09:21:39.812729'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-06-09 09:21:39.812729'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-06-09 09:21:39.917998'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-06-09 09:21:40.169972'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-06-09 09:21:40.390924'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-06-09 09:21:40.604112'),
(16, 'auth', '0011_update_proxy_permissions', '2024-06-09 09:21:40.733130'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-06-09 09:21:40.789786'),
(18, 'sessions', '0001_initial', '2024-06-09 09:21:40.955931'),
(20, 'recipe_manager', '0002_alter_recipe_directions_alter_recipe_ingredients_and_more', '2024-06-12 16:14:29.817034'),
(25, 'account', '0001_initial', '2024-06-29 17:14:18.772036'),
(26, 'account', '0002_email_max_length', '2024-06-29 17:14:19.028012'),
(27, 'account', '0003_alter_emailaddress_create_unique_verified_email', '2024-06-29 17:14:19.298956'),
(28, 'account', '0004_alter_emailaddress_drop_unique_email', '2024-06-29 17:14:27.031155'),
(29, 'account', '0005_emailaddress_idx_upper_email', '2024-06-29 17:14:27.155150'),
(30, 'account', '0006_emailaddress_lower', '2024-06-29 17:14:27.404164'),
(31, 'account', '0007_emailaddress_idx_email', '2024-06-29 17:14:27.651206'),
(32, 'account', '0008_emailaddress_unique_primary_email_fixup', '2024-06-29 17:14:27.833742'),
(33, 'account', '0009_emailaddress_unique_primary_email', '2024-06-29 17:14:27.944742'),
(34, 'sites', '0001_initial', '2024-06-29 17:14:28.236644'),
(35, 'sites', '0002_alter_domain_unique', '2024-06-29 17:14:28.421646'),
(36, 'socialaccount', '0001_initial', '2024-06-29 17:14:31.847021'),
(37, 'socialaccount', '0002_token_max_lengths', '2024-06-29 17:14:32.636981'),
(38, 'socialaccount', '0003_extra_data_default_dict', '2024-06-29 17:14:32.821981'),
(39, 'socialaccount', '0004_app_provider_id_settings', '2024-06-29 17:14:33.715968'),
(40, 'socialaccount', '0005_socialtoken_nullable_app', '2024-06-29 17:14:37.251895'),
(41, 'socialaccount', '0006_alter_socialaccount_extra_data', '2024-06-29 17:14:39.232664'),
(42, 'recipe_manager', '0003_tag_remove_recipe_tags', '2024-07-01 11:25:45.751868'),
(43, 'recipe_manager', '0004_recipe_tags', '2024-07-01 11:25:46.016657'),
(44, 'recipe_manager', '0005_remove_recipe_tags_delete_tag_recipe_tags', '2024-07-01 11:25:46.074953'),
(45, 'recipe_manager', '0006_alter_recipe_image', '2024-07-01 11:25:46.079951'),
(50, 'recipe_manager', '0001_initial', '2024-07-01 14:26:19.663719'),
(51, 'recipe_manager', '0002_alter_recipe_user', '2024-07-01 14:26:20.035554'),
(52, 'save_recipe', '0001_initial', '2024-07-10 11:50:28.962876');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7mfloxisae9pel2f2echy6gw48o8in50', '.eJxVjDsOwyAQRO9CHSHzW3DK9D4DgoUNTiKQjF1FuXtsyUVSzrw382Y-bGvxW8-LnxO7MgHs8lvGgM9cD5Ieod4bx1bXZY78UPhJO59ayq_b6f4dlNDLviZraXQanTNaa8yOpCURUUMW0aox04AyakUYaXDSBCAAiUrsQYAh9vkCDhE37Q:1sSgSD:TO3NYTm6bX_GFAiipfXPwQnFcezAYAed5kCFGoLFrK0', '2024-07-27 17:22:37.542279'),
('g6j1tmu99buum65em22k9pj4eb8chnlm', 'e30:1sOENT:5nuAw2yF_sE7HzLQoNiF8EQlycqQpf8En1buO68o5tk', '2024-07-15 10:35:19.256481'),
('oske5f253hhujffvx7j0iv5c7acn4m67', '.eJxVjDsOwyAQRO9CHSHzW3DK9D4DgoUNTiKQjF1FuXtsyUVSzrw382Y-bGvxW8-LnxO7MgHs8lvGgM9cD5Ieod4bx1bXZY78UPhJO59ayq_b6f4dlNDLviZraXQanTNaa8yOpCURUUMW0aox04AyakUYaXDSBCAAiUrsQYAh9vkCDhE37Q:1sQsNE:es5k390IlkUS3UFOKmVxPx26zfbgFC6QxcDmTSHxciQ', '2024-07-22 17:42:00.326428'),
('sqt1g3kxu7v7t9a1gw94bimeu50wlems', '.eJxVjDsOwjAQBe_iGlk2_sWU9DmDtfbu4gBypDipEHeHSCmgfTPzXiLBtta0dVrShOIitBGn3zFDeVDbCd6h3WZZ5rYuU5a7Ig_a5TgjPa-H-3dQoddvrRRYq533ANlHzSYUNkW5QMUbVOwGxWfkHGyk7EhZpBIDDA4jMxgj3h8HSTiZ:1sOaHH:O91Mt_ssEPT0qJKU-8xrxjJ19NyGELObzHhAIfgbkcM', '2024-07-16 09:58:23.610914'),
('w89323w38sujpzzfqo6a9saoar1j4uas', '.eJxVjDsOwjAQBe_iGlne-ENMSc8ZrM3uGgeQI8VJhbg7iZQC2jfz5q0SrktJa5M5jawuCkCdfscB6Sl1J_zAep80TXWZx0Hvij5o07eJ5XU93L9AwVa2d4AYDZKxgpbQCiFGYue86yBkgx45e9MHQhDrbQbPW9xDd84cemfU5wsZszhy:1sOEZe:VuDr-4H8cGXfqE4b7i1UYtrFcCGmryazBKyELb4FIAw', '2024-07-15 10:47:54.725589');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_manager_recipe`
--

CREATE TABLE `recipe_manager_recipe` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `ingredients` longtext NOT NULL,
  `directions` longtext NOT NULL,
  `time_required` longtext NOT NULL,
  `servings` int(11) NOT NULL,
  `tags` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipe_manager_recipe`
--

INSERT INTO `recipe_manager_recipe` (`id`, `title`, `description`, `image`, `ingredients`, `directions`, `time_required`, `servings`, `tags`, `created_at`, `updated_at`, `user_id`) VALUES
(2, 'Strawberry Shortcake', 'The cake is sliced in half and layered with sweet juicy strawberries and whipped cream for a delicious summer treat!', 'images/strawberry_cake.webp', '[\"6 cups fresh strawberries\", \"\\u2153 cup white sugar\", \"2 \\u00bc cups all-purpose flour\", \"\\u00bc cup white sugar\", \"1 tablespoon baking powder\", \"\\u00bc teaspoon salt\", \"\\u00bd cup butter cold unsalted butter\", \"1 large egg, lightly beaten\", \"2 teaspoons vanilla extract, divided\", \"1 \\u00bd cups whipped heavy cream\", \"\\u00bc cup powdered sugar\"]', '[\"Gather the ingredients.\", \"Preheat the oven to 425 degrees F (220 degrees C). Grease an 8-inch cake pan with butter and lightly dust with flour.\", \"Slice the strawberries and toss them with 1/3 cup of white sugar. Set aside.\", \"Combine flour, 1/4 cup of white sugar, baking powder, and salt in a medium bowl; cut in butter with a pastry blender or two knives until mixture resembles coarse crumbs. Make a well in the center of mixture; add beaten egg, half-and-half, and 1 teaspoon vanilla.  Stir mixture until just combined and no dry spots remain, being careful not to overmix.\", \"Spoon batter evenly into prepared cake pan.\", \"Bake in the preheated oven until a toothpick inserted into the cake comes out clean and top is golden brown, about 18 minutes. Let cool partially in cake pan, about 10 minutes. Flip cake onto a clean work surface.\", \"Meanwhile, beat heavy cream, powdered sugar, and remaining 1 teaspoon vanilla with an electric mixer on medium-high speed until soft peaks form, about 3 minutes. Set aside.\", \"Spread \\u00bd of whipped cream evenly over strawberries; place top cake layer over whipped cream. Top with remaining strawberries and whipped cream.\"]', '1 hr', 8, '[\"Birthday recipes\", \"Desserts\", \"Strawberry\"]', '2024-07-02 10:17:16.187431', '2024-07-02 10:17:16.187431', 15),
(3, 'Bubble Tea', 'It\'s simple to make but some of the ingredients may be a little tough to find. You can add flavor as you wish.', 'images/bubble.webp', '[\"1 teaspoon white sugar\", \"\\u2153 cup pearl tapioca\", \"1 cup brewed black tea\", \"2 tablespoons milk\", \"4 teaspoons white sugar\", \"1 cup ice cubes\"]', '[\"In a small saucepan, bring 2 cups water to a boil. Stir in 1 teaspoon sugar until it dissolves. Toss in the pearl tapioca. Cook for about 20 minutes. Rinse, drain, and refrigerate until chilled.\", \"Pour tea, milk, and 4 teaspoons sugar into a cocktail shaker. Stir until the sugar has dissolved and the milk is well mixed in. Add the ice cubes, and shake so the whole drink can get cold. Pour into a glass, and add tapioca.\"]', '1 hr', 1, '[\"Drinks\", \"Trendy drink\", \"Tea\"]', '2024-07-02 10:23:27.380078', '2024-07-02 10:23:27.380078', 15),
(4, 'Carrot Soup', 'This flavorful and fragrant carrot soup is a wonderful and healthy addition to any special dinner.', 'images/carrot.webp', '[\"3 pounds carrots, chopped\", \"6 cups chicken stock\", \"3 cloves garlic, chopped\", \"2 tablespoons dried dill weed\", \"\\u00bc pound butter\", \"1 \\u00bd teaspoons salt\"]', '[\"In a medium-sized stockpot, over high heat, combine chicken stock, carrots, garlic, dill weed, salt, and butter. Bring to a boil, reduce heat and simmer for 30 minutes or until carrots are soft.\", \"Puree soup in a blender; return to the stockpot and simmer for an additional 30 to 45 minutes. Season with additional dill or garlic if needed.\"]', '30 mins', 6, '[\"Healthy\", \"Soup\"]', '2024-07-02 10:26:18.793784', '2024-07-02 10:26:18.793784', 15),
(5, 'Peach Ice Cream', 'This peach ice cream is easy to make at home and the best you\'ll ever eat!', 'images/peach.webp', '[\"2 \\u00bd pounds fresh peaches - peeled, pitted and chopped\", \"1 pint half-and-half cream\", \"\\u00bd cup white sugar\", \"1 (14 ounce) can sweetened condensed milk\", \"1 (12 fluid ounce) can evaporated milk\", \"1 teaspoon vanilla extract\", \"2 cups whole milk, or as needed\"]', '[\"Gather all ingredients.\", \"Working in batches, pur\\u00e9e peaches with half-and-half and sugar in a blender or food processor.\", \"Mix peach mixture, sweetened condensed milk, evaporated milk, and vanilla in a gallon ice cream freezer container. Pour enough whole milk into the container to reach the fill line, about 2 cups. Pour mixture into an ice cream maker.\", \"Freeze according to manufacturer\'s instructions, about 20 minutes. Transfer to an airtight container and freeze until firm, about 4 hours.\"]', '4 hrs 35 mins', 32, '[\"Desserts\", \"Summer recipes\"]', '2024-07-02 10:31:23.994809', '2024-07-02 10:31:23.994809', 15),
(10, 'Mojito', 'Mojito is a very refreshing drink for hot summer days.', 'images/mojito.jpg', '[\"10 fresh mint leaves\", \"\\u00bd medium lime, cut into 3 wedges, divided\", \"2 tablespoons white sugar, or to taste\", \"1 cup ice cubes, or as needed\", \"1 \\u00bd fluid ounces white rum\", \"\\u00bd cup club soda, or as needed\"]', '[\"Place mint leaves and 1 lime wedge into a sturdy glass. Use a muddler and crush to release mint oils and lime juice.\", \"Add remaining lime wedges and 2 tablespoons sugar, and muddle again to release the lime juice. Do not strain the mixture.\", \"Fill the glass almost to the top with ice.\", \"Pour in rum and fill the glass with club soda.\", \"Stir, taste, and add more sugar if desired.\"]', '10 mind', 1, '[\"Drinks\", \"Summer Recipes\"]', '2024-07-04 16:37:36.968899', '2024-07-04 16:40:21.074576', 13),
(11, 'Homemade Sushi', 'Sushi rolls can be filled with any ingredients you choose. Try smoked salmon instead of imitation crabmeat. Serve with teriyaki sauce and wasabi.', 'images/sushi.webp', '[\"1 \\u2153 cups water\", \"\\u2154 cup uncooked short-grain white rice\", \"3 tablespoons rice vinegar\", \"3 tablespoons white sugar\", \"1 \\u00bd teaspoons salt\", \"4 sheets nori seaweed sheets\", \"\\u00bd pound imitation crabmeat, flaked\", \"1 avocado - peeled, pitted, and sliced\", \"\\u00bd cucumber, peeled, cut into small strips\", \"2 tablespoons pickled ginger\"]', '[\"Gather all ingredients. Preheat the oven to 300 degrees F (150 degrees C).\", \"Bring water to a boil in a medium pot; stir in rice. Reduce heat to medium-low, cover, and simmer until rice is tender and water has been absorbed, 20 to 25 minutes.\", \"Mix rice vinegar, sugar, and salt in a small bowl. Gently stir into cooked rice in the pot and set aside.\", \"Lay nori sheets on a baking sheet.\", \"Heat nori in the preheated oven until warm, 1 to 2 minutes.\", \"Center 1 nori sheet on a bamboo sushi mat. Use wet hands to spread a thin layer of rice on top. Arrange 1/4 of the crabmeat, avocado, cucumber, and pickled ginger over rice in a line down the center.\", \"Lift one end of the mat and roll it tightly over filling to make a complete roll. Repeat with remaining ingredients.\", \"Use a wet, sharp knife to cut each roll into 4 to 6 slices.\"]', '1 hr 10 mins', 8, '[\"Seafood\", \"Japanese\"]', '2024-07-04 16:52:02.423271', '2024-07-04 16:52:02.423271', 14),
(12, 'Butter Chicken', 'This butter chicken recipe is one of my favorite Indian dishes. It features a full-flavored sauce that complements the chicken well.', 'images/Easy-Butter-Chicken-TIMG.jpg', '[\"2 tablespoons peanut oil, divided\", \"1 shallot, finely chopped\", \"\\u00bc white onion, chopped\", \"2 tablespoons butter\", \"1 tablespoon ginger garlic paste\", \"2 teaspoons lemon juice\", \"2 teaspoons garam masala, divided\", \"1 teaspoon chili powder\", \"1 teaspoon ground cumin\", \"1 cup tomato puree\", \"\\u00bc cup plain yogurt\", \"1 pinch salt and ground black pepper to taste\", \"1 pound boneless, skinless chicken thighs, cut into bite-size pieces\", \"\\u00bc teaspoon cayenne pepper, or to taste\", \"\\u00bc cup water\"]', '[\"Heat 1 tablespoon oil in a large saucepan over medium-high heat. Saut\\u00e9 shallot and onion until soft and translucent, about 5 minutes.\", \"Stir in butter, ginger-garlic paste, lemon juice, 1 teaspoon garam masala, chili powder, cumin, and bay leaf. Cook and stir for 1 minute. Add tomato sauce, and cook for 2 minutes, continuing to frequently stir.\", \"Stir in half-and-half and yogurt. Reduce heat to low, and simmer for 10 minutes, frequently stirring. Season with salt and pepper. Remove from heat and set aside.\", \"Heat remaining 1 tablespoon oil in a large heavy skillet over medium heat. Cook chicken until lightly browned, about 10 minutes.\", \"Reduce heat, and season with remaining 1 teaspoon garam masala and cayenne. Stir in a few spoonfuls of sauce, and simmer until liquid has reduced, and chicken is no longer pink. Add cooked chicken into sauce and stir together.\", \"Dissolve cornstarch into water, then mix into the sauce. Cook for 5 to 10 minutes, or until thickened.\", \"Serve over rice with naan.\"]', '35 mins', 4, '[\"Chicken\", \"Indian recipes\", \"Non - veg recipes\"]', '2024-07-05 09:24:32.410282', '2024-07-05 09:24:32.410282', 13),
(13, 'Air Fryer Potato Chips', 'Use your air fryer to make these yummy sweet potato chips.', 'images/p.webp', '[\"1 large (8 ounces) sweet potato\", \"1 tablespoon canola oil\", \"1/4 teaspoon sea salt\", \"1/4 teaspoon freshly ground black pepper\", \"cooking spray\"]', '[\"Slice potato into 1/16-inch-thick rounds using a mandoline. Put potato slices in a large bowl of cold water; soak about 20 minutes. Drain and pat dry with paper towels. Wipe out bowl.\", \"Return potato slices to dried bowl. Add oil, salt, and pepper; toss gently to coat.\", \"Preheat air fryer to 350 degrees F (175 degrees C). Lightly coat air fryer basket with cooking spray. Working in batches if needed, arrange potato slices in an even layer in basket (do not overcrowd).\", \"Cook until lightly golden and crispy, 12 to 16 minutes, turning and rearranging chips into an even layer every 4 minutes. Watch closely during the last 2 to 3 minutes of cooking. Check chips about every 30 seconds, using tongs to remove golden chips from the basket as needed to avoid overcooking and ending up with bitter chips.\", \"Let chips cool about 5 minutes. Chips will continue to crisp as they cool. Store in an airtight container up to 3 days.\"]', '40 mins', 4, '[\"Chips\", \"Snacks\", \"Low - fat recipes\", \"Low - calorie recipes\"]', '2024-07-05 09:28:43.176373', '2024-07-05 09:28:43.176373', 12),
(15, 'Omlette', 'Here\'s everything you need to know how to pull off a perfect omlette at home.', 'images/omlette.jfif', '[\"2 large eggs\", \"Salt and pepper to taste\", \"Butter or oil for cooking\"]', '[\"Beat eggs with salt and pepper until well combined.\", \"Heat butter or oil in a pan.\", \"Pour eggs into the pan until the edges start to set.\"]', '10 mins', 1, '[\"Breakfast recipes\", \"Easy recipes\"]', '2024-07-08 17:42:00.083433', '2024-07-08 17:42:00.083433', 16),
(16, 'Mango Lassi', 'This is a very refreshing summer drink and takes little effort to make as well.', 'images/Mango-lassi.jpg', '[\"Qui iure laborum Do\", \"Harum rem dolore fug\", \"Porro occaecat nihil\", \"Perferendis aperiam\"]', '[\"Fugiat eum totam eni\", \"Repudiandae mollitia\", \"Tempora sed non libe\", \"Molestiae dolor modi\"]', '10 mins', 1, '[\"Drinks\", \"Summer recipes\"]', '2024-07-13 17:13:57.040391', '2024-07-13 17:13:57.040391', 17),
(17, 'Garlic Butter Shrimp', 'Garlic Butter Shrimp is a savory dish where tender shrimp are  sautéed in a flavorful mixture of butter and minced garlic.', 'images/shrimp.jpg', '[\"Distinctio Voluptat\", \"In amet irure provi\", \"Voluptate non nostru\", \"Eveniet veniam vel\", \"Qui ut nesciunt vol\", \"Accusantium laborum\"]', '[\"Itaque tempor labore\", \"Quod et in officiis\", \"Consectetur consequ\", \"Quaerat id sunt al\"]', '1 hr 40 mins', 3, '[\"Seafood\", \"Non - veg recipes\"]', '2024-07-13 17:21:48.257966', '2024-07-13 17:21:48.257966', 16);

-- --------------------------------------------------------

--
-- Table structure for table `save_recipe_favorite`
--

CREATE TABLE `save_recipe_favorite` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `recipe_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `save_recipe_favorite`
--

INSERT INTO `save_recipe_favorite` (`id`, `created_at`, `recipe_id`, `user_id`) VALUES
(7, '2024-07-11 10:41:28.137405', 3, 13),
(8, '2024-07-11 11:29:22.470336', 3, 15),
(10, '2024-07-11 11:29:58.438020', 5, 15),
(11, '2024-07-11 11:30:15.350509', 10, 15),
(21, '2024-07-11 16:31:05.057926', 11, 12),
(25, '2024-07-12 11:14:36.581423', 4, 13),
(26, '2024-07-12 11:14:45.319460', 5, 13),
(27, '2024-07-12 11:17:29.564094', 2, 13),
(28, '2024-07-12 11:19:40.532486', 13, 13),
(31, '2024-07-12 11:25:35.756337', 15, 13),
(32, '2024-07-12 11:27:11.294787', 11, 13),
(33, '2024-07-12 14:07:10.058920', 10, 16),
(36, '2024-07-12 14:32:06.917049', 2, 14),
(39, '2024-07-12 14:58:35.122749', 5, 17),
(41, '2024-07-13 17:22:37.503017', 17, 16);

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialaccount`
--

CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL,
  `provider` varchar(200) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`extra_data`)),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp`
--

CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `provider_id` varchar(200) NOT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`settings`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp_sites`
--

CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint(20) NOT NULL,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialtoken`
--

CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  ADD KEY `account_emailaddress_email_03be32b2` (`email`);

--
-- Indexes for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

--
-- Indexes for table `recipe_manager_recipe`
--
ALTER TABLE `recipe_manager_recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_manager_recipe_user_id_7f6c5392_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `save_recipe_favorite`
--
ALTER TABLE `save_recipe_favorite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `save_recipe_favorite_user_id_recipe_id_06b09f66_uniq` (`user_id`,`recipe_id`),
  ADD KEY `save_recipe_favorite_recipe_id_93dd245b_fk_recipe_ma` (`recipe_id`);

--
-- Indexes for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  ADD KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  ADD KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`);

--
-- Indexes for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  ADD KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `recipe_manager_recipe`
--
ALTER TABLE `recipe_manager_recipe`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `save_recipe_favorite`
--
ALTER TABLE `save_recipe_favorite`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `recipe_manager_recipe`
--
ALTER TABLE `recipe_manager_recipe`
  ADD CONSTRAINT `recipe_manager_recipe_user_id_7f6c5392_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `save_recipe_favorite`
--
ALTER TABLE `save_recipe_favorite`
  ADD CONSTRAINT `save_recipe_favorite_recipe_id_93dd245b_fk_recipe_ma` FOREIGN KEY (`recipe_id`) REFERENCES `recipe_manager_recipe` (`id`),
  ADD CONSTRAINT `save_recipe_favorite_user_id_58fcd2d6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  ADD CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Constraints for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  ADD CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
