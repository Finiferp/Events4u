/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS `BelongsAudit`;
CREATE TABLE `BelongsAudit` (
  `idBelongsAudit` int NOT NULL AUTO_INCREMENT,
  `event_code_belongs_PKFK` int NOT NULL,
  `category_code_belongs_PKFK` int NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idBelongsAudit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `CategoryAudit`;
CREATE TABLE `CategoryAudit` (
  `idCategoryAudit` int NOT NULL AUTO_INCREMENT,
  `code_PK` int NOT NULL,
  `label` varchar(450) NOT NULL,
  `date_Audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idCategoryAudit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `EventAudit`;
CREATE TABLE `EventAudit` (
  `idEventAudit` int NOT NULL AUTO_INCREMENT,
  `code_PK` int NOT NULL,
  `title` varchar(450) NOT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime NOT NULL,
  `price` int NOT NULL,
  `created` datetime NOT NULL,
  `owner_FK` int NOT NULL,
  `imageURL` varchar(450) NOT NULL,
  `isVisible` tinyint NOT NULL,
  `location_FK` int NOT NULL,
  `group_view_FK` int NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idEventAudit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `FavoriteAudit`;
CREATE TABLE `FavoriteAudit` (
  `idFavoriteAudit` int NOT NULL AUTO_INCREMENT,
  `user_code_favorite_PKFK` int NOT NULL,
  `event_code_favorite_PKFK` int NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idFavoriteAudit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `GroupAudit`;
CREATE TABLE `GroupAudit` (
  `idGroupAudit` int NOT NULL AUTO_INCREMENT,
  `code_PK` int NOT NULL,
  `name` varchar(450) NOT NULL,
  `owner_FK` int NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idGroupAudit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `LocationAudit`;
CREATE TABLE `LocationAudit` (
  `idLocationAudit` int NOT NULL AUTO_INCREMENT,
  `code_PK` int NOT NULL,
  `adress` varchar(450) NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idLocationAudit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `PartOfAudit`;
CREATE TABLE `PartOfAudit` (
  `idPartOfAudit` int NOT NULL AUTO_INCREMENT,
  `code_group_partOf_PKFK` int NOT NULL,
  `code_user_partOf_PKFK` int NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idPartOfAudit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `ReviewAudit`;
CREATE TABLE `ReviewAudit` (
  `idReviewAudit` int NOT NULL AUTO_INCREMENT,
  `code_PK` int NOT NULL,
  `stars` int NOT NULL,
  `review` text NOT NULL,
  `user_code_review_FK` int NOT NULL,
  `event_code_describes_FK` int NOT NULL,
  `creationDate` date NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idReviewAudit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `UserAudit`;
CREATE TABLE `UserAudit` (
  `idUserAudit` int NOT NULL AUTO_INCREMENT,
  `code_PK` int NOT NULL,
  `firstName` varchar(450) NOT NULL,
  `lastName` varchar(450) NOT NULL,
  `email` varchar(450) NOT NULL,
  `phone` varchar(450) NOT NULL,
  `isAdmin` tinyint NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idUserAudit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `ViewAudit`;
CREATE TABLE `ViewAudit` (
  `idViewAudit` int NOT NULL AUTO_INCREMENT,
  `code_group_view_PKFK` int NOT NULL,
  `code_event_view_PKFK` int NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idViewAudit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;