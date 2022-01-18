CREATE DATABASE  IF NOT EXISTS `movie` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `movie`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: movie
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `city` (
  `City_ID` int(11) NOT NULL,
  `Name` varchar(75) NOT NULL,
  `State` varchar(75) NOT NULL,
  `Province` varchar(45) DEFAULT NULL,
  `ZipCode` varchar(20) NOT NULL,
  `Country` varchar(75) NOT NULL,
  PRIMARY KEY (`City_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie` (
  `Movie_ID` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Director` varchar(100) DEFAULT NULL,
  `Cast` varchar(1024) DEFAULT NULL,
  `Description` text,
  `Duration_min` time DEFAULT NULL,
  `ReleaseDate` datetime DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL,
  `Amount` decimal(10,0) DEFAULT NULL,
  `DiscountNo` int(11) DEFAULT NULL,
  `Transaction_ID` int(11) DEFAULT NULL,
  `PaymentMethod` int(11) DEFAULT NULL,
  `Reservation_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Payment_ID`),
  UNIQUE KEY `Transaction_ID_UNIQUE` (`Transaction_ID`),
  KEY `Reservation_idx_idx` (`Reservation_ID`),
  CONSTRAINT `Reservation_idx` FOREIGN KEY (`Reservation_ID`) REFERENCES `reservation` (`reservation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservation` (
  `Reservation_ID` int(11) NOT NULL,
  `TotalSeats` int(11) NOT NULL,
  `TimeChosen` datetime NOT NULL,
  `Status` int(11) DEFAULT NULL,
  `ShowSlot_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  PRIMARY KEY (`Reservation_ID`),
  KEY `ShowSlot_ID_idx` (`ShowSlot_ID`),
  KEY `User_Id_idx` (`User_ID`),
  CONSTRAINT `ShowSlot_ID` FOREIGN KEY (`ShowSlot_ID`) REFERENCES `showslot` (`showslot_id`),
  CONSTRAINT `User_Id` FOREIGN KEY (`User_ID`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showseat`
--

DROP TABLE IF EXISTS `showseat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `showseat` (
  `Showseat_ID` int(11) NOT NULL,
  `Price` decimal(9,2) DEFAULT NULL,
  `TheaterSeat_ID` int(11) NOT NULL,
  `ShowSlot_ID` int(11) NOT NULL,
  `Reservation_ID` int(11) NOT NULL,
  PRIMARY KEY (`Showseat_ID`),
  KEY `TheaterSeatid_idx` (`TheaterSeat_ID`),
  KEY `ShowSlotidx_idx` (`ShowSlot_ID`),
  KEY `ReservationIdx_idx` (`Reservation_ID`),
  CONSTRAINT `ReservationIdx` FOREIGN KEY (`Reservation_ID`) REFERENCES `reservation` (`reservation_id`),
  CONSTRAINT `ShowSlotidx` FOREIGN KEY (`ShowSlot_ID`) REFERENCES `showslot` (`showslot_id`),
  CONSTRAINT `TheaterSeatid` FOREIGN KEY (`TheaterSeat_ID`) REFERENCES `theater_seat` (`theaterseat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showseat`
--

LOCK TABLES `showseat` WRITE;
/*!40000 ALTER TABLE `showseat` DISABLE KEYS */;
/*!40000 ALTER TABLE `showseat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showslot`
--

DROP TABLE IF EXISTS `showslot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `showslot` (
  `ShowSlot_ID` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `StartTime` datetime NOT NULL,
  `Movie_ID` int(11) NOT NULL,
  `TheaterHall_ID` int(11) NOT NULL,
  PRIMARY KEY (`ShowSlot_ID`),
  KEY `MovieId_idx` (`Movie_ID`),
  KEY `TheaterHallid_idx` (`TheaterHall_ID`),
  CONSTRAINT `MovieId` FOREIGN KEY (`Movie_ID`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `TheaterHallid` FOREIGN KEY (`TheaterHall_ID`) REFERENCES `theaterhall` (`theaterhall_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showslot`
--

LOCK TABLES `showslot` WRITE;
/*!40000 ALTER TABLE `showslot` DISABLE KEYS */;
/*!40000 ALTER TABLE `showslot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `theater` (
  `Theater_ID` int(11) NOT NULL,
  `Name` varchar(75) DEFAULT NULL,
  `TotalTheaterHalls` int(11) DEFAULT NULL,
  `City_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Theater_ID`),
  KEY `City_ID_idx` (`City_ID`),
  CONSTRAINT `City_ID` FOREIGN KEY (`City_ID`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater_seat`
--

DROP TABLE IF EXISTS `theater_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `theater_seat` (
  `TheaterSeat_ID` int(11) NOT NULL,
  `SeatNumber` int(11) NOT NULL,
  `TheaterHall_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TheaterSeat_ID`),
  KEY `TheaterHall_ID_idx` (`TheaterHall_ID`),
  CONSTRAINT `TheaterHall_ID` FOREIGN KEY (`TheaterHall_ID`) REFERENCES `theaterhall` (`theaterhall_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater_seat`
--

LOCK TABLES `theater_seat` WRITE;
/*!40000 ALTER TABLE `theater_seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `theater_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theaterhall`
--

DROP TABLE IF EXISTS `theaterhall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `theaterhall` (
  `TheaterHall_ID` int(11) NOT NULL,
  `Name` varchar(75) DEFAULT NULL,
  `Total_Seats` int(11) DEFAULT NULL,
  `Theater_ID` int(11) NOT NULL,
  PRIMARY KEY (`TheaterHall_ID`),
  CONSTRAINT `Theater_ID` FOREIGN KEY (`TheaterHall_ID`) REFERENCES `theater` (`theater_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theaterhall`
--

LOCK TABLES `theaterhall` WRITE;
/*!40000 ALTER TABLE `theaterhall` DISABLE KEYS */;
/*!40000 ALTER TABLE `theaterhall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL,
  `Name` varchar(75) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Email` varchar(65) DEFAULT NULL,
  `Phone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-05 18:55:55
