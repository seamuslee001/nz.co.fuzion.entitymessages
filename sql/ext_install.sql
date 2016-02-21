CREATE TABLE `civicrm_message` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(128) NULL DEFAULT NULL COMMENT 'Message Title.' COLLATE 'utf8_unicode_ci',
  `created_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Created By',
  `subject` VARCHAR(128) NULL DEFAULT NULL COMMENT 'Subject of mailing' COLLATE 'utf8_unicode_ci',
  `body_text` LONGTEXT NULL COMMENT 'Message Body (text format).' COLLATE 'utf8_unicode_ci',
  `body_html` LONGTEXT NULL COMMENT 'Message Body (html format.)' COLLATE 'utf8_unicode_ci',
  PRIMARY KEY (`id`),
  INDEX `FK_created_id` (`created_id`),
  CONSTRAINT `FK_created_id` FOREIGN KEY (`created_id`) REFERENCES `civicrm_contact` (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB
;

CREATE TABLE `civicrm_entity_message` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Message ID',
  `entity_type` VARCHAR(64) NULL DEFAULT NULL COMMENT 'Type of entity' COLLATE 'utf8_unicode_ci',
  `is_smarty_render` TINYINT(4) NULL DEFAULT '0' COMMENT 'Render using smarty? This has security and performance implications',
  `entity_id` INT(10) UNSIGNED NULL DEFAULT '0' COMMENT 'Item in table',
  `message_id` INT(10) UNSIGNED NOT NULL COMMENT 'Message',
  `label` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Label for token' COLLATE 'utf8_unicode_ci',
  `name` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Entity_id` (`entity_id`, `entity_type`, `message_id`),
  UNIQUE INDEX `index_name_entity_id_entity_type` (`name`, `entity_id`, `entity_type`),
  INDEX `FK_civicrm_entity_message_civicrm_message` (`message_id`),
  CONSTRAINT `FK_civicrm_entity_message_civicrm_message` FOREIGN KEY (`message_id`) REFERENCES `civicrm_message` (`id`) ON DELETE CASCADE
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB
;


