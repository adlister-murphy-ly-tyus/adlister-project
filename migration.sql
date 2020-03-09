-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema adlister_db
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema adlister_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `adlister_db` DEFAULT CHARACTER SET utf8 ;
USE `adlister_db` ;
-- -----------------------------------------------------
-- Table `adlister_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adlister_db`.`users` (
                                                     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                                                     `username` VARCHAR(255) NOT NULL,
                                                     `password` VARCHAR(255) NOT NULL,
                                                     `email` VARCHAR(255) NOT NULL,
                                                     `phone_number` VARCHAR(20) NULL,
                                                     PRIMARY KEY (`id`),
                                                     UNIQUE INDEX `username_UNIQUE` (`username` ASC),
                                                     UNIQUE INDEX `id_UNIQUE` (`id` ASC))
    ENGINE = InnoDB
    AUTO_INCREMENT = 11
    DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `adlister_db`.`ads`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adlister_db`.`ads` (
                                                   `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                                                   `user_id` INT(10) UNSIGNED NULL DEFAULT NULL,
                                                   `title` VARCHAR(200) NOT NULL,
                                                   `price` DOUBLE NOT NULL,
                                                   `description` TEXT NULL DEFAULT NULL,
                                                   `img_url` VARCHAR(255) NULL,
                                                   PRIMARY KEY (`id`),
                                                   INDEX `user_id_idx` (`user_id` ASC),
                                                   CONSTRAINT `user_id`
                                                       FOREIGN KEY (`user_id`)
                                                           REFERENCES `adlister_db`.`users` (`id`)
                                                           ON DELETE NO ACTION
                                                           ON UPDATE NO ACTION)
    ENGINE = InnoDB
    AUTO_INCREMENT = 6
    DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `adlister_db`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adlister_db`.`categories` (
                                                          `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                                          `name` VARCHAR(200) NOT NULL,
                                                          PRIMARY KEY (`id`),
                                                          UNIQUE INDEX `id_UNIQUE` (`id` ASC),
                                                          UNIQUE INDEX `name_UNIQUE` (`name` ASC))
    ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `adlister_db`.`ads_has_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adlister_db`.`ads_has_category` (
                                                                `ads_id` INT(10) UNSIGNED NOT NULL,
                                                                `category_id` INT UNSIGNED NOT NULL,
                                                                PRIMARY KEY (`ads_id`, `category_id`),
                                                                INDEX `fk_ads_has_category_category1_idx` (`category_id` ASC),
                                                                INDEX `fk_ads_has_category_ads1_idx` (`ads_id` ASC),
                                                                CONSTRAINT `fk_ads_has_category_ads1`
                                                                    FOREIGN KEY (`ads_id`)
                                                                        REFERENCES `adlister_db`.`ads` (`id`)
                                                                        ON DELETE NO ACTION
                                                                        ON UPDATE NO ACTION,
                                                                CONSTRAINT `fk_ads_has_category_category1`
                                                                    FOREIGN KEY (`category_id`)
                                                                        REFERENCES `adlister_db`.`categories` (`id`)
                                                                        ON DELETE NO ACTION
                                                                        ON UPDATE NO ACTION)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `adlister_db`.`favorites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adlister_db`.`favorites` (
                                                         `users_id` INT(10) UNSIGNED NOT NULL,
                                                         `ads_id` INT(10) UNSIGNED NOT NULL,
                                                         PRIMARY KEY (`users_id`, `ads_id`),
                                                         INDEX `fk_users_has_ads_ads1_idx` (`ads_id` ASC),
                                                         INDEX `fk_users_has_ads_users1_idx` (`users_id` ASC),
                                                         CONSTRAINT `fk_users_has_ads_users1`
                                                             FOREIGN KEY (`users_id`)
                                                                 REFERENCES `adlister_db`.`users` (`id`)
                                                                 ON DELETE NO ACTION
                                                                 ON UPDATE NO ACTION,
                                                         CONSTRAINT `fk_users_has_ads_ads1`
                                                             FOREIGN KEY (`ads_id`)
                                                                 REFERENCES `adlister_db`.`ads` (`id`)
                                                                 ON DELETE NO ACTION
                                                                 ON UPDATE NO ACTION)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;