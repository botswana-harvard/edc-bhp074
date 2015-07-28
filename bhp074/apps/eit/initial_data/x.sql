SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
CREATE SCHEMA IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`table1` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`table1` (
)
ENGINE = InnoDB;

USE `test` ;

-- -----------------------------------------------------
-- Table `test`.`auth_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`auth_group` ;

CREATE  TABLE IF NOT EXISTS `test`.`auth_group` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(80) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`django_content_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`django_content_type` ;

CREATE  TABLE IF NOT EXISTS `test`.`django_content_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(100) NOT NULL ,
  `app_label` VARCHAR(100) NOT NULL ,
  `model` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `app_label` (`app_label` ASC, `model` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 108
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`auth_permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`auth_permission` ;

CREATE  TABLE IF NOT EXISTS `test`.`auth_permission` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(50) NOT NULL ,
  `content_type_id` INT(11) NOT NULL ,
  `codename` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `content_type_id` (`content_type_id` ASC, `codename` ASC) ,
  INDEX `auth_permission_1bb8f392` (`content_type_id` ASC) ,
  CONSTRAINT `content_type_id_refs_id_728de91f`
    FOREIGN KEY (`content_type_id` )
    REFERENCES `test`.`django_content_type` (`id` ))
ENGINE = InnoDB
AUTO_INCREMENT = 322
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`auth_group_permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`auth_group_permissions` ;

CREATE  TABLE IF NOT EXISTS `test`.`auth_group_permissions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `group_id` INT(11) NOT NULL ,
  `permission_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `group_id` (`group_id` ASC, `permission_id` ASC) ,
  INDEX `auth_group_permissions_425ae3c4` (`group_id` ASC) ,
  INDEX `auth_group_permissions_1e014c8f` (`permission_id` ASC) ,
  CONSTRAINT `group_id_refs_id_3cea63fe`
    FOREIGN KEY (`group_id` )
    REFERENCES `test`.`auth_group` (`id` ),
  CONSTRAINT `permission_id_refs_id_5886d21f`
    FOREIGN KEY (`permission_id` )
    REFERENCES `test`.`auth_permission` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`auth_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`auth_user` ;

CREATE  TABLE IF NOT EXISTS `test`.`auth_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(30) NOT NULL ,
  `first_name` VARCHAR(30) NOT NULL ,
  `last_name` VARCHAR(30) NOT NULL ,
  `email` VARCHAR(75) NOT NULL ,
  `password` VARCHAR(128) NOT NULL ,
  `is_staff` TINYINT(1) NOT NULL ,
  `is_active` TINYINT(1) NOT NULL ,
  `is_superuser` TINYINT(1) NOT NULL ,
  `last_login` DATETIME NOT NULL ,
  `date_joined` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `username` (`username` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`auth_message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`auth_message` ;

CREATE  TABLE IF NOT EXISTS `test`.`auth_message` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `user_id` INT(11) NOT NULL ,
  `message` LONGTEXT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `auth_message_403f60f` (`user_id` ASC) ,
  CONSTRAINT `user_id_refs_id_650f49a6`
    FOREIGN KEY (`user_id` )
    REFERENCES `test`.`auth_user` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`auth_user_groups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`auth_user_groups` ;

CREATE  TABLE IF NOT EXISTS `test`.`auth_user_groups` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `user_id` INT(11) NOT NULL ,
  `group_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `user_id` (`user_id` ASC, `group_id` ASC) ,
  INDEX `auth_user_groups_403f60f` (`user_id` ASC) ,
  INDEX `auth_user_groups_425ae3c4` (`group_id` ASC) ,
  CONSTRAINT `group_id_refs_id_f116770`
    FOREIGN KEY (`group_id` )
    REFERENCES `test`.`auth_group` (`id` ),
  CONSTRAINT `user_id_refs_id_7ceef80f`
    FOREIGN KEY (`user_id` )
    REFERENCES `test`.`auth_user` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`auth_user_user_permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`auth_user_user_permissions` ;

CREATE  TABLE IF NOT EXISTS `test`.`auth_user_user_permissions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `user_id` INT(11) NOT NULL ,
  `permission_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `user_id` (`user_id` ASC, `permission_id` ASC) ,
  INDEX `auth_user_user_permissions_403f60f` (`user_id` ASC) ,
  INDEX `auth_user_user_permissions_1e014c8f` (`permission_id` ASC) ,
  CONSTRAINT `permission_id_refs_id_67e79cb`
    FOREIGN KEY (`permission_id` )
    REFERENCES `test`.`auth_permission` (`id` ),
  CONSTRAINT `user_id_refs_id_dfbab7d`
    FOREIGN KEY (`user_id` )
    REFERENCES `test`.`auth_user` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`bhp_code_lists_arvcode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_code_lists_arvcode` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_code_lists_arvcode` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `code` VARCHAR(15) NOT NULL ,
  `short_name` VARCHAR(35) NOT NULL ,
  `long_name` VARCHAR(255) NOT NULL ,
  `list_ref` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `code` (`code` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`bhp_code_lists_arvdosestatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_code_lists_arvdosestatus` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_code_lists_arvdosestatus` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `code` VARCHAR(15) NOT NULL ,
  `short_name` VARCHAR(35) NOT NULL ,
  `long_name` VARCHAR(255) NOT NULL ,
  `list_ref` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `code` (`code` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`bhp_code_lists_arvmodificationcode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_code_lists_arvmodificationcode` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_code_lists_arvmodificationcode` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `code` VARCHAR(15) NOT NULL ,
  `short_name` VARCHAR(35) NOT NULL ,
  `long_name` VARCHAR(255) NOT NULL ,
  `list_ref` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `code` (`code` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`bhp_code_lists_bodysitecode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_code_lists_bodysitecode` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_code_lists_bodysitecode` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `code` VARCHAR(15) NOT NULL ,
  `short_name` VARCHAR(35) NOT NULL ,
  `long_name` VARCHAR(255) NOT NULL ,
  `list_ref` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `code` (`code` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`bhp_code_lists_diagnosiscode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_code_lists_diagnosiscode` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_code_lists_diagnosiscode` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `code` VARCHAR(15) NOT NULL ,
  `short_name` VARCHAR(35) NOT NULL ,
  `long_name` VARCHAR(255) NOT NULL ,
  `list_ref` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `code` (`code` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`bhp_code_lists_medicationcode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_code_lists_medicationcode` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_code_lists_medicationcode` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `code` VARCHAR(15) NOT NULL ,
  `short_name` VARCHAR(35) NOT NULL ,
  `long_name` VARCHAR(255) NOT NULL ,
  `list_ref` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `code` (`code` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`bhp_code_lists_organismcode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_code_lists_organismcode` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_code_lists_organismcode` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `code` VARCHAR(15) NOT NULL ,
  `short_name` VARCHAR(35) NOT NULL ,
  `long_name` VARCHAR(255) NOT NULL ,
  `list_ref` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `code` (`code` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`bhp_code_lists_signssymptomscode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_code_lists_signssymptomscode` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_code_lists_signssymptomscode` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `code` VARCHAR(15) NOT NULL ,
  `short_name` VARCHAR(35) NOT NULL ,
  `long_name` VARCHAR(255) NOT NULL ,
  `list_ref` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `code` (`code` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`django_admin_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`django_admin_log` ;

CREATE  TABLE IF NOT EXISTS `test`.`django_admin_log` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `action_time` DATETIME NOT NULL ,
  `user_id` INT(11) NOT NULL ,
  `content_type_id` INT(11) NULL DEFAULT NULL ,
  `object_id` LONGTEXT NULL DEFAULT NULL ,
  `object_repr` VARCHAR(200) NOT NULL ,
  `action_flag` SMALLINT(5) UNSIGNED NOT NULL ,
  `change_message` LONGTEXT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `django_admin_log_403f60f` (`user_id` ASC) ,
  INDEX `django_admin_log_1bb8f392` (`content_type_id` ASC) ,
  CONSTRAINT `content_type_id_refs_id_288599e6`
    FOREIGN KEY (`content_type_id` )
    REFERENCES `test`.`django_content_type` (`id` ),
  CONSTRAINT `user_id_refs_id_c8665aa`
    FOREIGN KEY (`user_id` )
    REFERENCES `test`.`auth_user` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`django_session`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`django_session` ;

CREATE  TABLE IF NOT EXISTS `test`.`django_session` (
  `session_key` VARCHAR(40) NOT NULL ,
  `session_data` LONGTEXT NOT NULL ,
  `expire_date` DATETIME NOT NULL ,
  PRIMARY KEY (`session_key`) ,
  INDEX `django_session_3da3d3d8` (`expire_date` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`django_site`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`django_site` ;

CREATE  TABLE IF NOT EXISTS `test`.`django_site` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `domain` VARCHAR(100) NOT NULL ,
  `name` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af001reasonnotstart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af001reasonnotstart` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af001reasonnotstart` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_subjectconsent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_subjectconsent` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_subjectconsent` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `subject_identifier` VARCHAR(25) NOT NULL ,
  `first_name` VARCHAR(250) NOT NULL ,
  `last_name` VARCHAR(250) NOT NULL ,
  `omang` VARCHAR(250) NOT NULL ,
  `initials` VARCHAR(3) NOT NULL ,
  `consent_datetime` DATETIME NOT NULL ,
  `may_store_samples` VARCHAR(3) NOT NULL ,
  `gender` VARCHAR(1) NOT NULL ,
  `is_dob_estimated` VARCHAR(25) NOT NULL ,
  `comment` VARCHAR(250) NOT NULL ,
  `site` INT(11) NOT NULL ,
  `dob` DATE NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_identifier` (`subject_identifier` ASC) ,
  UNIQUE INDEX `omang` (`omang` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_registeredmother`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_registeredmother` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_registeredmother` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `subject_identifier` VARCHAR(25) NULL DEFAULT NULL ,
  `registration_datetime` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  CONSTRAINT `subject_consent_id_refs_id_709dd76e`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_randomization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_randomization` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_randomization` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `sid` INT(11) NOT NULL ,
  `site` VARCHAR(10) NOT NULL ,
  `feeding_choice` VARCHAR(2) NOT NULL ,
  `haart_status` VARCHAR(10) NOT NULL ,
  `rx` VARCHAR(7) NOT NULL ,
  `feeding_duration` INT(11) NOT NULL ,
  `registration_datetime` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `sid` (`sid` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_registeredinfant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_registeredinfant` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_registeredinfant` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `infant_identifier` VARCHAR(25) NOT NULL ,
  `registered_mother_id` VARCHAR(36) NOT NULL ,
  `registration_datetime` DATETIME NOT NULL ,
  `randomization_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `infant_identifier` (`infant_identifier` ASC) ,
  UNIQUE INDEX `registered_mother_id` (`registered_mother_id` ASC) ,
  UNIQUE INDEX `randomization_id` (`randomization_id` ASC) ,
  CONSTRAINT `registered_mother_id_refs_id_7c097610`
    FOREIGN KEY (`registered_mother_id` )
    REFERENCES `test`.`mpepu_registeredmother` (`id` ),
  CONSTRAINT `randomization_id_refs_id_36d97145`
    FOREIGN KEY (`randomization_id` )
    REFERENCES `test`.`mpepu_randomization` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af001`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af001` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af001` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `registered_infant_id` VARCHAR(36) NOT NULL ,
  `started_drug` VARCHAR(25) NOT NULL ,
  `date_first_dose` DATE NOT NULL ,
  `reason_not_start_id` INT(11) NOT NULL ,
  `reason_not_start_other` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `registered_infant_id` (`registered_infant_id` ASC) ,
  INDEX `mpepu_af001_2fe5cad3` (`reason_not_start_id` ASC) ,
  CONSTRAINT `reason_not_start_id_refs_id_710a621c`
    FOREIGN KEY (`reason_not_start_id` )
    REFERENCES `test`.`mpepu_af001reasonnotstart` (`id` ),
  CONSTRAINT `registered_infant_id_refs_id_5ede3fc4`
    FOREIGN KEY (`registered_infant_id` )
    REFERENCES `test`.`mpepu_registeredinfant` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af003reasondiscnt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af003reasondiscnt` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af003reasondiscnt` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af003`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af003` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af003` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `source_information` DATE NOT NULL ,
  `reason_discontinuing_id` INT(11) NOT NULL ,
  `reason_discontinuing_other` VARCHAR(35) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  INDEX `mpepu_af003_3434657b` (`reason_discontinuing_id` ASC) ,
  CONSTRAINT `reason_discontinuing_id_refs_id_116bf2c6`
    FOREIGN KEY (`reason_discontinuing_id` )
    REFERENCES `test`.`mpepu_af003reasondiscnt` (`id` ),
  CONSTRAINT `subject_consent_id_refs_id_6d9d7386`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af004reasonoffstudy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af004reasonoffstudy` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af004reasonoffstudy` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af005deathcausecat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af005deathcausecat` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af005deathcausecat` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af005deathcauseinfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af005deathcauseinfo` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af005deathcauseinfo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af005haart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af005haart` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af005haart` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af005medicalresponsibility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af005medicalresponsibility` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af005medicalresponsibility` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af005nevirapine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af005nevirapine` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af005nevirapine` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af005reasonhospitalized`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af005reasonhospitalized` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af005reasonhospitalized` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af005studydrug`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af005studydrug` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af005studydrug` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af005tradmedicine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af005tradmedicine` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af005tradmedicine` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af005`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af005` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af005` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `death_date` DATE NOT NULL ,
  `death_cause_info_id` INT(11) NOT NULL ,
  `death_cause_info_other` VARCHAR(35) NULL DEFAULT NULL ,
  `perform_autopsy` VARCHAR(3) NOT NULL ,
  `death_cause` VARCHAR(35) NOT NULL ,
  `death_cause_cat_id` INT(11) NOT NULL ,
  `death_cause_other` VARCHAR(35) NULL DEFAULT NULL ,
  `death_cause_code_id` INT(11) NOT NULL ,
  `illness_duration` INT(11) NOT NULL ,
  `medical_responsibility_id` INT(11) NOT NULL ,
  `participant_hospitalized` VARCHAR(3) NOT NULL ,
  `reason_hospitalized_id` INT(11) NOT NULL ,
  `days_hospitalized` INT(11) NOT NULL ,
  `your_assessment` VARCHAR(25) NOT NULL ,
  `study_drug_id` INT(11) NOT NULL ,
  `nevirapine_id` INT(11) NOT NULL ,
  `haart_id` INT(11) NOT NULL ,
  `trad_medicine_id` INT(11) NOT NULL ,
  `comment` VARCHAR(35) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  INDEX `mpepu_af005_2afa91a1` (`death_cause_info_id` ASC) ,
  INDEX `mpepu_af005_658113d4` (`death_cause_cat_id` ASC) ,
  INDEX `mpepu_af005_e2b6ab2` (`death_cause_code_id` ASC) ,
  INDEX `mpepu_af005_30512f84` (`medical_responsibility_id` ASC) ,
  INDEX `mpepu_af005_266f5d94` (`reason_hospitalized_id` ASC) ,
  INDEX `mpepu_af005_5faa877a` (`study_drug_id` ASC) ,
  INDEX `mpepu_af005_e871bb` (`nevirapine_id` ASC) ,
  INDEX `mpepu_af005_1babb963` (`haart_id` ASC) ,
  INDEX `mpepu_af005_42b2448b` (`trad_medicine_id` ASC) ,
  CONSTRAINT `death_cause_cat_id_refs_id_47eaddfd`
    FOREIGN KEY (`death_cause_cat_id` )
    REFERENCES `test`.`mpepu_af005deathcausecat` (`id` ),
  CONSTRAINT `death_cause_code_id_refs_id_6de60a8b`
    FOREIGN KEY (`death_cause_code_id` )
    REFERENCES `test`.`bhp_code_lists_diagnosiscode` (`id` ),
  CONSTRAINT `death_cause_info_id_refs_id_e8cbbba`
    FOREIGN KEY (`death_cause_info_id` )
    REFERENCES `test`.`mpepu_af005deathcauseinfo` (`id` ),
  CONSTRAINT `haart_id_refs_id_72afd2d8`
    FOREIGN KEY (`haart_id` )
    REFERENCES `test`.`mpepu_af005haart` (`id` ),
  CONSTRAINT `medical_responsibility_id_refs_id_3027e0b5`
    FOREIGN KEY (`medical_responsibility_id` )
    REFERENCES `test`.`mpepu_af005medicalresponsibility` (`id` ),
  CONSTRAINT `nevirapine_id_refs_id_190ae444`
    FOREIGN KEY (`nevirapine_id` )
    REFERENCES `test`.`mpepu_af005nevirapine` (`id` ),
  CONSTRAINT `reason_hospitalized_id_refs_id_6fd64465`
    FOREIGN KEY (`reason_hospitalized_id` )
    REFERENCES `test`.`mpepu_af005reasonhospitalized` (`id` ),
  CONSTRAINT `study_drug_id_refs_id_34672c75`
    FOREIGN KEY (`study_drug_id` )
    REFERENCES `test`.`mpepu_af005studydrug` (`id` ),
  CONSTRAINT `subject_consent_id_refs_id_486259c8`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ),
  CONSTRAINT `trad_medicine_id_refs_id_3f2baca`
    FOREIGN KEY (`trad_medicine_id` )
    REFERENCES `test`.`mpepu_af005tradmedicine` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af006providedinformation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af006providedinformation` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af006providedinformation` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af006survivalstatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af006survivalstatus` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af006survivalstatus` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af006`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af006` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af006` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `survival_status_id` INT(11) NOT NULL ,
  `provided_information_id` INT(11) NOT NULL ,
  `provided_information_other` VARCHAR(35) NULL DEFAULT NULL ,
  `comments` VARCHAR(35) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  INDEX `mpepu_af006_3838c18c` (`survival_status_id` ASC) ,
  INDEX `mpepu_af006_19c706b6` (`provided_information_id` ASC) ,
  CONSTRAINT `provided_information_id_refs_id_4fb1c37b`
    FOREIGN KEY (`provided_information_id` )
    REFERENCES `test`.`mpepu_af006providedinformation` (`id` ),
  CONSTRAINT `subject_consent_id_refs_id_3d949a1`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ),
  CONSTRAINT `survival_status_id_refs_id_23b0c563`
    FOREIGN KEY (`survival_status_id` )
    REFERENCES `test`.`mpepu_af006survivalstatus` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_diagnosis`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_diagnosis` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_diagnosis` (
  `diagnosiscode_ptr_id` INT(11) NOT NULL ,
  PRIMARY KEY (`diagnosiscode_ptr_id`) ,
  CONSTRAINT `diagnosiscode_ptr_id_refs_id_2ec60770`
    FOREIGN KEY (`diagnosiscode_ptr_id` )
    REFERENCES `test`.`bhp_code_lists_diagnosiscode` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003conditions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003conditions` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003conditions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003cookingmethod`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003cookingmethod` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003cookingmethod` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003currentoccupation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003currentoccupation` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003currentoccupation` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003ethnicity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003ethnicity` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003ethnicity` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003higheducation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003higheducation` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003higheducation` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003housetype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003housetype` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003housetype` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003knowhivstat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003knowhivstat` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003knowhivstat` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003maritalstatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003maritalstatus` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003maritalstatus` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003moneyearned`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003moneyearned` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003moneyearned` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003priorarv`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003priorarv` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003priorarv` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003priorpregnancy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003priorpregnancy` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003priorpregnancy` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003providesmoney`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003providesmoney` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003providesmoney` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003recruitsource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003recruitsource` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003recruitsource` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `participant_interview` VARCHAR(25) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  CONSTRAINT `subject_consent_id_refs_id_5899507c`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003sectionfour`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003sectionfour` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003sectionfour` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `mp003_id` VARCHAR(36) NOT NULL ,
  `recruit_source_id` INT(11) NOT NULL ,
  `recruit_source_other` VARCHAR(35) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `mp003_id` (`mp003_id` ASC) ,
  INDEX `mpepu_mp003sectionfour_2d0a2f54` (`recruit_source_id` ASC) ,
  CONSTRAINT `mp003_id_refs_id_8b206af`
    FOREIGN KEY (`mp003_id` )
    REFERENCES `test`.`mpepu_mp003` (`id` ),
  CONSTRAINT `recruit_source_id_refs_id_5d608537`
    FOREIGN KEY (`recruit_source_id` )
    REFERENCES `test`.`mpepu_mp003recruitsource` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003toiletfacility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003toiletfacility` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003toiletfacility` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003watersource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003watersource` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003watersource` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp004arvinterruption`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp004arvinterruption` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp004arvinterruption` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp004arvlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp004arvlist` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp004arvlist` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp004`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp004` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp004` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `recv_arv_pregnancy` VARCHAR(3) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  CONSTRAINT `subject_consent_id_refs_id_6afe1db7`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp004sectiontwo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp004sectiontwo` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp004sectiontwo` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `mp004_id` VARCHAR(36) NOT NULL ,
  `arv_interruption_id` INT(11) NOT NULL ,
  `sdnvp` VARCHAR(3) NOT NULL ,
  `date_discharged` DATE NOT NULL ,
  `arv_start_pp` VARCHAR(3) NOT NULL ,
  `comments` VARCHAR(35) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `mp004_id` (`mp004_id` ASC) ,
  INDEX `mpepu_mp004sectiontwo_2d83eb1` (`arv_interruption_id` ASC) ,
  CONSTRAINT `arv_interruption_id_refs_id_2e3d7ef5`
    FOREIGN KEY (`arv_interruption_id` )
    REFERENCES `test`.`mpepu_mp004arvinterruption` (`id` ),
  CONSTRAINT `mp004_id_refs_id_2a8c7b50`
    FOREIGN KEY (`mp004_id` )
    REFERENCES `test`.`mpepu_mp004` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp005complications`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp005complications` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp005complications` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp005conditions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp005conditions` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp005conditions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp005deliverymode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp005deliverymode` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp005deliverymode` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp005labourperiod`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp005labourperiod` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp005labourperiod` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp005obcomplications`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp005obcomplications` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp005obcomplications` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp005othercomplications`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp005othercomplications` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp005othercomplications` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp005reasonhospitalized`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp005reasonhospitalized` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp005reasonhospitalized` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp005supplements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp005supplements` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp005supplements` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp006`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp006` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp006` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `postnatal_followup` VARCHAR(3) NOT NULL ,
  `mother_weight` VARCHAR(3) NOT NULL ,
  `enter_weight` DECIMAL(3,1) NOT NULL ,
  `breastfeeding` VARCHAR(3) NOT NULL ,
  `mastitis` VARCHAR(3) NOT NULL ,
  `mother_new` VARCHAR(3) NOT NULL ,
  `chronic_conditions` VARCHAR(3) NOT NULL ,
  `diagnoses` VARCHAR(3) NOT NULL ,
  `mp006_diagnosis_id` VARCHAR(36) NOT NULL ,
  `who_clinical_stage` VARCHAR(3) NOT NULL ,
  `who_diagnosis` VARCHAR(35) NULL DEFAULT NULL ,
  `cd4_perform` VARCHAR(3) NOT NULL ,
  `viraload_perform` VARCHAR(3) NOT NULL ,
  `medical_record` VARCHAR(3) NOT NULL ,
  `date` DATE NOT NULL ,
  `result` INT(11) NOT NULL ,
  `comments` VARCHAR(35) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  INDEX `mpepu_mp006_5060ff2` (`mp006_diagnosis_id` ASC) ,
  CONSTRAINT `subject_consent_id_refs_id_6827b9fd`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp006reasonhospitalized`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp006reasonhospitalized` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp006reasonhospitalized` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp007haartreason`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp007haartreason` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp007haartreason` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp007`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp007` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp007` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `last_haart` VARCHAR(25) NOT NULL ,
  `haart_reason_id` INT(11) NOT NULL ,
  `regimen_changes` VARCHAR(25) NOT NULL ,
  `comments` VARCHAR(35) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  INDEX `mpepu_mp007_1ef4c207` (`haart_reason_id` ASC) ,
  CONSTRAINT `haart_reason_id_refs_id_5526398e`
    FOREIGN KEY (`haart_reason_id` )
    REFERENCES `test`.`mpepu_mp007haartreason` (`id` ),
  CONSTRAINT `subject_consent_id_refs_id_65cc9420`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp007haart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp007haart` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp007haart` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `arv_code_id` INT(11) NOT NULL ,
  `dose_status_id` INT(11) NOT NULL ,
  `modification_date` DATE NOT NULL ,
  `modification_code_id` INT(11) NOT NULL ,
  `mp007_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `mpepu_mp007haart_7c2859e1` (`arv_code_id` ASC) ,
  INDEX `mpepu_mp007haart_7e662ce7` (`dose_status_id` ASC) ,
  INDEX `mpepu_mp007haart_1d74e317` (`modification_code_id` ASC) ,
  INDEX `mpepu_mp007haart_3f744b09` (`mp007_id` ASC) ,
  CONSTRAINT `arv_code_id_refs_id_4f805b1e`
    FOREIGN KEY (`arv_code_id` )
    REFERENCES `test`.`bhp_code_lists_arvcode` (`id` ),
  CONSTRAINT `dose_status_id_refs_id_5e79f7f2`
    FOREIGN KEY (`dose_status_id` )
    REFERENCES `test`.`bhp_code_lists_arvdosestatus` (`id` ),
  CONSTRAINT `modification_code_id_refs_id_15effa92`
    FOREIGN KEY (`modification_code_id` )
    REFERENCES `test`.`bhp_code_lists_arvmodificationcode` (`id` ),
  CONSTRAINT `mp007_id_refs_id_ff6b33a`
    FOREIGN KEY (`mp007_id` )
    REFERENCES `test`.`mpepu_mp007` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp008feedingafterdeliv`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp008feedingafterdeliv` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp008feedingafterdeliv` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp009arvprophylaxisstat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp009arvprophylaxisstat` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp009arvprophylaxisstat` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp009reasonmissed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp009reasonmissed` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp009reasonmissed` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp009reasonstopped`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp009reasonstopped` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp009reasonstopped` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp009`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp009` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp009` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `arv_prophylaxis_stat_id` INT(11) NOT NULL ,
  `baby_nvp` VARCHAR(3) NOT NULL ,
  `missed_prophy_nvp` INT(11) NOT NULL ,
  `reason_missed_id` INT(11) NOT NULL ,
  `reason_missed_other` VARCHAR(35) NULL DEFAULT NULL ,
  `reason_stopped_id` INT(11) NOT NULL ,
  `reason_stopped_other` VARCHAR(35) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  INDEX `mpepu_mp009_5f541a7e` (`arv_prophylaxis_stat_id` ASC) ,
  INDEX `mpepu_mp009_182390a1` (`reason_missed_id` ASC) ,
  INDEX `mpepu_mp009_2af75428` (`reason_stopped_id` ASC) ,
  CONSTRAINT `arv_prophylaxis_stat_id_refs_id_1313a853`
    FOREIGN KEY (`arv_prophylaxis_stat_id` )
    REFERENCES `test`.`mpepu_mp009arvprophylaxisstat` (`id` ),
  CONSTRAINT `reason_missed_id_refs_id_17cf5f58`
    FOREIGN KEY (`reason_missed_id` )
    REFERENCES `test`.`mpepu_mp009reasonmissed` (`id` ),
  CONSTRAINT `reason_stopped_id_refs_id_1bc3106f`
    FOREIGN KEY (`reason_stopped_id` )
    REFERENCES `test`.`mpepu_mp009reasonstopped` (`id` ),
  CONSTRAINT `subject_consent_id_refs_id_49738b9a`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp010reasonhospital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp010reasonhospital` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp010reasonhospital` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp010vaccinations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp010vaccinations` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp010vaccinations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp010`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp010` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp010` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `child_brought` VARCHAR(25) NOT NULL ,
  `child_alive` VARCHAR(25) NOT NULL ,
  `weight` DECIMAL(2,1) NOT NULL ,
  `height` DECIMAL(3,1) NOT NULL ,
  `physical_abnormal` VARCHAR(35) NULL DEFAULT NULL ,
  `hosp_days` INT(11) NOT NULL ,
  `diagnosis_code_id` VARCHAR(36) NOT NULL ,
  `new_diagnosis` VARCHAR(25) NOT NULL ,
  `date_started` DATE NOT NULL ,
  `new_medications` VARCHAR(25) NOT NULL ,
  `heart_rate` INT(11) NOT NULL ,
  `resp_rate` INT(11) NOT NULL ,
  `temperature` INT(11) NOT NULL ,
  `new_dx` VARCHAR(25) NOT NULL ,
  `new_stage_dx` VARCHAR(25) NOT NULL ,
  `child_hospitalized` VARCHAR(25) NOT NULL ,
  `reason_hospital_id` INT(11) NOT NULL ,
  `days_hospitalised` INT(11) NOT NULL ,
  `new_meds` VARCHAR(25) NOT NULL ,
  `vaccinations_id` INT(11) NOT NULL ,
  `comment` VARCHAR(35) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  INDEX `mpepu_mp010_26368181` (`diagnosis_code_id` ASC) ,
  INDEX `mpepu_mp010_78d06caa` (`reason_hospital_id` ASC) ,
  INDEX `mpepu_mp010_41574b6e` (`vaccinations_id` ASC) ,
  CONSTRAINT `reason_hospital_id_refs_id_237d5125`
    FOREIGN KEY (`reason_hospital_id` )
    REFERENCES `test`.`mpepu_mp010reasonhospital` (`id` ),
  CONSTRAINT `subject_consent_id_refs_id_6c658760`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ),
  CONSTRAINT `vaccinations_id_refs_id_13a4d017`
    FOREIGN KEY (`vaccinations_id` )
    REFERENCES `test`.`mpepu_mp010vaccinations` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp011maritalstatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp011maritalstatus` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp011maritalstatus` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp011reasondiscontinued`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp011reasondiscontinued` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp011reasondiscontinued` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp011reasondiscontinuing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp011reasondiscontinuing` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp011reasondiscontinuing` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp011`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp011` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp011` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `received_nvp` VARCHAR(25) NOT NULL ,
  `taking_nvp` VARCHAR(25) NOT NULL ,
  `current_dose` INT(11) NOT NULL ,
  `date_last_dose` DATE NOT NULL ,
  `bf_occured` VARCHAR(25) NOT NULL ,
  `npv_doses_miss` INT(11) NOT NULL ,
  `tot_miss_doses` INT(11) NOT NULL ,
  `nvp_days_miss_id` INT(11) NOT NULL ,
  `miss_dose_days` INT(11) NOT NULL ,
  `nvp_discont` VARCHAR(25) NOT NULL ,
  `reason_discont_id` INT(11) NOT NULL ,
  `reason_discont_other` VARCHAR(35) NULL DEFAULT NULL ,
  `nvp_discont_now` VARCHAR(25) NOT NULL ,
  `reason_discont_now_id` INT(11) NOT NULL ,
  `reason_discont_now_other` VARCHAR(35) NULL DEFAULT NULL ,
  `comment` VARCHAR(35) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  INDEX `mpepu_mp011_3bb79ea0` (`nvp_days_miss_id` ASC) ,
  INDEX `mpepu_mp011_5f595da3` (`reason_discont_id` ASC) ,
  INDEX `mpepu_mp011_71e416e2` (`reason_discont_now_id` ASC) ,
  CONSTRAINT `nvp_days_miss_id_refs_id_3d52fc8a`
    FOREIGN KEY (`nvp_days_miss_id` )
    REFERENCES `test`.`mpepu_mp011maritalstatus` (`id` ),
  CONSTRAINT `reason_discont_id_refs_id_25216b56`
    FOREIGN KEY (`reason_discont_id` )
    REFERENCES `test`.`mpepu_mp011reasondiscontinued` (`id` ),
  CONSTRAINT `reason_discont_now_id_refs_id_61731c44`
    FOREIGN KEY (`reason_discont_now_id` )
    REFERENCES `test`.`mpepu_mp011reasondiscontinuing` (`id` ),
  CONSTRAINT `subject_consent_id_refs_id_55874bc3`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp011nvpdaysmiss`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp011nvpdaysmiss` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp011nvpdaysmiss` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp012cowmilk`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp012cowmilk` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp012cowmilk` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp012rcvbm`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp012rcvbm` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp012rcvbm` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp012reasonrcvfm`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp012reasonrcvfm` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp012reasonrcvfm` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp012water`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp012water` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp012water` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp012`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp012` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp012` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `eval_interview` VARCHAR(3) NOT NULL ,
  `last_att_sche_visit` DATE NOT NULL ,
  `other_bm` VARCHAR(3) NOT NULL ,
  `fm_intro_occur` VARCHAR(3) NOT NULL ,
  `fm_date` DATE NOT NULL ,
  `reason_rcv_fm_id` INT(11) NOT NULL ,
  `reason_rcv_fm_other` VARCHAR(35) NULL DEFAULT NULL ,
  `water_use_id` INT(11) NOT NULL ,
  `formula` VARCHAR(3) NOT NULL ,
  `water` VARCHAR(3) NOT NULL ,
  `juice` VARCHAR(3) NOT NULL ,
  `cow_milk` VARCHAR(3) NOT NULL ,
  `cow_milk_yes_id` INT(11) NOT NULL ,
  `other_milk_animal` DATE NOT NULL ,
  `milk_boiled` VARCHAR(3) NOT NULL ,
  `fruits_veg` VARCHAR(3) NOT NULL ,
  `cereal_porridge` VARCHAR(3) NOT NULL ,
  `solid_liquid` VARCHAR(3) NOT NULL ,
  `other_milk` VARCHAR(3) NOT NULL ,
  `ever_breastfeed` VARCHAR(3) NOT NULL ,
  `complete_weaning` VARCHAR(3) NOT NULL ,
  `weaned_72h` VARCHAR(3) NOT NULL ,
  `most_recent_bm` DATE NOT NULL ,
  `rcv_bm_id` INT(11) NOT NULL ,
  `list_comments` VARCHAR(35) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  INDEX `mpepu_mp012_229f8417` (`reason_rcv_fm_id` ASC) ,
  INDEX `mpepu_mp012_5961a590` (`water_use_id` ASC) ,
  INDEX `mpepu_mp012_7a2d49bb` (`cow_milk_yes_id` ASC) ,
  INDEX `mpepu_mp012_3797870b` (`rcv_bm_id` ASC) ,
  CONSTRAINT `cow_milk_yes_id_refs_id_7d8cab3e`
    FOREIGN KEY (`cow_milk_yes_id` )
    REFERENCES `test`.`mpepu_mp012cowmilk` (`id` ),
  CONSTRAINT `rcv_bm_id_refs_id_14b2a46e`
    FOREIGN KEY (`rcv_bm_id` )
    REFERENCES `test`.`mpepu_mp012rcvbm` (`id` ),
  CONSTRAINT `reason_rcv_fm_id_refs_id_26a802e8`
    FOREIGN KEY (`reason_rcv_fm_id` )
    REFERENCES `test`.`mpepu_mp012reasonrcvfm` (`id` ),
  CONSTRAINT `subject_consent_id_refs_id_6fc01002`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ),
  CONSTRAINT `water_use_id_refs_id_8cbbd69`
    FOREIGN KEY (`water_use_id` )
    REFERENCES `test`.`mpepu_mp012water` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp013`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp013` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp013` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `last_illness` VARCHAR(100) NOT NULL ,
  `death_cause` VARCHAR(100) NOT NULL ,
  `last_ill_signs` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  CONSTRAINT `subject_consent_id_refs_id_6a4c73f7`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp014`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp014` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp014` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `reportable_events` VARCHAR(100) NOT NULL ,
  `source_docs` VARCHAR(3) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  CONSTRAINT `subject_consent_id_refs_id_1742a3bc`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af002currentstatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af002currentstatus` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af002currentstatus` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af002infantinfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af002infantinfo` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af002infantinfo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af002reasonvisit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af002reasonvisit` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af002reasonvisit` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af002sourceinfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af002sourceinfo` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af002sourceinfo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_en003feedingchoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_en003feedingchoice` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_en003feedingchoice` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp005hospital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp005hospital` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp005hospital` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp005labouranddelivery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp005labouranddelivery` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp005labouranddelivery` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `registered_mother_id` VARCHAR(36) NOT NULL ,
  `delivery_datetime` DATETIME NOT NULL ,
  `delivery_time_estimated` VARCHAR(3) NOT NULL ,
  `labour_begin_hrs_id` INT(11) NOT NULL ,
  `delivery_mode_id` INT(11) NOT NULL ,
  `delivery_hosp_id` INT(11) NOT NULL ,
  `deliver_hosp_other` VARCHAR(35) NULL DEFAULT NULL ,
  `urine_tenderness` VARCHAR(3) NOT NULL ,
  `max_temp` DECIMAL(2,1) NOT NULL ,
  `chorioamnionitis` VARCHAR(3) NOT NULL ,
  `delivery_complications` VARCHAR(3) NOT NULL ,
  `live_babies` INT(11) NOT NULL ,
  `still_born_babies` INT(11) NOT NULL ,
  `congenital_abnormality` VARCHAR(3) NOT NULL ,
  `congenital_abnormality_other` VARCHAR(35) NULL DEFAULT NULL ,
  `additional_info` VARCHAR(35) NULL DEFAULT NULL ,
  `comment` LONGTEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `registered_mother_id` (`registered_mother_id` ASC) ,
  INDEX `mpepu_mp005labouranddelivery_34b854e5` (`labour_begin_hrs_id` ASC) ,
  INDEX `mpepu_mp005labouranddelivery_6900faad` (`delivery_mode_id` ASC) ,
  INDEX `mpepu_mp005labouranddelivery_4be21a4` (`delivery_hosp_id` ASC) ,
  CONSTRAINT `delivery_hosp_id_refs_id_253d6e4c`
    FOREIGN KEY (`delivery_hosp_id` )
    REFERENCES `test`.`mpepu_mp005hospital` (`id` ),
  CONSTRAINT `delivery_mode_id_refs_id_baa6e0b`
    FOREIGN KEY (`delivery_mode_id` )
    REFERENCES `test`.`mpepu_mp005deliverymode` (`id` ),
  CONSTRAINT `labour_begin_hrs_id_refs_id_404f1688`
    FOREIGN KEY (`labour_begin_hrs_id` )
    REFERENCES `test`.`mpepu_mp005labourperiod` (`id` ),
  CONSTRAINT `registered_mother_id_refs_id_f55a7ee`
    FOREIGN KEY (`registered_mother_id` )
    REFERENCES `test`.`mpepu_registeredmother` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp008infantbirthrecord`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp008infantbirthrecord` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp008infantbirthrecord` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `mp005_id` VARCHAR(36) NOT NULL ,
  `infant_identifier` VARCHAR(25) NOT NULL ,
  `delivery_date` DATE NOT NULL ,
  `newborn_date` DATE NOT NULL ,
  `newborn_time` TIME NOT NULL ,
  `newborn_sex` VARCHAR(6) NOT NULL ,
  `general_activity` VARCHAR(100) NOT NULL ,
  `gen_activity_other` VARCHAR(35) NULL DEFAULT NULL ,
  `infant_weight` DECIMAL(2,2) NOT NULL ,
  `infant_length` DECIMAL(2,2) NOT NULL ,
  `head_circumference` DECIMAL(2,2) NOT NULL ,
  `physical_exam_result` VARCHAR(35) NOT NULL ,
  `heent_exam` VARCHAR(3) NOT NULL ,
  `heent_no_other` VARCHAR(35) NULL DEFAULT NULL ,
  `resp_exam` VARCHAR(3) NOT NULL ,
  `resp_exam_other` VARCHAR(35) NULL DEFAULT NULL ,
  `cardiac_exam` VARCHAR(3) NOT NULL ,
  `cardiac_exam_other` VARCHAR(35) NULL DEFAULT NULL ,
  `abdominal_exam` VARCHAR(3) NOT NULL ,
  `abdominal_exam_other` VARCHAR(35) NULL DEFAULT NULL ,
  `skin_exam` VARCHAR(3) NOT NULL ,
  `mac_pap_rash` VARCHAR(3) NOT NULL ,
  `neuro_exam` VARCHAR(3) NOT NULL ,
  `neuro_exam_other` VARCHAR(35) NULL DEFAULT NULL ,
  `congenital_anomalities` VARCHAR(3) NOT NULL ,
  `apgar_score` VARCHAR(3) NOT NULL ,
  `apgar_score_min_1` INT(11) NOT NULL ,
  `apgar_score_min_5` INT(11) NOT NULL ,
  `apgar_score_min_10` INT(11) NOT NULL ,
  `other_info` VARCHAR(100) NULL DEFAULT NULL ,
  `infant_azt` VARCHAR(3) NOT NULL ,
  `azt__first_dose` DATE NOT NULL ,
  `azt_additional_dose` VARCHAR(3) NOT NULL ,
  `nvp_after_birth` VARCHAR(3) NOT NULL ,
  `nvp__first_dose` DATE NOT NULL ,
  `additional_nvp_doses` VARCHAR(3) NOT NULL ,
  `azt_after_discharge` VARCHAR(3) NOT NULL ,
  `nvp_after_discharge` VARCHAR(3) NOT NULL ,
  `feeding_after_deliv_id` INT(11) NOT NULL ,
  `comments` VARCHAR(35) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `infant_identifier` (`infant_identifier` ASC) ,
  INDEX `mpepu_mp008infantbirthrecord_2b038295` (`mp005_id` ASC) ,
  INDEX `mpepu_mp008infantbirthrecord_2e86b527` (`feeding_after_deliv_id` ASC) ,
  CONSTRAINT `feeding_after_deliv_id_refs_id_8023a33`
    FOREIGN KEY (`feeding_after_deliv_id` )
    REFERENCES `test`.`mpepu_mp008feedingafterdeliv` (`id` ),
  CONSTRAINT `mp005_id_refs_id_53c3a510`
    FOREIGN KEY (`mp005_id` )
    REFERENCES `test`.`mpepu_mp005labouranddelivery` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_en003`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_en003` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_en003` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `mp008_id` VARCHAR(36) NOT NULL ,
  `registered_infant_id` VARCHAR(36) NOT NULL ,
  `hiv_status` DATE NOT NULL ,
  `ctx_contra` INT(11) NOT NULL ,
  `congen_anomaly` VARCHAR(3) NOT NULL ,
  `arv_72hrs` VARCHAR(3) NOT NULL ,
  `feeding_method_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `mp008_id` (`mp008_id` ASC) ,
  UNIQUE INDEX `registered_infant_id` (`registered_infant_id` ASC) ,
  INDEX `mpepu_en003_4c557382` (`feeding_method_id` ASC) ,
  CONSTRAINT `feeding_method_id_refs_id_5cd66727`
    FOREIGN KEY (`feeding_method_id` )
    REFERENCES `test`.`mpepu_en003feedingchoice` (`id` ),
  CONSTRAINT `mp008_id_refs_id_7ee98f57`
    FOREIGN KEY (`mp008_id` )
    REFERENCES `test`.`mpepu_mp008infantbirthrecord` (`id` ),
  CONSTRAINT `registered_infant_id_refs_id_6229d72`
    FOREIGN KEY (`registered_infant_id` )
    REFERENCES `test`.`mpepu_registeredinfant` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_locatorinformation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_locatorinformation` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_locatorinformation` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `date_signed` DATE NOT NULL ,
  `mail_address` VARCHAR(35) NOT NULL ,
  `contact_clinic` VARCHAR(35) NOT NULL ,
  `home_visit_permission` VARCHAR(25) NOT NULL ,
  `follow_up_call` VARCHAR(25) NOT NULL ,
  `cell_number` INT(11) NOT NULL ,
  `tel_number` INT(11) NOT NULL ,
  `work_call` VARCHAR(25) NOT NULL ,
  `work_name` VARCHAR(35) NOT NULL ,
  `contact_someone` VARCHAR(25) NOT NULL ,
  `name_contact` VARCHAR(35) NOT NULL ,
  `relationship` VARCHAR(35) NOT NULL ,
  `physical_address` VARCHAR(35) NOT NULL ,
  `phone_1` INT(11) NOT NULL ,
  `phone_2` INT(11) NOT NULL ,
  `resposible_person` VARCHAR(25) NOT NULL ,
  `responsible_names` VARCHAR(35) NOT NULL ,
  `number_1` INT(11) NOT NULL ,
  `number_2` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  CONSTRAINT `subject_consent_id_refs_id_4397ff79`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af002mother`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af002mother` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af002mother` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `visit_datetime` DATETIME NOT NULL ,
  `visit_code` DECIMAL(5,1) NOT NULL ,
  `source_info_id` INT(11) NOT NULL ,
  `source_info_other` VARCHAR(35) NULL DEFAULT NULL ,
  `reason_visit_id` INT(11) NOT NULL ,
  `reason_missed` VARCHAR(35) NULL DEFAULT NULL ,
  `comments` LONGTEXT NULL DEFAULT NULL ,
  `registered_mother_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `mpepu_af002mother_3936b421` (`source_info_id` ASC) ,
  INDEX `mpepu_af002mother_22ef2100` (`reason_visit_id` ASC) ,
  INDEX `mpepu_af002mother_61e12f9f` (`registered_mother_id` ASC) ,
  CONSTRAINT `reason_visit_id_refs_id_7567321a`
    FOREIGN KEY (`reason_visit_id` )
    REFERENCES `test`.`mpepu_af002reasonvisit` (`id` ),
  CONSTRAINT `registered_mother_id_refs_id_7d285d2d`
    FOREIGN KEY (`registered_mother_id` )
    REFERENCES `test`.`mpepu_registeredmother` (`id` ),
  CONSTRAINT `source_info_id_refs_id_28e179a9`
    FOREIGN KEY (`source_info_id` )
    REFERENCES `test`.`mpepu_af002sourceinfo` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af002infant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af002infant` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af002infant` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `visit_datetime` DATETIME NOT NULL ,
  `visit_code` DECIMAL(5,1) NOT NULL ,
  `source_info_id` INT(11) NOT NULL ,
  `source_info_other` VARCHAR(35) NULL DEFAULT NULL ,
  `reason_visit_id` INT(11) NOT NULL ,
  `reason_missed` VARCHAR(35) NULL DEFAULT NULL ,
  `comments` LONGTEXT NULL DEFAULT NULL ,
  `registered_infant_id` VARCHAR(36) NOT NULL ,
  `infant_info_id` INT(11) NOT NULL ,
  `infant_info_other` VARCHAR(35) NULL DEFAULT NULL ,
  `current_status_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `mpepu_af002infant_3936b421` (`source_info_id` ASC) ,
  INDEX `mpepu_af002infant_22ef2100` (`reason_visit_id` ASC) ,
  INDEX `mpepu_af002infant_6d6dae96` (`registered_infant_id` ASC) ,
  INDEX `mpepu_af002infant_4a393974` (`infant_info_id` ASC) ,
  INDEX `mpepu_af002infant_191f34f2` (`current_status_id` ASC) ,
  CONSTRAINT `current_status_id_refs_id_7d132233`
    FOREIGN KEY (`current_status_id` )
    REFERENCES `test`.`mpepu_af002currentstatus` (`id` ),
  CONSTRAINT `infant_info_id_refs_id_471dc803`
    FOREIGN KEY (`infant_info_id` )
    REFERENCES `test`.`mpepu_af002infantinfo` (`id` ),
  CONSTRAINT `reason_visit_id_refs_id_632731f5`
    FOREIGN KEY (`reason_visit_id` )
    REFERENCES `test`.`mpepu_af002reasonvisit` (`id` ),
  CONSTRAINT `registered_infant_id_refs_id_429919`
    FOREIGN KEY (`registered_infant_id` )
    REFERENCES `test`.`mpepu_registeredinfant` (`id` ),
  CONSTRAINT `source_info_id_refs_id_7e169bca`
    FOREIGN KEY (`source_info_id` )
    REFERENCES `test`.`mpepu_af002sourceinfo` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp005medicalhistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp005medicalhistory` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp005medicalhistory` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `mp005_id` VARCHAR(36) NOT NULL ,
  `chronic_condition` VARCHAR(3) NOT NULL ,
  `pregnancy_diagnoses` VARCHAR(3) NOT NULL ,
  `mp005_diagnosis_id` VARCHAR(36) NOT NULL ,
  `who_clinical_stage` VARCHAR(3) NOT NULL ,
  `cd4_performed` VARCHAR(3) NOT NULL ,
  `cd4_date` DATE NOT NULL ,
  `cd4_results` VARCHAR(35) NOT NULL ,
  `viral_load` VARCHAR(3) NOT NULL ,
  `vload_date` DATE NOT NULL ,
  `vload_results` VARCHAR(35) NOT NULL ,
  `overnight_hospt` VARCHAR(3) NOT NULL ,
  `mother_weight` DECIMAL(3,1) NOT NULL ,
  `take_supplements` VARCHAR(3) NOT NULL ,
  `comment` VARCHAR(35) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `mp005_id` (`mp005_id` ASC) ,
  INDEX `mpepu_mp005medicalhistory_484e9355` (`mp005_diagnosis_id` ASC) ,
  CONSTRAINT `mp005_id_refs_id_343b974d`
    FOREIGN KEY (`mp005_id` )
    REFERENCES `test`.`mpepu_mp005labouranddelivery` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`bhp_code_lists_whoclinicalstagingdxadult`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_code_lists_whoclinicalstagingdxadult` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_code_lists_whoclinicalstagingdxadult` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `code` VARCHAR(15) NOT NULL ,
  `short_name` VARCHAR(35) NOT NULL ,
  `long_name` VARCHAR(255) NOT NULL ,
  `list_ref` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `code` (`code` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp005medicalhistory_who_staging_dx`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp005medicalhistory_who_staging_dx` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp005medicalhistory_who_staging_dx` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `mp005medicalhistory_id` VARCHAR(36) NOT NULL ,
  `whoclinicalstagingdxadult_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `mp005medicalhistory_id` (`mp005medicalhistory_id` ASC, `whoclinicalstagingdxadult_id` ASC) ,
  INDEX `mpepu_mp005medicalhistory_who_staging_dx_48cae11c` (`mp005medicalhistory_id` ASC) ,
  INDEX `mpepu_mp005medicalhistory_who_staging_dx_6fb53497` (`whoclinicalstagingdxadult_id` ASC) ,
  CONSTRAINT `mp005medicalhistory_id_refs_id_320796`
    FOREIGN KEY (`mp005medicalhistory_id` )
    REFERENCES `test`.`mpepu_mp005medicalhistory` (`id` ),
  CONSTRAINT `whoclinicalstagingdxadult_id_refs_id_746976a3`
    FOREIGN KEY (`whoclinicalstagingdxadult_id` )
    REFERENCES `test`.`bhp_code_lists_whoclinicalstagingdxadult` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp005medicalhistory_supplements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp005medicalhistory_supplements` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp005medicalhistory_supplements` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `mp005medicalhistory_id` VARCHAR(36) NOT NULL ,
  `mp005supplements_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `mp005medicalhistory_id` (`mp005medicalhistory_id` ASC, `mp005supplements_id` ASC) ,
  INDEX `mpepu_mp005medicalhistory_supplements_48cae11c` (`mp005medicalhistory_id` ASC) ,
  INDEX `mpepu_mp005medicalhistory_supplements_394200fc` (`mp005supplements_id` ASC) ,
  CONSTRAINT `mp005medicalhistory_id_refs_id_17af03d6`
    FOREIGN KEY (`mp005medicalhistory_id` )
    REFERENCES `test`.`mpepu_mp005medicalhistory` (`id` ),
  CONSTRAINT `mp005supplements_id_refs_id_50c5fbc2`
    FOREIGN KEY (`mp005supplements_id` )
    REFERENCES `test`.`mpepu_mp005supplements` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp005medicalhistory_obstetrical_complications`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp005medicalhistory_obstetrical_complications` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp005medicalhistory_obstetrical_complications` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `mp005medicalhistory_id` VARCHAR(36) NOT NULL ,
  `mp005obcomplications_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `mp005medicalhistory_id` (`mp005medicalhistory_id` ASC, `mp005obcomplications_id` ASC) ,
  INDEX `mpepu_mp005medicalhistory_obstetrical_complications_48cae11c` (`mp005medicalhistory_id` ASC) ,
  INDEX `mpepu_mp005medicalhistory_obstetrical_complications_26952e8c` (`mp005obcomplications_id` ASC) ,
  CONSTRAINT `mp005medicalhistory_id_refs_id_b23e102`
    FOREIGN KEY (`mp005medicalhistory_id` )
    REFERENCES `test`.`mpepu_mp005medicalhistory` (`id` ),
  CONSTRAINT `mp005obcomplications_id_refs_id_7bc927ee`
    FOREIGN KEY (`mp005obcomplications_id` )
    REFERENCES `test`.`mpepu_mp005obcomplications` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp005medicalhistory_conditions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp005medicalhistory_conditions` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp005medicalhistory_conditions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `mp005medicalhistory_id` VARCHAR(36) NOT NULL ,
  `mp005conditions_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `mp005medicalhistory_id` (`mp005medicalhistory_id` ASC, `mp005conditions_id` ASC) ,
  INDEX `mpepu_mp005medicalhistory_conditions_48cae11c` (`mp005medicalhistory_id` ASC) ,
  INDEX `mpepu_mp005medicalhistory_conditions_67b2f49f` (`mp005conditions_id` ASC) ,
  CONSTRAINT `mp005conditions_id_refs_id_138a29aa`
    FOREIGN KEY (`mp005conditions_id` )
    REFERENCES `test`.`mpepu_mp005conditions` (`id` ),
  CONSTRAINT `mp005medicalhistory_id_refs_id_6a95a2f5`
    FOREIGN KEY (`mp005medicalhistory_id` )
    REFERENCES `test`.`mpepu_mp005medicalhistory` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp005labouranddelivery_other_complications`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp005labouranddelivery_other_complications` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp005labouranddelivery_other_complications` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `mp005labouranddelivery_id` VARCHAR(36) NOT NULL ,
  `mp005othercomplications_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `mp005labouranddelivery_id` (`mp005labouranddelivery_id` ASC, `mp005othercomplications_id` ASC) ,
  INDEX `mpepu_mp005labouranddelivery_other_complications_bc24e8e` (`mp005labouranddelivery_id` ASC) ,
  INDEX `mpepu_mp005labouranddelivery_other_complications_28febfc8` (`mp005othercomplications_id` ASC) ,
  CONSTRAINT `mp005labouranddelivery_id_refs_id_6bfbc38`
    FOREIGN KEY (`mp005labouranddelivery_id` )
    REFERENCES `test`.`mpepu_mp005labouranddelivery` (`id` ),
  CONSTRAINT `mp005othercomplications_id_refs_id_3e6378ee`
    FOREIGN KEY (`mp005othercomplications_id` )
    REFERENCES `test`.`mpepu_mp005othercomplications` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af004mother`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af004mother` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af004mother` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `registered_mother_id` VARCHAR(36) NOT NULL ,
  `reason_off_study_id` INT(11) NOT NULL ,
  `reason_off_study_other` VARCHAR(35) NULL DEFAULT NULL ,
  `comment` VARCHAR(35) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `registered_mother_id` (`registered_mother_id` ASC) ,
  INDEX `mpepu_af004mother_5bcc6df8` (`reason_off_study_id` ASC) ,
  CONSTRAINT `reason_off_study_id_refs_id_16b69724`
    FOREIGN KEY (`reason_off_study_id` )
    REFERENCES `test`.`mpepu_af004reasonoffstudy` (`id` ),
  CONSTRAINT `registered_mother_id_refs_id_1b6b95cf`
    FOREIGN KEY (`registered_mother_id` )
    REFERENCES `test`.`mpepu_registeredmother` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af004infantprerandomization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af004infantprerandomization` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af004infantprerandomization` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `mp008_id` VARCHAR(36) NOT NULL ,
  `reason_off_study_id` INT(11) NOT NULL ,
  `reason_off_study_other` VARCHAR(35) NULL DEFAULT NULL ,
  `comment` VARCHAR(35) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `mp008_id` (`mp008_id` ASC) ,
  INDEX `mpepu_af004infantprerandomization_5bcc6df8` (`reason_off_study_id` ASC) ,
  CONSTRAINT `mp008_id_refs_id_16421826`
    FOREIGN KEY (`mp008_id` )
    REFERENCES `test`.`mpepu_mp008infantbirthrecord` (`id` ),
  CONSTRAINT `reason_off_study_id_refs_id_6425f73d`
    FOREIGN KEY (`reason_off_study_id` )
    REFERENCES `test`.`mpepu_af004reasonoffstudy` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af004infantpostrandomization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af004infantpostrandomization` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af004infantpostrandomization` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `registered_infant_id` VARCHAR(36) NOT NULL ,
  `reason_off_study_id` INT(11) NOT NULL ,
  `reason_off_study_other` VARCHAR(35) NULL DEFAULT NULL ,
  `comment` VARCHAR(35) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `registered_infant_id` (`registered_infant_id` ASC) ,
  INDEX `mpepu_af004infantpostrandomization_5bcc6df8` (`reason_off_study_id` ASC) ,
  CONSTRAINT `reason_off_study_id_refs_id_55d170a3`
    FOREIGN KEY (`reason_off_study_id` )
    REFERENCES `test`.`mpepu_af004reasonoffstudy` (`id` ),
  CONSTRAINT `registered_infant_id_refs_id_6263e989`
    FOREIGN KEY (`registered_infant_id` )
    REFERENCES `test`.`mpepu_registeredinfant` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`bhp_code_lists_whoclinicalstagingdxpediatric`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_code_lists_whoclinicalstagingdxpediatric` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_code_lists_whoclinicalstagingdxpediatric` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `code` VARCHAR(15) NOT NULL ,
  `short_name` VARCHAR(35) NOT NULL ,
  `long_name` VARCHAR(255) NOT NULL ,
  `list_ref` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `code` (`code` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp012wateruse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp012wateruse` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp012wateruse` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp012signireason`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp012signireason` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp012signireason` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp012ifyes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp012ifyes` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp012ifyes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp006conditions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp006conditions` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp006conditions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp006_conditions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp006_conditions` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp006_conditions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `mp006_id` VARCHAR(36) NOT NULL ,
  `mp006conditions_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `mp006_id` (`mp006_id` ASC, `mp006conditions_id` ASC) ,
  INDEX `mpepu_mp006_conditions_3bab2752` (`mp006_id` ASC) ,
  INDEX `mpepu_mp006_conditions_537bcc6a` (`mp006conditions_id` ASC) ,
  CONSTRAINT `mp006conditions_id_refs_id_46b6aa05`
    FOREIGN KEY (`mp006conditions_id` )
    REFERENCES `test`.`mpepu_mp006conditions` (`id` ),
  CONSTRAINT `mp006_id_refs_id_4a292ca9`
    FOREIGN KEY (`mp006_id` )
    REFERENCES `test`.`mpepu_mp006` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_en002maternaleligiblitypostpartum`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_en002maternaleligiblitypostpartum` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_en002maternaleligiblitypostpartum` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `registered_mother_id` VARCHAR(36) NOT NULL ,
  `hiv_positive` VARCHAR(3) NOT NULL ,
  `on_arv` VARCHAR(3) NOT NULL ,
  `agree_follow_up` VARCHAR(3) NOT NULL ,
  `days_pnc` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  INDEX `mpepu_en002maternaleligiblitypostpartum_61e12f9f` (`registered_mother_id` ASC) ,
  CONSTRAINT `registered_mother_id_refs_id_6feb0cf1`
    FOREIGN KEY (`registered_mother_id` )
    REFERENCES `test`.`mpepu_registeredmother` (`id` ),
  CONSTRAINT `subject_consent_id_refs_id_783530d6`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_en001maternaleligiblityantenatal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_en001maternaleligiblityantenatal` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_en001maternaleligiblityantenatal` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `registered_mother_id` VARCHAR(36) NOT NULL ,
  `hiv_positive` VARCHAR(3) NOT NULL ,
  `on_arv` VARCHAR(3) NOT NULL ,
  `agree_follow_up` VARCHAR(3) NOT NULL ,
  `gestational_age` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  INDEX `mpepu_en001maternaleligiblityantenatal_61e12f9f` (`registered_mother_id` ASC) ,
  CONSTRAINT `registered_mother_id_refs_id_3463d9ca`
    FOREIGN KEY (`registered_mother_id` )
    REFERENCES `test`.`mpepu_registeredmother` (`id` ),
  CONSTRAINT `subject_consent_id_refs_id_11e52215`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp001reasonsmothernotreg`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp001reasonsmothernotreg` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp001reasonsmothernotreg` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp001preregistrationloss`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp001preregistrationloss` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp001preregistrationloss` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `report_datetime` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `comments` LONGTEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `subject_consent_id` (`subject_consent_id` ASC) ,
  CONSTRAINT `subject_consent_id_refs_id_7c961486`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp001preregistrationloss_reason_not_reg`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp001preregistrationloss_reason_not_reg` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp001preregistrationloss_reason_not_reg` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `mp001preregistrationloss_id` VARCHAR(36) NOT NULL ,
  `mp001reasonsmothernotreg_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `mp001preregistrationloss_id` (`mp001preregistrationloss_id` ASC, `mp001reasonsmothernotreg_id` ASC) ,
  INDEX `mpepu_mp001preregistrationloss_reason_not_reg_2b93a6af` (`mp001preregistrationloss_id` ASC) ,
  INDEX `mpepu_mp001preregistrationloss_reason_not_reg_42add1f1` (`mp001reasonsmothernotreg_id` ASC) ,
  CONSTRAINT `mp001preregistrationloss_id_refs_id_40bd16c6`
    FOREIGN KEY (`mp001preregistrationloss_id` )
    REFERENCES `test`.`mpepu_mp001preregistrationloss` (`id` ),
  CONSTRAINT `mp001reasonsmothernotreg_id_refs_id_190e68a6`
    FOREIGN KEY (`mp001reasonsmothernotreg_id` )
    REFERENCES `test`.`mpepu_mp001reasonsmothernotreg` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp004arv`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp004arv` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp004arv` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `mp004_id` VARCHAR(36) NOT NULL ,
  `arv_code_id` INT(11) NOT NULL ,
  `arv_start_date` DATE NOT NULL ,
  `arv_stop_date` DATE NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `mpepu_mp004arv_18955f84` (`mp004_id` ASC) ,
  INDEX `mpepu_mp004arv_7c2859e1` (`arv_code_id` ASC) ,
  CONSTRAINT `arv_code_id_refs_id_5e8d71cd`
    FOREIGN KEY (`arv_code_id` )
    REFERENCES `test`.`mpepu_mp004arvlist` (`id` ),
  CONSTRAINT `mp004_id_refs_id_4fc47d41`
    FOREIGN KEY (`mp004_id` )
    REFERENCES `test`.`mpepu_mp004` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp004arvpregnancy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp004arvpregnancy` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp004arvpregnancy` (
  `mp004arv_ptr_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`mp004arv_ptr_id`) ,
  CONSTRAINT `mp004arv_ptr_id_refs_id_34660865`
    FOREIGN KEY (`mp004arv_ptr_id` )
    REFERENCES `test`.`mpepu_mp004arv` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp004arvpostpartum`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp004arvpostpartum` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp004arvpostpartum` (
  `mp004arv_ptr_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`mp004arv_ptr_id`) ,
  CONSTRAINT `mp004arv_ptr_id_refs_id_43dc84de`
    FOREIGN KEY (`mp004arv_ptr_id` )
    REFERENCES `test`.`mpepu_mp004arv` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003sectiontwo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003sectiontwo` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003sectiontwo` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `mp003_id` VARCHAR(36) NOT NULL ,
  `prev_pregnancies` INT(11) NOT NULL ,
  `preg_24wks` INT(11) NOT NULL ,
  `lost_before_24wks` INT(11) NOT NULL ,
  `lost_after_24wks` INT(11) NOT NULL ,
  `live_children` INT(11) NOT NULL ,
  `dead_children` INT(11) NOT NULL ,
  `ongoing_conditions` VARCHAR(25) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `mp003_id` (`mp003_id` ASC) ,
  CONSTRAINT `mp003_id_refs_id_52d066e2`
    FOREIGN KEY (`mp003_id` )
    REFERENCES `test`.`mpepu_mp003` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003sectiontwo_conditions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003sectiontwo_conditions` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003sectiontwo_conditions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `mp003sectiontwo_id` VARCHAR(36) NOT NULL ,
  `mp003conditions_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `mp003sectiontwo_id` (`mp003sectiontwo_id` ASC, `mp003conditions_id` ASC) ,
  INDEX `mpepu_mp003sectiontwo_conditions_6313def8` (`mp003sectiontwo_id` ASC) ,
  INDEX `mpepu_mp003sectiontwo_conditions_68768773` (`mp003conditions_id` ASC) ,
  CONSTRAINT `mp003conditions_id_refs_id_3b08564c`
    FOREIGN KEY (`mp003conditions_id` )
    REFERENCES `test`.`mpepu_mp003conditions` (`id` ),
  CONSTRAINT `mp003sectiontwo_id_refs_id_1f44836b`
    FOREIGN KEY (`mp003sectiontwo_id` )
    REFERENCES `test`.`mpepu_mp003sectiontwo` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003sectionthree`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003sectionthree` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003sectionthree` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `mp003_id` VARCHAR(36) NOT NULL ,
  `prior_health_haart` VARCHAR(25) NOT NULL ,
  `date_haart` DATE NOT NULL ,
  `preg_on_haart` VARCHAR(25) NOT NULL ,
  `haart_regimens` INT(11) NOT NULL ,
  `prior_preg_id` INT(11) NOT NULL ,
  `prev_pregnancy_arv` VARCHAR(25) NOT NULL ,
  `prev_preg_azt` VARCHAR(25) NOT NULL ,
  `prev_sdnvp_labour` VARCHAR(25) NOT NULL ,
  `prev_preg_haart` VARCHAR(25) NOT NULL ,
  `azt3tc_post_delivery` VARCHAR(25) NOT NULL ,
  `cd4_count` INT(11) NOT NULL ,
  `cd4_date` DATE NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `mp003_id` (`mp003_id` ASC) ,
  INDEX `mpepu_mp003sectionthree_2ef97b91` (`prior_preg_id` ASC) ,
  CONSTRAINT `mp003_id_refs_id_c0fe4be`
    FOREIGN KEY (`mp003_id` )
    REFERENCES `test`.`mpepu_mp003` (`id` ),
  CONSTRAINT `prior_preg_id_refs_id_70cdb785`
    FOREIGN KEY (`prior_preg_id` )
    REFERENCES `test`.`mpepu_mp003priorpregnancy` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_mp003sectionthree_conditions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_mp003sectionthree_conditions` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_mp003sectionthree_conditions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `mp003sectionthree_id` VARCHAR(36) NOT NULL ,
  `mp003priorarv_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `mp003sectionthree_id` (`mp003sectionthree_id` ASC, `mp003priorarv_id` ASC) ,
  INDEX `mpepu_mp003sectionthree_conditions_665c4e38` (`mp003sectionthree_id` ASC) ,
  INDEX `mpepu_mp003sectionthree_conditions_37ae7caa` (`mp003priorarv_id` ASC) ,
  CONSTRAINT `mp003priorarv_id_refs_id_3f1c8795`
    FOREIGN KEY (`mp003priorarv_id` )
    REFERENCES `test`.`mpepu_mp003priorarv` (`id` ),
  CONSTRAINT `mp003sectionthree_id_refs_id_70ea5191`
    FOREIGN KEY (`mp003sectionthree_id` )
    REFERENCES `test`.`mpepu_mp003sectionthree` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af002motherappointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af002motherappointment` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af002motherappointment` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `scheduled_visit_datetime` DATETIME NOT NULL ,
  `visit_code` DECIMAL(5,1) NOT NULL ,
  `registered_mother_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `registered_mother_id` (`registered_mother_id` ASC, `visit_code` ASC) ,
  INDEX `mpepu_af002motherappointment_61e12f9f` (`registered_mother_id` ASC) ,
  CONSTRAINT `registered_mother_id_refs_id_4fbc284d`
    FOREIGN KEY (`registered_mother_id` )
    REFERENCES `test`.`mpepu_registeredmother` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`mpepu_af002infantappointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mpepu_af002infantappointment` ;

CREATE  TABLE IF NOT EXISTS `test`.`mpepu_af002infantappointment` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `scheduled_visit_datetime` DATETIME NOT NULL ,
  `visit_code` DECIMAL(5,1) NOT NULL ,
  `registered_infant_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `registered_infant_id` (`registered_infant_id` ASC, `visit_code` ASC) ,
  INDEX `mpepu_af002infantappointment_6d6dae96` (`registered_infant_id` ASC) ,
  CONSTRAINT `registered_infant_id_refs_id_3a090d4d`
    FOREIGN KEY (`registered_infant_id` )
    REFERENCES `test`.`mpepu_registeredinfant` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`bhp_variables_studyspecific`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_variables_studyspecific` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_variables_studyspecific` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `protocol_number` VARCHAR(10) NOT NULL ,
  `protocol_title` VARCHAR(100) NOT NULL ,
  `research_title` VARCHAR(250) NOT NULL ,
  `study_start_datetime` DATETIME NOT NULL ,
  `subject_identifier_seed` INT(11) NOT NULL ,
  `subject_identifier_prefix` VARCHAR(3) NOT NULL ,
  `subject_identifier_modulus` INT(11) NOT NULL ,
  `device_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `protocol_number` (`protocol_number` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`bhp_lab_panel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_lab_panel` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_lab_panel` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(25) NOT NULL ,
  `comment` VARCHAR(250) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`bhp_lab_test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_lab_test` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_lab_test` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `test_code` VARCHAR(10) NOT NULL ,
  `test_name` VARCHAR(25) NOT NULL ,
  `comment` VARCHAR(250) NOT NULL ,
  `panel_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `test_code` (`test_code` ASC) ,
  INDEX `bhp_lab_test_130efbb7` (`panel_id` ASC) ,
  CONSTRAINT `panel_id_refs_id_4159be16`
    FOREIGN KEY (`panel_id` )
    REFERENCES `test`.`bhp_lab_panel` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`bhp_lab_labaliquotcondition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_lab_labaliquotcondition` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_lab_labaliquotcondition` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`bhp_lab_labaliquottype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_lab_labaliquottype` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_lab_labaliquottype` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `short_name` VARCHAR(250) NOT NULL ,
  `display_index` INT(11) NOT NULL ,
  `field_name` VARCHAR(25) NULL DEFAULT NULL ,
  `version` VARCHAR(35) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) ,
  UNIQUE INDEX `short_name` (`short_name` ASC) ,
  UNIQUE INDEX `display_index` (`display_index` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`bhp_lab_labaliquot`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_lab_labaliquot` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_lab_labaliquot` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `aliquot_identifier` VARCHAR(25) NOT NULL ,
  `id_int` INT(11) NOT NULL ,
  `id_seed` INT(11) NOT NULL ,
  `lab_aliquot_type_id` INT(11) NOT NULL ,
  `aliquot_volume` DECIMAL(10,2) NOT NULL ,
  `lab_aliquot_condition_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `aliquot_identifier` (`aliquot_identifier` ASC) ,
  INDEX `bhp_lab_labaliquot_71fc4b12` (`lab_aliquot_type_id` ASC) ,
  INDEX `bhp_lab_labaliquot_158f571c` (`lab_aliquot_condition_id` ASC) ,
  CONSTRAINT `lab_aliquot_condition_id_refs_id_6ce267f9`
    FOREIGN KEY (`lab_aliquot_condition_id` )
    REFERENCES `test`.`bhp_lab_labaliquotcondition` (`id` ),
  CONSTRAINT `lab_aliquot_type_id_refs_id_26e78521`
    FOREIGN KEY (`lab_aliquot_type_id` )
    REFERENCES `test`.`bhp_lab_labaliquottype` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`bhp_lab_labreceive`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_lab_labreceive` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_lab_labreceive` (
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `id` VARCHAR(36) NOT NULL ,
  `lab_aliquot_id` VARCHAR(36) NOT NULL ,
  `datetime_received` DATETIME NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `datetime_drawn` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `lab_aliquot_id` (`lab_aliquot_id` ASC) ,
  INDEX `bhp_lab_labreceive_504d356c` (`subject_consent_id` ASC) ,
  CONSTRAINT `lab_aliquot_id_refs_id_4c266cb3`
    FOREIGN KEY (`lab_aliquot_id` )
    REFERENCES `test`.`bhp_lab_labaliquot` (`id` ),
  CONSTRAINT `subject_consent_id_refs_id_504a2de`
    FOREIGN KEY (`subject_consent_id` )
    REFERENCES `test`.`mpepu_subjectconsent` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `test`.`bhp_consent_subjectidentifieraudittrail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`bhp_consent_subjectidentifieraudittrail` ;

CREATE  TABLE IF NOT EXISTS `test`.`bhp_consent_subjectidentifieraudittrail` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created` DATETIME NOT NULL ,
  `modified` DATETIME NOT NULL ,
  `user_created` VARCHAR(250) NOT NULL ,
  `user_modified` VARCHAR(250) NOT NULL ,
  `hostname_created` VARCHAR(50) NOT NULL ,
  `hostname_modified` VARCHAR(50) NOT NULL ,
  `subject_consent_id` VARCHAR(36) NOT NULL ,
  `subject_identifier` VARCHAR(25) NOT NULL ,
  `first_name` VARCHAR(250) NOT NULL ,
  `initials` VARCHAR(3) NOT NULL ,
  `date_allocated` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

