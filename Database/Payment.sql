CREATE TABLE `movie`.`payment` (
  `Payment_ID` INT NOT NULL,
  `Amount` DECIMAL NULL,
  `DiscountNo` INT NULL,
  `Transaction_ID` INT NULL,
  `PaymentMethod` INT NULL,
  `Reservation_ID` INT NULL,
  PRIMARY KEY (`Payment_ID`),
  UNIQUE INDEX `Transaction_ID_UNIQUE` (`Transaction_ID` ASC) VISIBLE,
  INDEX `Reservation_idx_idx` (`Reservation_ID` ASC) VISIBLE,
  CONSTRAINT `Reservation_idx`
    FOREIGN KEY (`Reservation_ID`)
    REFERENCES `movie`.`reservation` (`Reservation_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
