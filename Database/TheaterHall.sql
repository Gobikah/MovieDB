CREATE TABLE `movie`.`theaterhall` (
  `TheaterHall_ID` INT NOT NULL,
  `Name` VARCHAR(75) NULL,
  `Total_Seats` INT NULL,
  `Theater_ID` INT NOT NULL,
  PRIMARY KEY (`TheaterHall_ID`),
  CONSTRAINT `Theater_ID`
    FOREIGN KEY (`TheaterHall_ID`)
    REFERENCES `movie`.`theater` (`Theater_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
