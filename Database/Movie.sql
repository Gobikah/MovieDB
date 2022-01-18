CREATE TABLE `movie`.`movie` (
  `Movie_ID` INT NOT NULL,
  `Title` VARCHAR(255) NULL,
  `Director` VARCHAR(100) NULL,
  `Cast` VARCHAR(1024) NULL,
  `Description` TEXT(1800) NULL,
  `Duration_min` TIME NULL,
  `ReleaseDate` DATETIME NULL,
  `Country` VARCHAR(100) NULL,
  PRIMARY KEY (`Movie_ID`));
