CREATE TABLE `mad_lib_templates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` longtext NOT NULL,
  `category` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `slot_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `slots` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mad_lib_template_id` int(11) unsigned NOT NULL,
  `slot_type_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mad_lib_template_id` (`mad_lib_template_id`),
  KEY `slot_type_id` (`slot_type_id`),
  CONSTRAINT `slots_ibfk_2` FOREIGN KEY (`mad_lib_template_id`) REFERENCES `mad_lib_templates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `slots_ibfk_3` FOREIGN KEY (`slot_type_id`) REFERENCES `slot_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `mad_libs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mad_lib_template_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `mad_lib_template_id` (`mad_lib_template_id`),
  CONSTRAINT `mad_libs_ibfk_1` FOREIGN KEY (`mad_lib_template_id`) REFERENCES `mad_lib_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mad_lib_id` int(11) unsigned NOT NULL,
  `slot_id` int(11) unsigned NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mad_lib_id` (`mad_lib_id`),
  KEY `slot_id` (`slot_id`),
  CONSTRAINT `entries_ibfk_1` FOREIGN KEY (`mad_lib_id`) REFERENCES `mad_libs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_ibfk_2` FOREIGN KEY (`slot_id`) REFERENCES `slots` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert seed data
INSERT INTO `slot_types` (`id`, `type`)
VALUES
	(1, 'first name'),
	(2, 'last name'),
	(3, 'nickname'),
	(4, 'city'),
	(5, 'state'),
	(6, 'country'),
	(7, 'noun'),
	(8, 'plural noun'),
	(9, 'pronoun'),
	(10, 'adjective'),
	(11, 'verb'),
	(12, 'adverb'),
	(13, 'number'),
	(14, 'number (1-10)'),
	(15, 'number (1-100)'),
	(16, 'number (1-1,000)'),
	(17, 'number (1-10,000)'),
	(18, 'number (1-100,000)'),
	(19, 'part of the body'),
	(20, 'body part'),
	(21, 'color'),
	(22, 'type of weather'),
	(23, 'time of day'),
	(24, 'food'),
	(25, 'type of food'),
	
