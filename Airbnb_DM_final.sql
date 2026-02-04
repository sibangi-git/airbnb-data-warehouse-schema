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
-- -----------------------------------------------------
-- Schema airbnb_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema airbnb_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `airbnb_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
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

USE `airbnb_schema` ;

-- -----------------------------------------------------
-- Table `airbnb_schema`.`dimstay_sibangis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb_schema`.`dimstay_sibangis` (
  `stayKey` INT NOT NULL,
  `stayID` INT NULL DEFAULT NULL,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `location` VARCHAR(45) NULL DEFAULT NULL,
  `pricePerNight` DECIMAL(10,2) NULL DEFAULT NULL,
  `numberOfBedrooms` INT NULL DEFAULT NULL,
  `numberOfBathrooms` INT NULL DEFAULT NULL,
  `numberOfGuests` INT NULL DEFAULT NULL,
  PRIMARY KEY (`stayKey`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `airbnb_schema`.`dim_amenity_sibangis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb_schema`.`dim_amenity_sibangis` (
  `amenityKey` INT NOT NULL AUTO_INCREMENT,
  `amenityID` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`amenityKey`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `airbnb_schema`.`bridge_stay_amenity_sibangis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb_schema`.`bridge_stay_amenity_sibangis` (
  `stayKey` INT NOT NULL,
  `amenityKey` INT NOT NULL,
  PRIMARY KEY (`stayKey`, `amenityKey`),
  INDEX `amenityKey` (`amenityKey` ASC) VISIBLE,
  CONSTRAINT `bridge_stay_amenity_sibangis_ibfk_1`
    FOREIGN KEY (`stayKey`)
    REFERENCES `airbnb_schema`.`dimstay_sibangis` (`stayKey`),
  CONSTRAINT `bridge_stay_amenity_sibangis_ibfk_2`
    FOREIGN KEY (`amenityKey`)
    REFERENCES `airbnb_schema`.`dim_amenity_sibangis` (`amenityKey`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `airbnb_schema`.`dim_bookingstatus_sibangis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb_schema`.`dim_bookingstatus_sibangis` (
  `statusKey` INT NOT NULL AUTO_INCREMENT,
  `statusName` VARCHAR(45) NULL DEFAULT NULL,
  `paymentType` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`statusKey`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `airbnb_schema`.`dimcustomer_sibangis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb_schema`.`dimcustomer_sibangis` (
  `customerKey` INT NOT NULL,
  `customerID` INT NULL DEFAULT NULL,
  `firstName` VARCHAR(45) NULL DEFAULT NULL,
  `lastName` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(15) NULL DEFAULT NULL,
  `country` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`customerKey`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `airbnb_schema`.`dimdate_sibangis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb_schema`.`dimdate_sibangis` (
  `dateKey` INT NOT NULL,
  `fullDate` DATE NULL DEFAULT NULL,
  `day` INT NULL DEFAULT NULL,
  `month` INT NULL DEFAULT NULL,
  `year` INT NULL DEFAULT NULL,
  `quarter` INT NULL DEFAULT NULL,
  `dayOfWeek` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`dateKey`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `airbnb_schema`.`dimexperience_sibangis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb_schema`.`dimexperience_sibangis` (
  `experienceKey` INT NOT NULL,
  `experienceID` INT NULL DEFAULT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `location` VARCHAR(100) NULL DEFAULT NULL,
  `pricePerPerson` DECIMAL(10,2) NULL DEFAULT NULL,
  `capacity` INT NULL DEFAULT NULL,
  `experienceDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`experienceKey`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `airbnb_schema`.`dimhost_sibangi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb_schema`.`dimhost_sibangi` (
  `hostKey` INT NOT NULL,
  `hostID` INT NULL DEFAULT NULL,
  `firstName` VARCHAR(45) NULL DEFAULT NULL,
  `lastName` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(15) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`hostKey`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `airbnb_schema`.`factbooking_sibangis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb_schema`.`factbooking_sibangis` (
  `bookingKey` INT NOT NULL,
  `customerKey` INT NULL DEFAULT NULL,
  `hostKey` INT NULL DEFAULT NULL,
  `stayKey` INT NULL DEFAULT NULL,
  `experienceKey` INT NULL DEFAULT NULL,
  `checkInDateKey` INT NULL DEFAULT NULL,
  `checkOutDateKey` INT NULL DEFAULT NULL,
  `bookingDateKey` INT NULL DEFAULT NULL,
  `statusKey` INT NULL DEFAULT NULL,
  `totalAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  `attendees` INT NULL DEFAULT NULL,
  PRIMARY KEY (`bookingKey`),
  INDEX `customerKey` (`customerKey` ASC) VISIBLE,
  INDEX `hostKey` (`hostKey` ASC) VISIBLE,
  INDEX `stayKey` (`stayKey` ASC) VISIBLE,
  INDEX `experienceKey` (`experienceKey` ASC) VISIBLE,
  INDEX `checkInDateKey` (`checkInDateKey` ASC) VISIBLE,
  INDEX `checkOutDateKey` (`checkOutDateKey` ASC) VISIBLE,
  INDEX `bookingDateKey` (`bookingDateKey` ASC) VISIBLE,
  INDEX `statusKey` (`statusKey` ASC) VISIBLE,
  CONSTRAINT `factbooking_sibangi_ibfk_1`
    FOREIGN KEY (`customerKey`)
    REFERENCES `airbnb_schema`.`dimcustomer_sibangis` (`customerKey`),
  CONSTRAINT `factbooking_sibangi_ibfk_2`
    FOREIGN KEY (`hostKey`)
    REFERENCES `airbnb_schema`.`dimhost_sibangi` (`hostKey`),
  CONSTRAINT `factbooking_sibangi_ibfk_3`
    FOREIGN KEY (`stayKey`)
    REFERENCES `airbnb_schema`.`dimstay_sibangis` (`stayKey`),
  CONSTRAINT `factbooking_sibangi_ibfk_4`
    FOREIGN KEY (`experienceKey`)
    REFERENCES `airbnb_schema`.`dimexperience_sibangis` (`experienceKey`),
  CONSTRAINT `factbooking_sibangi_ibfk_5`
    FOREIGN KEY (`checkInDateKey`)
    REFERENCES `airbnb_schema`.`dimdate_sibangis` (`dateKey`),
  CONSTRAINT `factbooking_sibangi_ibfk_6`
    FOREIGN KEY (`checkOutDateKey`)
    REFERENCES `airbnb_schema`.`dimdate_sibangis` (`dateKey`),
  CONSTRAINT `factbooking_sibangi_ibfk_7`
    FOREIGN KEY (`bookingDateKey`)
    REFERENCES `airbnb_schema`.`dimdate_sibangis` (`dateKey`),
  CONSTRAINT `factbooking_sibangi_ibfk_8`
    FOREIGN KEY (`statusKey`)
    REFERENCES `airbnb_schema`.`dim_bookingstatus_sibangis` (`statusKey`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `airbnb_schema`.`factreview_sibangis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb_schema`.`factreview_sibangis` (
  `reviewKey` INT NOT NULL,
  `customerKey` INT NULL DEFAULT NULL,
  `stayKey` INT NULL DEFAULT NULL,
  `experienceKey` INT NULL DEFAULT NULL,
  `reviewDateKey` INT NULL DEFAULT NULL,
  `rating` DECIMAL(3,2) NULL DEFAULT NULL,
  `comment` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`reviewKey`),
  INDEX `customerKey` (`customerKey` ASC) VISIBLE,
  INDEX `stayKey` (`stayKey` ASC) VISIBLE,
  INDEX `experienceKey` (`experienceKey` ASC) VISIBLE,
  INDEX `reviewDateKey` (`reviewDateKey` ASC) VISIBLE,
  CONSTRAINT `factreview_sibangi_ibfk_1`
    FOREIGN KEY (`customerKey`)
    REFERENCES `airbnb_schema`.`dimcustomer_sibangis` (`customerKey`),
  CONSTRAINT `factreview_sibangi_ibfk_2`
    FOREIGN KEY (`stayKey`)
    REFERENCES `airbnb_schema`.`dimstay_sibangis` (`stayKey`),
  CONSTRAINT `factreview_sibangi_ibfk_3`
    FOREIGN KEY (`experienceKey`)
    REFERENCES `airbnb_schema`.`dimexperience_sibangis` (`experienceKey`),
  CONSTRAINT `factreview_sibangi_ibfk_4`
    FOREIGN KEY (`reviewDateKey`)
    REFERENCES `airbnb_schema`.`dimdate_sibangis` (`dateKey`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
