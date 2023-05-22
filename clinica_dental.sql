-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema clinica_dental
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema clinica_dental
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clinica_dental` DEFAULT CHARACTER SET utf8 ;
USE `clinica_dental` ;

-- -----------------------------------------------------
-- Table `clinica_dental`.`Pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dental`.`Pacientes` (
  `idPaciente` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `edad` INT NULL,
  PRIMARY KEY (`idPaciente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinica_dental`.`doctores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dental`.`doctores` (
  `iddoctor` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `puesto` VARCHAR(45) NULL,
  PRIMARY KEY (`iddoctor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinica_dental`.`citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dental`.`citas` (
  `idcitas` INT NOT NULL,
  `fecha` DATE NULL,
  `citascol` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `iddoctor` VARCHAR(45) NULL,
  `idpaciente` VARCHAR(45) NULL,
  `Pacientes_idPaciente` INT NOT NULL,
  `doctores_iddoctor` INT NOT NULL,
  PRIMARY KEY (`idcitas`),
  INDEX `fk_citas_Pacientes_idx` (`Pacientes_idPaciente` ASC),
  INDEX `fk_citas_doctores1_idx` (`doctores_iddoctor` ASC),
  CONSTRAINT `fk_citas_Pacientes`
    FOREIGN KEY (`Pacientes_idPaciente`)
    REFERENCES `clinica_dental`.`Pacientes` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_citas_doctores1`
    FOREIGN KEY (`doctores_iddoctor`)
    REFERENCES `clinica_dental`.`doctores` (`iddoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinica_dental`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica_dental`.`usuarios` (
  `idusuario` INT NOT NULL,
  `contrasena` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
