SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for website_alert_messages
-- ----------------------------
DROP TABLE IF EXISTS `website_alert_messages`;
CREATE TABLE `website_alert_messages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `message` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Unacceptable for the Hotel Management',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of website_alert_messages
-- ----------------------------
INSERT INTO `website_alert_messages` VALUES (1, 'Use of language', 'Watch your language! You will be banned on repeated occasions.');
INSERT INTO `website_alert_messages` VALUES (2, 'Act as Staff', 'Acting as Staff is against the rules. You will be banned on repeated occasions.');
INSERT INTO `website_alert_messages` VALUES (3, 'Talking about retro hotels', 'Talking about retro hotels is against the rules! At repetition you will be banned.');
INSERT INTO `website_alert_messages` VALUES (4, 'Requesting/giving away personal information', 'Asking/giving away personal data is against the rules! You will be banned on repeated occasions.');
INSERT INTO `website_alert_messages` VALUES (5, 'Ask/give away Social Media', 'Ask/giving away snapchat, insta or other Social Media is against the rules! You will be banned on repeated occasions.');
INSERT INTO `website_alert_messages` VALUES (6, 'Unacceptable language/behavior', 'Unacceptable language/behavior is against the rules! You will be banned on repeated occasions.');
INSERT INTO `website_alert_messages` VALUES (7, 'Harassment', 'Don\'t bother other players! You will be banned on repeated occasions.');
INSERT INTO `website_alert_messages` VALUES (8, 'Sexual conversations/behaviors', 'Sexual conversations or behaviors are against the rules! You will be banned on repeated occasions.');

-- ----------------------------
-- Table structure for website_ban_messages
-- ----------------------------
DROP TABLE IF EXISTS `website_ban_messages`;
CREATE TABLE `website_ban_messages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Unacceptable for the Hotel Management',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of website_ban_messages
-- ----------------------------
INSERT INTO `website_ban_messages` VALUES (1, 'Advertising for Retro Hotels');
INSERT INTO `website_ban_messages` VALUES (2, 'Highlight one or more players');
INSERT INTO `website_ban_messages` VALUES (3, 'Illegal activities');
INSERT INTO `website_ban_messages` VALUES (4, 'Hate speech/discrimination');
INSERT INTO `website_ban_messages` VALUES (5, 'Pedophile activities');
INSERT INTO `website_ban_messages` VALUES (6, 'Requesting/giving away personal information');
INSERT INTO `website_ban_messages` VALUES (7, 'Ask/giving away snapchat, insta or other Social Media');
INSERT INTO `website_ban_messages` VALUES (8, 'Harassment/unacceptable language or behavior');
INSERT INTO `website_ban_messages` VALUES (9, 'Order disturbance');
INSERT INTO `website_ban_messages` VALUES (10, 'Embarrassing sexual behaviors');
INSERT INTO `website_ban_messages` VALUES (11, 'Requesting/offering webscam sex or sexual images');
INSERT INTO `website_ban_messages` VALUES (12, 'Threat of one or more players with ddos/hack/expose');
INSERT INTO `website_ban_messages` VALUES (13, 'Act as Staff');
INSERT INTO `website_ban_messages` VALUES (14, 'Username in violation of the rules');

-- ----------------------------
-- Table structure for website_ban_types
-- ----------------------------
DROP TABLE IF EXISTS `website_ban_types`;
CREATE TABLE `website_ban_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seconds` int(10) NOT NULL DEFAULT 7200,
  `message` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `min_rank` int(10) NOT NULL DEFAULT 6,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `min_rank`(`min_rank`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of website_ban_types
-- ----------------------------
INSERT INTO `website_ban_types` VALUES (1, 7200, '2 hours', 4);
INSERT INTO `website_ban_types` VALUES (2, 14400, '4 hours', 4);
INSERT INTO `website_ban_types` VALUES (3, 28800, '8 hours', 4);
INSERT INTO `website_ban_types` VALUES (4, 43200, '12 hours', 4);
INSERT INTO `website_ban_types` VALUES (5, 86400, '1 day', 6);
INSERT INTO `website_ban_types` VALUES (6, 259200, '3 days', 6);
INSERT INTO `website_ban_types` VALUES (7, 604800, '1 week', 6);
INSERT INTO `website_ban_types` VALUES (8, 2629743, '1 month', 6);
INSERT INTO `website_ban_types` VALUES (9, 7889231, '3 months', 6);
INSERT INTO `website_ban_types` VALUES (10, 946707780, 'permanent', 6);

-- ----------------------------
-- Table structure for website_bans_asn
-- ----------------------------
DROP TABLE IF EXISTS `website_bans_asn`;
CREATE TABLE `website_bans_asn`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asn` int(11) NOT NULL,
  `host` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `added_by` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `asn`(`asn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for website_feeds
-- ----------------------------
DROP TABLE IF EXISTS `website_feeds`;
CREATE TABLE `website_feeds`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_user_id` int(11) NOT NULL,
  `message` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `is_hidden` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for website_feeds_likes
-- ----------------------------
DROP TABLE IF EXISTS `website_feeds_likes`;
CREATE TABLE `website_feeds_likes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `feed_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for website_feeds_reactions
-- ----------------------------
DROP TABLE IF EXISTS `website_feeds_reactions`;
CREATE TABLE `website_feeds_reactions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_id` int(11) NOT NULL,
  `message` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `is_hidden` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for website_forum_likes
-- ----------------------------
DROP TABLE IF EXISTS `website_forum_likes`;
CREATE TABLE `website_forum_likes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for website_helptool_categories
-- ----------------------------
DROP TABLE IF EXISTS `website_helptool_categories`;
CREATE TABLE `website_helptool_categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for website_helptool_faq
-- ----------------------------
DROP TABLE IF EXISTS `website_helptool_faq`;
CREATE TABLE `website_helptool_faq`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category` int(11) NOT NULL DEFAULT 0,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `author` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category`(`category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for website_helptool_logs
-- ----------------------------
DROP TABLE IF EXISTS `website_helptool_logs`;
CREATE TABLE `website_helptool_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `target` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `value` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `type` enum('CHANGE','SEND') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `player_id`(`player_id`) USING BTREE,
  INDEX `target`(`target`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for website_helptool_reactions
-- ----------------------------
DROP TABLE IF EXISTS `website_helptool_reactions`;
CREATE TABLE `website_helptool_reactions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NULL DEFAULT NULL,
  `practitioner_id` int(11) NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `timestamp` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for website_helptool_requests
-- ----------------------------
DROP TABLE IF EXISTS `website_helptool_requests`;
CREATE TABLE `website_helptool_requests`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `player_id` int(11) NULL DEFAULT 0,
  `ip_address` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `status` enum('closed','open','in_treatment','wait_reply') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'open',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for website_jobs
-- ----------------------------
DROP TABLE IF EXISTS `website_jobs`;
CREATE TABLE `website_jobs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `small_description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `full_description` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for website_jobs_applys
-- ----------------------------
DROP TABLE IF EXISTS `website_jobs_applys`;
CREATE TABLE `website_jobs_applys`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `message` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `available_monday` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `available_tuesday` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `available_wednesday` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `available_thursday` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `available_friday` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `available_saturday` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `available_sunday` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('open','closed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for website_news
-- ----------------------------
DROP TABLE IF EXISTS `website_news`;
CREATE TABLE `website_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `short_story` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `full_story` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` int(11) NOT NULL DEFAULT 0,
  `header` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `category` int(4) NOT NULL DEFAULT 0,
  `form` enum('none','photo','badge','look','word') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'none',
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `hidden` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `slug`(`slug`) USING BTREE,
  INDEX `timestamp`(`timestamp`) USING BTREE,
  INDEX `hidden`(`hidden`) USING BTREE,
  INDEX `category`(`category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of website_news
-- ----------------------------
INSERT INTO `website_news` VALUES (1, 'welcome-to-cosmic', 'Welcome to Cosmic', 'Curious about Cosmic\'s functions? Then be sure to read this!', '<p>Hey you! Who the hell are you?! Are you using CosmicCMS?!<br /><br />You managed to get Cosmic working!<br /><br />Our team has worked very hard on Cosmic to keep the installation as easy as possible. Cosmic has been specially developed with a new proprietary written Framework. So it\'s normal that you won\'t know how everything works yet, hence the installation in the beginning!<br /><br />Cosmic offers many functions, all of which are easy to use. Just think of adding currency ids, adding and editing furniture, managing the FAQ, managing and answering help tickets, VPN control, remote control (RCON), and much more!<br /><br />Since Cosmic already has the basic functions, you won\'t have to add anything yourself, but of course you can! Though you will have to learn the Framework first. We have thought about this as well. Our team has provided a documentation that will allow you to write new features in our Framework within minutes/hours/days/weeks! This depends on the skills you already have!<br /><br />Unfortunately Cosmic only works on Arcturus Morningstar, this means that you cannot set Cosmic to Plus Emulator/Comet Server or R63 Emulators. Now the question is, can I also use Cosmic on the normal Arcturus or upcoming Sirius Emulator? We advise you not to do this as some functions may differ between these emulators. If you don\'t want to use Arcturus Morningstar anyway, you\'ll have to convert Cosmic to the emulator you love!<br /><br />Cosmic is composed of about 34.4% JavaScript, 32.3% PHP, 20% HTML and 13.3% CSS. Now you will think, why is Cosmic almost half made of JavaScript? Cosmic wouldn\'t work without this JavaScript, because we made sure that you only need to load Cosmic once and you can control all functions without refresh! This also ensures that we can use a hotel that can stay open. This makes it easier to switch between website and hotel, but also to control the functions, since we can use notifications without refreshing the page and because of this your data is gone!<br /><br />Cosmic also has a shop and forum! In the shop you can buy GOTW-Points via paypal and/or phone, and you can buy vip with GOTW-Points! This can all be set via housekeeping. Because of the RCON system built into Cosmic, the user who buys GOTW-Points or vip doesn\'t have to leave the hotel or log in. Everything happens automatically and you immediately receive your GOTW-Points and/or vip! After the purchase the user can view their purchase / purchases through the purchase history page. The forum also offers multiple functions. You can create topics, respond to topics, like topics, report topics, pin messages, ... Members can ask questions or offer information that is useful for other members. The categories and so on can all be created/adjusted in the housekeeping.<br /><br />Cosmic also has a photo page. Here you can see all the nice pictures of members taken in the hotel. If you think there is a picture you really like, you can also give it a like. Or maybe a photo that is inappropriate does not belong on the page, you can report it and the team will delete it.<br /><br />With Cosmic we try to offer our members a nice environment. Because of the many features that Cosmic offers, this has certainly succeeded! You no longer need to communicate only through the hotel, but you can also do so through the forum, or if you have a try through the help tool. Parents will also be able to reach the team easily and they will gain more confidence in the hotel.<br /><br />Cosmic also owns a number of info pages. Just think of the general terms and conditions, the rules, a privacy statement, cookie policy and a guide for parents. All this to create the best playing experience for the members.<br /><br />Our team has also thought about the security of your account. You can use Google Authenticator. But what is that now? Google Authenticator provides a 6-digit code with which you can login to your account. This code is asked when your username and password are entered correctly. The code you get is changed every X number of seconds to ensure the security of your account. If you can\'t get this code anymore, because your phone is broken or for any reason, you can restore it via Google itself or you can report this to the team and they will reopen your account so you can get back in (if this is your account of course).<br /><br />When you visit a user\'s profile, you can see different things: which badges he/she has, who his/her friends are, in which groups he/she sits, which rooms he/she has taken and which photos he/she has taken. You will also find a guestbook on each profile page. If you want to let a user know something small, you can write it in the guestbook. Or you can let them know on your own profile what you are doing at that moment.<br /><br />The settings of your account also offer some special features: Can other users see your profile? Can other users see when you were last online or when you are online? Can other users add you at the hotel or follow you to other rooms? It\'s all possible! As an employee you also have the possibility not to show yourself on the employee page.<br /><br />If all this is not enough, you also have a very large and extensive housekeeping! In the beginning of this message a number of functions are already explained. The housekeeping has been developed in such a way that you hardly need to search your database for data. Because of the RCON system we were able to add some extra functions, like sending alerts, banning users, ... You can create permissions, manage rooms, manage users, block VPN\'s using ASN, manage the word filter, view chatlogs/banlogs/stafflogs, manage help tickets, manage FAQ\'s, manage the feed, manage news, shop and catalogue! As an administrator you can easily assign all these permissions to different ranks. All pages have different permissions, which can be found under the permissions tab in the menu.<br /><br />Changing your password is also no problem due to the implemented e-mail system. Users can request their password and will receive an e-mail in the inbox. There is a link in the inbox that allows them to change their password. You should make sure you use a secure mail server, so that your email is not spamming, as this can cause confusion for some users and/or parents.<br /><br />This was it for the explanation of Cosmic. We hope you\'re sufficiently informed about Cosmic. If you have any questions, you can always visit our Discord. The support team is always ready to answer any questions you might have.<br /><br />We wish you a lot of fun using Cosmic!<br /><br />- Cosmic support team</p>', 'https://images.habbo.com/c_images/Security/safetytips1_n.png', 1, 'https://images.habbo.com/web_images/habbo-web-articles/lpromo_Easter_Comeback.png', 1, 'none', 1536203060, '0');

-- ----------------------------
-- Table structure for website_news_categories
-- ----------------------------
DROP TABLE IF EXISTS `website_news_categories`;
CREATE TABLE `website_news_categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `category`(`category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of website_news_categories
-- ----------------------------
INSERT INTO `website_news_categories` VALUES (1, 'Updates');
INSERT INTO `website_news_categories` VALUES (2, 'Fixes');
INSERT INTO `website_news_categories` VALUES (3, 'Events');

-- ----------------------------
-- Table structure for website_news_reactions
-- ----------------------------
DROP TABLE IF EXISTS `website_news_reactions`;
CREATE TABLE `website_news_reactions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL DEFAULT 0,
  `news_id` int(11) NULL DEFAULT NULL,
  `player_id` int(11) NULL DEFAULT NULL,
  `message` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hidden` int(11) NULL DEFAULT 0,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for website_password_reset
-- ----------------------------
DROP TABLE IF EXISTS `website_password_reset`;
CREATE TABLE `website_password_reset`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `email` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ip_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0.0.0.0',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for website_permissions
-- ----------------------------
DROP TABLE IF EXISTS `website_permissions`;
CREATE TABLE `website_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'housekeeping_',
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of website_permissions
-- ----------------------------
INSERT INTO `website_permissions` VALUES (1, 'housekeeping', 'Player has access to the housekeeping.');
INSERT INTO `website_permissions` VALUES (2, 'housekeeping_remote_control', 'Player is able to nd may adjust other players account information, except the ranks.');
INSERT INTO `website_permissions` VALUES (3, 'housekeeping_ban_user', 'Player is able to ban users from the control panel. A rank system is included in this permission.');
INSERT INTO `website_permissions` VALUES (4, 'housekeeping_ban_logs', 'Player is able to view which players have been denied access to the hotel');
INSERT INTO `website_permissions` VALUES (5, 'housekeeping_staff_logs', 'Player is able to view all loggings that staffs have committed in the cms');
INSERT INTO `website_permissions` VALUES (6, 'housekeeping_chat_logs', 'Player is able to read chat logs from other players');
INSERT INTO `website_permissions` VALUES (7, 'housekeeping_website', '\r\nPlayer has access to the website category');
INSERT INTO `website_permissions` VALUES (8, 'housekeeping_website_news', 'Player is able to manage news items');
INSERT INTO `website_permissions` VALUES (9, 'housekeeping_ranks', 'Player is able to change ranks of other players');
INSERT INTO `website_permissions` VALUES (10, 'housekeeping_permissions', 'Player can add/remove permissions for other players who have access to housekeeping');
INSERT INTO `website_permissions` VALUES (11, 'housekeeping_ip_display', 'Player is able to see IP addresses of other players');
INSERT INTO `website_permissions` VALUES (12, 'housekeeping_reset_user', 'Player is able to reset the player (motto, look, relationships)');
INSERT INTO `website_permissions` VALUES (13, 'housekeeping_alert_user', 'Player is able to send warn the player');
INSERT INTO `website_permissions` VALUES (14, 'housekeeping_room_control', 'Player is able to see rooms but not able to edit the room');
INSERT INTO `website_permissions` VALUES (15, 'housekeeping_moderation_tools', 'Player is able to use the moderation tools on the website');
INSERT INTO `website_permissions` VALUES (16, 'housekeeping_website_helptool', 'Player is able to handle the helptool');
INSERT INTO `website_permissions` VALUES (17, 'housekeeping_change_email', 'Player is able to change mail adresses');
INSERT INTO `website_permissions` VALUES (18, 'housekeeping_website_feeds', 'Player is able to remove feeds from the website');
INSERT INTO `website_permissions` VALUES (19, 'housekeeping_vpn_control', 'Player is able to ban of unban AS numbers');
INSERT INTO `website_permissions` VALUES (20, 'housekeeping_wordfilter_control', 'Player is able to manage the word filter');
INSERT INTO `website_permissions` VALUES (21, 'housekeeping_website_rarevalue', 'Player is able to change rare values');
INSERT INTO `website_permissions` VALUES (22, 'housekeeping_website_faq', 'Player is able to manage the FAQ');
INSERT INTO `website_permissions` VALUES (23, 'housekeeping_shop_control', 'Player is able to handle and see purchase logs');
INSERT INTO `website_permissions` VALUES (24, 'housekeeping_ranks_extra', 'Player is able to edit the extra rank');
INSERT INTO `website_permissions` VALUES (25, 'housekeeping_staff_logs_menu', 'Player is able to see logs in menu');
INSERT INTO `website_permissions` VALUES (26, 'housekeeping_config', 'Player can manage all the config settings');
INSERT INTO `website_permissions` VALUES (27, 'website_invisible_staff', 'Hide rank from staff page at website');
INSERT INTO `website_permissions` VALUES (28, 'website_extra_rank', '');
INSERT INTO `website_permissions` VALUES (29, 'housekeeping_website_badgerequest', 'Player is able to accept new badge requests');
INSERT INTO `website_permissions` VALUES (30, 'housekeeping_server_catalog', 'Player is able to manage catalog');
INSERT INTO `website_permissions` VALUES (31, 'housekeeping_rarevalue_control', 'Player is able to manage rare value control');
INSERT INTO `website_permissions` VALUES (32, 'maintenance_login', 'Player is able to manage rare value control');
-- ----------------------------
-- Table structure for website_permissions_ranks
-- ----------------------------
DROP TABLE IF EXISTS `website_permissions_ranks`;
CREATE TABLE `website_permissions_ranks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rank_id`(`rank_id`) USING BTREE,
  INDEX `permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of website_permissions_ranks
-- ----------------------------
INSERT INTO `website_permissions_ranks` VALUES (1, 1, 7);
INSERT INTO `website_permissions_ranks` VALUES (2, 2, 7);
INSERT INTO `website_permissions_ranks` VALUES (3, 3, 7);
INSERT INTO `website_permissions_ranks` VALUES (4, 4, 7);
INSERT INTO `website_permissions_ranks` VALUES (5, 5, 7);
INSERT INTO `website_permissions_ranks` VALUES (6, 6, 7);
INSERT INTO `website_permissions_ranks` VALUES (7, 7, 7);
INSERT INTO `website_permissions_ranks` VALUES (8, 8, 7);
INSERT INTO `website_permissions_ranks` VALUES (9, 9, 7);
INSERT INTO `website_permissions_ranks` VALUES (10, 10, 7);
INSERT INTO `website_permissions_ranks` VALUES (11, 11, 7);
INSERT INTO `website_permissions_ranks` VALUES (12, 12, 7);
INSERT INTO `website_permissions_ranks` VALUES (13, 13, 7);
INSERT INTO `website_permissions_ranks` VALUES (14, 14, 7);
INSERT INTO `website_permissions_ranks` VALUES (15, 15, 7);
INSERT INTO `website_permissions_ranks` VALUES (16, 16, 7);
INSERT INTO `website_permissions_ranks` VALUES (17, 17, 7);
INSERT INTO `website_permissions_ranks` VALUES (18, 18, 7);
INSERT INTO `website_permissions_ranks` VALUES (19, 19, 7);
INSERT INTO `website_permissions_ranks` VALUES (20, 20, 7);
INSERT INTO `website_permissions_ranks` VALUES (21, 21, 7);
INSERT INTO `website_permissions_ranks` VALUES (22, 22, 7);
INSERT INTO `website_permissions_ranks` VALUES (23, 23, 7);
INSERT INTO `website_permissions_ranks` VALUES (24, 24, 7);
INSERT INTO `website_permissions_ranks` VALUES (25, 25, 7);
INSERT INTO `website_permissions_ranks` VALUES (26, 26, 7);
INSERT INTO `website_permissions_ranks` VALUES (27, 27, 1);
INSERT INTO `website_permissions_ranks` VALUES (28, 27, 2);
INSERT INTO `website_permissions_ranks` VALUES (29, 29, 7);
INSERT INTO `website_permissions_ranks` VALUES (30, 30, 7);
INSERT INTO `website_permissions_ranks` VALUES (31, 31, 7);
INSERT INTO `website_permissions_ranks` VALUES (32, 32, 7);


-- ----------------------------
-- Table structure for website_photos_likes
-- ----------------------------
DROP TABLE IF EXISTS `website_photos_likes`;
CREATE TABLE `website_photos_likes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for website_referrals
-- ----------------------------

DROP TABLE IF EXISTS `website_referrals`;
CREATE TABLE `website_referrals`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `referral_user_id` int(11) NULL DEFAULT NULL,
  `ip_address` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timestamp` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for website_settings
-- ----------------------------
DROP TABLE IF EXISTS `website_settings`;
CREATE TABLE `website_settings`  (
  `key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of website_settings
-- ----------------------------
INSERT INTO `website_settings` VALUES ('rcon_api_host', '127.0.0.1');
INSERT INTO `website_settings` VALUES ('rcon_api_port', '3001');
INSERT INTO `website_settings` VALUES ('rcon_api_timeout', '30');
INSERT INTO `website_settings` VALUES ('rcon_api_protocol', 'tcp');
INSERT INTO `website_settings` VALUES ('rcon_api_persistent', 'false');
INSERT INTO `website_settings` VALUES ('recaptcha_publickey', NULL);
INSERT INTO `website_settings` VALUES ('recaptcha_secretkey', NULL);
INSERT INTO `website_settings` VALUES ('maintenance', '0');
INSERT INTO `website_settings` VALUES ('start_credits', '1000');
INSERT INTO `website_settings` VALUES ('vip_permission_id', '2');
INSERT INTO `website_settings` VALUES ('vip_currency_type', '5');
INSERT INTO `website_settings` VALUES ('vip_price', '1000');
INSERT INTO `website_settings` VALUES ('vip_badges', '[{\"value\":\"VIP\"},{\"value\":\"ACH_VipClub1\"}]');
INSERT INTO `website_settings` VALUES ('vip_gift_items', ''); 
INSERT INTO `website_settings` VALUES ('vip_gift_message', 'Thanks for buying club membership!');
INSERT INTO `website_settings` VALUES ('club_page_content', '<ul>\r\n<li>Je krijgt <strong>50 Bel-Credits</strong> en <strong>1000 Diamanten</strong>.</li>\r\n<li>Je krijgt <strong>10000 Duckets</strong> en <strong>20000 Achievement Score</strong>.</li>\r\n<li>Je kunt meubels uit de <strong>Donatie Winkel</strong> kopen.</li>\r\n<li>Je kunt als eerste de <strong>Nieuwste Meubi\'s</strong> kopen.</li>\r\n<li>Je kunt <strong>volle kamers</strong> bezoeken.</li>\r\n<li>Je hebt een korter typverbod (<strong>10 seconden</strong>).</li>\r\n<li>Je kunt <strong>1000 kamers</strong> maken (Normaal 150).</li>\r\n<li>Je kunt lid worden van <strong>500 groepen</strong> (Normaal 150).</li>\r\n<li>Je kunt <strong>10 respect</strong> geven aan Leet\'s (Normaal 5).</li>\r\n<li>Je hebt toegang tot <strong>speciale spraakcommando\'s<br /><br /></strong></li>\r\n</ul>\r\n<h4>De speciale spraakcommando\'s</h4>\r\n<p>Je hebt toegang tot speciale spraakcommando\'s.</p>\r\n<ul>\r\n<li><strong>:duw (<em>Cosmicnaam</em>)</strong> duwt de gewenste Leet 1 vak naar voor</li>\r\n<li><strong>:trek (<em>Cosmicnaamnaam</em>)</strong> trek een Leet naar je toe</li>\r\n<li><strong>:kus (<em>Cosmicnaamnaam</em>)</strong> geef een kusje aan een Leet</li>\r\n<li><strong>:sla (<em>Cosmicnaamnaam</em>)</strong> sla een Leet</li>\r\n<li><strong>:gezichtloos</strong> haal je gezicht weg</li>\r\n<li><strong>:trashvrij</strong> zorgt ervoor dat Leet\'s met rechten niks kunnen verplaatsen.</li>\r\n<li><strong>:huisdier (<em>lijst</em>)</strong> zal je veranderen in het dier dat je kiest uit de lijst</li>\r\n<li><strong>:zit</strong> zitten op de grond</li>\r\n<li><strong>:lig</strong> liggen op de grond</li>\r\n</ul>');
INSERT INTO `website_settings` VALUES ('namechange_currency_type', '5');
INSERT INTO `website_settings` VALUES ('namechange_price', '1000');
INSERT INTO `website_settings` VALUES ('registration_max_ip', '3');
INSERT INTO `website_settings` VALUES ('vip_membership_days', '31');
INSERT INTO `website_settings` VALUES ('referral_acc_create_days', '14');
INSERT INTO `website_settings` VALUES ('referral_points_type', '103');
INSERT INTO `website_settings` VALUES ('referral_points', '5');
INSERT INTO `website_settings` VALUES ('referral_waiting_seconds', '3600');
INSERT INTO `website_settings` VALUES ('user_of_the_week', NULL);
INSERT INTO `website_settings` VALUES ('draw_badge_imaging', NULL);
INSERT INTO `website_settings` VALUES ('draw_badge_currency', '5');
INSERT INTO `website_settings` VALUES ('draw_badge_price', '1000');
INSERT INTO `website_settings` VALUES ('available_profile_widgets', 'myhabbo;friends;rooms;groups;mybadges;note;photos');
INSERT INTO `website_settings` VALUES ('cache_timestamp', '336fe37f95117bcf3f99c56aca3758d2');
INSERT INTO `website_settings` VALUES ('findretros_enabled', 'false');
INSERT INTO `website_settings` VALUES ('findretros_timeout', '2');
INSERT INTO `website_settings` VALUES ('findretros_cloudflare', 'true');
INSERT INTO `website_settings` VALUES ('findretros_api', 'https://findretros.com/');
INSERT INTO `website_settings` VALUES ('findretros_pagename', 'cosmic');
INSERT INTO `website_settings` VALUES ('paypal_secret_id', 'EHdmOYyk8cZvAxi8IMcKn4bsAFHizM3tHokRUiyL6gswAPdtER2B5CkppiyMJKLf6cjQpMCRXX41gV-r');
INSERT INTO `website_settings` VALUES ('paypal_client_id', 'AZgKBttgOzrm8jk92EdsdgqSqOeIa3bTUCORltU_uzRHiiuQhrZadQVawjIW0c0WlgP091aCBPNXrI9q');
INSERT INTO `website_settings` VALUES ('paypal_currency', 'USD');
INSERT INTO `website_settings` VALUES ('paypal_sandbox_enabled', 'true');
INSERT INTO `website_settings` VALUES ('upload_path', '/var/www/cosmic.devraizer.nl/public/uploads/');


-- ----------------------------
-- Table structure for website_settings_currencys
-- ----------------------------
DROP TABLE IF EXISTS `website_settings_currencys`;
CREATE TABLE `website_settings_currencys`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` int(3) NULL DEFAULT NULL,
  `amount` int(12) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of website_settings_currencys
-- ----------------------------
INSERT INTO `website_settings_currencys` VALUES ('1', 'duckets', 0, 1000);
INSERT INTO `website_settings_currencys` VALUES ('2', 'diamonds', 5, 1000);


-- ----------------------------
-- Table structure for website_paypal_offers
-- ----------------------------
DROP TABLE IF EXISTS `website_paypal_offers`;
CREATE TABLE `website_paypal_offers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of website_paypal_offers
-- ----------------------------
INSERT INTO `website_paypal_offers` VALUES (1, '10.00', 'VIP', 'ES551.png', '{\"givecredits\":{\"credits\":10000},\"givepoints\":{\"type\":5,\"points\":5000},\"givebadge\":[{\"badge\":\"ES551;ES51G\"}],\"setrank\":{\"rank\":2}}', '<ul>\r\n<li>Je ontvangt 10000 credits</li>\r\n<li>Je ontvangt 5000 diamonds</li>\r\n<li>Je ontvangt 2 unieke badges</li>\r\n<li>Je ontvangt VIP Rank</li>\r\n</ul>');
INSERT INTO `website_paypal_offers` VALUES (2, '5.00', '50 credits', 'belcredits-lg.png', '{\"givecredits\":{\"credits\":50}}', '<ul><li>Je ontvangt 50 credits</ul></li>');

-- ----------------------------
-- Table structure for website_paypal_payments
-- ----------------------------
DROP TABLE IF EXISTS `website_paypal_payments`;
CREATE TABLE `website_paypal_payments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `offer_id` int(11) NULL DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `payer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'pending',
  `delivered` enum('NO','YES') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'NO',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;


-- ----------------------------
-- Table structure for website_staff_logs
-- ----------------------------
DROP TABLE IF EXISTS `website_staff_logs`;
CREATE TABLE `website_staff_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `player_id` int(11) NULL DEFAULT NULL,
  `target` int(11) NULL DEFAULT NULL,
  `timestamp` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for website_user_logs_email
-- ----------------------------
DROP TABLE IF EXISTS `website_user_logs_email`;
CREATE TABLE `website_user_logs_email`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `old_mail` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `new_mail` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ip_address` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `timestamp` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for website_membership
-- ----------------------------
DROP TABLE IF EXISTS `website_membership`;
CREATE TABLE `website_membership`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `old_rank` int(1) NULL DEFAULT NULL,
  `expires_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for website_badge_requests
-- ----------------------------
DROP TABLE IF EXISTS `website_badge_requests`;
CREATE TABLE `website_badge_requests`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `badge_imaging` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` enum('open','accept','decline') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'open',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for website_extra_ranks
-- ----------------------------
DROP TABLE IF EXISTS `website_extra_ranks`;
CREATE TABLE `website_extra_ranks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rank_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for website_profile_catalogues
-- ----------------------------
DROP TABLE IF EXISTS `website_profile_catalogues`;
CREATE TABLE `website_profile_catalogues`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 's',
  `data` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2869 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_profile_catalogues
-- ----------------------------
INSERT INTO `website_profile_catalogues` VALUES (2, 's', 'trax_sfx', 'Trax Sfx', '3');
INSERT INTO `website_profile_catalogues` VALUES (3, 's', 'trax_disco', 'Trax Disco', '3');
INSERT INTO `website_profile_catalogues` VALUES (4, 's', 'trax_8_bit', 'Trax 8 bit', '3');
INSERT INTO `website_profile_catalogues` VALUES (5, 's', 'trax_electro', 'Trax Electro', '3');
INSERT INTO `website_profile_catalogues` VALUES (6, 's', 'trax_reggae', 'Trax Reggae', '3');
INSERT INTO `website_profile_catalogues` VALUES (7, 's', 'trax_ambient', 'Trax Ambient', '3');
INSERT INTO `website_profile_catalogues` VALUES (8, 's', 'trax_bling', 'Trax Bling', '3');
INSERT INTO `website_profile_catalogues` VALUES (9, 's', 'trax_heavy', 'Trax Heavy', '3');
INSERT INTO `website_profile_catalogues` VALUES (10, 's', 'trax_latin', 'Trax Latin', '3');
INSERT INTO `website_profile_catalogues` VALUES (11, 's', 'trax_rock', 'Trax Rock', '3');
INSERT INTO `website_profile_catalogues` VALUES (37, 's', 'a', 'A', '5');
INSERT INTO `website_profile_catalogues` VALUES (38, 's', 'b', 'B', '5');
INSERT INTO `website_profile_catalogues` VALUES (39, 's', 'c', 'C', '5');
INSERT INTO `website_profile_catalogues` VALUES (40, 's', 'd', 'D', '5');
INSERT INTO `website_profile_catalogues` VALUES (41, 's', 'e', 'E', '5');
INSERT INTO `website_profile_catalogues` VALUES (42, 's', 'f', 'F', '5');
INSERT INTO `website_profile_catalogues` VALUES (43, 's', 'g', 'G', '5');
INSERT INTO `website_profile_catalogues` VALUES (44, 's', 'h', 'H', '5');
INSERT INTO `website_profile_catalogues` VALUES (45, 's', 'i', 'I', '5');
INSERT INTO `website_profile_catalogues` VALUES (46, 's', 'j', 'J', '5');
INSERT INTO `website_profile_catalogues` VALUES (47, 's', 'k', 'K', '5');
INSERT INTO `website_profile_catalogues` VALUES (48, 's', 'l', 'L', '5');
INSERT INTO `website_profile_catalogues` VALUES (49, 's', 'm', 'M', '5');
INSERT INTO `website_profile_catalogues` VALUES (50, 's', 'n', 'N', '5');
INSERT INTO `website_profile_catalogues` VALUES (51, 's', 'o', 'O', '5');
INSERT INTO `website_profile_catalogues` VALUES (52, 's', 'p', 'P', '5');
INSERT INTO `website_profile_catalogues` VALUES (53, 's', 'q', 'Q', '5');
INSERT INTO `website_profile_catalogues` VALUES (54, 's', 'r', 'R', '5');
INSERT INTO `website_profile_catalogues` VALUES (55, 's', 's', 'S', '5');
INSERT INTO `website_profile_catalogues` VALUES (56, 's', 't', 'T', '5');
INSERT INTO `website_profile_catalogues` VALUES (57, 's', 'u', 'U', '5');
INSERT INTO `website_profile_catalogues` VALUES (58, 's', 'v', 'V', '5');
INSERT INTO `website_profile_catalogues` VALUES (59, 's', 'w', 'W', '5');
INSERT INTO `website_profile_catalogues` VALUES (60, 's', 'x', 'X', '5');
INSERT INTO `website_profile_catalogues` VALUES (61, 's', 'y', 'Y', '5');
INSERT INTO `website_profile_catalogues` VALUES (62, 's', 'z', 'Z', '5');
INSERT INTO `website_profile_catalogues` VALUES (63, 's', 'bling_star', 'Bling Star', '6');
INSERT INTO `website_profile_catalogues` VALUES (64, 's', 'bling_a', 'Bling a', '6');
INSERT INTO `website_profile_catalogues` VALUES (65, 's', 'bling_b', 'Bling b', '6');
INSERT INTO `website_profile_catalogues` VALUES (66, 's', 'bling_c', 'Bling c', '6');
INSERT INTO `website_profile_catalogues` VALUES (67, 's', 'bling_d', 'Bling d', '6');
INSERT INTO `website_profile_catalogues` VALUES (68, 's', 'bling_e', 'Bling e', '6');
INSERT INTO `website_profile_catalogues` VALUES (69, 's', 'bling_f', 'Bling f', '6');
INSERT INTO `website_profile_catalogues` VALUES (70, 's', 'bling_g', 'Bling g', '6');
INSERT INTO `website_profile_catalogues` VALUES (71, 's', 'bling_h', 'Bling h', '6');
INSERT INTO `website_profile_catalogues` VALUES (72, 's', 'bling_i', 'Bling i', '6');
INSERT INTO `website_profile_catalogues` VALUES (73, 's', 'bling_j', 'Bling j', '6');
INSERT INTO `website_profile_catalogues` VALUES (74, 's', 'bling_k', 'Bling k', '6');
INSERT INTO `website_profile_catalogues` VALUES (75, 's', 'bling_l', 'Bling l', '6');
INSERT INTO `website_profile_catalogues` VALUES (76, 's', 'bling_m', 'Bling m', '6');
INSERT INTO `website_profile_catalogues` VALUES (77, 's', 'bling_n', 'Bling n', '6');
INSERT INTO `website_profile_catalogues` VALUES (78, 's', 'bling_o', 'Bling o', '6');
INSERT INTO `website_profile_catalogues` VALUES (79, 's', 'bling_p', 'Bling p', '6');
INSERT INTO `website_profile_catalogues` VALUES (80, 's', 'bling_q', 'Bling q', '6');
INSERT INTO `website_profile_catalogues` VALUES (81, 's', 'bling_r', 'Bling r', '6');
INSERT INTO `website_profile_catalogues` VALUES (82, 's', 'bling_s', 'Bling s', '6');
INSERT INTO `website_profile_catalogues` VALUES (83, 's', 'bling_t', 'Bling t', '6');
INSERT INTO `website_profile_catalogues` VALUES (84, 's', 'bling_u', 'Bling u', '6');
INSERT INTO `website_profile_catalogues` VALUES (85, 's', 'bling_v', 'Bling v', '6');
INSERT INTO `website_profile_catalogues` VALUES (86, 's', 'bling_w', 'Bling w', '6');
INSERT INTO `website_profile_catalogues` VALUES (87, 's', 'bling_x', 'Bling x', '6');
INSERT INTO `website_profile_catalogues` VALUES (88, 's', 'bling_y', 'Bling y', '6');
INSERT INTO `website_profile_catalogues` VALUES (89, 's', 'bling_z', 'Bling z', '6');
INSERT INTO `website_profile_catalogues` VALUES (90, 's', 'bling_underscore', 'Bling Underscore', '6');
INSERT INTO `website_profile_catalogues` VALUES (91, 's', 'bling_comma', 'Bling Comma', '6');
INSERT INTO `website_profile_catalogues` VALUES (92, 's', 'bling_dot', 'Bling Dot', '6');
INSERT INTO `website_profile_catalogues` VALUES (93, 's', 'bling_exclamation', 'Bling Exclamation', '6');
INSERT INTO `website_profile_catalogues` VALUES (94, 's', 'bling_question', 'Bling Question', '6');
INSERT INTO `website_profile_catalogues` VALUES (95, 's', 'a_with_circle', 'A with Circle', '5');
INSERT INTO `website_profile_catalogues` VALUES (96, 's', 'a_with_dots', 'A with Dots', '5');
INSERT INTO `website_profile_catalogues` VALUES (97, 's', 'o_with_dots', 'O with Dots', '5');
INSERT INTO `website_profile_catalogues` VALUES (98, 's', 'dot', 'Dot', '5');
INSERT INTO `website_profile_catalogues` VALUES (99, 's', 'acsent1', 'Accent 1', '5');
INSERT INTO `website_profile_catalogues` VALUES (101, 's', 'underscore', 'Underscore', '5');
INSERT INTO `website_profile_catalogues` VALUES (103, 's', 'chain_horizontal', 'Chain Horizontal', '7');
INSERT INTO `website_profile_catalogues` VALUES (104, 's', 'chain_vertical', 'Chain Vertical', '7');
INSERT INTO `website_profile_catalogues` VALUES (105, 's', 'ruler_horizontal', 'Ruler Horizontal', '7');
INSERT INTO `website_profile_catalogues` VALUES (106, 's', 'ruler_vertical', 'Ruler Vertical', '7');
INSERT INTO `website_profile_catalogues` VALUES (107, 's', 'vine1', 'Vine', '7');
INSERT INTO `website_profile_catalogues` VALUES (108, 's', 'vine2', 'Vine 2', '7');
INSERT INTO `website_profile_catalogues` VALUES (110, 's', 'leafs2', 'Leafs 2', '7');
INSERT INTO `website_profile_catalogues` VALUES (111, 's', 'sticker_zipper_v_tile', 'Sticker Zipper V Tile', '7');
INSERT INTO `website_profile_catalogues` VALUES (112, 's', 'sticker_zipper_h_tile', 'Sticker Zipper H Tile', '7');
INSERT INTO `website_profile_catalogues` VALUES (113, 's', 'sticker_zipper_h_normal_lock', 'Sticker Zipper H Normal Lock', '7');
INSERT INTO `website_profile_catalogues` VALUES (114, 's', 'sticker_zipper_h_bobba_lock', 'Sticker Zipper H Bobba Lock', '7');
INSERT INTO `website_profile_catalogues` VALUES (115, 's', 'sticker_zipper_h_end', 'Sticker Zipper H End', '7');
INSERT INTO `website_profile_catalogues` VALUES (116, 's', 'sticker_zipper_v_end', 'Sticker Zipper V End', '7');
INSERT INTO `website_profile_catalogues` VALUES (117, 's', 'sticker_zipper_v_bobba_lock', 'Sticker Zipper V Bobba Lock', '7');
INSERT INTO `website_profile_catalogues` VALUES (118, 's', 'sticker_zipper_v_normal_lock', 'Sticker Zipper V Normal Lock', '7');
INSERT INTO `website_profile_catalogues` VALUES (119, 's', 'wormhand', 'Wormhand', '8');
INSERT INTO `website_profile_catalogues` VALUES (120, 's', 'sticker_gentleman', 'Sticker Gentleman', '8');
INSERT INTO `website_profile_catalogues` VALUES (121, 's', 'chewed_bubblegum', 'Chewed Bubblegum', '8');
INSERT INTO `website_profile_catalogues` VALUES (122, 's', 'sticker_cactus_anim', 'Cactus', '8');
INSERT INTO `website_profile_catalogues` VALUES (123, 's', 'sticker_spaceduck', 'Sticker Spaceduck', '8');
INSERT INTO `website_profile_catalogues` VALUES (124, 's', 'sticker_moonpig', 'Sticker Moonpig', '8');
INSERT INTO `website_profile_catalogues` VALUES (125, 's', 'swimming_fish', 'Swimming Fish', '8');
INSERT INTO `website_profile_catalogues` VALUES (126, 's', 'sticker_boxer', 'Sticker Boxer', '8');
INSERT INTO `website_profile_catalogues` VALUES (127, 's', 'wunderfrank', 'Wunder Frank', '8');
INSERT INTO `website_profile_catalogues` VALUES (128, 's', 'sticker_submarine', 'Sticker Submarine', '8');
INSERT INTO `website_profile_catalogues` VALUES (129, 's', 'sticker_clown_anim', 'Sticker Clown Anim', '8');
INSERT INTO `website_profile_catalogues` VALUES (132, 's', 'sticker_heartbeat', 'Sticker Heartbeat', '9');
INSERT INTO `website_profile_catalogues` VALUES (133, 's', 'sticker_catinabox', 'Sticker Catinabox', '9');
INSERT INTO `website_profile_catalogues` VALUES (134, 's', 'bear', 'Bear', '9');
INSERT INTO `website_profile_catalogues` VALUES (135, 's', 'gothic_draculacape', 'Gothic Draculacape', '10');
INSERT INTO `website_profile_catalogues` VALUES (136, 's', 'evil_giant_bunny', 'Evil Giant Bunny', '10');
INSERT INTO `website_profile_catalogues` VALUES (137, 's', 'zombiepupu', 'Zombie Pupu', '10');
INSERT INTO `website_profile_catalogues` VALUES (138, 's', 'skeletor_001', 'Skeletor 1', '10');
INSERT INTO `website_profile_catalogues` VALUES (139, 's', 'skull', 'Skull', '10');
INSERT INTO `website_profile_catalogues` VALUES (140, 's', 'skull2', 'Skull 2', '10');
INSERT INTO `website_profile_catalogues` VALUES (141, 's', 'scubacapsule_anim', 'Scubacapsule Anim', '10');
INSERT INTO `website_profile_catalogues` VALUES (142, 's', 'sticker_bobbaskull', 'Bobbaskull', '10');
INSERT INTO `website_profile_catalogues` VALUES (153, 's', 'sticker_pointing_hand_1', 'Sticker Pointing Hand 1', '12');
INSERT INTO `website_profile_catalogues` VALUES (154, 's', 'sticker_pointing_hand_2', 'Sticker Pointing Hand 2', '12');
INSERT INTO `website_profile_catalogues` VALUES (155, 's', 'sticker_pointing_hand_3', 'Sticker Pointing Hand 3', '12');
INSERT INTO `website_profile_catalogues` VALUES (156, 's', 'sticker_pointing_hand_4', 'Sticker Pointing Hand 4', '12');
INSERT INTO `website_profile_catalogues` VALUES (164, 's', 'grass', 'Grass Meadow', '13');
INSERT INTO `website_profile_catalogues` VALUES (165, 's', 'sticker_flower1', 'Sticker Flower', '13');
INSERT INTO `website_profile_catalogues` VALUES (166, 's', 'sticker_flower_big_yellow', 'Sticker Flower Big Yellow', '13');
INSERT INTO `website_profile_catalogues` VALUES (167, 's', 'sticker_flower_pink', 'Sticker Flower Pink', '13');
INSERT INTO `website_profile_catalogues` VALUES (168, 's', 'sticker_bobbaskull', 'Bobba badge', '14');
INSERT INTO `website_profile_catalogues` VALUES (169, 's', 'i_love_coffee', 'I love Coffee', '14');
INSERT INTO `website_profile_catalogues` VALUES (170, 's', 'sticker_effect_bam', 'Sticker Effect Bam', '14');
INSERT INTO `website_profile_catalogues` VALUES (171, 's', 'sticker_effect_burp', 'Sticker Effect Burp', '14');
INSERT INTO `website_profile_catalogues` VALUES (172, 's', 'sticker_effect_woosh', 'Sticker Effect Woosh', '14');
INSERT INTO `website_profile_catalogues` VALUES (173, 's', 'sticker_effect_zap', 'Sticker Effect Zap', '14');
INSERT INTO `website_profile_catalogues` VALUES (174, 's', 'sticker_effect_whoosh2', 'Sticker Effect Whoosh 2', '14');
INSERT INTO `website_profile_catalogues` VALUES (175, 's', 'icecube_small', 'Icecube Small', '15');
INSERT INTO `website_profile_catalogues` VALUES (176, 's', 'ss_snowballmachine', 'Snowball Machine', '15');
INSERT INTO `website_profile_catalogues` VALUES (177, 's', 'icecube_big', 'Icecube Big', '15');
INSERT INTO `website_profile_catalogues` VALUES (178, 's', 'bootsitjalapaset_red', 'Bootsitjalapaset Red', '15');
INSERT INTO `website_profile_catalogues` VALUES (179, 's', 'ss_bootsitjalapaset_blue', 'Boots and Gloves', '15');
INSERT INTO `website_profile_catalogues` VALUES (180, 's', 'ss_costume_red', 'Red SnowStorm Costume', '15');
INSERT INTO `website_profile_catalogues` VALUES (181, 's', 'ss_costume_blue', 'Snowstorm Blue Costume', '15');
INSERT INTO `website_profile_catalogues` VALUES (182, 's', 'ss_hits_by_snowball', 'Splash!', '15');
INSERT INTO `website_profile_catalogues` VALUES (183, 's', 'extra_ss_duck_left', 'SnowStorm Duck!', '15');
INSERT INTO `website_profile_catalogues` VALUES (184, 's', 'ss_snowtree', 'Snowtree', '15');
INSERT INTO `website_profile_catalogues` VALUES (185, 's', 'extra_ss_duck_right', 'SnowStorm Duck!', '15');
INSERT INTO `website_profile_catalogues` VALUES (186, 's', 'ss_snowman', 'Snowman', '15');
INSERT INTO `website_profile_catalogues` VALUES (187, 's', 'ss_snowflake2', 'Lumihiutale', '15');
INSERT INTO `website_profile_catalogues` VALUES (188, 's', 'ss_snowqueen', 'Snow Queen', '15');
INSERT INTO `website_profile_catalogues` VALUES (189, 's', 'battle1', 'Battle 1', '16');
INSERT INTO `website_profile_catalogues` VALUES (190, 's', 'battle3', 'Battle 3', '16');
INSERT INTO `website_profile_catalogues` VALUES (191, 's', 'hc_hat', 'HC Hat', '18');
INSERT INTO `website_profile_catalogues` VALUES (192, 's', 'eyeleft', 'Eye Left', '18');
INSERT INTO `website_profile_catalogues` VALUES (193, 's', 'eyeright', 'Eye Right', '18');
INSERT INTO `website_profile_catalogues` VALUES (194, 's', 'angelwings_anim', 'Angel Wings', '18');
INSERT INTO `website_profile_catalogues` VALUES (195, 's', 'sticker_gurubeard_grey', 'Sticker Gurubeard Gray', '18');
INSERT INTO `website_profile_catalogues` VALUES (196, 's', 'sticker_gurubeard_brown', 'Sticker Gurubeard Brown', '18');
INSERT INTO `website_profile_catalogues` VALUES (197, 's', 'sticker_glasses_supernerd', 'Supernerd', '18');
INSERT INTO `website_profile_catalogues` VALUES (198, 's', 'sticker_glasses_elton', 'Goofy Glasses', '18');
INSERT INTO `website_profile_catalogues` VALUES (199, 's', 'sticker_eyes_blue', 'Blue Eyes', '18');
INSERT INTO `website_profile_catalogues` VALUES (200, 's', 'sticker_eye_anim', 'Sticker Eye Anim', '18');
INSERT INTO `website_profile_catalogues` VALUES (201, 's', 'sticker_eye_evil_anim', 'Sticker Eye Evil Anim', '18');
INSERT INTO `website_profile_catalogues` VALUES (203, 's', 'star', 'Star', '8');
INSERT INTO `website_profile_catalogues` VALUES (204, 's', 'pencil', 'Sticker Pencil', '8');
INSERT INTO `website_profile_catalogues` VALUES (206, 's', 'pencil_2', 'Sticker Pencil 2', '8');
INSERT INTO `website_profile_catalogues` VALUES (207, 's', 'sticker_lonewolf', 'Sticker Lonewolf', '8');
INSERT INTO `website_profile_catalogues` VALUES (208, 's', 'sticker_prankster', 'Sticker Prankster', '8');
INSERT INTO `website_profile_catalogues` VALUES (210, 's', 'sticker_romantic', 'Sticker Romantic', '8');
INSERT INTO `website_profile_catalogues` VALUES (218, 's', 'sticker_hole', 'Sticker Hole', '8');
INSERT INTO `website_profile_catalogues` VALUES (219, 's', 'sticker_flames', 'Sticker Flames', '8');
INSERT INTO `website_profile_catalogues` VALUES (220, 's', 'paper_clip_1', 'Paper Clip 1', '8');
INSERT INTO `website_profile_catalogues` VALUES (221, 's', 'paper_clip_2', 'Paper Clip 2', '8');
INSERT INTO `website_profile_catalogues` VALUES (222, 's', 'paper_clip_3', 'Paper Clip 3', '8');
INSERT INTO `website_profile_catalogues` VALUES (223, 's', 'highlighter_1', 'Highlighter 1', '8');
INSERT INTO `website_profile_catalogues` VALUES (224, 's', 'highlighter_mark5', 'Highlighter Mark 5', '8');
INSERT INTO `website_profile_catalogues` VALUES (225, 's', 'highlighter_mark6', 'Highlighter Mark 6', '8');
INSERT INTO `website_profile_catalogues` VALUES (226, 's', 'highlighter_mark4b', 'Highlighter Mark 4', '8');
INSERT INTO `website_profile_catalogues` VALUES (227, 's', 'highlighter_2', 'Highlighter 2', '8');
INSERT INTO `website_profile_catalogues` VALUES (228, 's', 'highlighter_mark1', 'Highlighter Mark 1', '8');
INSERT INTO `website_profile_catalogues` VALUES (229, 's', 'highlighter_mark2', 'Highlighter Mark 2', '8');
INSERT INTO `website_profile_catalogues` VALUES (230, 's', 'highlighter_mark3', 'Highlighter Mark 3', '8');
INSERT INTO `website_profile_catalogues` VALUES (234, 's', 'fish', 'Fish', '8');
INSERT INTO `website_profile_catalogues` VALUES (235, 's', 'parrot', 'Parrot', '8');
INSERT INTO `website_profile_catalogues` VALUES (236, 's', 'sticker_sleeping_habbo', 'Sticker Sleeping Habbo', '8');
INSERT INTO `website_profile_catalogues` VALUES (238, 's', 'juice', 'Juice', '8');
INSERT INTO `website_profile_catalogues` VALUES (245, 's', 'football', 'Football', '8');
INSERT INTO `website_profile_catalogues` VALUES (1001, 's', 'ob_clubber_146x146', 'OB Clubber', '201');
INSERT INTO `website_profile_catalogues` VALUES (1002, 's', 'ob_devil_146x146', 'OB Devil', '201');
INSERT INTO `website_profile_catalogues` VALUES (1003, 's', 'ob_doctor_146x146', 'OB Doctor', '201');
INSERT INTO `website_profile_catalogues` VALUES (1004, 's', 'ob_fairy_146x146', 'OB Fairy', '201');
INSERT INTO `website_profile_catalogues` VALUES (1005, 's', 'ob_jetsetter_146x146', 'OB Jetsetter', '201');
INSERT INTO `website_profile_catalogues` VALUES (1007, 's', 'ob_shopaholic_146x146', 'OB Shopaholic', '201');
INSERT INTO `website_profile_catalogues` VALUES (1008, 's', 'ob_sporty_146x146', 'OB Sport', '201');
INSERT INTO `website_profile_catalogues` VALUES (1011, 's', '27224_sticker_themepark_001', 'Sticker Themepark', '8');
INSERT INTO `website_profile_catalogues` VALUES (1023, 's', 'acma_notepad_bg_lge', 'Acma Notepad Background', '8');
INSERT INTO `website_profile_catalogues` VALUES (1026, 's', 'acsent1', 'Acsent 1', '203');
INSERT INTO `website_profile_catalogues` VALUES (1027, 's', 'acsent2', 'Acsent 2', '5');
INSERT INTO `website_profile_catalogues` VALUES (1028, 's', 'adcats', 'Ad Cats', '204');
INSERT INTO `website_profile_catalogues` VALUES (1029, 's', 'addogs', 'Ad Dogs', '204');
INSERT INTO `website_profile_catalogues` VALUES (1030, 's', 'adholiday', 'Ad Holiday', '204');
INSERT INTO `website_profile_catalogues` VALUES (1032, 's', 'adparty', 'Ad Party', '204');
INSERT INTO `website_profile_catalogues` VALUES (1033, 's', 'adskating', 'Ad Skating', '204');
INSERT INTO `website_profile_catalogues` VALUES (1035, 's', 'alhambra_sticker', 'Alhambra Sticker', '205');
INSERT INTO `website_profile_catalogues` VALUES (1036, 's', 'alhambra_wallsticker', 'Alhambra Wallsticker', '205');
INSERT INTO `website_profile_catalogues` VALUES (1037, 's', 'sticker_alhambralogo', 'Alhambra Logo', '205');
INSERT INTO `website_profile_catalogues` VALUES (1039, 's', 'ametrin', 'Ametrin', '216');
INSERT INTO `website_profile_catalogues` VALUES (1040, 's', 'ob_angel_146x146', 'Angel', '201');
INSERT INTO `website_profile_catalogues` VALUES (1043, 's', 'anim_appart_732', 'Anim Appart 732', '8');
INSERT INTO `website_profile_catalogues` VALUES (1044, 's', 'anim_boule_cristal', 'Anim Boule Cristal', '8');
INSERT INTO `website_profile_catalogues` VALUES (1045, 's', 'anim_brasero', 'Anim Brasero', '8');
INSERT INTO `website_profile_catalogues` VALUES (1046, 's', 'anim_cook', 'Anim Cook', '216');
INSERT INTO `website_profile_catalogues` VALUES (1047, 's', 'anim_elvis', 'Anim Elvis', '216');
INSERT INTO `website_profile_catalogues` VALUES (1048, 's', 'anim_enseigne', 'Anim Enseigne', '8');
INSERT INTO `website_profile_catalogues` VALUES (1049, 's', 'anim_hockey', 'Anim Hockey', '213');
INSERT INTO `website_profile_catalogues` VALUES (1051, 's', 'anim_oeil', 'Anim Oeil', '8');
INSERT INTO `website_profile_catalogues` VALUES (1052, 's', 'anim_ventilo', 'Anim Ventilo', '8');
INSERT INTO `website_profile_catalogues` VALUES (1053, 's', 'anim_viking_hole', 'Anim Viking Hole', '216');
INSERT INTO `website_profile_catalogues` VALUES (1054, 's', 'anti_eco', 'Anti Eco', '235');
INSERT INTO `website_profile_catalogues` VALUES (1057, 's', 'argentina', 'Argentina', '216');
INSERT INTO `website_profile_catalogues` VALUES (1058, 's', 'star', 'Asterisco 1', '5');
INSERT INTO `website_profile_catalogues` VALUES (1059, 's', 'au_3rdbday_01', 'AU 3rd Bday 1', '8');
INSERT INTO `website_profile_catalogues` VALUES (1060, 's', 'au_3rdbday_02', 'AU 3rd Bday 2', '8');
INSERT INTO `website_profile_catalogues` VALUES (1061, 's', 'au_3rdbday_03', 'AU 3rd Bday 3', '8');
INSERT INTO `website_profile_catalogues` VALUES (1062, 's', 'au_greengold', 'AU Greengold', '204');
INSERT INTO `website_profile_catalogues` VALUES (1063, 's', 'au_lifesaver', 'AU Lifesaver', '8');
INSERT INTO `website_profile_catalogues` VALUES (1064, 's', 'au_surfing', 'AU Surfing', '204');
INSERT INTO `website_profile_catalogues` VALUES (1067, 's', 'ballsmahoney_001', 'Ballsma Honey', '209');
INSERT INTO `website_profile_catalogues` VALUES (1068, 's', 'baltasar', 'Baltasar', '216');
INSERT INTO `website_profile_catalogues` VALUES (1069, 's', 'banksbobby', 'Banks Bobby', '236');
INSERT INTO `website_profile_catalogues` VALUES (1070, 's', 'bankscan', 'Banks Can', '236');
INSERT INTO `website_profile_catalogues` VALUES (1071, 's', 'banksdoor', 'Banks Door', '236');
INSERT INTO `website_profile_catalogues` VALUES (1072, 's', 'banksheater', 'Banks Heater', '236');
INSERT INTO `website_profile_catalogues` VALUES (1073, 's', 'barbequeset', 'Barbequeset', '207');
INSERT INTO `website_profile_catalogues` VALUES (1074, 's', 'slash', 'Barra', '5');
INSERT INTO `website_profile_catalogues` VALUES (1075, 's', 'bartender_costume', 'Bartender Costume', '18');
INSERT INTO `website_profile_catalogues` VALUES (1076, 's', 'batista', 'Batista', '209');
INSERT INTO `website_profile_catalogues` VALUES (1079, 's', 'sticker_beachBall', 'Beachbunny Beachball', '207');
INSERT INTO `website_profile_catalogues` VALUES (1080, 's', 'sticker_beachBallBouncing', 'Beachbunny Beachball Bouncing', '207');
INSERT INTO `website_profile_catalogues` VALUES (1081, 's', 'sticker_bbbPoster', 'Beachbunny Bmovie Poster', '207');
INSERT INTO `website_profile_catalogues` VALUES (1082, 's', 'sticker_bunnySuit', 'Beachbunny Bunny Suit', '207');
INSERT INTO `website_profile_catalogues` VALUES (1083, 's', 'sticker_peep', 'Beachbunny Peep', '207');
INSERT INTO `website_profile_catalogues` VALUES (1084, 's', 'sticker_roasterBunny', 'Beachbunny Roaster Bunny', '207');
INSERT INTO `website_profile_catalogues` VALUES (1085, 's', 'ob_beachgirl_146x146', 'Beachgirl', '201');
INSERT INTO `website_profile_catalogues` VALUES (1086, 's', 'bear', 'Bear', '226');
INSERT INTO `website_profile_catalogues` VALUES (1087, 's', 'bellydancer', 'Bellydancer', '205');
INSERT INTO `website_profile_catalogues` VALUES (1088, 's', 'bethPhoenix', 'Beth Phoenix', '209');
INSERT INTO `website_profile_catalogues` VALUES (1089, 's', 'v2bethPhoenix', 'Beth Phoenix Skinny', '209');
INSERT INTO `website_profile_catalogues` VALUES (1090, 's', 'bg_groupinfo', 'Groupinfo Background', '8');
INSERT INTO `website_profile_catalogues` VALUES (1092, 's', 'bigDaddyV_001', 'Big Daddy V', '209');
INSERT INTO `website_profile_catalogues` VALUES (1093, 's', 'bigshow', 'Big Show', '209');
INSERT INTO `website_profile_catalogues` VALUES (1094, 's', 'billygraham', 'Billy Graham', '209');
INSERT INTO `website_profile_catalogues` VALUES (1095, 's', 'easter_birdsuit', 'Bird Suit', '210');
INSERT INTO `website_profile_catalogues` VALUES (1129, 's', 'blingblingstars', 'Bling Bling Stars', '9');
INSERT INTO `website_profile_catalogues` VALUES (1130, 's', 'blinghearts', 'Bling Hearts', '9');
INSERT INTO `website_profile_catalogues` VALUES (1132, 's', 'bluehockeystick', 'Blue Hockey Stick', '213');
INSERT INTO `website_profile_catalogues` VALUES (1133, 's', 'bluestarfish', 'Blue Starfish', '8');
INSERT INTO `website_profile_catalogues` VALUES (1134, 's', 'sticker_bobbaskull', 'Bobba Curse', '8');
INSERT INTO `website_profile_catalogues` VALUES (1136, 's', 'boborton', 'Boborton', '209');
INSERT INTO `website_profile_catalogues` VALUES (1137, 's', 'bonbon_duck_146x146', 'Bonbon Duck', '214');
INSERT INTO `website_profile_catalogues` VALUES (1138, 's', 'bonbon_mouse_146x146', 'Bonbon Mouse', '214');
INSERT INTO `website_profile_catalogues` VALUES (1139, 's', 'bonbon_rat_146x146', 'Bonbon Rat', '214');
INSERT INTO `website_profile_catalogues` VALUES (1140, 's', 'boogeyman', 'Boogeyman', '209');
INSERT INTO `website_profile_catalogues` VALUES (1141, 's', 'bootsitjalapaset_red', 'Bootsitjalapaset Red', '18');
INSERT INTO `website_profile_catalogues` VALUES (1145, 's', 'bozzanova', 'Bozzanova', '216');
INSERT INTO `website_profile_catalogues` VALUES (1146, 's', 'bra_football_guest2', 'BRA Football Guest 2', '216');
INSERT INTO `website_profile_catalogues` VALUES (1147, 's', 'bratz_featuredclique', 'Bratz Featured Clique', '214');
INSERT INTO `website_profile_catalogues` VALUES (1148, 's', 'briankendrick', 'Brian Kendrick', '209');
INSERT INTO `website_profile_catalogues` VALUES (1149, 's', 'britishlegion', 'British Legion', '8');
INSERT INTO `website_profile_catalogues` VALUES (1150, 's', 'britney', 'Britney', '8');
INSERT INTO `website_profile_catalogues` VALUES (1152, 's', 'bullet1', 'Bullet 1', '8');
INSERT INTO `website_profile_catalogues` VALUES (1153, 's', 'bullybuster', 'Bullybuster', '8');
INSERT INTO `website_profile_catalogues` VALUES (1155, 's', 'burger', 'Burger', '8');
INSERT INTO `website_profile_catalogues` VALUES (1156, 's', 'ob_businesswoman_146x146', 'Businesswoman', '201');
INSERT INTO `website_profile_catalogues` VALUES (1157, 's', 'butterfly_01', 'Butterfly', '210');
INSERT INTO `website_profile_catalogues` VALUES (1159, 's', 'ca_hockeygoalie2', 'CA Hockeygoalie 2', '213');
INSERT INTO `website_profile_catalogues` VALUES (1160, 's', 'camel', 'Camel', '8');
INSERT INTO `website_profile_catalogues` VALUES (1162, 's', 'v2candiceMichelle', 'Candice Michelle', '209');
INSERT INTO `website_profile_catalogues` VALUES (1163, 's', 'candycorn', 'Candycorn', '8');
INSERT INTO `website_profile_catalogues` VALUES (1164, 's', 'carlito', 'Carlito', '209');
INSERT INTO `website_profile_catalogues` VALUES (1165, 's', 'cassette1', 'Cassette 1', '8');
INSERT INTO `website_profile_catalogues` VALUES (1166, 's', 'cassette2', 'Cassette 2', '8');
INSERT INTO `website_profile_catalogues` VALUES (1167, 's', 'cassette3', 'Cassette 3', '8');
INSERT INTO `website_profile_catalogues` VALUES (1168, 's', 'cassette4', 'Cassette 4', '8');
INSERT INTO `website_profile_catalogues` VALUES (1170, 's', 'sticker_celebticket_veronicas', 'Celeb Ticket Veronicas', '214');
INSERT INTO `website_profile_catalogues` VALUES (1171, 's', 'cena', 'Cena', '209');
INSERT INTO `website_profile_catalogues` VALUES (1174, 's', 'ob_cheerleader_146x146', 'Cheerleader', '201');
INSERT INTO `website_profile_catalogues` VALUES (1175, 's', 'Cheese_BadgeSticker', 'Cheese Badge', '204');
INSERT INTO `website_profile_catalogues` VALUES (1177, 's', 'CheeseSuit', 'Cheese Suit Sticker', '18');
INSERT INTO `website_profile_catalogues` VALUES (1178, 's', 'cheshirecat', 'Cheshirecat', '216');
INSERT INTO `website_profile_catalogues` VALUES (1180, 's', 'chile', 'Chile', '216');
INSERT INTO `website_profile_catalogues` VALUES (1181, 's', 'chocolates2', 'Chocolates', '8');
INSERT INTO `website_profile_catalogues` VALUES (1183, 's', 'chrisjericho', 'Chris Jericho', '209');
INSERT INTO `website_profile_catalogues` VALUES (1184, 's', 'chuckpalumbo', 'Chuck Palumbo', '209');
INSERT INTO `website_profile_catalogues` VALUES (1185, 's', 'clothesline', 'Clothes line', '8');
INSERT INTO `website_profile_catalogues` VALUES (1187, 's', 'cmpunk', 'CM Punk', '209');
INSERT INTO `website_profile_catalogues` VALUES (1188, 's', 'cn_teleskull', 'CN Teleskull', '10');
INSERT INTO `website_profile_catalogues` VALUES (1190, 's', 'cny_dragon_body_l', 'CNY Dragon Body L', '217');
INSERT INTO `website_profile_catalogues` VALUES (1191, 's', 'cny_dragon_body_r', 'CNY Dragon Body R', '217');
INSERT INTO `website_profile_catalogues` VALUES (1192, 's', 'cny_dragon_head_l', 'CNY Dragon Head L', '217');
INSERT INTO `website_profile_catalogues` VALUES (1193, 's', 'cny_dragon_head_r', 'CNY Dragon Head R', '217');
INSERT INTO `website_profile_catalogues` VALUES (1195, 's', 'cny_kungfu_dude', 'CNY Kunfu Dude', '217');
INSERT INTO `website_profile_catalogues` VALUES (1197, 's', 'cny_kungfu_girl', 'CNY Kunfu Girl', '217');
INSERT INTO `website_profile_catalogues` VALUES (1198, 's', 'colombia', 'Colombia', '216');
INSERT INTO `website_profile_catalogues` VALUES (1199, 's', 'comma', 'Comma', '5');
INSERT INTO `website_profile_catalogues` VALUES (1206, 's', 'curthawkins', 'Curt Hawkins', '209');
INSERT INTO `website_profile_catalogues` VALUES (1208, 's', 'dagofhabbo_trophy', 'Dag of Habbo Trophy', '8');
INSERT INTO `website_profile_catalogues` VALUES (1209, 's', 'dagornot', 'DagorNot', '8');
INSERT INTO `website_profile_catalogues` VALUES (1210, 's', 'de_bday_4', 'DE 4th Bday', '8');
INSERT INTO `website_profile_catalogues` VALUES (1217, 's', 'goth_border_horizontal', 'Deal goth border Horizontale', '7');
INSERT INTO `website_profile_catalogues` VALUES (1218, 's', 'goth_border_vertical', 'deal goth border Verticale', '7');
INSERT INTO `website_profile_catalogues` VALUES (1219, 's', 'dhsmith', 'DH Smith', '209');
INSERT INTO `website_profile_catalogues` VALUES (1220, 's', 'diadeinternetsticker2008_001', 'Dia de Internetsticker 2008', '214');
INSERT INTO `website_profile_catalogues` VALUES (1221, 's', 'diamond_reward', 'Diamond Reward', '9');
INSERT INTO `website_profile_catalogues` VALUES (1222, 's', 'dimsims', 'Dim Sims', '8');
INSERT INTO `website_profile_catalogues` VALUES (1223, 's', 'dk_bobbacurse_2', 'DK Bobbacurse 2', '8');
INSERT INTO `website_profile_catalogues` VALUES (1224, 's', 'doelee', 'Doelee', '216');
INSERT INTO `website_profile_catalogues` VALUES (1225, 's', 'donk', 'Donk', '216');
INSERT INTO `website_profile_catalogues` VALUES (1227, 's', 'dudesons', 'Dudesons', '214');
INSERT INTO `website_profile_catalogues` VALUES (1228, 's', 'Durian2', 'Durian', '8');
INSERT INTO `website_profile_catalogues` VALUES (1231, 's', 'easter_bird', 'Easter Bird', '210');
INSERT INTO `website_profile_catalogues` VALUES (1236, 's', 'easter_broomstick_001', 'Easter Broomstick_001', '210');
INSERT INTO `website_profile_catalogues` VALUES (1238, 's', 'easter_bunnymoped', 'Easter Bunnymoped', '210');
INSERT INTO `website_profile_catalogues` VALUES (1240, 's', 'easter_carrot_rocket', 'Easter Carrot_rocket', '210');
INSERT INTO `website_profile_catalogues` VALUES (1251, 's', 'easter_pointyhat', 'Easter Pointyhat', '210');
INSERT INTO `website_profile_catalogues` VALUES (1253, 's', 'easter_rabbit_in_hole', 'Easter Rabbit_in_hole', '210');
INSERT INTO `website_profile_catalogues` VALUES (1255, 's', 'easteregg_costume', 'Easter Egg Costume', '210');
INSERT INTO `website_profile_catalogues` VALUES (1258, 's', 'edge', 'Edge', '209');
INSERT INTO `website_profile_catalogues` VALUES (1259, 's', 'edito_fisherman_bait', 'Edito Fisherman Bait', '8');
INSERT INTO `website_profile_catalogues` VALUES (1260, 's', 'edito_logo', 'Edito Logo', '8');
INSERT INTO `website_profile_catalogues` VALUES (1263, 's', 'eggs', 'Eggs', '10');
INSERT INTO `website_profile_catalogues` VALUES (1264, 's', 'elegant_bling', 'Elegant Bling', '9');
INSERT INTO `website_profile_catalogues` VALUES (1265, 's', 'elijahburke', 'Elijah Burke', '209');
INSERT INTO `website_profile_catalogues` VALUES (1269, 's', 'evil_giant_bunny', 'Evil Giant Bunny', '10');
INSERT INTO `website_profile_catalogues` VALUES (1270, 's', 'exclamation', 'Exclamation', '5');
INSERT INTO `website_profile_catalogues` VALUES (1271, 's', 'exe_sticker_cheappen', 'Executive Cheappen', '8');
INSERT INTO `website_profile_catalogues` VALUES (1272, 's', 'exe_sticker_luxurypen', 'Executive Luxurypen', '8');
INSERT INTO `website_profile_catalogues` VALUES (1276, 's', 'extreme_dudesons', 'Extreme Dudesons', '214');
INSERT INTO `website_profile_catalogues` VALUES (1277, 's', 'eyeleft', 'Eye Left', '10');
INSERT INTO `website_profile_catalogues` VALUES (1278, 's', 'eyeright', 'Eye Right', '10');
INSERT INTO `website_profile_catalogues` VALUES (1280, 's', 'fantasticfourlogo', 'Fantastic Four Logo', '214');
INSERT INTO `website_profile_catalogues` VALUES (1281, 's', 'featuredgroup', 'Featuredgroup', '50');
INSERT INTO `website_profile_catalogues` VALUES (1283, 's', 'featuredgroup_sticker', 'Featuredgroup Sticker', '50');
INSERT INTO `website_profile_catalogues` VALUES (1284, 's', 'felix01', 'Felix 1', '214');
INSERT INTO `website_profile_catalogues` VALUES (1285, 's', 'felix02', 'Felix 2', '214');
INSERT INTO `website_profile_catalogues` VALUES (1286, 's', 'felix03', 'Felix 3', '214');
INSERT INTO `website_profile_catalogues` VALUES (1289, 's', 'festus', 'Festus', '209');
INSERT INTO `website_profile_catalogues` VALUES (1291, 's', 'fi_golden_snake', 'FI Golden Snake', '8');
INSERT INTO `website_profile_catalogues` VALUES (1292, 's', 'fi_koirakisu2', 'FI Koirakisu 2', '216');
INSERT INTO `website_profile_catalogues` VALUES (1293, 's', 'fi_mino', 'FI Mino', '216');
INSERT INTO `website_profile_catalogues` VALUES (1294, 's', 'fi_posti_box', 'FI Posti Box', '216');
INSERT INTO `website_profile_catalogues` VALUES (1295, 's', 'fi_posti_girl', 'FI Posti Girl', '216');
INSERT INTO `website_profile_catalogues` VALUES (1297, 's', 'fieldberries', 'Fieldberries', '214');
INSERT INTO `website_profile_catalogues` VALUES (1298, 's', 'fiesta_chica_tampax', 'Fiesta Chica Tampax', '214');
INSERT INTO `website_profile_catalogues` VALUES (1299, 's', 'fiesta_minifalda_1', 'Fiesta Minifalda 1', '214');
INSERT INTO `website_profile_catalogues` VALUES (1300, 's', 'fiesta_minifalda_2', 'Fiesta Minifalda 2', '214');
INSERT INTO `website_profile_catalogues` VALUES (1301, 's', 'fiesta_welcome', 'Fiesta Welcome', '214');
INSERT INTO `website_profile_catalogues` VALUES (1302, 's', 'filmstrip_corner_botleft', 'Filmstrip Corner Botleft', '221');
INSERT INTO `website_profile_catalogues` VALUES (1303, 's', 'filmstrip_corner_botright', 'Filmstrip Corner Botright', '221');
INSERT INTO `website_profile_catalogues` VALUES (1304, 's', 'filmstrip_corner_topleft', 'Filmstrip Corner Topleft', '221');
INSERT INTO `website_profile_catalogues` VALUES (1305, 's', 'filmstrip_corner_topright', 'Filmstrip Corner Topright', '221');
INSERT INTO `website_profile_catalogues` VALUES (1306, 's', 'filmstrip_horiz', 'Filmstrip Horiz', '221');
INSERT INTO `website_profile_catalogues` VALUES (1307, 's', 'filmstrip_vert', 'Filmstrip Vert', '221');
INSERT INTO `website_profile_catalogues` VALUES (1308, 's', 'finger_push', 'Finger Push', '12');
INSERT INTO `website_profile_catalogues` VALUES (1309, 's', 'fish', 'Fish', '8');
INSERT INTO `website_profile_catalogues` VALUES (1312, 's', 'flower2', 'Flower 2', '214');
INSERT INTO `website_profile_catalogues` VALUES (1313, 's', 'football', 'Football', '216');
INSERT INTO `website_profile_catalogues` VALUES (1314, 's', 'freeHugs', 'Free Hugs', '216');
INSERT INTO `website_profile_catalogues` VALUES (1317, 's', 'funaki', 'Funaki', '209');
INSERT INTO `website_profile_catalogues` VALUES (1318, 's', 'fwrk_blue', 'FWRK Blue', '223');
INSERT INTO `website_profile_catalogues` VALUES (1319, 's', 'fwrk_pink', 'FWRK Pink', '223');
INSERT INTO `website_profile_catalogues` VALUES (1320, 's', 'fwrk_yellow', 'FWRK Yellow', '223');
INSERT INTO `website_profile_catalogues` VALUES (1324, 's', 'gaspar', 'Gaspar', '216');
INSERT INTO `website_profile_catalogues` VALUES (1327, 's', 'gaursticker3', 'Gaursticker 3', '214');
INSERT INTO `website_profile_catalogues` VALUES (1328, 's', 'sticker_geniefirehead', 'Genie Fire Head', '18');
INSERT INTO `website_profile_catalogues` VALUES (1330, 's', 'gf_hotornot_blue', 'Girlfriend Blue', '214');
INSERT INTO `website_profile_catalogues` VALUES (1331, 's', 'gf_hotornot_pink', 'Girlfriend Pink', '214');
INSERT INTO `website_profile_catalogues` VALUES (1332, 's', 'globalw_sticker', 'Global World Sticker', '235');
INSERT INTO `website_profile_catalogues` VALUES (1337, 's', 'gorillahand1', 'Gorilla Hand 1', '10');
INSERT INTO `website_profile_catalogues` VALUES (1338, 's', 'gorillahand2', 'Gorilla Hand 2', '10');
INSERT INTO `website_profile_catalogues` VALUES (1344, 's', 'gothic_draculacape', 'Gothic Draculacape', '214');
INSERT INTO `website_profile_catalogues` VALUES (1346, 's', 'gothic_scienceplatform', 'Gothic Scienceplatform', '18');
INSERT INTO `website_profile_catalogues` VALUES (1352, 's', 'gravesticker', 'Grave Sticker', '10');
INSERT INTO `website_profile_catalogues` VALUES (1353, 's', 'gravesticker2', 'Grave Sticker 2', '10');
INSERT INTO `website_profile_catalogues` VALUES (1354, 's', 'greenhockeystick', 'Green Hockey Stick', '213');
INSERT INTO `website_profile_catalogues` VALUES (1360, 's', 'grunge_polaroid_1', 'Grunge Polaroid 1', '216');
INSERT INTO `website_profile_catalogues` VALUES (1361, 's', 'grunge_polaroid_2', 'Grunge Polaroid 2', '216');
INSERT INTO `website_profile_catalogues` VALUES (1362, 's', 'grunge_polaroid_3', 'Grunge Polaroid 3', '216');
INSERT INTO `website_profile_catalogues` VALUES (1363, 's', 'grunge_polaroid_4', 'Grunge Polaroid 4', '216');
INSERT INTO `website_profile_catalogues` VALUES (1364, 's', 'grunge_polaroid_5', 'Grunge Polaroid 5', '216');
INSERT INTO `website_profile_catalogues` VALUES (1365, 's', 'guard1', 'Guard 1', '216');
INSERT INTO `website_profile_catalogues` VALUES (1366, 's', 'guard2', 'Guard 2', '216');
INSERT INTO `website_profile_catalogues` VALUES (1367, 's', 'guccimama', 'Guccimama', '216');
INSERT INTO `website_profile_catalogues` VALUES (1370, 's', 'habbo_island', 'Habbo Island', '207');
INSERT INTO `website_profile_catalogues` VALUES (1372, 's', 'habbobynightsticker', 'Habbo By Night-sticker', '10');
INSERT INTO `website_profile_catalogues` VALUES (1373, 's', 'habbohome_of_the_month', 'Habbohome Of The Month', '50');
INSERT INTO `website_profile_catalogues` VALUES (1375, 's', 'habborella_logo', 'Habborella Logo', '8');
INSERT INTO `website_profile_catalogues` VALUES (1377, 's', 'hacksaw', 'Hacksaw', '209');
INSERT INTO `website_profile_catalogues` VALUES (1378, 's', 'hat_clown2', 'Hat Clown 2', '18');
INSERT INTO `website_profile_catalogues` VALUES (1379, 's', 'hc_hat', 'HC Hat', '18');
INSERT INTO `website_profile_catalogues` VALUES (1380, 's', 'highlighter_1', 'Highlighter 1', '238');
INSERT INTO `website_profile_catalogues` VALUES (1381, 's', 'highlighter_2', 'Highlighter 2', '238');
INSERT INTO `website_profile_catalogues` VALUES (1382, 's', 'highlighter_mark1', 'Highlighter Mark 1', '238');
INSERT INTO `website_profile_catalogues` VALUES (1383, 's', 'highlighter_mark2', 'Highlighter Mark 2', '238');
INSERT INTO `website_profile_catalogues` VALUES (1384, 's', 'highlighter_mark3', 'Highlighter Mark 3', '238');
INSERT INTO `website_profile_catalogues` VALUES (1385, 's', 'highlighter_mark4b', 'Highlighter Mark 4', '238');
INSERT INTO `website_profile_catalogues` VALUES (1386, 's', 'highlighter_mark5', 'Highlighter Mark 5', '238');
INSERT INTO `website_profile_catalogues` VALUES (1387, 's', 'highlighter_mark6', 'Highlighter Mark 6', '238');
INSERT INTO `website_profile_catalogues` VALUES (1388, 's', 'hockey_habbo', 'Hockey Habbo', '213');
INSERT INTO `website_profile_catalogues` VALUES (1389, 's', 'hockeyref', 'Hockeyref', '213');
INSERT INTO `website_profile_catalogues` VALUES (1390, 's', 'holycarp', 'Holycarp', '8');
INSERT INTO `website_profile_catalogues` VALUES (1391, 's', 'homer', 'Homer', '216');
INSERT INTO `website_profile_catalogues` VALUES (1392, 's', 'horizontalink', 'Horizontalink', '238');
INSERT INTO `website_profile_catalogues` VALUES (1393, 's', 'hornswoggle', 'Hornswoggle', '209');
INSERT INTO `website_profile_catalogues` VALUES (1394, 's', 'hp_guest', 'HP Guest', '216');
INSERT INTO `website_profile_catalogues` VALUES (1429, 's', 'hw_3d_glasses', '3d Glasses', '221');
INSERT INTO `website_profile_catalogues` VALUES (1430, 's', 'hw_actionstar', 'Actionstar', '221');
INSERT INTO `website_profile_catalogues` VALUES (1431, 's', 'hw_amp_big', 'Amp Big', '221');
INSERT INTO `website_profile_catalogues` VALUES (1432, 's', 'hw_amp_small', 'Amp Small', '221');
INSERT INTO `website_profile_catalogues` VALUES (1433, 's', 'bartender_costume', 'Bartender Costume', '221');
INSERT INTO `website_profile_catalogues` VALUES (1434, 's', 'hw_bassplayer_boy', 'Bassplayer Boy', '221');
INSERT INTO `website_profile_catalogues` VALUES (1435, 's', 'hw_bassplayer_girl', 'Bassplayer Girl', '221');
INSERT INTO `website_profile_catalogues` VALUES (1437, 's', 'val_bgpattern_skull', 'Skull Background', '221');
INSERT INTO `website_profile_catalogues` VALUES (1438, 's', 'hw_bigcamera', 'Bigcamera', '221');
INSERT INTO `website_profile_catalogues` VALUES (1439, 's', 'hw_bouncers', 'Bouncers', '221');
INSERT INTO `website_profile_catalogues` VALUES (1440, 's', 'hw_camera_l', 'Camera L', '221');
INSERT INTO `website_profile_catalogues` VALUES (1441, 's', 'hw_camera_r', 'Camera R', '221');
INSERT INTO `website_profile_catalogues` VALUES (1445, 's', 'hw_carpet_corner_down', 'Carpet Corner Down', '221');
INSERT INTO `website_profile_catalogues` VALUES (1446, 's', 'hw_carpet_corner_up', 'Carpet Corner Up', '221');
INSERT INTO `website_profile_catalogues` VALUES (1447, 's', 'hw_carpet_end_ldown', 'Carpet End Ldown', '221');
INSERT INTO `website_profile_catalogues` VALUES (1448, 's', 'hw_carpet_end_lup', 'Carpet End Lup', '221');
INSERT INTO `website_profile_catalogues` VALUES (1449, 's', 'hw_carpet_end_rdown', 'Carpet End Rdown', '221');
INSERT INTO `website_profile_catalogues` VALUES (1450, 's', 'hw_carpet_end_rup', 'Carpet End Rup', '221');
INSERT INTO `website_profile_catalogues` VALUES (1451, 's', 'hw_carpet_l', 'Carpet L', '221');
INSERT INTO `website_profile_catalogues` VALUES (1452, 's', 'hw_carpet_r', 'Carpet R', '221');
INSERT INTO `website_profile_catalogues` VALUES (1453, 's', 'hw_drummer_boy', 'Drummer Boy', '221');
INSERT INTO `website_profile_catalogues` VALUES (1454, 's', 'hw_drummer_girl', 'Drummer Girl', '221');
INSERT INTO `website_profile_catalogues` VALUES (1456, 's', 'hw_guitarplayer_black', 'Guitarplayer Black', '221');
INSERT INTO `website_profile_catalogues` VALUES (1457, 's', 'hw_guitarplayer_white', 'Guitarplayer White', '221');
INSERT INTO `website_profile_catalogues` VALUES (1458, 's', 'hw_hairspray', 'Hairspray', '221');
INSERT INTO `website_profile_catalogues` VALUES (1459, 's', 'hw_hippie_2', 'Hippie', '221');
INSERT INTO `website_profile_catalogues` VALUES (1460, 's', 'hw_hitcher', 'Hitcher', '221');
INSERT INTO `website_profile_catalogues` VALUES (1461, 's', 'hw_inmate', 'Inmate', '221');
INSERT INTO `website_profile_catalogues` VALUES (1462, 's', 'hw_kenny_burger', 'Kenny Burger', '221');
INSERT INTO `website_profile_catalogues` VALUES (1463, 's', 'hw_kenny_fight', 'Kenny Fight', '221');
INSERT INTO `website_profile_catalogues` VALUES (1464, 's', 'hw_kenny_shock', 'Kenny Shock', '221');
INSERT INTO `website_profile_catalogues` VALUES (1465, 's', 'hw_keyboards', 'Keyboards', '221');
INSERT INTO `website_profile_catalogues` VALUES (1468, 's', 'hw_logoanim', 'Logoanim', '221');
INSERT INTO `website_profile_catalogues` VALUES (1469, 's', 'hw_mega_afro', 'Mega Afro', '221');
INSERT INTO `website_profile_catalogues` VALUES (1470, 's', 'hw_microphone', 'Microphone', '221');
INSERT INTO `website_profile_catalogues` VALUES (1471, 's', 'hw_moh_logo', 'Moh Logo', '221');
INSERT INTO `website_profile_catalogues` VALUES (1472, 's', 'hw_shades', 'Shades', '221');
INSERT INTO `website_profile_catalogues` VALUES (1473, 's', 'hw_speedobunny', 'Speedobunny', '221');
INSERT INTO `website_profile_catalogues` VALUES (1474, 's', 'val_lovecostume3', 'Valentine Love Costume', '221');
INSERT INTO `website_profile_catalogues` VALUES (1477, 's', 'hwood07_klaffi2', 'Habbowood Klaffi 2', '221');
INSERT INTO `website_profile_catalogues` VALUES (1480, 's', 'i_love_bobba2', 'I love Bobba', '204');
INSERT INTO `website_profile_catalogues` VALUES (1481, 's', 'i_love_coffee', 'I love Coffee', '204');
INSERT INTO `website_profile_catalogues` VALUES (1483, 's', 'icecube_big', 'Icecube Big', '235');
INSERT INTO `website_profile_catalogues` VALUES (1484, 's', 'icecube_small', 'Icecube Small', '235');
INSERT INTO `website_profile_catalogues` VALUES (1488, 's', 'sticker_antiSquidF', 'Inked Antisquidf', '239');
INSERT INTO `website_profile_catalogues` VALUES (1489, 's', 'sticker_antisquidm', 'Inked Antisquidm', '239');
INSERT INTO `website_profile_catalogues` VALUES (1490, 's', 'sticker_antiSquidRank', 'Inked Antisquidrank', '239');
INSERT INTO `website_profile_catalogues` VALUES (1491, 's', 'sticker_inkedblink', 'Inked Inkedblink', '239');
INSERT INTO `website_profile_catalogues` VALUES (1492, 's', 'sticker_amberLamp', 'Inked Lamp', '239');
INSERT INTO `website_profile_catalogues` VALUES (1493, 's', 'sticker_inkedLove', 'Inked Love', '239');
INSERT INTO `website_profile_catalogues` VALUES (1494, 's', 'sticker_inkedPoster', 'Inked Poster', '239');
INSERT INTO `website_profile_catalogues` VALUES (1495, 's', 'sticker_inkedShip', 'Inked Ship', '239');
INSERT INTO `website_profile_catalogues` VALUES (1496, 's', 'sticker_inkedSpit', 'Inked Spit', '239');
INSERT INTO `website_profile_catalogues` VALUES (1497, 's', 'sticker_inkedPants', 'Inked Squidpants', '239');
INSERT INTO `website_profile_catalogues` VALUES (1498, 's', 'sticker_inkedSquidPatrol', 'Inked Suidpatrol', '239');
INSERT INTO `website_profile_catalogues` VALUES (1499, 's', 'island', 'Island', '207');
INSERT INTO `website_profile_catalogues` VALUES (1500, 's', 'it_habbohome', 'IT Habbohome', '50');
INSERT INTO `website_profile_catalogues` VALUES (1501, 's', 'it_stickerpodio', 'IT Stickerpodio', '8');
INSERT INTO `website_profile_catalogues` VALUES (1502, 's', 'it_toilet', 'IT Toilet', '216');
INSERT INTO `website_profile_catalogues` VALUES (1504, 's', 'jamescurtis', 'James Curtis', '209');
INSERT INTO `website_profile_catalogues` VALUES (1505, 's', 'jared', 'Jared', '216');
INSERT INTO `website_profile_catalogues` VALUES (1506, 's', 'jarno_guest', 'Jarno Guest', '216');
INSERT INTO `website_profile_catalogues` VALUES (1507, 's', 'jarppi_guest', 'Jarppi Guest', '216');
INSERT INTO `website_profile_catalogues` VALUES (1508, 's', 'jarppi_guest2', 'Jarppi Guest 2', '216');
INSERT INTO `website_profile_catalogues` VALUES (1509, 's', 'jbl', 'JBL', '209');
INSERT INTO `website_profile_catalogues` VALUES (1510, 's', 'jeffhardy', 'Jeff Hardy', '209');
INSERT INTO `website_profile_catalogues` VALUES (1511, 's', 'jenkki_monster_sticker', 'Jenkki Monster Sticker', '214');
INSERT INTO `website_profile_catalogues` VALUES (1513, 's', 'jesse', 'Jesse', '209');
INSERT INTO `website_profile_catalogues` VALUES (1514, 's', 'sticker_2', 'Jigoku Shojo 1', '214');
INSERT INTO `website_profile_catalogues` VALUES (1515, 's', 'sticker_2', 'Jigoku Shojo 2', '214');
INSERT INTO `website_profile_catalogues` VALUES (1516, 's', 'jimmyhart', 'Jimmyhart', '209');
INSERT INTO `website_profile_catalogues` VALUES (1517, 's', 'jimmysnuka', 'Jimmysnuka', '209');
INSERT INTO `website_profile_catalogues` VALUES (1518, 's', 'johnmorrison', 'Johnmorrison', '209');
INSERT INTO `website_profile_catalogues` VALUES (1519, 's', 'jp_5years', 'JP 5 Uears', '8');
INSERT INTO `website_profile_catalogues` VALUES (1520, 's', 'jp_godzilla', 'JP Godzilla', '204');
INSERT INTO `website_profile_catalogues` VALUES (1521, 's', 'jp_sushi', 'JP Sushi', '204');
INSERT INTO `website_profile_catalogues` VALUES (1522, 's', 'juice', 'Juice', '8');
INSERT INTO `website_profile_catalogues` VALUES (1523, 's', 'jukka_guest', 'Jukka Guest', '216');
INSERT INTO `website_profile_catalogues` VALUES (1524, 's', 'jukka_guest2', 'Jukka Guest2', '216');
INSERT INTO `website_profile_catalogues` VALUES (1525, 's', 'sticker_fireworkBoom1', 'July0408 Boom 1', '223');
INSERT INTO `website_profile_catalogues` VALUES (1526, 's', 'sticker_auntSamantha', 'July408 Auntsamantha', '223');
INSERT INTO `website_profile_catalogues` VALUES (1527, 's', 'sticker_fireworkBoom2', 'July408 Boom 2', '223');
INSERT INTO `website_profile_catalogues` VALUES (1528, 's', 'sticker_fireworkBoom3', 'July408 Boom 3', '223');
INSERT INTO `website_profile_catalogues` VALUES (1529, 's', 'sticker_fireworkBoom4', 'July408 Boom 4', '223');
INSERT INTO `website_profile_catalogues` VALUES (1530, 's', 'sticker_flagBorder', 'July408 Border', '223');
INSERT INTO `website_profile_catalogues` VALUES (1531, 's', 'sticker_4th08', 'July408 July4th', '223');
INSERT INTO `website_profile_catalogues` VALUES (1532, 's', 'sticker_uncleSam', 'July408 Unclesam', '223');
INSERT INTO `website_profile_catalogues` VALUES (1534, 's', 'karigrandi_sticker', 'Karigrandi Sticker', '214');
INSERT INTO `website_profile_catalogues` VALUES (1535, 's', 'kennydykstra', 'Kennydy Kstra', '209');
INSERT INTO `website_profile_catalogues` VALUES (1536, 's', 'ketupat', 'Ketupat', '8');
INSERT INTO `website_profile_catalogues` VALUES (1537, 's', 'kevinthorn', 'Kevinthorn', '209');
INSERT INTO `website_profile_catalogues` VALUES (1538, 's', 'kfp_sticker_01', 'KFP Sticker 1', '214');
INSERT INTO `website_profile_catalogues` VALUES (1539, 's', 'kfp_sticker_02', 'KFP Sticker 2', '214');
INSERT INTO `website_profile_catalogues` VALUES (1540, 's', 'kfp_sticker_03', 'KFP Sticker 3', '214');
INSERT INTO `website_profile_catalogues` VALUES (1541, 's', 'kfp_sticker_04', 'KFP Sticker 4', '214');
INSERT INTO `website_profile_catalogues` VALUES (1542, 's', 'kfp_sticker_05', 'KFP Sticker 5', '214');
INSERT INTO `website_profile_catalogues` VALUES (1543, 's', 'kfp_sticker_06', 'KFP Sticker 6', '214');
INSERT INTO `website_profile_catalogues` VALUES (1544, 's', 'kfp_sticker_07', 'KFP Sticker 7', '214');
INSERT INTO `website_profile_catalogues` VALUES (1545, 's', 'kip_partnerbtn', 'KIP Partnerbtn', '225');
INSERT INTO `website_profile_catalogues` VALUES (1546, 's', 'kir-stamp1', 'KIR Stamp 1', '225');
INSERT INTO `website_profile_catalogues` VALUES (1547, 's', 'kir_bam_sticker', 'KIR Bam Sticker', '225');
INSERT INTO `website_profile_catalogues` VALUES (1548, 's', 'kir_elkah_sticker', 'KIR Elkah Sticker', '225');
INSERT INTO `website_profile_catalogues` VALUES (1549, 's', 'kir_foz_sticker', 'KIR Foz Sticker', '225');
INSERT INTO `website_profile_catalogues` VALUES (1550, 's', 'kir_fushi_sticker', 'KIR Fushi Sticker', '225');
INSERT INTO `website_profile_catalogues` VALUES (1551, 's', 'kir_stamp1', 'KIR Stamp 1', '225');
INSERT INTO `website_profile_catalogues` VALUES (1552, 's', 'kir_stamp2', 'KIR Stamp 2', '225');
INSERT INTO `website_profile_catalogues` VALUES (1553, 's', 'kir_stamp3b', 'KIR Stamp 3', '225');
INSERT INTO `website_profile_catalogues` VALUES (1555, 's', 'kir_stamp4', 'Kir Stamp', '225');
INSERT INTO `website_profile_catalogues` VALUES (1557, 's', 'kir_stamp5', 'KIR Stamp 5', '225');
INSERT INTO `website_profile_catalogues` VALUES (1558, 's', 'kir_stamp6', 'KIR Stamp 6', '225');
INSERT INTO `website_profile_catalogues` VALUES (1559, 's', 'kir_stamp6_002', 'KIR Stamp 7', '225');
INSERT INTO `website_profile_catalogues` VALUES (1561, 's', 'kir_sticker', 'KIR Sticker', '225');
INSERT INTO `website_profile_catalogues` VALUES (1562, 's', 'kir_winner_01', 'KIR Winner 1', '225');
INSERT INTO `website_profile_catalogues` VALUES (1563, 's', 'kir_winner_02', 'KIR Winner 2', '225');
INSERT INTO `website_profile_catalogues` VALUES (1564, 's', 'kir_winner_03', 'KIR Winner 3', '225');
INSERT INTO `website_profile_catalogues` VALUES (1565, 's', 'kir_winner_04', 'KIR Winner 4', '225');
INSERT INTO `website_profile_catalogues` VALUES (1566, 's', 'kir_winner_05', 'KIR Winner 5', '225');
INSERT INTO `website_profile_catalogues` VALUES (1567, 's', 'kir_winner_06', 'KIR Winner 6', '225');
INSERT INTO `website_profile_catalogues` VALUES (1568, 's', 'kir_winner_07', 'KIR Winner 7', '225');
INSERT INTO `website_profile_catalogues` VALUES (1569, 's', 'kir_winner_08', 'KIR Winner 8', '225');
INSERT INTO `website_profile_catalogues` VALUES (1570, 's', 'kir_winner_09', 'KIR Winner 9', '225');
INSERT INTO `website_profile_catalogues` VALUES (1571, 's', 'kir_winner_10', 'KIR Winner 10', '225');
INSERT INTO `website_profile_catalogues` VALUES (1572, 's', 'kir_winner_11', 'KIR Winner 11', '225');
INSERT INTO `website_profile_catalogues` VALUES (1573, 's', 'kir_yobbo_sticker', 'KIR Yobbo Sticker', '225');
INSERT INTO `website_profile_catalogues` VALUES (1574, 's', 'kitsune_wonders', 'Kitsune Wonders', '224');
INSERT INTO `website_profile_catalogues` VALUES (1575, 's', 'kitsune_yelling', 'Kitsune Yelling', '224');
INSERT INTO `website_profile_catalogues` VALUES (1576, 's', 'kitune_fighting', 'Kitune Fighting', '224');
INSERT INTO `website_profile_catalogues` VALUES (1580, 's', 'krans', 'Krans', '8');
INSERT INTO `website_profile_catalogues` VALUES (1582, 's', 'lamp_single_1', 'Lamp 1', '8');
INSERT INTO `website_profile_catalogues` VALUES (1583, 's', 'lamp_single_2', 'Lamp 2', '8');
INSERT INTO `website_profile_catalogues` VALUES (1584, 's', 'lamp_single_3', 'Lamp 3', '8');
INSERT INTO `website_profile_catalogues` VALUES (1585, 's', 'lamp_single_4', 'Lamp 4', '8');
INSERT INTO `website_profile_catalogues` VALUES (1586, 's', 'lamp_group', 'Lamp Group', '8');
INSERT INTO `website_profile_catalogues` VALUES (1588, 's', 'lapanen_blue', 'Lapanen Blue', '8');
INSERT INTO `website_profile_catalogues` VALUES (1593, 's', 'lapanen_purple', 'Lapanen Purple', '8');
INSERT INTO `website_profile_catalogues` VALUES (1594, 's', 'lapanen_red', 'Lapanen Red', '8');
INSERT INTO `website_profile_catalogues` VALUES (1596, 's', 'lapanen_yellow', 'Lapanen Yellow', '8');
INSERT INTO `website_profile_catalogues` VALUES (1597, 's', 'lashey', 'Lashey', '209');
INSERT INTO `website_profile_catalogues` VALUES (1598, 's', 'leafs1', 'Leafs 1', '7');
INSERT INTO `website_profile_catalogues` VALUES (1600, 's', 'leapday', 'Leapday', '8');
INSERT INTO `website_profile_catalogues` VALUES (1604, 's', 'lightbulb', 'Lightbulb', '8');
INSERT INTO `website_profile_catalogues` VALUES (1605, 's', 'limo_back', 'Limo Back', '221');
INSERT INTO `website_profile_catalogues` VALUES (1606, 's', 'limo_doorpiece', 'Limo Doorpiece', '221');
INSERT INTO `website_profile_catalogues` VALUES (1607, 's', 'limo_front', 'Limo Front', '221');
INSERT INTO `website_profile_catalogues` VALUES (1608, 's', 'limo_windowpiece', 'Limo Windowpiece', '221');
INSERT INTO `website_profile_catalogues` VALUES (1609, 's', 'line', 'Linha', '5');
INSERT INTO `website_profile_catalogues` VALUES (1610, 's', 'linnsticker', 'Linnsticker', '214');
INSERT INTO `website_profile_catalogues` VALUES (1614, 's', 'loderse', 'Loderse', '214');
INSERT INTO `website_profile_catalogues` VALUES (1616, 's', 'lovebed', 'Lovebed', '226');
INSERT INTO `website_profile_catalogues` VALUES (1622, 's', 'mansikka_tarra', 'Mansikka Tarra', '214');
INSERT INTO `website_profile_catalogues` VALUES (1623, 's', 'v2Maria', 'Maria', '209');
INSERT INTO `website_profile_catalogues` VALUES (1624, 's', 'markhenry', 'Mark Henry', '209');
INSERT INTO `website_profile_catalogues` VALUES (1625, 's', 'matthardy', 'Matt Hardy', '209');
INSERT INTO `website_profile_catalogues` VALUES (1626, 's', 'mattstriker', 'Matt Striker', '209');
INSERT INTO `website_profile_catalogues` VALUES (1627, 's', 'mayweather', 'May Weather', '209');
INSERT INTO `website_profile_catalogues` VALUES (1628, 's', 'melchor', 'Melchor', '216');
INSERT INTO `website_profile_catalogues` VALUES (1629, 's', 'v2Melina', 'Melina', '209');
INSERT INTO `website_profile_catalogues` VALUES (1631, 's', 'mexico', 'Mexico', '216');
INSERT INTO `website_profile_catalogues` VALUES (1633, 's', 'midsommar_1', 'Mid Sommar 1', '8');
INSERT INTO `website_profile_catalogues` VALUES (1634, 's', 'mikeknoxx', 'Mike Knoxx', '209');
INSERT INTO `website_profile_catalogues` VALUES (1635, 's', 'missj', 'Miss J', '216');
INSERT INTO `website_profile_catalogues` VALUES (1636, 's', 'money_o', 'Money Low', '7');
INSERT INTO `website_profile_catalogues` VALUES (1637, 's', 'money_stash', 'Money Stash', '7');
INSERT INTO `website_profile_catalogues` VALUES (1638, 's', 'money_v', 'Money High', '7');
INSERT INTO `website_profile_catalogues` VALUES (1639, 's', 'mooncake_dark', 'Mooncake Dark', '217');
INSERT INTO `website_profile_catalogues` VALUES (1640, 's', 'mooncake_light', 'Mooncake Light', '217');
INSERT INTO `website_profile_catalogues` VALUES (1641, 's', 'mrkennedy', 'Mr Kennedy', '209');
INSERT INTO `website_profile_catalogues` VALUES (1642, 's', 'mummimor', 'Mummimor', '216');
INSERT INTO `website_profile_catalogues` VALUES (1644, 's', 'nail2', 'Nail 2', '12');
INSERT INTO `website_profile_catalogues` VALUES (1645, 's', 'nail3', 'Nail 3', '12');
INSERT INTO `website_profile_catalogues` VALUES (1646, 's', 'needle_1', 'Needle 1', '12');
INSERT INTO `website_profile_catalogues` VALUES (1647, 's', 'needle_2', 'Needle 2', '12');
INSERT INTO `website_profile_catalogues` VALUES (1648, 's', 'needle_3', 'Needle 3', '12');
INSERT INTO `website_profile_catalogues` VALUES (1649, 's', 'needle_4', 'Needle 4', '12');
INSERT INTO `website_profile_catalogues` VALUES (1650, 's', 'needle_5', 'Needle 5', '12');
INSERT INTO `website_profile_catalogues` VALUES (1652, 's', 'newyear_2007_anim', 'Newyear 2007', '223');
INSERT INTO `website_profile_catalogues` VALUES (1655, 's', 'newyear_sparkler', 'Newyear Sparkler', '223');
INSERT INTO `website_profile_catalogues` VALUES (1656, 's', 'nigirisushi', 'Nigiri Sushi', '224');
INSERT INTO `website_profile_catalogues` VALUES (1657, 's', 'nl_coinguy_animated', 'NL Coinguy Animated', '8');
INSERT INTO `website_profile_catalogues` VALUES (1658, 's', 'nl_cupido', 'NL Cupido', '226');
INSERT INTO `website_profile_catalogues` VALUES (1659, 's', 'nl_downtown_costume', 'NL Downtown Costume', '18');
INSERT INTO `website_profile_catalogues` VALUES (1660, 's', 'nl_firecracker', 'NL Firecracker', '217');
INSERT INTO `website_profile_catalogues` VALUES (1661, 's', 'nl_football_guest', 'NL Football Guest', '216');
INSERT INTO `website_profile_catalogues` VALUES (1662, 's', 'nl_football_guest2', 'NL Football Guest 2', '216');
INSERT INTO `website_profile_catalogues` VALUES (1663, 's', 'nl_limo', 'NL Limo', '221');
INSERT INTO `website_profile_catalogues` VALUES (1664, 's', 'nl_wanted_costume', 'NL Wanted Costume', '18');
INSERT INTO `website_profile_catalogues` VALUES (1665, 's', 'no_space_sticker', 'No Space Sticker', '204');
INSERT INTO `website_profile_catalogues` VALUES (1666, 's', 'nowayout_slanted', 'No Way Out Slanted', '214');
INSERT INTO `website_profile_catalogues` VALUES (1670, 's', 'nunzio', 'Nunzio', '209');
INSERT INTO `website_profile_catalogues` VALUES (1671, 's', 'nz_heart', 'NZ Heart', '204');
INSERT INTO `website_profile_catalogues` VALUES (1672, 's', 'nz_tiki', 'NZ Tiki', '204');
INSERT INTO `website_profile_catalogues` VALUES (1675, 's', 'ogopogo1', 'Ogopogo 1', '217');
INSERT INTO `website_profile_catalogues` VALUES (1676, 's', 'oldfence_left', 'Oldfence Left', '8');
INSERT INTO `website_profile_catalogues` VALUES (1677, 's', 'oldfence_right', 'Oldfence Right', '8');
INSERT INTO `website_profile_catalogues` VALUES (1678, 's', 'orca_ideal_home', 'Orca Ideal Home', '8');
INSERT INTO `website_profile_catalogues` VALUES (1680, 's', 'paper_clip_1', 'Paper Clip 1', '12');
INSERT INTO `website_profile_catalogues` VALUES (1681, 's', 'paper_clip_2', 'Paper Clip 2', '12');
INSERT INTO `website_profile_catalogues` VALUES (1682, 's', 'paper_clip_3', 'Paper Clip 3', '12');
INSERT INTO `website_profile_catalogues` VALUES (1683, 's', 'parrot', 'Parrot', '8');
INSERT INTO `website_profile_catalogues` VALUES (1684, 's', 'patsday_claddagh', 'Patsday Claddagh', '241');
INSERT INTO `website_profile_catalogues` VALUES (1685, 's', 'patsday_kissme', 'Patsday Kissme', '241');
INSERT INTO `website_profile_catalogues` VALUES (1687, 's', 'patsday_potogold', 'Patsday Potogold', '241');
INSERT INTO `website_profile_catalogues` VALUES (1688, 's', 'patsday_shamborderh', 'Patsday Shamborderh', '241');
INSERT INTO `website_profile_catalogues` VALUES (1689, 's', 'patsday_shamborderv', 'Patsday Shamborderv', '241');
INSERT INTO `website_profile_catalogues` VALUES (1690, 's', 'patsday_shamrock', 'Patsday Shamrock', '241');
INSERT INTO `website_profile_catalogues` VALUES (1691, 's', 'paullondon', 'Paul London', '209');
INSERT INTO `website_profile_catalogues` VALUES (1692, 's', 'paulorndorff', 'Paul Orndorff', '209');
INSERT INTO `website_profile_catalogues` VALUES (1704, 's', 'plaster', 'Plaster', '8');
INSERT INTO `website_profile_catalogues` VALUES (1705, 's', 'plaster2', 'Plaster 2', '8');
INSERT INTO `website_profile_catalogues` VALUES (1714, 's', 'pro_eco', 'Pro Eco', '235');
INSERT INTO `website_profile_catalogues` VALUES (1717, 's', 'sticker_podBrains', 'Prom of the Dead Sticker Brains', '221');
INSERT INTO `website_profile_catalogues` VALUES (1718, 's', 'sticker_podDress', 'Prom of the Dead Sticker Dress', '221');
INSERT INTO `website_profile_catalogues` VALUES (1719, 's', 'sticker_podDuck', 'Prom of the Dead Sticker Duck', '221');
INSERT INTO `website_profile_catalogues` VALUES (1720, 's', 'sticker_podPoster', 'Prom of the Dead Sticker Poster', '221');
INSERT INTO `website_profile_catalogues` VALUES (1721, 's', 'sticker_podSuit', 'Prom of the Dead Sticker Suit', '221');
INSERT INTO `website_profile_catalogues` VALUES (1722, 's', 'sticker_podZombieGnarl', 'Prom of the Dead Sticker Zombie', '221');
INSERT INTO `website_profile_catalogues` VALUES (1724, 's', 'queensibidi', 'Queensibidi', '216');
INSERT INTO `website_profile_catalogues` VALUES (1725, 's', 'question', 'Question', '5');
INSERT INTO `website_profile_catalogues` VALUES (1727, 's', 'radar', 'Radar', '216');
INSERT INTO `website_profile_catalogues` VALUES (1728, 's', 'randyorton', 'Randy Orton', '209');
INSERT INTO `website_profile_catalogues` VALUES (1729, 's', 'rasta', 'Rasta', '216');
INSERT INTO `website_profile_catalogues` VALUES (1730, 's', 'ratv2', 'Ratv 2', '217');
INSERT INTO `website_profile_catalogues` VALUES (1731, 's', 'redhockeystick', 'Red Hockeystick', '213');
INSERT INTO `website_profile_catalogues` VALUES (1732, 's', 'redlamp', 'Redlamp', '8');
INSERT INTO `website_profile_catalogues` VALUES (1733, 's', 'redstarfish', 'Red Starfish', '8');
INSERT INTO `website_profile_catalogues` VALUES (1734, 's', 'nl_football_guest', 'Referee 1 Guest', '216');
INSERT INTO `website_profile_catalogues` VALUES (1736, 's', 'referee_03_guest', 'Referee 3 Guest', '216');
INSERT INTO `website_profile_catalogues` VALUES (1737, 's', 'reymysterio', 'Reymysterio', '209');
INSERT INTO `website_profile_catalogues` VALUES (1738, 's', 'ricflair', 'Ricflair', '209');
INSERT INTO `website_profile_catalogues` VALUES (1739, 's', 'roddypiper', 'Roddypiper', '209');
INSERT INTO `website_profile_catalogues` VALUES (1740, 's', 'ronsimmons', 'Ronsimmons', '209');
INSERT INTO `website_profile_catalogues` VALUES (1741, 's', 'sticker_rotw', 'Room of the Week', '50');
INSERT INTO `website_profile_catalogues` VALUES (1748, 's', 'sackcostume_thumb', 'Sack Costume', '18');
INSERT INTO `website_profile_catalogues` VALUES (1749, 's', 'saferinternet2008', 'Safer Internet 2008', '8');
INSERT INTO `website_profile_catalogues` VALUES (1750, 's', 'samsung1', 'Samsung 1', '214');
INSERT INTO `website_profile_catalogues` VALUES (1751, 's', 'samsung2', 'Samsung 2', '214');
INSERT INTO `website_profile_catalogues` VALUES (1752, 's', 'samsung3', 'Samsung 3', '214');
INSERT INTO `website_profile_catalogues` VALUES (1753, 's', 'samsung4', 'Samsung 4', '214');
INSERT INTO `website_profile_catalogues` VALUES (1754, 's', 'samsung5', 'Samsung 5', '214');
INSERT INTO `website_profile_catalogues` VALUES (1756, 's', 'santinomarella', 'Santinoma Rella', '209');
INSERT INTO `website_profile_catalogues` VALUES (1758, 's', 'sasquatch7', 'Sasquatch', '8');
INSERT INTO `website_profile_catalogues` VALUES (1759, 's', 'sasquatch_hands', 'Sasquatch Hands', '18');
INSERT INTO `website_profile_catalogues` VALUES (1760, 's', 'satay', 'Satay', '8');
INSERT INTO `website_profile_catalogues` VALUES (1761, 's', 'scubacapsule_anim', 'Scubacapsule Anim', '18');
INSERT INTO `website_profile_catalogues` VALUES (1762, 's', 'se_sticker_competition', 'SE Sticker Competition', '18');
INSERT INTO `website_profile_catalogues` VALUES (1763, 's', 'seagull_01', 'Seagull 1', '207');
INSERT INTO `website_profile_catalogues` VALUES (1764, 's', 'seagull_02', 'Seagull 2', '207');
INSERT INTO `website_profile_catalogues` VALUES (1768, 's', 'sergeantslaughter', 'Sergeant Slaughter', '209');
INSERT INTO `website_profile_catalogues` VALUES (1769, 's', 'sg_mtv_sticker_01', 'MTV Sticker 1', '214');
INSERT INTO `website_profile_catalogues` VALUES (1770, 's', 'sg_mtv_sticker_02', 'MTV Sticker 2', '214');
INSERT INTO `website_profile_catalogues` VALUES (1771, 's', 'sg_mtv_sticker_03', 'MTV Sticker 3', '214');
INSERT INTO `website_profile_catalogues` VALUES (1772, 's', 'shell', 'Shell', '207');
INSERT INTO `website_profile_catalogues` VALUES (1773, 's', 'sheltonbenjamin', 'Shelton Benjamin', '209');
INSERT INTO `website_profile_catalogues` VALUES (1774, 's', 'shrubbery', 'Shrubbery', '8');
INSERT INTO `website_profile_catalogues` VALUES (1776, 's', 'skeletor_001', 'Skeletor 1', '10');
INSERT INTO `website_profile_catalogues` VALUES (1777, 's', 'skull', 'Skull', '10');
INSERT INTO `website_profile_catalogues` VALUES (1778, 's', 'skull2', 'Skull 2', '10');
INSERT INTO `website_profile_catalogues` VALUES (1780, 's', 'michaels', 'Smichaels', '209');
INSERT INTO `website_profile_catalogues` VALUES (1781, 's', 'snitsky', 'Snitsky', '209');
INSERT INTO `website_profile_catalogues` VALUES (1782, 's', 'snowball', 'Snowball', '8');
INSERT INTO `website_profile_catalogues` VALUES (1783, 's', 'snowball_bumpy', 'Snowball Bumpy', '8');
INSERT INTO `website_profile_catalogues` VALUES (1785, 's', 'GiocatoreA1', 'Soccer Dude 1', '216');
INSERT INTO `website_profile_catalogues` VALUES (1786, 's', 'GiocatoreA', 'Soccer Dude 2', '216');
INSERT INTO `website_profile_catalogues` VALUES (1787, 's', 'GiocatoreA3', 'Soccer Dude 3', '216');
INSERT INTO `website_profile_catalogues` VALUES (1788, 's', 'giocatoreA4', 'Soccer Dude 4', '216');
INSERT INTO `website_profile_catalogues` VALUES (1789, 's', 'giocatoreA5', 'Soccer Dude 5', '216');
INSERT INTO `website_profile_catalogues` VALUES (1830, 's', 'sofresh', 'Sofresh', '204');
INSERT INTO `website_profile_catalogues` VALUES (1831, 's', 'sticker_goblin1_l', 'spiderwick Goblin 1 L', '214');
INSERT INTO `website_profile_catalogues` VALUES (1832, 's', 'sticker_goblin1_r', 'spiderwick Goblin 1 R', '214');
INSERT INTO `website_profile_catalogues` VALUES (1833, 's', 'sticker_goblin2_l', 'spiderwick Goblin 2 L', '214');
INSERT INTO `website_profile_catalogues` VALUES (1834, 's', 'sticker_goblin2_r', 'spiderwick Goblin 2 R', '214');
INSERT INTO `website_profile_catalogues` VALUES (1835, 's', 'sticker_goblin_anim_l', 'spiderwick Goblin Anim L', '214');
INSERT INTO `website_profile_catalogues` VALUES (1836, 's', 'sticker_goblin_anim_r', 'spiderwick Goblin Anim R', '214');
INSERT INTO `website_profile_catalogues` VALUES (1837, 's', 'sticker_griffin_l', 'spiderwick Griffin L', '214');
INSERT INTO `website_profile_catalogues` VALUES (1838, 's', 'sticker_griffin_r', 'spiderwick Griffin R', '214');
INSERT INTO `website_profile_catalogues` VALUES (1839, 's', 'sticker_sprite1_l', 'spiderwick Sprite 1 L', '214');
INSERT INTO `website_profile_catalogues` VALUES (1840, 's', 'sticker_sprite1_r', 'spiderwick Sprite 1 R', '214');
INSERT INTO `website_profile_catalogues` VALUES (1841, 's', 'sticker_sprite2_l', 'spiderwick Sprite 2 L', '214');
INSERT INTO `website_profile_catalogues` VALUES (1842, 's', 'sticker_sprite2_r', 'spiderwick Sprite 2 R', '214');
INSERT INTO `website_profile_catalogues` VALUES (1845, 's', 'spill1', 'Spill 1', '8');
INSERT INTO `website_profile_catalogues` VALUES (1846, 's', 'spill2', 'Spill 2', '8');
INSERT INTO `website_profile_catalogues` VALUES (1847, 's', 'spill3', 'Spill 3', '8');
INSERT INTO `website_profile_catalogues` VALUES (1848, 's', 'spotlight_sticker_002', 'Spotlight Sticker', '8');
INSERT INTO `website_profile_catalogues` VALUES (1849, 's', 'spotlight_sticker2_001', 'Spotlight Sticker 2', '8');
INSERT INTO `website_profile_catalogues` VALUES (1852, 's', 'spray1', 'Spray', '8');
INSERT INTO `website_profile_catalogues` VALUES (1853, 's', 'spray2', 'Spray 2', '8');
INSERT INTO `website_profile_catalogues` VALUES (1854, 's', 'squib', 'Squib', '8');
INSERT INTO `website_profile_catalogues` VALUES (1869, 's', 'stanleycupsticker', 'Stanley Cup Sticker', '213');
INSERT INTO `website_profile_catalogues` VALUES (1872, 's', 'starburst', 'Starburst', '214');
INSERT INTO `website_profile_catalogues` VALUES (1873, 's', 'stevierichards', 'Stevie Richards', '209');
INSERT INTO `website_profile_catalogues` VALUES (1877, 's', '3_years_usa', 'Sticker 3 Years', '8');
INSERT INTO `website_profile_catalogues` VALUES (1879, 's', 'sticker_arrow_down', 'Sticker Arrow Down', '12');
INSERT INTO `website_profile_catalogues` VALUES (1880, 's', 'sticker_arrow_left', 'Sticker Arrow Left', '12');
INSERT INTO `website_profile_catalogues` VALUES (1881, 's', 'sticker_arrow_right', 'Sticker Arrow Right', '12');
INSERT INTO `website_profile_catalogues` VALUES (1882, 's', 'sticker_arrow_up', 'Sticker Arrow Up', '12');
INSERT INTO `website_profile_catalogues` VALUES (1883, 's', 'sticker_award_bronze', 'Sticker Award Bronze', '50');
INSERT INTO `website_profile_catalogues` VALUES (1884, 's', 'sticker_award_gold', 'Sticker Award Gold', '50');
INSERT INTO `website_profile_catalogues` VALUES (1886, 's', 'sticker_award_silver', 'Sticker Award Silver', '50');
INSERT INTO `website_profile_catalogues` VALUES (1888, 's', 'sticker_bonsai_ninjaf', 'Sticker Bonsai Ninjaf', '224');
INSERT INTO `website_profile_catalogues` VALUES (1889, 's', 'sticker_bonsai_ninjafa', 'Sticker Bonsai Ninjafa', '224');
INSERT INTO `website_profile_catalogues` VALUES (1890, 's', 'sticker_bonsai_ninjam', 'Sticker Bonsai Ninjam', '224');
INSERT INTO `website_profile_catalogues` VALUES (1891, 's', 'sticker_bonsai_ninjama', 'Sticker Bonsai Ninjama', '224');
INSERT INTO `website_profile_catalogues` VALUES (1892, 's', 'sticker_bonsai_samuraif', 'Sticker Bonsai Samuraif', '224');
INSERT INTO `website_profile_catalogues` VALUES (1893, 's', 'sticker_bonsai_samuraifa', 'Sticker Bonsai Samuraifa', '224');
INSERT INTO `website_profile_catalogues` VALUES (1894, 's', 'sticker_bonsai_samuraim', 'Sticker Bonsai Samuraim', '224');
INSERT INTO `website_profile_catalogues` VALUES (1895, 's', 'sticker_bonsai_samuraima', 'Sticker Bonsai Samuraima', '224');
INSERT INTO `website_profile_catalogues` VALUES (1897, 's', 'sticker_boxer', 'Sticker Boxer', '216');
INSERT INTO `website_profile_catalogues` VALUES (1898, 's', 'sticker_caballoons', 'Sticker Caballoons', '213');
INSERT INTO `website_profile_catalogues` VALUES (1899, 's', 'sticker_cabin', 'Sticker Cabin', '8');
INSERT INTO `website_profile_catalogues` VALUES (1901, 's', 'sticker_cais4', 'Sticker Cais 4', '213');
INSERT INTO `website_profile_catalogues` VALUES (1902, 's', 'sticker_cape', 'sticker_Cape', '18');
INSERT INTO `website_profile_catalogues` VALUES (1903, 's', 'sticker_catinabox', 'Sticker Catinabox', '8');
INSERT INTO `website_profile_catalogues` VALUES (1906, 's', 'sticker_chica_tampax', 'Sticker Chica_Tampax', '214');
INSERT INTO `website_profile_catalogues` VALUES (1907, 's', 'sticker_chica_tampax1', 'Sticker Chica_Tampax 1', '214');
INSERT INTO `website_profile_catalogues` VALUES (1908, 's', 'sticker_chica_tampax2', 'Sticker Chica Tampax 2', '214');
INSERT INTO `website_profile_catalogues` VALUES (1909, 's', 'sticker_chips', 'Sticker Chips', '8');
INSERT INTO `website_profile_catalogues` VALUES (1910, 's', 'sticker_clown_anim', 'Sticker Clown Anim', '216');
INSERT INTO `website_profile_catalogues` VALUES (1911, 's', 'sticker_coffee_stain', 'Sticker Coffee Stain', '8');
INSERT INTO `website_profile_catalogues` VALUES (1912, 's', 'sticker_coffee_steam_blue', 'Sticker Coffee Steam Blue', '8');
INSERT INTO `website_profile_catalogues` VALUES (1913, 's', 'sticker_coffee_steam_grey', 'Sticker Coffee Steam Grey', '8');
INSERT INTO `website_profile_catalogues` VALUES (1914, 's', 'sticker_croco', 'Sticker Croco', '8');
INSERT INTO `website_profile_catalogues` VALUES (1915, 's', 'sticker_da_blingclock', 'Sticker DA Blingclock', '8');
INSERT INTO `website_profile_catalogues` VALUES (1916, 's', 'sticker_dreamer', 'Sticker Dreamer', '8');
INSERT INTO `website_profile_catalogues` VALUES (1922, 's', 'eraser', 'Sticker Eraser', '8');
INSERT INTO `website_profile_catalogues` VALUES (1923, 's', 'sticker_eye_anim', 'Sticker Eye Anim', '8');
INSERT INTO `website_profile_catalogues` VALUES (1924, 'b', '01.gif', '01', '0');
INSERT INTO `website_profile_catalogues` VALUES (1925, 'b', '02.gif', '02', '0');
INSERT INTO `website_profile_catalogues` VALUES (1926, 'b', '03.gif', '03', '0');
INSERT INTO `website_profile_catalogues` VALUES (1927, 'b', '05.gif', '05', '0');
INSERT INTO `website_profile_catalogues` VALUES (1928, 'b', '06.gif', '06', '0');
INSERT INTO `website_profile_catalogues` VALUES (1929, 'b', '07.gif', '07', '0');
INSERT INTO `website_profile_catalogues` VALUES (1930, 'b', '08.gif', '08', '0');
INSERT INTO `website_profile_catalogues` VALUES (1931, 'b', '09.gif', '09', '0');
INSERT INTO `website_profile_catalogues` VALUES (1932, 'b', '10.gif', '10', '0');
INSERT INTO `website_profile_catalogues` VALUES (1933, 'b', '11.gif', '11', '0');
INSERT INTO `website_profile_catalogues` VALUES (1934, 'b', '12.gif', '12', '0');
INSERT INTO `website_profile_catalogues` VALUES (1935, 'b', '13.gif', '13', '0');
INSERT INTO `website_profile_catalogues` VALUES (1936, 'b', '14.gif', '14', '0');
INSERT INTO `website_profile_catalogues` VALUES (1937, 'b', '15.gif', '15', '0');
INSERT INTO `website_profile_catalogues` VALUES (1938, 'b', '16.gif', '16', '0');
INSERT INTO `website_profile_catalogues` VALUES (1939, 'b', '17.gif', '17', '0');
INSERT INTO `website_profile_catalogues` VALUES (1940, 'b', '18.gif', '18', '0');
INSERT INTO `website_profile_catalogues` VALUES (1941, 'b', '19.gif', '19', '0');
INSERT INTO `website_profile_catalogues` VALUES (1942, 'b', '21.gif', '21', '0');
INSERT INTO `website_profile_catalogues` VALUES (1943, 'b', '22.gif', '22', '0');
INSERT INTO `website_profile_catalogues` VALUES (1944, 'b', '23.gif', '23', '0');
INSERT INTO `website_profile_catalogues` VALUES (1945, 'b', '24.gif', '24', '0');
INSERT INTO `website_profile_catalogues` VALUES (1946, 'b', '25.gif', '25', '0');
INSERT INTO `website_profile_catalogues` VALUES (1947, 'b', '26.gif', '26', '0');
INSERT INTO `website_profile_catalogues` VALUES (1948, 'b', '27.gif', '27', '0');
INSERT INTO `website_profile_catalogues` VALUES (1949, 'b', '28.gif', '28', '0');
INSERT INTO `website_profile_catalogues` VALUES (1950, 'b', '29.gif', '29', '0');
INSERT INTO `website_profile_catalogues` VALUES (1951, 'b', '2lt4saq.jpg', '2lt4saq', '0');
INSERT INTO `website_profile_catalogues` VALUES (1952, 'b', '30.gif', '30', '0');
INSERT INTO `website_profile_catalogues` VALUES (1953, 'b', '32.gif', '32', '0');
INSERT INTO `website_profile_catalogues` VALUES (1954, 'b', '33.gif', '33', '0');
INSERT INTO `website_profile_catalogues` VALUES (1955, 'b', '38.gif', '38', '0');
INSERT INTO `website_profile_catalogues` VALUES (1956, 'b', '39.gif', '39', '0');
INSERT INTO `website_profile_catalogues` VALUES (1957, 'b', '40.gif', '40', '0');
INSERT INTO `website_profile_catalogues` VALUES (1958, 'b', '42.gif', '42', '0');
INSERT INTO `website_profile_catalogues` VALUES (1959, 'b', 'BG_10.png', 'BG_10', '0');
INSERT INTO `website_profile_catalogues` VALUES (1960, 'b', 'Hween06_BGpattern_slime.gif', 'Hween06_BGpattern_slime', '0');
INSERT INTO `website_profile_catalogues` VALUES (1961, 'b', 'SOB_BG.gif', 'SOB_BG', '0');
INSERT INTO `website_profile_catalogues` VALUES (1962, 'b', 'SOB_BG2.gif', 'SOB_BG2', '0');
INSERT INTO `website_profile_catalogues` VALUES (1963, 'b', 'SOB_BG3.gif', 'SOB_BG3', '0');
INSERT INTO `website_profile_catalogues` VALUES (1964, 'b', 'SOB_BG4.gif', 'SOB_BG4', '0');
INSERT INTO `website_profile_catalogues` VALUES (1965, 'b', 'Xmas_background.gif', 'Xmas_background', '0');
INSERT INTO `website_profile_catalogues` VALUES (1966, 'b', 'basket_ball.gif', 'basket_ball', '0');
INSERT INTO `website_profile_catalogues` VALUES (1967, 'b', 'bday_background.gif.png', 'bday_background.gif', '0');
INSERT INTO `website_profile_catalogues` VALUES (1968, 'b', 'bg.gif', 'bg', '0');
INSERT INTO `website_profile_catalogues` VALUES (1969, 'b', 'bg3.png', 'bg3', '0');
INSERT INTO `website_profile_catalogues` VALUES (1970, 'b', 'bg_blue.gif', 'bg_blue', '0');
INSERT INTO `website_profile_catalogues` VALUES (1971, 'b', 'bg_colour_01.gif', 'bg_colour_01', '0');
INSERT INTO `website_profile_catalogues` VALUES (1972, 'b', 'bg_colour_02.gif', 'bg_colour_02', '0');
INSERT INTO `website_profile_catalogues` VALUES (1973, 'b', 'bg_colour_03.gif', 'bg_colour_03', '0');
INSERT INTO `website_profile_catalogues` VALUES (1974, 'b', 'bg_colour_04.gif', 'bg_colour_04', '0');
INSERT INTO `website_profile_catalogues` VALUES (1975, 'b', 'bg_colour_05.gif', 'bg_colour_05', '0');
INSERT INTO `website_profile_catalogues` VALUES (1976, 'b', 'bg_colour_06.gif', 'bg_colour_06', '0');
INSERT INTO `website_profile_catalogues` VALUES (1977, 'b', 'bg_colour_07.gif', 'bg_colour_07', '0');
INSERT INTO `website_profile_catalogues` VALUES (1978, 'b', 'bg_colour_08.gif', 'bg_colour_08', '0');
INSERT INTO `website_profile_catalogues` VALUES (1979, 'b', 'bg_colour_09.gif', 'bg_colour_09', '0');
INSERT INTO `website_profile_catalogues` VALUES (1980, 'b', 'bg_colour_10.gif', 'bg_colour_10', '0');
INSERT INTO `website_profile_catalogues` VALUES (1981, 'b', 'bg_colour_11.gif', 'bg_colour_11', '0');
INSERT INTO `website_profile_catalogues` VALUES (1982, 'b', 'bg_colour_12.gif', 'bg_colour_12', '0');
INSERT INTO `website_profile_catalogues` VALUES (1983, 'b', 'bg_colour_13.gif', 'bg_colour_13', '0');
INSERT INTO `website_profile_catalogues` VALUES (1984, 'b', 'bg_colour_14.gif', 'bg_colour_14', '0');
INSERT INTO `website_profile_catalogues` VALUES (1985, 'b', 'bg_colour_15.gif', 'bg_colour_15', '0');
INSERT INTO `website_profile_catalogues` VALUES (1986, 'b', 'bg_colour_16.gif', 'bg_colour_16', '0');
INSERT INTO `website_profile_catalogues` VALUES (1987, 'b', 'bg_crosshatch.gif', 'bg_crosshatch', '0');
INSERT INTO `website_profile_catalogues` VALUES (1988, 'b', 'bg_duck.gif', 'bg_duck', '0');
INSERT INTO `website_profile_catalogues` VALUES (1989, 'b', 'bg_empty.gif', 'bg_empty', '0');
INSERT INTO `website_profile_catalogues` VALUES (1990, 'b', 'bg_fish.gif', 'bg_fish', '0');
INSERT INTO `website_profile_catalogues` VALUES (1991, 'b', 'bg_frog.gif', 'bg_frog', '0');
INSERT INTO `website_profile_catalogues` VALUES (1992, 'b', 'bg_grass.gif', 'bg_grass', '0');
INSERT INTO `website_profile_catalogues` VALUES (1993, 'b', 'bg_grey.gif', 'bg_grey', '0');
INSERT INTO `website_profile_catalogues` VALUES (1994, 'b', 'bg_info.gif', 'bg_info', '0');
INSERT INTO `website_profile_catalogues` VALUES (1995, 'b', 'bg_love.gif', 'bg_love', '0');
INSERT INTO `website_profile_catalogues` VALUES (1996, 'b', 'bg_newh.gif', 'bg_newh', '0');
INSERT INTO `website_profile_catalogues` VALUES (1997, 'b', 'bg_newh2.gif', 'bg_newh2', '0');
INSERT INTO `website_profile_catalogues` VALUES (1998, 'b', 'bg_ool.gif', 'bg_ool', '0');
INSERT INTO `website_profile_catalogues` VALUES (1999, 'b', 'bg_ool2.gif', 'bg_ool2', '0');
INSERT INTO `website_profile_catalogues` VALUES (2000, 'b', 'bg_pattern_bobbaskulls1.gif', 'bg_pattern_bobbaskulls1', '0');
INSERT INTO `website_profile_catalogues` VALUES (2001, 'b', 'bg_pattern_cars.gif', 'bg_pattern_cars', '0');
INSERT INTO `website_profile_catalogues` VALUES (2002, 'b', 'bg_pattern_clouds.gif', 'bg_pattern_clouds', '0');
INSERT INTO `website_profile_catalogues` VALUES (2003, 'b', 'bg_pattern_deepred.gif', 'bg_pattern_deepred', '0');
INSERT INTO `website_profile_catalogues` VALUES (2004, 'b', 'bg_petal.gif', 'bg_petal', '0');
INSERT INTO `website_profile_catalogues` VALUES (2005, 'b', 'bg_pink.gif', 'bg_pink', '0');
INSERT INTO `website_profile_catalogues` VALUES (2006, 'b', 'bg_teal.gif', 'bg_teal', '0');
INSERT INTO `website_profile_catalogues` VALUES (2007, 'b', 'bg_tiles.gif', 'bg_tiles', '0');
INSERT INTO `website_profile_catalogues` VALUES (2008, 'b', 'bg_water.gif', 'bg_water', '0');
INSERT INTO `website_profile_catalogues` VALUES (2009, 'b', 'bg_wood.gif', 'bg_wood', '0');
INSERT INTO `website_profile_catalogues` VALUES (2010, 'b', 'bg_wooden.gif', 'bg_wooden', '0');
INSERT INTO `website_profile_catalogues` VALUES (2011, 'b', 'bg_xer.gif', 'bg_xer', '0');
INSERT INTO `website_profile_catalogues` VALUES (2012, 'b', 'bga.gif', 'bga', '0');
INSERT INTO `website_profile_catalogues` VALUES (2013, 'b', 'bgblue.gif', 'bgblue', '0');
INSERT INTO `website_profile_catalogues` VALUES (2014, 'b', 'bubble.gif', 'bubble', '0');
INSERT INTO `website_profile_catalogues` VALUES (2015, 'b', 'bunnybackround.gif', 'bunnybackround', '0');
INSERT INTO `website_profile_catalogues` VALUES (2016, 'b', 'duck_back.gif', 'duck_back', '0');
INSERT INTO `website_profile_catalogues` VALUES (2017, 'b', 'greenbg.gif', 'greenbg', '0');
INSERT INTO `website_profile_catalogues` VALUES (2018, 'b', 'ham_back.gif', 'ham_back', '0');
INSERT INTO `website_profile_catalogues` VALUES (2019, 'b', 'hp_back1.gif', 'hp_back1', '0');
INSERT INTO `website_profile_catalogues` VALUES (2020, 'b', 'hp_back10.gif', 'hp_back10', '0');
INSERT INTO `website_profile_catalogues` VALUES (2021, 'b', 'hp_back11.gif', 'hp_back11', '0');
INSERT INTO `website_profile_catalogues` VALUES (2022, 'b', 'hp_back13.gif', 'hp_back13', '0');
INSERT INTO `website_profile_catalogues` VALUES (2023, 'b', 'hp_back14.gif', 'hp_back14', '0');
INSERT INTO `website_profile_catalogues` VALUES (2024, 'b', 'hp_back17.gif', 'hp_back17', '0');
INSERT INTO `website_profile_catalogues` VALUES (2025, 'b', 'hp_back18.gif', 'hp_back18', '0');
INSERT INTO `website_profile_catalogues` VALUES (2026, 'b', 'hp_back19.gif', 'hp_back19', '0');
INSERT INTO `website_profile_catalogues` VALUES (2027, 'b', 'hp_back20.gif', 'hp_back20', '0');
INSERT INTO `website_profile_catalogues` VALUES (2028, 'b', 'hp_back21.gif', 'hp_back21', '0');
INSERT INTO `website_profile_catalogues` VALUES (2029, 'b', 'hp_back22.gif', 'hp_back22', '0');
INSERT INTO `website_profile_catalogues` VALUES (2030, 'b', 'hp_back3.gif', 'hp_back3', '0');
INSERT INTO `website_profile_catalogues` VALUES (2031, 'b', 'hp_back4.gif', 'hp_back4', '0');
INSERT INTO `website_profile_catalogues` VALUES (2032, 'b', 'hp_back5.gif', 'hp_back5', '0');
INSERT INTO `website_profile_catalogues` VALUES (2033, 'b', 'hp_back8.gif', 'hp_back8', '0');
INSERT INTO `website_profile_catalogues` VALUES (2034, 'b', 'hp_back9.gif', 'hp_back9', '0');
INSERT INTO `website_profile_catalogues` VALUES (2035, 'b', 'inside.gif', 'inside', '0');
INSERT INTO `website_profile_catalogues` VALUES (2036, 'b', 'inside7.gif', 'inside7', '0');
INSERT INTO `website_profile_catalogues` VALUES (2037, 'b', 'inside_1.gif', 'inside_1', '0');
INSERT INTO `website_profile_catalogues` VALUES (2038, 'b', 'inside_10.gif', 'inside_10', '0');
INSERT INTO `website_profile_catalogues` VALUES (2039, 'b', 'inside_11.gif', 'inside_11', '0');
INSERT INTO `website_profile_catalogues` VALUES (2040, 'b', 'inside_12.gif', 'inside_12', '0');
INSERT INTO `website_profile_catalogues` VALUES (2041, 'b', 'inside_13.gif', 'inside_13', '0');
INSERT INTO `website_profile_catalogues` VALUES (2042, 'b', 'inside_14.gif', 'inside_14', '0');
INSERT INTO `website_profile_catalogues` VALUES (2043, 'b', 'inside_15.gif', 'inside_15', '0');
INSERT INTO `website_profile_catalogues` VALUES (2044, 'b', 'inside_16.gif', 'inside_16', '0');
INSERT INTO `website_profile_catalogues` VALUES (2045, 'b', 'inside_2.gif', 'inside_2', '0');
INSERT INTO `website_profile_catalogues` VALUES (2046, 'b', 'inside_3.gif', 'inside_3', '0');
INSERT INTO `website_profile_catalogues` VALUES (2047, 'b', 'inside_4.gif', 'inside_4', '0');
INSERT INTO `website_profile_catalogues` VALUES (2048, 'b', 'inside_5.gif', 'inside_5', '0');
INSERT INTO `website_profile_catalogues` VALUES (2049, 'b', 'inside_6.gif', 'inside_6', '0');
INSERT INTO `website_profile_catalogues` VALUES (2050, 'b', 'inside_8.gif', 'inside_8', '0');
INSERT INTO `website_profile_catalogues` VALUES (2051, 'b', 'inside_9.gif', 'inside_9', '0');
INSERT INTO `website_profile_catalogues` VALUES (2052, 'b', 'loveduck_back.gif', 'loveduck_back', '0');
INSERT INTO `website_profile_catalogues` VALUES (2053, 'b', 'modebackround.gif', 'modebackround', '0');
INSERT INTO `website_profile_catalogues` VALUES (2054, 'b', 'newbg.png', 'newbg', '0');
INSERT INTO `website_profile_catalogues` VALUES (2055, 'b', 'pinkbg.gif', 'pinkbg', '0');
INSERT INTO `website_profile_catalogues` VALUES (2056, 'b', 'qmarkbackround.gif', 'qmarkbackround', '0');
INSERT INTO `website_profile_catalogues` VALUES (2057, 'b', 'snowbg1.gif', 'snowbg1', '0');
INSERT INTO `website_profile_catalogues` VALUES (2058, 'b', 'snowbg2.gif', 'snowbg2', '0');
INSERT INTO `website_profile_catalogues` VALUES (2059, 'b', 'snowflake_us.gif', 'snowflake_us', '0');
INSERT INTO `website_profile_catalogues` VALUES (2060, 'b', 'soccer_bg.gif', 'soccer_bg', '0');
INSERT INTO `website_profile_catalogues` VALUES (2061, 'b', 'spiders.gif', 'spiders', '0');
INSERT INTO `website_profile_catalogues` VALUES (2062, 'b', 'ss_bg.gif', 'ss_bg', '0');
INSERT INTO `website_profile_catalogues` VALUES (2063, 'b', 'star_sky.gif', 'star_sky', '0');
INSERT INTO `website_profile_catalogues` VALUES (2064, 'b', 'star_sky2.gif', 'star_sky2', '0');
INSERT INTO `website_profile_catalogues` VALUES (2065, 'b', 'streets_background.gif', 'streets_background', '0');
INSERT INTO `website_profile_catalogues` VALUES (2066, 'b', 'streets_background2.gif', 'streets_background2', '0');
INSERT INTO `website_profile_catalogues` VALUES (2067, 'b', 'streets_background3.gif', 'streets_background3', '0');
INSERT INTO `website_profile_catalogues` VALUES (2068, 'b', 'streets_background4.gif', 'streets_background4', '0');
INSERT INTO `website_profile_catalogues` VALUES (2069, 'b', 'stripes.gif', 'stripes', '0');
INSERT INTO `website_profile_catalogues` VALUES (2070, 'b', 'val_bg.gif', 'val_bg', '0');
INSERT INTO `website_profile_catalogues` VALUES (2071, 'b', 'vara.gif', 'vara', '0');
INSERT INTO `website_profile_catalogues` VALUES (2072, 'b', 'vara1.gif', 'vara1', '0');
INSERT INTO `website_profile_catalogues` VALUES (2073, 'b', 'vara2.gif', 'vara2', '0');
INSERT INTO `website_profile_catalogues` VALUES (2074, 'b', 'vara3.gif', 'vara3', '0');
INSERT INTO `website_profile_catalogues` VALUES (2075, 'b', 'vara4.gif', 'vara4', '0');
INSERT INTO `website_profile_catalogues` VALUES (2076, 'b', 'xmas_bgpattern_starsky.gif', 'xmas_bgpattern_starsky', '0');

-- ----------------------------
-- Table structure for website_profile_catalogues_cats
-- ----------------------------
DROP TABLE IF EXISTS `website_profile_catalogues_cats`;
CREATE TABLE `website_profile_catalogues_cats`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 's',
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1002 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_profile_catalogues_cats
-- ----------------------------
INSERT INTO `website_profile_catalogues_cats` VALUES (3, 's', 'Trax');
INSERT INTO `website_profile_catalogues_cats` VALUES (5, 's', 'Alphabet Plastic');
INSERT INTO `website_profile_catalogues_cats` VALUES (6, 's', 'Alphabet Bling');
INSERT INTO `website_profile_catalogues_cats` VALUES (7, 's', 'Borders');
INSERT INTO `website_profile_catalogues_cats` VALUES (8, 's', 'Others');
INSERT INTO `website_profile_catalogues_cats` VALUES (9, 's', 'Sparkles');
INSERT INTO `website_profile_catalogues_cats` VALUES (10, 's', 'Halloween');
INSERT INTO `website_profile_catalogues_cats` VALUES (12, 's', 'Pointers');
INSERT INTO `website_profile_catalogues_cats` VALUES (13, 's', 'Floral');
INSERT INTO `website_profile_catalogues_cats` VALUES (14, 's', 'FX');
INSERT INTO `website_profile_catalogues_cats` VALUES (15, 's', 'SnowStorm');
INSERT INTO `website_profile_catalogues_cats` VALUES (16, 's', 'Battleball');
INSERT INTO `website_profile_catalogues_cats` VALUES (18, 's', 'Costume');
INSERT INTO `website_profile_catalogues_cats` VALUES (50, 's', 'Prizes');
INSERT INTO `website_profile_catalogues_cats` VALUES (201, 's', 'OB');
INSERT INTO `website_profile_catalogues_cats` VALUES (204, 's', 'Buttons');
INSERT INTO `website_profile_catalogues_cats` VALUES (205, 's', 'Alhambra');
INSERT INTO `website_profile_catalogues_cats` VALUES (207, 's', 'Beach');
INSERT INTO `website_profile_catalogues_cats` VALUES (209, 's', 'WWE');
INSERT INTO `website_profile_catalogues_cats` VALUES (210, 's', 'Easter');
INSERT INTO `website_profile_catalogues_cats` VALUES (213, 's', 'Hockey');
INSERT INTO `website_profile_catalogues_cats` VALUES (214, 's', 'Advertisement');
INSERT INTO `website_profile_catalogues_cats` VALUES (216, 's', 'Avatars');
INSERT INTO `website_profile_catalogues_cats` VALUES (217, 's', 'China');
INSERT INTO `website_profile_catalogues_cats` VALUES (221, 's', 'Hollywood');
INSERT INTO `website_profile_catalogues_cats` VALUES (223, 's', 'Celebration');
INSERT INTO `website_profile_catalogues_cats` VALUES (224, 's', 'Japanese');
INSERT INTO `website_profile_catalogues_cats` VALUES (225, 's', 'Keep it Real');
INSERT INTO `website_profile_catalogues_cats` VALUES (226, 's', 'Valentines');
INSERT INTO `website_profile_catalogues_cats` VALUES (235, 's', 'Environment');
INSERT INTO `website_profile_catalogues_cats` VALUES (236, 's', 'Banks');
INSERT INTO `website_profile_catalogues_cats` VALUES (238, 's', 'Highlighters');
INSERT INTO `website_profile_catalogues_cats` VALUES (239, 's', 'Inked');
INSERT INTO `website_profile_catalogues_cats` VALUES (241, 's', 'St Patricks');

-- ----------------------------
-- Table structure for website_rares
-- ----------------------------
CREATE TABLE IF NOT EXISTS `website_rares` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `parent_id` int(250) NOT NULL DEFAULT 1,
  `name` varchar(108) NOT NULL,
  `item_id` int(250) NOT NULL DEFAULT 0,
  `image` varchar(250) NOT NULL,
  `cost_credits` int(15) NOT NULL DEFAULT 0,
  `cost_points` int(15) NOT NULL DEFAULT 0,
  `points_type` int(15) NOT NULL DEFAULT 5,
  `last_edited` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_editor` int(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for website_rares_pages
-- ----------------------------
CREATE TABLE IF NOT EXISTS `website_rares_pages` (
  `id` int(55) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `description` varchar(55) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;


-- Table structure for website_profile_homes
-- ----------------------------
DROP TABLE IF EXISTS `website_profile_homes`;
CREATE TABLE `website_profile_homes`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `z` int(255) NULL DEFAULT NULL,
  `x` int(255) NULL DEFAULT NULL,
  `y` int(255) NULL DEFAULT NULL,
  `skin` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `data` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Alter table fixes for Cosmic to work
-- ----------------------------
ALTER TABLE users ADD secret_key varchar(40) NULL DEFAULT NULL;
ALTER TABLE users ADD pincode varchar(11) NULL DEFAULT NULL;
ALTER TABLE users ADD extra_rank int(2) NULL DEFAULT NULL;
ALTER TABLE users ADD template enum('light','dark') NULL DEFAULT 'light';
ALTER TABLE bans MODIFY COLUMN machine_id varchar(255)NOT NULL DEFAULT '';

SET FOREIGN_KEY_CHECKS = 1;
