-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `tb_temas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tb_temas` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `assunto` VARCHAR(80) NOT NULL,
  `relevancia` VARCHAR(65) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tb_usuario` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tb_postagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tb_postagens` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `titulos` VARCHAR(100) NOT NULL,
  `texto` TEXT(1000) NOT NULL,
  `dat_public` DATE NOT NULL,
  `contato` VARCHAR(80) NOT NULL,
  `tb_temas_id` BIGINT NOT NULL,
  `tb_usuario_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`, `tb_usuario_id`),
  INDEX `fk_tb_postagens_tb_temas_idx` (`tb_temas_id` ASC) VISIBLE,
  INDEX `fk_tb_postagens_tb_usuario1_idx` (`tb_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_postagens_tb_temas`
    FOREIGN KEY (`tb_temas_id`)
    REFERENCES `tb_temas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_postagens_tb_usuario1`
    FOREIGN KEY (`tb_usuario_id`)
    REFERENCES `tb_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
