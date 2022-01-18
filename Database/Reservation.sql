CREATE TABLE `movie`.`reservation` (
  `Reservation_ID` INT NOT NULL,
  `TotalSeats` INT NOT NULL,
  `TimeChosen` DATETIME NOT NULL,
  `Status` INT NULL,
  `ShowSlot_ID` INT NOT NULL,
  `User_ID` INT NOT NULL,
   PRIMARY KEY (`Reservation_ID`),
  INDEX `ShowSlot_ID_idx` (`ShowSlot_ID` ASC) VISIBLE,
  INDEX `User_Id_idx` (`User_ID` ASC) VISIBLE;
  CONSTRAINT `ShowSlot_ID`
    FOREIGN KEY (`ShowSlot_ID`)
    REFERENCES `movie`.`showslot` (`ShowSlot_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
  CONSTRAINT `User_Id`
  FOREIGN KEY (`User_ID`)
  REFERENCES `movie`.`user` (`User_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
