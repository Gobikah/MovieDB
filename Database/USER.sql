CREATE TABLE `movie`.`user` (
  `User_ID` INT NOT NULL,
  `Name` VARCHAR(75) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(65) NULL,
  `Phone` VARCHAR(16) NULL,
  PRIMARY KEY (`User_ID`));
