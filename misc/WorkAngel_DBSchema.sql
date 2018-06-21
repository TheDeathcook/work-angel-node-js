-- MySQL Script generated by MySQL Workbench
-- Mon Jun  4 10:41:52 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema work_angel_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `work_angel_db` DEFAULT CHARACTER SET utf8 ;
USE `work_angel_db` ;

-- -----------------------------------------------------
-- Table `work_angel_db`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `work_angel_db`.`User` (
  `User_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Lastname` VARCHAR(45) NULL,
  `Forename` VARCHAR(45) NULL,
  `Description` VARCHAR(500) NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `SALT` VARCHAR(45) NULL,
  `UserPicture` BLOB(32000000) NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `work_angel_db`.`Employer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `work_angel_db`.`Employer` (
  `Employer_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Username` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `SALT` VARCHAR(45) NULL,
  `EmployerPicture` BLOB(32000000) NULL,
  `Description` VARCHAR(500) NULL,
  PRIMARY KEY (`Employer_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `work_angel_db`.`Skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `work_angel_db`.`Skill` (
  `Skill_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`Skill_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `work_angel_db`.`User_has_Skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `work_angel_db`.`User_has_Skill` (
  `User_User_ID` INT(11) NOT NULL,
  `Skill_Skill_ID` INT NOT NULL,
  `Level` INT(1) NULL,
  PRIMARY KEY (`User_User_ID`, `Skill_Skill_ID`),
  INDEX `fk_User_has_Skills_Skills1_idx` (`Skill_Skill_ID` ASC),
  INDEX `fk_User_has_Skills_User_idx` (`User_User_ID` ASC),
  CONSTRAINT `fk_User_has_Skills_User`
    FOREIGN KEY (`User_User_ID`)
    REFERENCES `work_angel_db`.`User` (`User_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_User_has_Skills_Skills1`
    FOREIGN KEY (`Skill_Skill_ID`)
    REFERENCES `work_angel_db`.`Skill` (`Skill_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `work_angel_db`.`Match`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `work_angel_db`.`Match` (
  `Employer_Employer_ID` INT NOT NULL,
  `User_User_ID` INT(11) NOT NULL,
  `Compability` INT NULL,
  `User_Accepted` BIT NULL,
  `Employer_Accepted` BIT NULL,
  PRIMARY KEY (`Employer_Employer_ID`, `User_User_ID`),
  INDEX `fk_Employer_has_User_User1_idx` (`User_User_ID` ASC),
  INDEX `fk_Employer_has_User_Employer1_idx` (`Employer_Employer_ID` ASC),
  CONSTRAINT `fk_Employer_has_User_Employer1`
    FOREIGN KEY (`Employer_Employer_ID`)
    REFERENCES `work_angel_db`.`Employer` (`Employer_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Employer_has_User_User1`
    FOREIGN KEY (`User_User_ID`)
    REFERENCES `work_angel_db`.`User` (`User_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `work_angel_db`.`Employer_needs_Skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `work_angel_db`.`Employer_needs_Skill` (
  `Employer_Employer_ID` INT NOT NULL,
  `Skill_Skill_ID` INT NOT NULL,
  PRIMARY KEY (`Employer_Employer_ID`, `Skill_Skill_ID`),
  INDEX `fk_Employer_has_Skills_Skills1_idx` (`Skill_Skill_ID` ASC),
  INDEX `fk_Employer_has_Skills_Employer1_idx` (`Employer_Employer_ID` ASC),
  CONSTRAINT `fk_Employer_has_Skills_Employer1`
    FOREIGN KEY (`Employer_Employer_ID`)
    REFERENCES `work_angel_db`.`Employer` (`Employer_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Employer_has_Skills_Skills1`
    FOREIGN KEY (`Skill_Skill_ID`)
    REFERENCES `work_angel_db`.`Skill` (`Skill_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
