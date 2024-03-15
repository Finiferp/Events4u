/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS `Attends`;
CREATE TABLE `Attends` (
  `event_code_attends_PKFK` int NOT NULL,
  `user_code_attends_PKFK` int NOT NULL,
  PRIMARY KEY (`event_code_attends_PKFK`,`user_code_attends_PKFK`),
  KEY `user_code_interested_PKFK_idx` (`user_code_attends_PKFK`),
  KEY `event_code_attends_PKFK_idx` (`event_code_attends_PKFK`),
  CONSTRAINT `event_code_attends_PKFK` FOREIGN KEY (`event_code_attends_PKFK`) REFERENCES `Event` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_code_attends_PKFK` FOREIGN KEY (`user_code_attends_PKFK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  CONSTRAINT `group_view_FK` FOREIGN KEY (`group_view_FK`) REFERENCES `Group` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loaction_FK` FOREIGN KEY (`location_FK`) REFERENCES `Location` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `owner_FK` FOREIGN KEY (`owner_FK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

DROP TABLE IF EXISTS `Interested`;
CREATE TABLE `Interested` (
  `event_code_interested_PKFK` int NOT NULL,
  `user_code_interested_PKFK` int NOT NULL,
  PRIMARY KEY (`event_code_interested_PKFK`,`user_code_interested_PKFK`),
  KEY `user_code_interested_PKFK_idx` (`user_code_interested_PKFK`),
  KEY `event_code_interested_PKFK_idx` (`event_code_interested_PKFK`),
  CONSTRAINT `event_code_interested_PKFK` FOREIGN KEY (`event_code_interested_PKFK`) REFERENCES `Event` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_code_interested_PKFK` FOREIGN KEY (`user_code_interested_PKFK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  CONSTRAINT `code_group_partOf_PKFK` FOREIGN KEY (`code_group_partOf_PKFK`) REFERENCES `Group` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `code_user_partOf_PKFK` FOREIGN KEY (`code_user_partOf_PKFK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
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

DROP TABLE IF EXISTS `Token`;
CREATE TABLE `Token` (
  `code_PK` int NOT NULL AUTO_INCREMENT,
  `type` varchar(450) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_FK` int NOT NULL,
  PRIMARY KEY (`code_PK`),
  KEY `user_FK_idx` (`user_FK`),
  CONSTRAINT `user_FK` FOREIGN KEY (`user_FK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `code_PK` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(450) NOT NULL,
  `lastName` varchar(450) NOT NULL,
  `email` varchar(450) NOT NULL,
  `isAdmin` tinyint NOT NULL DEFAULT '0',
  `salt` varchar(450) DEFAULT NULL,
  `password` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`code_PK`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Attends`(event_code_attends_PKFK,user_code_attends_PKFK) VALUES('2','2');

INSERT INTO `Belongs`(event_code_belongs_PKFK,category_code_belongs_PKFK) VALUES('2','7'),('10','7'),('11','7'),('2','8'),('8','8'),('10','8'),('11','8'),('3','9'),('6','9'),('8','9'),('6','11');

INSERT INTO `Category`(code_PK,label) VALUES('7','\'Business\''),('8','\'Concert\''),('9','\'Exhibition\''),('10','\'Mettup\''),('11','\'Party & Nightlife\''),('12','\'Sport\''),('13','\'Other \'');

INSERT INTO `Event`(code_PK,title,startDateTime,endDateTime,price,created,owner_FK,imageUrl,isVisible,location_FK,group_view_FK) VALUES('2','\'Updated Event\'','\'2024-03-08 08:00:00\'','\'2024-02-26 12:00:00\'','25','\'2024-02-21 07:09:58\'','7','\'assets/images/dow.jpg\'','1','1','1'),('3','\'Group Test\'','\'2024-02-26 08:00:00\'','\'2024-02-26 12:00:00\'','12','\'2024-02-21 07:09:58\'','7','\'assets/images/dow.jpg\'','1','1','3'),('4','\'Audit Test\'','\'2024-02-26 09:00:00\'','\'2024-02-26 13:00:00\'','12','\'2024-02-21 07:09:58\'','7','\'assets/images/dow.jpg\'','1','1','1'),('6','\'gamescon\'','\'2024-02-25 21:00:00\'','\'2024-02-26 01:00:00\'','12','\'2024-03-09 07:09:58\'','7','\'assets/images/dow.jpg\'','1','1','1'),('7','\'simple event\'','\'2024-03-08 09:00:00\'','\'2024-02-26 13:00:00\'','12','\'2024-03-09 07:08:58\'','7','\'assets/images/dow.jpg\'','1','1','1'),('8','\'gamescon\'','\'2024-02-01 02:41:00\'','\'2024-02-08 10:41:00\'','54','\'2024-02-26 15:33:09\'','7','\'http://192.168.129.237:3000/assets/images/gamescon/1709108744312-gamescon.png\'','1','1','1'),('10','\'Updated Event copied\'','\'2024-03-08 08:00:00\'','\'2024-02-26 12:00:00\'','25','\'2024-03-06 07:26:28\'','7','\'http://192.168.129.237:3000/assets/images/Updated Event/1709709988477-Updated Event.png\'','1','1','1'),('11','\'Cpoied Event\'','\'2024-02-26 08:00:00\'','\'2024-02-26 12:00:00\'','25','\'2024-03-06 07:26:42\'','2','\'http://192.168.129.237:3000/assets/images/Cpoied Event/1709710003071-Cpoied Event.png\'','1','1','1');

INSERT INTO `Favorite`(user_code_favorite_PKFK,event_code_favorite_PKFK) VALUES('1','2'),('7','2'),('7','4');

INSERT INTO `Group`(code_PK,name,owner_FK) VALUES('1','\'All\'','2'),('2','\'Informatics\'','7'),('3','\'BTSi\'','7');

INSERT INTO `Interested`(event_code_interested_PKFK,user_code_interested_PKFK) VALUES('11','7');

INSERT INTO `Location`(code_PK,adress) VALUES('1','\'2 rue René Hartmann, 3425 Dudelange\''),('2','\'123 Main St\''),('3','\'26 Rue Pierre Dupong, 3449 Dudelange\''),('5','\'55 Rue Stade John F. Kennedy, 3502 Dudelange\'');

INSERT INTO `PartOf`(code_group_partOf_PKFK,code_user_partOf_PKFK) VALUES('1','1'),('3','2');

INSERT INTO `Review`(code_PK,stars,review,user_code_review_FK,event_code_describes_FK,creationDate) VALUES('1','3','X\'74657374\'','7','2','\'2024-02-29\''),('2','1','X\'7764\'','1','2','\'2024-02-29\'');

INSERT INTO `Token`(code_PK,type,created,user_FK) VALUES('17','\'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRhbmllbC1iYXRpc3RhMjJAaG90bWFpbC5jb20iLCJ1c2VySUQiOjcsImV4cCI6MTcxMDI3MTg0MiwiaWF0IjoxNzEwMjI4NjQyfQ.VGa3sXTR7fi9mPgG0AWfzIYlzaaSgednkbqzVCfXk3o\'','\'2024-03-12 07:30:42\'','7'),('19','\'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRhbmllbC1iYXRpc3RhMjJAaG90bWFpbC5jb20iLCJ1c2VySUQiOjcsImV4cCI6MTcxMDM1NjE3MywiaWF0IjoxNzEwMzEyOTczfQ.tRtWZvrTrEEZSkWi1pPw6Tec7ulxsNcGk_5KbM60db0\'','\'2024-03-13 06:56:13\'','7'),('22','\'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRhbmllbC1iYXRpc3RhMjJAaG90bWFpbC5jb20iLCJ1c2VySUQiOjcsImV4cCI6MTcxMDQ0MTQ1MywiaWF0IjoxNzEwMzk4MjUzfQ.q0ip1Zo4v_7dkTvPlCBxnJelW2TrAKNp3kU97fLht5E\'','\'2024-03-14 06:37:33\'','7');
INSERT INTO `User`(code_PK,firstName,lastName,email,isAdmin,salt,password) VALUES('1','\'Daniel\'','\'Batista\'','\'docda940@school.lu1\'','1','NULL','NULL'),('2','\'Ultra\'','\'Admin\'','\'docda940@school.lu2\'','1','NULL','NULL'),('3','\'Finiferp\'','\'B\'','\'docda940@school.lu3\'','0','NULL','NULL'),('4','\'John\'','\'Doe\'','\'docda940@school.lu4\'','0','NULL','NULL'),('5','\'Finiferp\'','\'Batista\'','\'docda940@school.lu\'','0','\'061da78552938e656c26bcb056d0a4b7d5659e95f235d6741f7a2efc6b8ed279\'','\'e17570d3af539ccab84ea3fa063886314bc27eb4f848b1c8e6be1529fae870b49d37809f7dc1fec5ed21da482a41e6baebca84ca72c5a8b551cc32336a3a1e69c436b64a3075f547ee69845ca221e0a619350dc988ee85a17dfd33e3c3a25251549adf1faabe0effc95cfffb354a4ff41af55108e588c6acaec7a3d68bc96dca\''),('7','\'Daniel\'','\'Do Canto Batista\'','\'daniel-batista22@hotmail.com\'','1','\'a8ccfbf23b153a7bede417c4ce0181777bb4a4197143edb63b1a34b173ac85ac\'','\'4de8d79c042ed2d5960d8dd305c8f140106801e46dcf1ab2599776b9e50fb11553c1c490e8352ed7f699c107127e4a6ae06a2fdad3c617049cb3cf36d6c01f86c8c62c08031571c791a203bf53599ae00bfa36f303627348caac8b9c3ca9790d3f1506d82c6408f933915e3e2bb5296405c440ca7f7b17e0abb730f1d3dc1b49\'');DROP PROCEDURE IF EXISTS sp_login;
CREATE PROCEDURE `sp_login`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_email VARCHAR(450);
    DECLARE input_password VARCHAR(450);
    DECLARE input_token VARCHAR(450);
    DECLARE stored_password VARCHAR(450);
    DECLARE stored_userID INT;
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "email": {"type": "string"},
                                    "password": {"type": "string"},
                                    "token": {"type": "string"}
                                },
                                "required": ["email", "password"]
                            }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_email = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.email'));
        SET input_password = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.password'));
        SET input_token = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.token'));
        IF NOT EXISTS (SELECT 1 FROM User WHERE email = input_email) THEN
            SET response_code = 404;
            SET response_message = 'User not found';
        ELSE
            SELECT code_PK, password INTO stored_userID, stored_password FROM User WHERE email = input_email;
            IF input_password = stored_password THEN
                INSERT INTO Token (type, user_FK) VALUES (input_token, stored_userID);
                SET response_code = 200;
                SET response_message = 'Login successful';
            ELSE
                SET response_code = 401;
                SET response_message = 'Wrong password';
            END IF;
        END IF;
    END IF;
    IF response_code = 200 THEN
        SET outputJSON = JSON_OBJECT(
                                'status_code', response_code,
                                'message', response_message,
                                'user', JSON_OBJECT(
                                    'userID', stored_userID,
                                    'email', input_email
                                ),
                                'token_out', input_token
                            );
    ELSE
        SET outputJSON = JSON_OBJECT('status_code', response_code,
                                    'message', response_message);
    END IF;
END;

DROP PROCEDURE IF EXISTS sp_register;
CREATE PROCEDURE `sp_register`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(450);
    DECLARE input_firstName VARCHAR(450);
    DECLARE input_lastName VARCHAR(450);
    DECLARE input_email VARCHAR(450);
    DECLARE input_salt VARCHAR(450);
    DECLARE input_password VARCHAR(450);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "firstName": {"type": "string"},
                                    "lastName": {"type": "string"},
                                    "email": {"type": "string"},
                                    "salt": {"type": "string"},
                                    "password": {"type": "string"}
                                },
                                "required": ["firstName", "lastName", "email", "salt", "password"]
                            }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_firstName = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.firstName'));
        SET input_lastName = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.lastName'));
        SET input_email = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.email'));
        SET input_salt = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.salt'));
        SET input_password = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.password'));
        IF input_firstName = '' OR input_lastName = '' OR input_email = '' OR input_salt = '' OR input_password = '' THEN
            SET response_code = 400;
            SET response_message = 'Invalid input';
        ELSE
            SET response_code = 200;
            SET response_message = 'OK';
            INSERT INTO User (firstName, lastName, email, salt, password)
            VALUES (input_firstName, input_lastName, input_email, input_salt, input_password);
        END IF;
    END IF;
    SET outputJSON = JSON_OBJECT('status_code', response_code,
                                'message', response_message);
END;