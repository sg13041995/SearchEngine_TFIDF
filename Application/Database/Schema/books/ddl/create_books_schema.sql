-- MySQL Script generated by MySQL Workbench
-- Mon Jan 29 23:44:39 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema books
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `books` ;

-- -----------------------------------------------------
-- Schema books
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `books` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `books` ;

-- -----------------------------------------------------
-- Table `books`.`book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`book` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `books`.`book` (
  `book_id` BIGINT NOT NULL AUTO_INCREMENT,
  `gr_book_id` BIGINT NOT NULL,
  `book_title` TEXT NOT NULL,
  `book_title_mod` TEXT NOT NULL,
  `book_title_series` TEXT NOT NULL,
  `book_title_series_mod` TEXT NOT NULL,
  `book_description` TEXT NOT NULL,
  `book_ratings_count` INT NOT NULL,
  `book_average_rating` FLOAT NOT NULL,
  `book_num_pages` INT NOT NULL,
  `book_publication_day` TINYINT NOT NULL,
  `book_publication_month` TINYINT NOT NULL,
  `book_publication_year` INT NOT NULL,
  `book_isbn` TEXT NOT NULL,
  `book_isbn13` TEXT NOT NULL,
  `book_publisher` VARCHAR(500) NOT NULL,
  `book_country_code` VARCHAR(100) NOT NULL,
  `book_language_code` VARCHAR(100) NOT NULL,
  `book_url` TEXT NOT NULL,
  `book_image_url` TEXT NOT NULL,
  `book_link` TEXT NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 1,
  `created_id` BIGINT NOT NULL DEFAULT 1,
  `created_dtm` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_id` BIGINT NOT NULL DEFAULT 1,
  `modified_dtm` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`book_id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `i_book_id` ON `books`.`book` (`gr_book_id` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `book_isbn_UNIQUE` ON `books`.`book` (`book_isbn` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `book_isbn13_UNIQUE` ON `books`.`book` (`book_isbn13` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `books`.`genres_lookup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`genres_lookup` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `books`.`genres_lookup` (
  `genres_lookup_id` BIGINT NOT NULL AUTO_INCREMENT,
  `genres_lookup_name` VARCHAR(500) NOT NULL,
  `genres_lookup_desc` TEXT NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 1,
  `created_id` BIGINT NOT NULL DEFAULT 1,
  `created_dtm` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_id` BIGINT NOT NULL DEFAULT 1,
  `modified_dtm` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`genres_lookup_id`))
ENGINE = InnoDB
COMMENT = '				';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `books`.`book_genres_lookup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`book_genres_lookup` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `books`.`book_genres_lookup` (
  `book_genres_lookup_id` BIGINT NOT NULL AUTO_INCREMENT,
  `book_id` BIGINT NOT NULL,
  `genres_lookup_id` BIGINT NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 1,
  `created_id` BIGINT NOT NULL DEFAULT 1,
  `created_dtm` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_id` BIGINT NOT NULL DEFAULT 1,
  `modified_dtm` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`book_genres_lookup_id`),
  CONSTRAINT `fk_book_book_genres_lookup`
    FOREIGN KEY (`book_id`)
    REFERENCES `books`.`book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_genres_lookup_book_genres_lookup`
    FOREIGN KEY (`genres_lookup_id`)
    REFERENCES `books`.`genres_lookup` (`genres_lookup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `i_book_id` ON `books`.`book_genres_lookup` (`book_id` ASC) ;

SHOW WARNINGS;
CREATE INDEX `i_genres_lookup_id` ON `books`.`book_genres_lookup` (`genres_lookup_id` ASC) ;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
