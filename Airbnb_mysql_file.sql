-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Airbnb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Airbnb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Airbnb` DEFAULT CHARACTER SET utf8 ;
USE `Airbnb` ;

-- -----------------------------------------------------
-- Table `Airbnb`.`Customer_SibangiS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Customer_SibangiS` (
  `customerID` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(15) NULL,
  `country` VARCHAR(15) NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Host_SibangiS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Host_SibangiS` (
  `hostID` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`hostID`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Stay_SibangiS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Stay_SibangiS` (
  `stayID` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `pricePerNight` DECIMAL(10,2) NOT NULL,
  `numberOfBedrooms` INT NOT NULL,
  `numberOfBathrooms` INT NOT NULL,
  `numberOfGuests` INT NOT NULL,
  `hostID` INT NOT NULL,
  PRIMARY KEY (`stayID`),
  INDEX `fk_Stay_SibangiS_Host_SibangiS1_idx` (`hostID` ASC) VISIBLE,
  CONSTRAINT `fk_Stay_SibangiS_Host_SibangiS1`
    FOREIGN KEY (`hostID`)
    REFERENCES `Airbnb`.`Host_SibangiS` (`hostID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Booking_SibangiS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Booking_SibangiS` (
  `bookingID` INT NOT NULL,
  `createdAt` DATE NOT NULL,
  `checkInDate` DATE NOT NULL,
  `checkOutDate` DATE NOT NULL,
  `totalAmount` DECIMAL(10,2) NOT NULL,
  `customerID` INT NOT NULL,
  `stayID` INT NOT NULL,
  PRIMARY KEY (`bookingID`),
  INDEX `fk_Booking_SibangiS_Customer_SibangiS_idx` (`customerID` ASC) VISIBLE,
  INDEX `fk_Booking_SibangiS_Stay_SibangiS1_idx` (`stayID` ASC) VISIBLE,
  CONSTRAINT `fk_Booking_SibangiS_Customer_SibangiS`
    FOREIGN KEY (`customerID`)
    REFERENCES `Airbnb`.`Customer_SibangiS` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_SibangiS_Stay_SibangiS1`
    FOREIGN KEY (`stayID`)
    REFERENCES `Airbnb`.`Stay_SibangiS` (`stayID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`BookingStatus_SibangiS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`BookingStatus_SibangiS` (
  `statusID` INT NOT NULL,
  `statusName` VARCHAR(45) NOT NULL,
  `paymentType` VARCHAR(45) NOT NULL,
  `bookingID` INT NOT NULL,
  PRIMARY KEY (`statusID`),
  INDEX `fk_BookingStatus_SibangiS_Booking_SibangiS1_idx` (`bookingID` ASC) VISIBLE,
  CONSTRAINT `fk_BookingStatus_SibangiS_Booking_SibangiS1`
    FOREIGN KEY (`bookingID`)
    REFERENCES `Airbnb`.`Booking_SibangiS` (`bookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Experience_SibangiS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Experience_SibangiS` (
  `experienceID` INT NOT NULL,
  `title` VARCHAR(100) NULL,
  `description` VARCHAR(255) NULL,
  `location` VARCHAR(100) NULL,
  `pricePerPerson` DECIMAL(10,2) NULL,
  `duration` INT NULL,
  `capacity` INT NULL DEFAULT 10,
  `experienceDate` DATE NULL,
  `hostID` INT NOT NULL,
  PRIMARY KEY (`experienceID`),
  INDEX `fk_Experience_SibangiS_Host_SibangiS1_idx` (`hostID` ASC) VISIBLE,
  CONSTRAINT `fk_Experience_SibangiS_Host_SibangiS1`
    FOREIGN KEY (`hostID`)
    REFERENCES `Airbnb`.`Host_SibangiS` (`hostID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Review_SibangiS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Review_SibangiS` (
  `reviewID` INT NOT NULL,
  `rating` DECIMAL(3,2) NOT NULL,
  `comment` VARCHAR(255) NULL,
  `reviewDate` DATE NOT NULL,
  `customerID` INT NOT NULL,
  `stayID` INT NULL,
  `experienceID` INT NULL,
  PRIMARY KEY (`reviewID`),
  INDEX `fk_Review_SibangiS_Customer_SibangiS1_idx` (`customerID` ASC) VISIBLE,
  INDEX `fk_Review_SibangiS_Stay_SibangiS1_idx` (`stayID` ASC) VISIBLE,
  INDEX `fk_Review_SibangiS_Experience_SibangiS1_idx` (`experienceID` ASC) VISIBLE,
  CONSTRAINT `fk_Review_SibangiS_Customer_SibangiS1`
    FOREIGN KEY (`customerID`)
    REFERENCES `Airbnb`.`Customer_SibangiS` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_SibangiS_Stay_SibangiS1`
    FOREIGN KEY (`stayID`)
    REFERENCES `Airbnb`.`Stay_SibangiS` (`stayID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_SibangiS_Experience_SibangiS1`
    FOREIGN KEY (`experienceID`)
    REFERENCES `Airbnb`.`Experience_SibangiS` (`experienceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`amenity_SibangiS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`amenity_SibangiS` (
  `amenity_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`amenity_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Stay_has_amenity_SibangiS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Stay_has_amenity_SibangiS` (
  `stayID` INT NOT NULL,
  `amenity_id` INT NOT NULL,
  PRIMARY KEY (`stayID`, `amenity_id`),
  INDEX `fk_Stay_SibangiS_has_amenity_SibangiS_amenity_SibangiS1_idx` (`amenity_id` ASC) VISIBLE,
  INDEX `fk_Stay_SibangiS_has_amenity_SibangiS_Stay_SibangiS1_idx` (`stayID` ASC) VISIBLE,
  CONSTRAINT `fk_Stay_SibangiS_has_amenity_SibangiS_Stay_SibangiS1`
    FOREIGN KEY (`stayID`)
    REFERENCES `Airbnb`.`Stay_SibangiS` (`stayID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Stay_SibangiS_has_amenity_SibangiS_amenity_SibangiS1`
    FOREIGN KEY (`amenity_id`)
    REFERENCES `Airbnb`.`amenity_SibangiS` (`amenity_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Booking_Experience_SibangiS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Booking_Experience_SibangiS` (
  `bookingExpID` INT NOT NULL,
  `bookingDate` DATE NOT NULL,
  `attendees` INT NOT NULL DEFAULT 1,
  `totalAmount` DECIMAL(10,2) NOT NULL,
  `experienceID` INT NOT NULL,
  `customerID` INT NOT NULL,
  `statusID` INT NOT NULL,
  INDEX `fk_Booking_Experience_SibangiS_Experience_SibangiS1_idx` (`experienceID` ASC) VISIBLE,
  INDEX `fk_Booking_Experience_SibangiS_Customer_SibangiS1_idx` (`customerID` ASC) VISIBLE,
  INDEX `fk_Booking_Experience_SibangiS_BookingStatus_SibangiS1_idx` (`statusID` ASC) VISIBLE,
  PRIMARY KEY (`bookingExpID`),
  CONSTRAINT `fk_Booking_Experience_SibangiS_Experience_SibangiS1`
    FOREIGN KEY (`experienceID`)
    REFERENCES `Airbnb`.`Experience_SibangiS` (`experienceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Experience_SibangiS_Customer_SibangiS1`
    FOREIGN KEY (`customerID`)
    REFERENCES `Airbnb`.`Customer_SibangiS` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Experience_SibangiS_BookingStatus_SibangiS1`
    FOREIGN KEY (`statusID`)
    REFERENCES `Airbnb`.`BookingStatus_SibangiS` (`statusID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
