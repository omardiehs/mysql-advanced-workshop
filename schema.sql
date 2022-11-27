-- MySQL Script generated by MySQL Workbench
-- Sun Nov 27 15:44:49 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema wild_commerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema wild_commerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wild_commerce` ;
USE `wild_commerce` ;

-- -----------------------------------------------------
-- Table `wild_commerce`.`images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wild_commerce`.`images` ;

CREATE TABLE IF NOT EXISTS `wild_commerce`.`images` (
  `image_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `url` VARCHAR(2083) NOT NULL,
  `product_id` INT NULL,
  `category_id` INT NULL,
  PRIMARY KEY (`image_id`),
  INDEX `product_image_idx` (`product_id` ASC) INVISIBLE,
  INDEX `category_image_idx` (`category_id` ASC) VISIBLE,
  UNIQUE INDEX `image_id_UNIQUE` (`image_id` ASC) VISIBLE,
  CONSTRAINT `images_product_image`
    FOREIGN KEY (`product_id`)
    REFERENCES `wild_commerce`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `images_category_image`
    FOREIGN KEY (`category_id`)
    REFERENCES `wild_commerce`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wild_commerce`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wild_commerce`.`categories` ;

CREATE TABLE IF NOT EXISTS `wild_commerce`.`categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(155) NOT NULL,
  `image_id` INT NULL,
  PRIMARY KEY (`category_id`),
  INDEX `category_image_idx` (`image_id` ASC) INVISIBLE,
  UNIQUE INDEX `category_id_UNIQUE` (`category_id` ASC) VISIBLE,
  CONSTRAINT `categories_category_image`
    FOREIGN KEY (`image_id`)
    REFERENCES `wild_commerce`.`images` (`image_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wild_commerce`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wild_commerce`.`products` ;

CREATE TABLE IF NOT EXISTS `wild_commerce`.`products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(155) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `category_id` INT NULL,
  `image_id` INT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) VISIBLE,
  INDEX `product_category_idx` (`category_id` ASC) VISIBLE,
  INDEX `product_image_idx` (`image_id` ASC) VISIBLE,
  CONSTRAINT `products_product_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `wild_commerce`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `products_product_image`
    FOREIGN KEY (`image_id`)
    REFERENCES `wild_commerce`.`images` (`image_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `wild_commerce`.`images`
-- -----------------------------------------------------
START TRANSACTION;
USE `wild_commerce`;
INSERT INTO `wild_commerce`.`images` (`image_id`, `title`, `url`, `product_id`, `category_id`) VALUES (1, 'soft-drinks', 'https://images.unsplash.com/photo-1473425990767-8324e48b48b5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', NULL, 1);
INSERT INTO `wild_commerce`.`images` (`image_id`, `title`, `url`, `product_id`, `category_id`) VALUES (2, 'snacks', 'https://images.unsplash.com/photo-1571865402713-98ba5a56f12b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80', NULL, 2);
INSERT INTO `wild_commerce`.`images` (`image_id`, `title`, `url`, `product_id`, `category_id`) VALUES (3, 'cola-drink', 'https://images.unsplash.com/photo-1606052018081-317029f8adfd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1978&q=80', 1, NULL);
INSERT INTO `wild_commerce`.`images` (`image_id`, `title`, `url`, `product_id`, `category_id`) VALUES (4, 'spicy-chips', 'https://images.unsplash.com/photo-1599490659213-e2b9527bd087?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80', 2, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wild_commerce`.`categories`
-- -----------------------------------------------------
START TRANSACTION;
USE `wild_commerce`;
INSERT INTO `wild_commerce`.`categories` (`category_id`, `title`, `image_id`) VALUES (1, 'Drinks', 1);
INSERT INTO `wild_commerce`.`categories` (`category_id`, `title`, `image_id`) VALUES (2, 'Snacks', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wild_commerce`.`products`
-- -----------------------------------------------------
START TRANSACTION;
USE `wild_commerce`;
INSERT INTO `wild_commerce`.`products` (`product_id`, `title`, `price`, `category_id`, `image_id`) VALUES (1, 'Wild Cola', 1.99, 1, 3);
INSERT INTO `wild_commerce`.`products` (`product_id`, `title`, `price`, `category_id`, `image_id`) VALUES (2, 'Spicy Chips', 2.5, 2, 4);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
