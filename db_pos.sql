/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50638
 Source Host           : localhost:3306
 Source Schema         : db_pos

 Target Server Type    : MySQL
 Target Server Version : 50638
 File Encoding         : 65001

 Date: 11/06/2018 11:37:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ospos_app_config
-- ----------------------------
DROP TABLE IF EXISTS `ospos_app_config`;
CREATE TABLE `ospos_app_config`  (
  `key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_customers
-- ----------------------------
DROP TABLE IF EXISTS `ospos_customers`;
CREATE TABLE `ospos_customers`  (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT 1,
  `sales_tax_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `discount_percent` decimal(15, 2) NOT NULL DEFAULT 0.00,
  `package_id` int(11) NULL DEFAULT NULL,
  `points` int(11) NULL DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_id` int(10) NOT NULL,
  `consent` int(1) NOT NULL DEFAULT 0,
  UNIQUE INDEX `account_number`(`account_number`) USING BTREE,
  INDEX `person_id`(`person_id`) USING BTREE,
  INDEX `package_id`(`package_id`) USING BTREE,
  CONSTRAINT `ospos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ospos_customers_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `ospos_customers_packages` (`package_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_customers_packages
-- ----------------------------
DROP TABLE IF EXISTS `ospos_customers_packages`;
CREATE TABLE `ospos_customers_packages`  (
  `package_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `points_percent` float NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`package_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_customers_points
-- ----------------------------
DROP TABLE IF EXISTS `ospos_customers_points`;
CREATE TABLE `ospos_customers_points`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `points_earned` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `person_id`(`person_id`) USING BTREE,
  INDEX `package_id`(`package_id`) USING BTREE,
  INDEX `sale_id`(`sale_id`) USING BTREE,
  CONSTRAINT `ospos_customers_points_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_customers` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ospos_customers_points_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `ospos_customers_packages` (`package_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ospos_customers_points_ibfk_3` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_dinner_tables
-- ----------------------------
DROP TABLE IF EXISTS `ospos_dinner_tables`;
CREATE TABLE `ospos_dinner_tables`  (
  `dinner_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`dinner_table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_employees
-- ----------------------------
DROP TABLE IF EXISTS `ospos_employees`;
CREATE TABLE `ospos_employees`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `hash_version` int(1) NOT NULL DEFAULT 2,
  `language` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `language_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `person_id`(`person_id`) USING BTREE,
  CONSTRAINT `ospos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_expense_categories
-- ----------------------------
DROP TABLE IF EXISTS `ospos_expense_categories`;
CREATE TABLE `ospos_expense_categories`  (
  `expense_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`expense_category_id`) USING BTREE,
  UNIQUE INDEX `category_name`(`category_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_expenses
-- ----------------------------
DROP TABLE IF EXISTS `ospos_expenses`;
CREATE TABLE `ospos_expenses`  (
  `expense_id` int(10) NOT NULL AUTO_INCREMENT,
  `date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(15, 2) NOT NULL,
  `payment_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `supplier_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier_tax_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tax_amount` decimal(15, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`expense_id`) USING BTREE,
  INDEX `expense_category_id`(`expense_category_id`) USING BTREE,
  INDEX `employee_id`(`employee_id`) USING BTREE,
  CONSTRAINT `ospos_expenses_ibfk_1` FOREIGN KEY (`expense_category_id`) REFERENCES `ospos_expense_categories` (`expense_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ospos_expenses_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_giftcards
-- ----------------------------
DROP TABLE IF EXISTS `ospos_giftcards`;
CREATE TABLE `ospos_giftcards`  (
  `record_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `giftcard_id` int(11) NOT NULL AUTO_INCREMENT,
  `giftcard_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` decimal(15, 2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `person_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`giftcard_id`) USING BTREE,
  UNIQUE INDEX `giftcard_number`(`giftcard_number`) USING BTREE,
  INDEX `person_id`(`person_id`) USING BTREE,
  CONSTRAINT `ospos_giftcards_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_grants
-- ----------------------------
DROP TABLE IF EXISTS `ospos_grants`;
CREATE TABLE `ospos_grants`  (
  `permission_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `person_id` int(10) NOT NULL,
  `menu_group` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'home',
  PRIMARY KEY (`permission_id`, `person_id`) USING BTREE,
  INDEX `ospos_grants_ibfk_2`(`person_id`) USING BTREE,
  CONSTRAINT `ospos_grants_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `ospos_permissions` (`permission_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ospos_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `ospos_employees` (`person_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_inventory
-- ----------------------------
DROP TABLE IF EXISTS `ospos_inventory`;
CREATE TABLE `ospos_inventory`  (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_items` int(11) NOT NULL DEFAULT 0,
  `trans_user` int(11) NOT NULL DEFAULT 0,
  `trans_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trans_location` int(11) NOT NULL,
  `trans_inventory` decimal(15, 3) NOT NULL DEFAULT 0.000,
  PRIMARY KEY (`trans_id`) USING BTREE,
  INDEX `trans_items`(`trans_items`) USING BTREE,
  INDEX `trans_user`(`trans_user`) USING BTREE,
  INDEX `trans_location`(`trans_location`) USING BTREE,
  CONSTRAINT `ospos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `ospos_items` (`item_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ospos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `ospos_employees` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ospos_inventory_ibfk_3` FOREIGN KEY (`trans_location`) REFERENCES `ospos_stock_locations` (`location_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_item_kit_items
-- ----------------------------
DROP TABLE IF EXISTS `ospos_item_kit_items`;
CREATE TABLE `ospos_item_kit_items`  (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15, 3) NOT NULL,
  `kit_sequence` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`item_kit_id`, `item_id`, `quantity`) USING BTREE,
  INDEX `ospos_item_kit_items_ibfk_2`(`item_id`) USING BTREE,
  CONSTRAINT `ospos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `ospos_item_kits` (`item_kit_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ospos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_item_kits
-- ----------------------------
DROP TABLE IF EXISTS `ospos_item_kits`;
CREATE TABLE `ospos_item_kits`  (
  `item_kit_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_id` int(10) NOT NULL DEFAULT 0,
  `kit_discount_percent` decimal(15, 2) NOT NULL DEFAULT 0.00,
  `price_option` tinyint(2) NOT NULL DEFAULT 0,
  `print_option` tinyint(2) NOT NULL DEFAULT 0,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`item_kit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_item_quantities
-- ----------------------------
DROP TABLE IF EXISTS `ospos_item_quantities`;
CREATE TABLE `ospos_item_quantities`  (
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `quantity` decimal(15, 3) NOT NULL DEFAULT 0.000,
  PRIMARY KEY (`item_id`, `location_id`) USING BTREE,
  INDEX `item_id`(`item_id`) USING BTREE,
  INDEX `location_id`(`location_id`) USING BTREE,
  CONSTRAINT `ospos_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ospos_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_items
-- ----------------------------
DROP TABLE IF EXISTS `ospos_items`;
CREATE TABLE `ospos_items`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_id` int(11) NULL DEFAULT NULL,
  `item_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cost_price` decimal(15, 2) NOT NULL,
  `unit_price` decimal(15, 2) NOT NULL,
  `reorder_level` decimal(15, 3) NOT NULL DEFAULT 0.000,
  `receiving_quantity` decimal(15, 3) NOT NULL DEFAULT 1.000,
  `pic_filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `stock_type` tinyint(2) NOT NULL DEFAULT 0,
  `item_type` tinyint(2) NOT NULL DEFAULT 0,
  `promotion_day_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_day_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_price` decimal(15, 2) NULL DEFAULT NULL,
  `tax_category_id` int(10) NOT NULL DEFAULT 1,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `custom1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`item_id`) USING BTREE,
  INDEX `item_number`(`item_number`) USING BTREE,
  INDEX `supplier_id`(`supplier_id`) USING BTREE,
  CONSTRAINT `ospos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_items_taxes
-- ----------------------------
DROP TABLE IF EXISTS `ospos_items_taxes`;
CREATE TABLE `ospos_items_taxes`  (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `percent` decimal(15, 3) NOT NULL,
  PRIMARY KEY (`item_id`, `name`, `percent`) USING BTREE,
  CONSTRAINT `ospos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_migrations
-- ----------------------------
DROP TABLE IF EXISTS `ospos_migrations`;
CREATE TABLE `ospos_migrations`  (
  `version` bigint(20) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_modules
-- ----------------------------
DROP TABLE IF EXISTS `ospos_modules`;
CREATE TABLE `ospos_modules`  (
  `name_lang_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc_lang_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`module_id`) USING BTREE,
  UNIQUE INDEX `desc_lang_key`(`desc_lang_key`) USING BTREE,
  UNIQUE INDEX `name_lang_key`(`name_lang_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_people
-- ----------------------------
DROP TABLE IF EXISTS `ospos_people`;
CREATE TABLE `ospos_people`  (
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` int(1) NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comments` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `person_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`person_id`) USING BTREE,
  INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_permissions
-- ----------------------------
DROP TABLE IF EXISTS `ospos_permissions`;
CREATE TABLE `ospos_permissions`  (
  `permission_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`permission_id`) USING BTREE,
  INDEX `module_id`(`module_id`) USING BTREE,
  INDEX `ospos_permissions_ibfk_2`(`location_id`) USING BTREE,
  CONSTRAINT `ospos_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `ospos_modules` (`module_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ospos_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_receivings
-- ----------------------------
DROP TABLE IF EXISTS `ospos_receivings`;
CREATE TABLE `ospos_receivings`  (
  `receiving_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(10) NULL DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT 0,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `receiving_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reference` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`receiving_id`) USING BTREE,
  INDEX `supplier_id`(`supplier_id`) USING BTREE,
  INDEX `employee_id`(`employee_id`) USING BTREE,
  INDEX `reference`(`reference`) USING BTREE,
  CONSTRAINT `ospos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ospos_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_receivings_items
-- ----------------------------
DROP TABLE IF EXISTS `ospos_receivings_items`;
CREATE TABLE `ospos_receivings_items`  (
  `receiving_id` int(10) NOT NULL DEFAULT 0,
  `item_id` int(10) NOT NULL DEFAULT 0,
  `description` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `serialnumber` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` decimal(15, 3) NOT NULL DEFAULT 0.000,
  `item_cost_price` decimal(15, 2) NOT NULL,
  `item_unit_price` decimal(15, 2) NOT NULL,
  `discount_percent` decimal(15, 2) NOT NULL DEFAULT 0.00,
  `item_location` int(11) NOT NULL,
  `receiving_quantity` decimal(15, 3) NOT NULL DEFAULT 1.000,
  PRIMARY KEY (`receiving_id`, `item_id`, `line`) USING BTREE,
  INDEX `item_id`(`item_id`) USING BTREE,
  CONSTRAINT `ospos_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ospos_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `ospos_receivings` (`receiving_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_sales
-- ----------------------------
DROP TABLE IF EXISTS `ospos_sales`;
CREATE TABLE `ospos_sales`  (
  `sale_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) NULL DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT 0,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `invoice_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quote_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  `sale_status` tinyint(2) NOT NULL DEFAULT 0,
  `dinner_table_id` int(11) NULL DEFAULT NULL,
  `work_order_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sale_type` tinyint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sale_id`) USING BTREE,
  UNIQUE INDEX `invoice_number`(`invoice_number`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  INDEX `employee_id`(`employee_id`) USING BTREE,
  INDEX `sale_time`(`sale_time`) USING BTREE,
  INDEX `dinner_table_id`(`dinner_table_id`) USING BTREE,
  CONSTRAINT `ospos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ospos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ospos_sales_ibfk_3` FOREIGN KEY (`dinner_table_id`) REFERENCES `ospos_dinner_tables` (`dinner_table_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_sales_items
-- ----------------------------
DROP TABLE IF EXISTS `ospos_sales_items`;
CREATE TABLE `ospos_sales_items`  (
  `sale_id` int(10) NOT NULL DEFAULT 0,
  `item_id` int(10) NOT NULL DEFAULT 0,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `serialnumber` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT 0,
  `quantity_purchased` decimal(15, 3) NOT NULL DEFAULT 0.000,
  `item_cost_price` decimal(15, 2) NOT NULL,
  `item_unit_price` decimal(15, 2) NOT NULL,
  `discount_percent` decimal(15, 2) NOT NULL DEFAULT 0.00,
  `item_location` int(11) NOT NULL,
  `print_option` tinyint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sale_id`, `item_id`, `line`) USING BTREE,
  INDEX `sale_id`(`sale_id`) USING BTREE,
  INDEX `item_id`(`item_id`) USING BTREE,
  INDEX `item_location`(`item_location`) USING BTREE,
  CONSTRAINT `ospos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ospos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ospos_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `ospos_stock_locations` (`location_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_sales_items_taxes
-- ----------------------------
DROP TABLE IF EXISTS `ospos_sales_items_taxes`;
CREATE TABLE `ospos_sales_items_taxes`  (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `percent` decimal(15, 4) NOT NULL DEFAULT 0.0000,
  `tax_type` tinyint(2) NOT NULL DEFAULT 0,
  `rounding_code` tinyint(2) NOT NULL DEFAULT 0,
  `cascade_tax` tinyint(2) NOT NULL DEFAULT 0,
  `cascade_sequence` tinyint(2) NOT NULL DEFAULT 0,
  `item_tax_amount` decimal(15, 4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`sale_id`, `item_id`, `line`, `name`, `percent`) USING BTREE,
  INDEX `sale_id`(`sale_id`) USING BTREE,
  INDEX `item_id`(`item_id`) USING BTREE,
  CONSTRAINT `ospos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_items` (`sale_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ospos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_sales_payments
-- ----------------------------
DROP TABLE IF EXISTS `ospos_sales_payments`;
CREATE TABLE `ospos_sales_payments`  (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payment_amount` decimal(15, 2) NOT NULL,
  PRIMARY KEY (`sale_id`, `payment_type`) USING BTREE,
  INDEX `sale_id`(`sale_id`) USING BTREE,
  CONSTRAINT `ospos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_sales_reward_points
-- ----------------------------
DROP TABLE IF EXISTS `ospos_sales_reward_points`;
CREATE TABLE `ospos_sales_reward_points`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `earned` float NOT NULL,
  `used` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sale_id`(`sale_id`) USING BTREE,
  CONSTRAINT `ospos_sales_reward_points_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_sales_taxes
-- ----------------------------
DROP TABLE IF EXISTS `ospos_sales_taxes`;
CREATE TABLE `ospos_sales_taxes`  (
  `sale_id` int(10) NOT NULL,
  `tax_type` smallint(2) NOT NULL,
  `tax_group` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sale_tax_basis` decimal(15, 4) NOT NULL,
  `sale_tax_amount` decimal(15, 4) NOT NULL,
  `print_sequence` tinyint(2) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tax_rate` decimal(15, 4) NOT NULL,
  `sales_tax_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `rounding_code` tinyint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sale_id`, `tax_type`, `tax_group`) USING BTREE,
  INDEX `print_sequence`(`sale_id`, `print_sequence`, `tax_type`, `tax_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ospos_sessions`;
CREATE TABLE `ospos_sessions`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  INDEX `ci_sessions_timestamp`(`timestamp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_stock_locations
-- ----------------------------
DROP TABLE IF EXISTS `ospos_stock_locations`;
CREATE TABLE `ospos_stock_locations`  (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`location_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_suppliers
-- ----------------------------
DROP TABLE IF EXISTS `ospos_suppliers`;
CREATE TABLE `ospos_suppliers`  (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `agency_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  UNIQUE INDEX `account_number`(`account_number`) USING BTREE,
  INDEX `person_id`(`person_id`) USING BTREE,
  CONSTRAINT `ospos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_tax_categories
-- ----------------------------
DROP TABLE IF EXISTS `ospos_tax_categories`;
CREATE TABLE `ospos_tax_categories`  (
  `tax_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `tax_category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tax_group_sequence` tinyint(2) NOT NULL,
  PRIMARY KEY (`tax_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_tax_code_rates
-- ----------------------------
DROP TABLE IF EXISTS `ospos_tax_code_rates`;
CREATE TABLE `ospos_tax_code_rates`  (
  `rate_tax_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rate_tax_category_id` int(10) NOT NULL,
  `tax_rate` decimal(15, 4) NOT NULL DEFAULT 0.0000,
  `rounding_code` tinyint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rate_tax_code`, `rate_tax_category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ospos_tax_codes
-- ----------------------------
DROP TABLE IF EXISTS `ospos_tax_codes`;
CREATE TABLE `ospos_tax_codes`  (
  `tax_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tax_code_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `tax_code_type` tinyint(2) NOT NULL DEFAULT 0,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
