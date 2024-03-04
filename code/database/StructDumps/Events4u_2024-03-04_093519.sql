/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS `Belongs`;
CREATE TABLE `Belongs` (
  `event_code_belongs_PKFK` int NOT NULL,
  `category_code_belongs_PKFK` int NOT NULL,
  PRIMARY KEY (`event_code_belongs_PKFK`,`category_code_belongs_PKFK`),
  KEY `category_code_belongs_PKFK_idx` (`category_code_belongs_PKFK`),
  CONSTRAINT `category_code_belongs_PKFK` FOREIGN KEY (`category_code_belongs_PKFK`) REFERENCES `Category` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event_code_belongs_PKFK` FOREIGN KEY (`event_code_belongs_PKFK`) REFERENCES `Event` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `Category`;
CREATE TABLE `Category` (
  `code_PK` int NOT NULL AUTO_INCREMENT,
  `label` varchar(450) NOT NULL,
  PRIMARY KEY (`code_PK`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `Event`;
CREATE TABLE `Event` (
  `code_PK` int NOT NULL AUTO_INCREMENT,
  `title` varchar(450) NOT NULL,
  `startDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `endDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `owner_FK` int NOT NULL,
  `imageUrl` varchar(450) NOT NULL,
  `isVisible` tinyint NOT NULL DEFAULT '1',
  `location_FK` int NOT NULL,
  `group_view_FK` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`code_PK`),
  KEY `owner_FK_idx` (`owner_FK`),
  KEY `location_FK_idx` (`location_FK`),
  KEY `group_view_FK_idx` (`group_view_FK`),
  CONSTRAINT `group_view_FK` FOREIGN KEY (`group_view_FK`) REFERENCES `Group` (`code_PK`),
  CONSTRAINT `loaction_FK` FOREIGN KEY (`location_FK`) REFERENCES `Location` (`code_PK`),
  CONSTRAINT `owner_FK` FOREIGN KEY (`owner_FK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `Favorite`;
CREATE TABLE `Favorite` (
  `user_code_favorite_PKFK` int NOT NULL,
  `event_code_favorite_PKFK` int NOT NULL,
  PRIMARY KEY (`user_code_favorite_PKFK`,`event_code_favorite_PKFK`),
  KEY `event_code_favorite_PKFK_idx` (`event_code_favorite_PKFK`),
  CONSTRAINT `event_code_favorite_PKFK` FOREIGN KEY (`event_code_favorite_PKFK`) REFERENCES `Event` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_code_favorite_PKFK` FOREIGN KEY (`user_code_favorite_PKFK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
  `code_PK` int NOT NULL AUTO_INCREMENT,
  `name` varchar(450) NOT NULL,
  `owner_FK` int NOT NULL,
  PRIMARY KEY (`code_PK`),
  KEY `owner_group_FK_idx` (`owner_FK`),
  CONSTRAINT `owner_group_FK` FOREIGN KEY (`owner_FK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `Location`;
CREATE TABLE `Location` (
  `code_PK` int NOT NULL AUTO_INCREMENT,
  `adress` varchar(450) NOT NULL,
  PRIMARY KEY (`code_PK`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `PartOf`;
CREATE TABLE `PartOf` (
  `code_group_partOf_PKFK` int NOT NULL,
  `code_user_partOf_PKFK` int NOT NULL,
  PRIMARY KEY (`code_group_partOf_PKFK`,`code_user_partOf_PKFK`),
  KEY `code_user_partOf_PKFK_idx` (`code_user_partOf_PKFK`),
  CONSTRAINT `code_group_partOf_PKFK` FOREIGN KEY (`code_group_partOf_PKFK`) REFERENCES `Group` (`code_PK`),
  CONSTRAINT `code_user_partOf_PKFK` FOREIGN KEY (`code_user_partOf_PKFK`) REFERENCES `User` (`code_PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `Review`;
CREATE TABLE `Review` (
  `code_PK` int NOT NULL AUTO_INCREMENT,
  `stars` int NOT NULL DEFAULT '1',
  `review` text NOT NULL,
  `user_code_review_FK` int NOT NULL,
  `event_code_describes_FK` int NOT NULL,
  `creationDate` date NOT NULL,
  PRIMARY KEY (`code_PK`),
  KEY `event_code_describes_FK_idx` (`event_code_describes_FK`),
  KEY `user_code_review_FK_idx` (`user_code_review_FK`),
  CONSTRAINT `event_code_describes_FK` FOREIGN KEY (`event_code_describes_FK`) REFERENCES `Event` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_code_review_FK` FOREIGN KEY (`user_code_review_FK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `code_PK` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(450) NOT NULL,
  `lastName` varchar(450) NOT NULL,
  `email` varchar(450) NOT NULL,
  `phone` varchar(450) NOT NULL,
  `isAdmin` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`code_PK`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `View`;
CREATE TABLE `View` (
  `code_group_view_PKFK` int NOT NULL,
  `code_event_view_PKFK` int NOT NULL,
  PRIMARY KEY (`code_group_view_PKFK`,`code_event_view_PKFK`),
  KEY `code_event_view_PKFK_idx` (`code_event_view_PKFK`),
  CONSTRAINT `code_event_view_PKFK` FOREIGN KEY (`code_event_view_PKFK`) REFERENCES `Event` (`code_PK`),
  CONSTRAINT `code_group_view_PKFK` FOREIGN KEY (`code_group_view_PKFK`) REFERENCES `Group` (`code_PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;