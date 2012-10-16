-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 16/10/2012 às 02:46:47
-- Versão do Servidor: 5.5.25a
-- Versão do PHP: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `pos2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_app_config`
--

CREATE TABLE IF NOT EXISTS `pos_app_config` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pos_app_config`
--

INSERT INTO `pos_app_config` (`key`, `value`) VALUES
('address', '123 Nowhere street'),
('company', 'LojYnha Ltda'),
('currency_symbol', 'R$'),
('default_tax_1_name', 'Sales Tax'),
('default_tax_1_rate', ''),
('default_tax_2_name', 'Sales Tax 2'),
('default_tax_2_rate', ''),
('default_tax_rate', '8'),
('email', 'admin@pappastech.com'),
('fax', ''),
('language', 'portugues'),
('phone', '555-555-5555'),
('print_after_sale', '0'),
('return_policy', 'Test'),
('timezone', 'America/Sao_Paulo'),
('website', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_customers`
--

CREATE TABLE IF NOT EXISTS `pos_customers` (
  `person_id` int(10) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_employees`
--

CREATE TABLE IF NOT EXISTS `pos_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `username` (`username`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pos_employees`
--

INSERT INTO `pos_employees` (`username`, `password`, `person_id`, `deleted`) VALUES
('admin', '25d55ad283aa400af464c76d713c07ad', 1, 0),
('demoypos', '25d55ad283aa400af464c76d713c07ad', 2, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_giftcards`
--

CREATE TABLE IF NOT EXISTS `pos_giftcards` (
  `giftcard_id` int(11) NOT NULL AUTO_INCREMENT,
  `giftcard_number` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `value` double(15,2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`giftcard_id`),
  UNIQUE KEY `giftcard_number` (`giftcard_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_inventory`
--

CREATE TABLE IF NOT EXISTS `pos_inventory` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_items` int(11) NOT NULL DEFAULT '0',
  `trans_user` int(11) NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text NOT NULL,
  `trans_inventory` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`trans_id`),
  KEY `ospos_inventory_ibfk_1` (`trans_items`),
  KEY `ospos_inventory_ibfk_2` (`trans_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_items`
--

CREATE TABLE IF NOT EXISTS `pos_items` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cost_price` double(15,2) NOT NULL,
  `unit_price` double(15,2) NOT NULL,
  `quantity` double(15,2) NOT NULL DEFAULT '0.00',
  `reorder_level` double(15,2) NOT NULL DEFAULT '0.00',
  `location` varchar(255) NOT NULL,
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_number` (`item_number`),
  KEY `ospos_items_ibfk_1` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_items_taxes`
--

CREATE TABLE IF NOT EXISTS `pos_items_taxes` (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` double(15,3) NOT NULL,
  PRIMARY KEY (`item_id`,`name`,`percent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_item_kits`
--

CREATE TABLE IF NOT EXISTS `pos_item_kits` (
  `item_kit_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`item_kit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_item_kit_items`
--

CREATE TABLE IF NOT EXISTS `pos_item_kit_items` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` double(15,2) NOT NULL,
  PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`),
  KEY `ospos_item_kit_items_ibfk_2` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_modules`
--

CREATE TABLE IF NOT EXISTS `pos_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  UNIQUE KEY `name_lang_key` (`name_lang_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pos_modules`
--

INSERT INTO `pos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
('module_config', 'module_config_desc', 100, 'config'),
('module_customers', 'module_customers_desc', 10, 'customers'),
('module_employees', 'module_employees_desc', 80, 'employees'),
('module_giftcards', 'module_giftcards_desc', 90, 'giftcards'),
('module_items', 'module_items_desc', 20, 'items'),
('module_item_kits', 'module_item_kits_desc', 30, 'item_kits'),
('module_receivings', 'module_receivings_desc', 60, 'receivings'),
('module_reports', 'module_reports_desc', 50, 'reports'),
('module_sales', 'module_sales_desc', 70, 'sales'),
('module_suppliers', 'module_suppliers_desc', 40, 'suppliers');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_people`
--

CREATE TABLE IF NOT EXISTS `pos_people` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `person_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `pos_people`
--

INSERT INTO `pos_people` (`first_name`, `last_name`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `person_id`) VALUES
('Muller', 'Nato', '(94) 3333-7777', 'admin@yttrium.com.br', 'Agora em novo endereço', '', '', '', '', '', '', 1),
('Funcionário', 'Visitante', '', '', '', '', '', '', '', '', '', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_permissions`
--

CREATE TABLE IF NOT EXISTS `pos_permissions` (
  `module_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  PRIMARY KEY (`module_id`,`person_id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pos_permissions`
--

INSERT INTO `pos_permissions` (`module_id`, `person_id`) VALUES
('config', 1),
('customers', 1),
('employees', 1),
('giftcards', 1),
('items', 1),
('item_kits', 1),
('receivings', 1),
('reports', 1),
('sales', 1),
('suppliers', 1),
('config', 2),
('customers', 2),
('employees', 2),
('giftcards', 2),
('items', 2),
('item_kits', 2),
('receivings', 2),
('reports', 2),
('sales', 2),
('suppliers', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_receivings`
--

CREATE TABLE IF NOT EXISTS `pos_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `receiving_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`receiving_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_receivings_items`
--

CREATE TABLE IF NOT EXISTS `pos_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` int(10) NOT NULL DEFAULT '0',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` double(15,2) NOT NULL,
  `discount_percent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`receiving_id`,`item_id`,`line`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_sales`
--

CREATE TABLE IF NOT EXISTS `pos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_sales_items`
--

CREATE TABLE IF NOT EXISTS `pos_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` double(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` double(15,2) NOT NULL,
  `discount_percent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_sales_items_taxes`
--

CREATE TABLE IF NOT EXISTS `pos_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` double(15,3) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_sales_payments`
--

CREATE TABLE IF NOT EXISTS `pos_sales_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_sales_suspended`
--

CREATE TABLE IF NOT EXISTS `pos_sales_suspended` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_sales_suspended_items`
--

CREATE TABLE IF NOT EXISTS `pos_sales_suspended_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` double(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` double(15,2) NOT NULL,
  `discount_percent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_sales_suspended_items_taxes`
--

CREATE TABLE IF NOT EXISTS `pos_sales_suspended_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` double(15,3) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_sales_suspended_payments`
--

CREATE TABLE IF NOT EXISTS `pos_sales_suspended_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_sessions`
--

CREATE TABLE IF NOT EXISTS `pos_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pos_sessions`
--

INSERT INTO `pos_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('23be8bc227b5a3f2b0f625b8b1ca160a', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 1350347506, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_suppliers`
--

CREATE TABLE IF NOT EXISTS `pos_suppliers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `pos_customers`
--
ALTER TABLE `pos_customers`
  ADD CONSTRAINT `pos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `pos_people` (`person_id`);

--
-- Restrições para a tabela `pos_employees`
--
ALTER TABLE `pos_employees`
  ADD CONSTRAINT `pos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `pos_people` (`person_id`);

--
-- Restrições para a tabela `pos_inventory`
--
ALTER TABLE `pos_inventory`
  ADD CONSTRAINT `pos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `pos_items` (`item_id`),
  ADD CONSTRAINT `pos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `pos_employees` (`person_id`);

--
-- Restrições para a tabela `pos_items`
--
ALTER TABLE `pos_items`
  ADD CONSTRAINT `pos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `pos_suppliers` (`person_id`);

--
-- Restrições para a tabela `pos_items_taxes`
--
ALTER TABLE `pos_items_taxes`
  ADD CONSTRAINT `pos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `pos_items` (`item_id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `pos_item_kit_items`
--
ALTER TABLE `pos_item_kit_items`
  ADD CONSTRAINT `pos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `pos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `pos_items` (`item_id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `pos_permissions`
--
ALTER TABLE `pos_permissions`
  ADD CONSTRAINT `pos_permissions_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `pos_employees` (`person_id`),
  ADD CONSTRAINT `pos_permissions_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `pos_modules` (`module_id`);

--
-- Restrições para a tabela `pos_receivings`
--
ALTER TABLE `pos_receivings`
  ADD CONSTRAINT `pos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `pos_employees` (`person_id`),
  ADD CONSTRAINT `pos_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `pos_suppliers` (`person_id`);

--
-- Restrições para a tabela `pos_receivings_items`
--
ALTER TABLE `pos_receivings_items`
  ADD CONSTRAINT `pos_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `pos_items` (`item_id`),
  ADD CONSTRAINT `pos_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `pos_receivings` (`receiving_id`);

--
-- Restrições para a tabela `pos_sales`
--
ALTER TABLE `pos_sales`
  ADD CONSTRAINT `pos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `pos_employees` (`person_id`),
  ADD CONSTRAINT `pos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `pos_customers` (`person_id`);

--
-- Restrições para a tabela `pos_sales_items`
--
ALTER TABLE `pos_sales_items`
  ADD CONSTRAINT `pos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `pos_items` (`item_id`),
  ADD CONSTRAINT `pos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `pos_sales` (`sale_id`);

--
-- Restrições para a tabela `pos_sales_items_taxes`
--
ALTER TABLE `pos_sales_items_taxes`
  ADD CONSTRAINT `pos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `pos_sales_items` (`sale_id`),
  ADD CONSTRAINT `pos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `pos_items` (`item_id`);

--
-- Restrições para a tabela `pos_sales_payments`
--
ALTER TABLE `pos_sales_payments`
  ADD CONSTRAINT `pos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `pos_sales` (`sale_id`);

--
-- Restrições para a tabela `pos_sales_suspended`
--
ALTER TABLE `pos_sales_suspended`
  ADD CONSTRAINT `pos_sales_suspended_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `pos_employees` (`person_id`),
  ADD CONSTRAINT `pos_sales_suspended_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `pos_customers` (`person_id`);

--
-- Restrições para a tabela `pos_sales_suspended_items`
--
ALTER TABLE `pos_sales_suspended_items`
  ADD CONSTRAINT `pos_sales_suspended_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `pos_items` (`item_id`),
  ADD CONSTRAINT `pos_sales_suspended_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `pos_sales_suspended` (`sale_id`);

--
-- Restrições para a tabela `pos_sales_suspended_items_taxes`
--
ALTER TABLE `pos_sales_suspended_items_taxes`
  ADD CONSTRAINT `pos_sales_suspended_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `pos_sales_suspended_items` (`sale_id`),
  ADD CONSTRAINT `pos_sales_suspended_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `pos_items` (`item_id`);

--
-- Restrições para a tabela `pos_sales_suspended_payments`
--
ALTER TABLE `pos_sales_suspended_payments`
  ADD CONSTRAINT `pos_sales_suspended_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `pos_sales_suspended` (`sale_id`);

--
-- Restrições para a tabela `pos_suppliers`
--
ALTER TABLE `pos_suppliers`
  ADD CONSTRAINT `pos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `pos_people` (`person_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
