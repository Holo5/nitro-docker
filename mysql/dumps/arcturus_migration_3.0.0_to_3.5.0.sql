INSERT INTO `emulator_settings`(`key`, `value`) VALUES ('wired.place.under', '0');
INSERT INTO `emulator_settings`(`key`, `value`) VALUES ('wired.custom.enabled', '0');

INSERT INTO `emulator_texts` (`key`, `value`) VALUES ('commands.error.cmd_stalk.forgot_username', 'Specify the username of the Habbo you want to follow!');

-- Enable or Disable TTY in console (Default is enabled)
INSERT INTO `emulator_settings` (`key`, `value`) VALUES ('console.mode', '1');

-- Youtube Api v3 key to YoutubeManager
INSERT INTO `emulator_settings` (`key`, `value`) VALUES ('youtube.apikey', '');

INSERT INTO `emulator_settings` (`key`, `value`) VALUES ('hotel.gifts.length.max', '300');

INSERT INTO `emulator_settings` (`key`, `value`) VALUES ('hotel.trophies.length.max', '300');

-- Add friendship categories table
CREATE TABLE `messenger_categories` (
                                        `id` int NOT NULL AUTO_INCREMENT,
                                        `name` varchar(25) NOT NULL,
                                        `user_id` int NOT NULL,
                                        UNIQUE KEY `identifier` (`id`)
);

-- Set an ID (int) from category list items
ALTER TABLE messenger_friendships ADD category int NOT NULL DEFAULT '0' AFTER friends_since;


-- ----------------------------
-- Table structure for calendar_campaigns
-- ----------------------------
DROP TABLE IF EXISTS `calendar_campaigns`;
CREATE TABLE `calendar_campaigns` (
                                      `id` int NOT NULL AUTO_INCREMENT,
                                      `name` varchar(255) NOT NULL DEFAULT '',
                                      `image` varchar(255) NOT NULL DEFAULT '',
                                      `start_timestamp` int NOT NULL DEFAULT '0',
                                      `total_days` int NOT NULL DEFAULT '30',
                                      `lock_expired` enum('1','0') NOT NULL DEFAULT '1',
                                      `enabled` enum('1','0') NOT NULL DEFAULT '1',
                                      UNIQUE KEY `id` (`id`)
);

-- ----------------------------
-- Table structure for calendar_rewards
-- ----------------------------
DROP TABLE IF EXISTS `calendar_rewards`;
CREATE TABLE `calendar_rewards` (
                                    `id` int NOT NULL AUTO_INCREMENT,
                                    `campaign_id` int NOT NULL DEFAULT '0',
                                    `product_name` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
                                    `custom_image` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
                                    `credits` int NOT NULL DEFAULT '0',
                                    `pixels` int NOT NULL DEFAULT '0',
                                    `points` int NOT NULL DEFAULT '0',
                                    `points_type` int NOT NULL DEFAULT '0',
                                    `badge` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
                                    `item_id` int NOT NULL DEFAULT '0',
                                    `subscription_type` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
                                    `subscription_days` int NOT NULL DEFAULT '0',
                                    PRIMARY KEY (`id`) USING BTREE
);

-- ----------------------------
-- Table structure for calendar_rewards_claimed
-- ----------------------------
DROP TABLE IF EXISTS `calendar_rewards_claimed`;
CREATE TABLE `calendar_rewards_claimed` (
                                            `user_id` int NOT NULL,
                                            `campaign_id` int NOT NULL DEFAULT '0',
                                            `day` int NOT NULL,
                                            `reward_id` int NOT NULL,
                                            `timestamp` int NOT NULL
);

INSERT INTO `emulator_settings` (`key`, `value`) VALUES ('hotel.calendar.default', 'test');
INSERT INTO `emulator_settings` (`key`, `value`) VALUES ('hotel.calendar.pixels.hc_modifier', '2.0');

-- Calendar force open
ALTER TABLE `permissions` ADD COLUMN `acc_calendar_force` enum('0','1') NULL DEFAULT '0';

-- UpdateCalendar command.
ALTER TABLE `permissions` ADD `cmd_update_calendar` ENUM('0', '1') NOT NULL DEFAULT '0';
INSERT INTO `emulator_texts` (`key`, `value`) VALUES ('commands.description.cmd_update_calendar', ':update_calendar'), ('commands.keys.cmd_update_calendar', 'update_calendar');
INSERT INTO `emulator_texts` (`key`, `value`) VALUES ('commands.success.cmd_update_calendar', 'Calendar updated successfully!');

-- add moodlight configuration
INSERT INTO `emulator_settings` (`key`, `value`) VALUES ('moodlight.color_check.enabled', '1');

-- Mannequin name
INSERT INTO `emulator_texts` (`key`, `value`) VALUES ('hotel.mannequin.name.default', 'My look');

-- RCON: Change Username
INSERT INTO `emulator_texts` (`key`, `value`) VALUES ('rcon.alert.user.change_username', 'You can change your username. Click on yourself to change it.');

-- Custom Stacking Setting
INSERT INTO `emulator_settings` (`key`, `value`) VALUES ('custom.stacking.enabled', '0');
