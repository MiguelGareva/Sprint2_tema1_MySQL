-- MySQL Script generated by MySQL Workbench
-- Mon Jan 20 11:13:55 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`direccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`direccion` ;

CREATE TABLE IF NOT EXISTS `optica`.`direccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(65) NOT NULL,
  `numero` INT NOT NULL,
  `piso` VARCHAR(10) NULL,
  `puerta` VARCHAR(10) NULL,
  `ciudad` VARCHAR(65) NOT NULL,
  `codigo_postal` VARCHAR(15) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`proveedor` ;

CREATE TABLE IF NOT EXISTS `optica`.`proveedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(25) NULL,
  `fax` VARCHAR(25) NULL,
  `nif` VARCHAR(45) NULL,
  `id_direccion` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_direccion_proveedor`
    FOREIGN KEY (`id_direccion`)
    REFERENCES `optica`.`direccion` (`id`)
    ON DELETE CASCADE
    ON UPDATE SET NULL)
ENGINE = InnoDB;

CREATE INDEX `fk_direccion_proveedor_idx` ON `optica`.`proveedor` (`id_direccion` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `optica`.`gafas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`gafas` ;

CREATE TABLE IF NOT EXISTS `optica`.`gafas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NOT NULL,
  `graduacion_cristal_derecho` DECIMAL NULL,
  `graduacion_cristal_izquierdo` DECIMAL NULL,
  `tipo_montura` ENUM("flotante", "pasta", "metalica") NOT NULL,
  `color_montura` VARCHAR(25) NOT NULL,
  `color_cristal_izquierdo` VARCHAR(25) NULL,
  `color_cistal_derecho` VARCHAR(25) NULL,
  `precio` DECIMAL NOT NULL,
  `id_proveedor` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_gafas_proveedor`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `optica`.`proveedor` (`id`)
    ON DELETE CASCADE
    ON UPDATE SET NULL)
ENGINE = InnoDB;

CREATE INDEX `fk_gafas_proveedor_idx` ON `optica`.`gafas` (`id_proveedor` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `optica`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`cliente` ;

CREATE TABLE IF NOT EXISTS `optica`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NOT NULL,
  `telefono` VARCHAR(25) NOT NULL,
  `email` VARCHAR(45) NULL,
  `fecha_alta_cliente` DATE NOT NULL,
  `id_direccion` INT NULL,
  `id_cliente_recomendacion` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_direccion_cliente`
    FOREIGN KEY (`id_direccion`)
    REFERENCES `optica`.`direccion` (`id`)
    ON DELETE CASCADE
    ON UPDATE SET NULL,
  CONSTRAINT `fk_cliente_recomendacion`
    FOREIGN KEY (`id_cliente_recomendacion`)
    REFERENCES `optica`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_direccion_cliente_idx` ON `optica`.`cliente` (`id_direccion` ASC) VISIBLE;

CREATE INDEX `fk_cliente_recomendacion_idx` ON `optica`.`cliente` (`id_cliente_recomendacion` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `optica`.`empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`empleado` ;

CREATE TABLE IF NOT EXISTS `optica`.`empleado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`venta` ;

CREATE TABLE IF NOT EXISTS `optica`.`venta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha_venta` DATE NOT NULL,
  `id_empleado` INT NOT NULL,
  `id_cliente` INT NULL,
  `id_gafas` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_ventas_empleado`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `optica`.`empleado` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `optica`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_gafas`
    FOREIGN KEY (`id_gafas`)
    REFERENCES `optica`.`gafas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ventas_empleado_idx` ON `optica`.`venta` (`id_empleado` ASC) VISIBLE;

CREATE INDEX `fk_ventas_cliente_idx` ON `optica`.`venta` (`id_cliente` ASC) VISIBLE;

CREATE INDEX `fk_ventas_gafas_idx` ON `optica`.`venta` (`id_gafas` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
