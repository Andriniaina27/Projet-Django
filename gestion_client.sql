-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 20 sep. 2025 à 16:44
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_client`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_permission`
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
(25, 'Can add type forfait', 7, 'add_typeforfait'),
(26, 'Can change type forfait', 7, 'change_typeforfait'),
(27, 'Can delete type forfait', 7, 'delete_typeforfait'),
(28, 'Can view type forfait', 7, 'view_typeforfait'),
(29, 'Can add forfait', 8, 'add_forfait'),
(30, 'Can change forfait', 8, 'change_forfait'),
(31, 'Can delete forfait', 8, 'delete_forfait'),
(32, 'Can view forfait', 8, 'view_forfait'),
(33, 'Can add client', 9, 'add_client'),
(34, 'Can change client', 9, 'change_client'),
(35, 'Can delete client', 9, 'delete_client'),
(36, 'Can view client', 9, 'view_client'),
(37, 'Can add abonnement', 10, 'add_abonnement'),
(38, 'Can change abonnement', 10, 'change_abonnement'),
(39, 'Can delete abonnement', 10, 'delete_abonnement'),
(40, 'Can view abonnement', 10, 'view_abonnement');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$YXmt3vDpPVBq8uswyBSDg3$TwdXWysnVT+A5fT85wJN1IxgMYKdnWKs4zePsWEPgpk=', '2025-09-20 14:11:44.524294', 1, 'Admnistrateur', '', '', 'ranaivoluca3@gmail.com', 1, 1, '2025-08-31 13:03:12.883048'),
(6, 'pbkdf2_sha256$600000$hYYJf2Yp870WxVAhrsLPGR$YnOs03bKk5rsQzwrgxJ+STCxN/znH7HdE7vaCRpzA2g=', '2025-09-20 14:02:07.220705', 0, 'Antsa', 'Fitiavana', '', 'fitiavana@gmail.com', 0, 1, '2025-09-14 13:55:30.991109'),
(7, 'pbkdf2_sha256$600000$WkK5LSOoDIhJzVVe0GXzPU$0jOp8at0uL7Jtxax4CdfK1IB8I+NCRMORUSOn3UE1oI=', '2025-09-20 12:56:43.578110', 0, 'Andriniaina', 'Luca', '', 'ranaivoluca@gmail.com', 0, 1, '2025-09-14 13:57:24.646175');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(10, 'gestion_client', 'abonnement'),
(9, 'gestion_client', 'client'),
(8, 'gestion_client', 'forfait'),
(7, 'gestion_client', 'typeforfait'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-08-20 12:18:07.306853'),
(2, 'auth', '0001_initial', '2025-08-20 12:18:21.660642'),
(3, 'admin', '0001_initial', '2025-08-20 12:18:24.999559'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-08-20 12:18:25.103226'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-08-20 12:18:25.191913'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-08-20 12:18:26.795443'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-08-20 12:18:29.213754'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-08-20 12:18:29.470035'),
(9, 'auth', '0004_alter_user_username_opts', '2025-08-20 12:18:29.581015'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-08-20 12:18:31.206441'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-08-20 12:18:31.292909'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-08-20 12:18:31.456889'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-08-20 12:18:31.748194'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-08-20 12:18:32.014002'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-08-20 12:18:32.337007'),
(16, 'auth', '0011_update_proxy_permissions', '2025-08-20 12:18:32.472380'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-08-20 12:18:32.865087'),
(18, 'gestion_client', '0001_initial', '2025-08-20 12:18:41.980298'),
(19, 'sessions', '0001_initial', '2025-08-20 12:18:43.760456');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('v08161k9vqvvuuqgxrjpebkm3t6h81ki', '.eJxVjEEOwiAQRe_C2pAABQaX7j0DmRlGqRqalHbVeHdt0oVu_3vvbyrjutS8dpnzWNRZGXX63Qj5KW0H5YHtPmme2jKPpHdFH7Tr61TkdTncv4OKvX5r4JiAokCwIWDy4CzcuAgPvuBQHCcDCUkiiHFgyTohYvQcKJKgUe8P6ek4qA:1utQJf:eeQGkEIBaYHWod3WEPl-blqFUAF-Yxvl_P2kJajmRRg', '2025-09-16 12:40:51.067068');

-- --------------------------------------------------------

--
-- Structure de la table `gestion_client_abonnement`
--

CREATE TABLE `gestion_client_abonnement` (
  `id` bigint(20) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `est_actif` tinyint(1) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `forfait_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gestion_client_abonnement`
--

INSERT INTO `gestion_client_abonnement` (`id`, `date_debut`, `date_fin`, `est_actif`, `client_id`, `forfait_id`) VALUES
(1, '2025-08-18', '2025-08-21', 1, 5, 1),
(2, '2025-09-18', '2025-09-20', 1, 5, 3),
(3, '2025-09-18', '2025-10-03', 1, 6, 7),
(4, '2025-07-18', '2025-07-21', 1, 5, 5),
(5, '2025-07-10', '2025-07-12', 1, 5, 4),
(6, '2025-06-18', '2025-06-21', 1, 6, 5),
(7, '2025-08-10', '2025-08-12', 1, 5, 3),
(8, '2025-09-20', '2025-09-22', 1, 6, 3),
(9, '2025-09-20', '2025-09-22', 1, 5, 3);

-- --------------------------------------------------------

--
-- Structure de la table `gestion_client_client`
--

CREATE TABLE `gestion_client_client` (
  `id` bigint(20) NOT NULL,
  `numero_tel` varchar(13) NOT NULL,
  `cin` varchar(12) NOT NULL,
  `date_naissance` date NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `last_activity` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gestion_client_client`
--

INSERT INTO `gestion_client_client` (`id`, `numero_tel`, `cin`, `date_naissance`, `photo`, `last_activity`, `user_id`) VALUES
(5, '0331234566', '111222333444', '2003-09-12', 'clients/received_580784318403873.jpeg', '2025-09-14 13:55:31.989192', 6),
(6, '0383619603', '117173980120', '2004-10-27', 'clients/206836265.jpg', '2025-09-14 13:57:25.683790', 7);

-- --------------------------------------------------------

--
-- Structure de la table `gestion_client_forfait`
--

CREATE TABLE `gestion_client_forfait` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `data_mo` int(11) NOT NULL,
  `minutes` int(11) NOT NULL,
  `sms` int(11) NOT NULL,
  `prix` decimal(6,2) NOT NULL,
  `duree_jours` int(11) NOT NULL,
  `type_forfait_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gestion_client_forfait`
--

INSERT INTO `gestion_client_forfait` (`id`, `nom`, `data_mo`, `minutes`, `sms`, `prix`, `duree_jours`, `type_forfait_id`) VALUES
(1, 'Forfait Maxi', 30, 60, 100, 1000.00, 3, 1),
(3, 'Forfait Spécial WeekEnd', 25, 20, 50, 500.00, 2, 1),
(4, 'Internet WeekEnd', 1000, 0, 0, 1000.00, 2, 2),
(5, 'Internet Milay', 2000, 0, 0, 2000.00, 4, 2),
(7, 'Internet prom', 5000, 0, 0, 5000.00, 15, 2),
(8, 'Appel famille', 10, 40, 200, 5000.00, 15, 1);

-- --------------------------------------------------------

--
-- Structure de la table `gestion_client_typeforfait`
--

CREATE TABLE `gestion_client_typeforfait` (
  `id` bigint(20) NOT NULL,
  `type_forfait` varchar(100) NOT NULL,
  `desc_forfait` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gestion_client_typeforfait`
--

INSERT INTO `gestion_client_typeforfait` (`id`, `type_forfait`, `desc_forfait`) VALUES
(1, 'Forfait Complet', 'Complet(Appel, SMS et data)'),
(2, 'Forfait Internet', 'Uniquement pour l\'internet');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `gestion_client_abonnement`
--
ALTER TABLE `gestion_client_abonnement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gestion_client_abonn_client_id_67721137_fk_gestion_c` (`client_id`),
  ADD KEY `gestion_client_abonn_forfait_id_ead6d093_fk_gestion_c` (`forfait_id`);

--
-- Index pour la table `gestion_client_client`
--
ALTER TABLE `gestion_client_client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Index pour la table `gestion_client_forfait`
--
ALTER TABLE `gestion_client_forfait`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gestion_client_forfa_type_forfait_id_82f900bb_fk_gestion_c` (`type_forfait_id`);

--
-- Index pour la table `gestion_client_typeforfait`
--
ALTER TABLE `gestion_client_typeforfait`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `gestion_client_abonnement`
--
ALTER TABLE `gestion_client_abonnement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `gestion_client_client`
--
ALTER TABLE `gestion_client_client`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `gestion_client_forfait`
--
ALTER TABLE `gestion_client_forfait`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `gestion_client_typeforfait`
--
ALTER TABLE `gestion_client_typeforfait`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `gestion_client_abonnement`
--
ALTER TABLE `gestion_client_abonnement`
  ADD CONSTRAINT `gestion_client_abonn_client_id_67721137_fk_gestion_c` FOREIGN KEY (`client_id`) REFERENCES `gestion_client_client` (`id`),
  ADD CONSTRAINT `gestion_client_abonn_forfait_id_ead6d093_fk_gestion_c` FOREIGN KEY (`forfait_id`) REFERENCES `gestion_client_forfait` (`id`);

--
-- Contraintes pour la table `gestion_client_client`
--
ALTER TABLE `gestion_client_client`
  ADD CONSTRAINT `gestion_client_client_user_id_1ee56a85_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `gestion_client_forfait`
--
ALTER TABLE `gestion_client_forfait`
  ADD CONSTRAINT `gestion_client_forfa_type_forfait_id_82f900bb_fk_gestion_c` FOREIGN KEY (`type_forfait_id`) REFERENCES `gestion_client_typeforfait` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
