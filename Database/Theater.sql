CREATE TABLE `movie`.`theater` (
  `Theater_ID` INT NOT NULL,
  `Name` VARCHAR(75) NULL,
  `TotalTheaterHalls` INT NULL,
  `City_ID` INT NULL,
  PRIMARY KEY (`Theater_ID`),
  INDEX `City_ID_idx` (`City_ID` ASC) VISIBLE,
  CONSTRAINT `City_ID`
    FOREIGN KEY (`City_ID`)
    REFERENCES `movie`.`city` (`City_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
