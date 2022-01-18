CREATE TABLE `movie`.`showslot` (
  `ShowSlot_ID` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `StartTime` DATETIME NOT NULL,
  `Movie_ID` INT NOT NULL,
  `TheaterHall_ID` INT NOT NULL,
  PRIMARY KEY (`ShowSlot_ID`),
  INDEX `MovieId_idx` (`Movie_ID` ASC) VISIBLE,
  INDEX `TheaterHallid_idx` (`TheaterHall_ID` ASC) VISIBLE,
  CONSTRAINT `MovieId`
    FOREIGN KEY (`Movie_ID`)
    REFERENCES `movie`.`movie` (`Movie_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TheaterHallid`
    FOREIGN KEY (`TheaterHall_ID`)
    REFERENCES `movie`.`theaterhall` (`TheaterHall_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
