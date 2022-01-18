CREATE TABLE `movie`.`showseat` (
  `Showseat_ID` INT NOT NULL,
  `Price` DECIMAL(9,2) NULL,
  `TheaterSeat_ID` INT NOT NULL,
  `ShowSlot_ID` INT NOT NULL,
  `Reservation_ID` INT NOT NULL,
  PRIMARY KEY (`Showseat_ID`),
  INDEX `TheaterSeatid_idx` (`TheaterSeat_ID` ASC) VISIBLE,
  INDEX `ShowSlotidx_idx` (`ShowSlot_ID` ASC) VISIBLE,
  INDEX `ReservationIdx_idx` (`Reservation_ID` ASC) VISIBLE,
  CONSTRAINT `TheaterSeatid`
    FOREIGN KEY (`TheaterSeat_ID`)
    REFERENCES `movie`.`theater_seat` (`TheaterSeat_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ShowSlotidx`
    FOREIGN KEY (`ShowSlot_ID`)
    REFERENCES `movie`.`showslot` (`ShowSlot_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ReservationIdx`
    FOREIGN KEY (`Reservation_ID`)
    REFERENCES `movie`.`reservation` (`Reservation_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
