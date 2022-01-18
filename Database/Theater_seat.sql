CREATE TABLE `movie`.`theater_seat` (
  `TheaterSeat_ID` INT NOT NULL,
  `SeatNumber` INT NOT NULL,
  `TheaterHall_ID` INT NULL,
  PRIMARY KEY (`TheaterSeat_ID`),
  INDEX `TheaterHall_ID_idx` (`TheaterHall_ID` ASC) VISIBLE,
  CONSTRAINT `TheaterHall_ID`
    FOREIGN KEY (`TheaterHall_ID`)
    REFERENCES `movie`.`theaterhall` (`TheaterHall_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
