-- ------------------------------------------------------
-- CPSC 471: Group 37 Project - TV & MOVIE Streaming Service Lookup Database 
-- -- This database script includes: 
-- ---- CREATE TABLE statements (15) 
-- ---- STORED PROCEDURES 
-- ------------------------------------------------------

DROP DATABASE IF EXISTS `cpsc471_project_db`;
CREATE DATABASE `cpsc471_project_db`; 
USE `cpsc471_project_db`;

-- ------------------------- CREATING DATABASE TABLES -----------------------------

--
-- Table structure for table `account`
--
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `Email` varchar(50) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`Email`),
  CONSTRAINT `account_chk_1` CHECK ((length(`Password`) > 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `account`
--
INSERT INTO `account` VALUES ('anisha.williams@email.com','anisha.williams','password'),('dennis.scott@email.com','dennis.scott','qwerty'),('jonathan.smith@email.com','jonathan.smith','asdfgh'),('michael.miller@email.com','michael.miller','123456'),('nolan.deutsch@ucalgary.ca','nolan.deutsch','123456'),('nolandeutsch@gmail.com','ndeutsch','123456'),('sam.santiago@email.com','sam.santiago','zxcvbn'),('tiffany.tang@ucalgary.ca','tiffany.tang','123123');

--
-- Table structure for table `admin`
--
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `Email` varchar(50) NOT NULL,
  `Username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Admin_role` varchar(3) NOT NULL DEFAULT 'yes',
  `Profile_pic` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--
INSERT INTO `admin` VALUES ('nolan.deutsch@ucalgary.ca','nolan.deutsch','yes','https://upload.wikimedia.org/wikipedia/en/thumb/f/fb/UofCCoat.svg/1200px-UofCCoat.svg.png'),('joshua.diwa1@ucalgary.ca','joshua.diwa','yes','https://upload.wikimedia.org/wikipedia/en/thumb/f/fb/UofCCoat.svg/1200px-UofCCoat.svg.png'),('tiffany.tang@ucalgary.ca','tiffany.tang','yes','https://upload.wikimedia.org/wikipedia/en/thumb/f/fb/UofCCoat.svg/1200px-UofCCoat.svg.png');

--
-- Table structure for table `crew`
--
DROP TABLE IF EXISTS `crew`;
CREATE TABLE `crew` (
  `Cid` varchar(36) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Image` varchar(300) NOT NULL,
  `Hometown` varchar(45) NOT NULL,
  PRIMARY KEY (`Cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `crew`
--
INSERT INTO `crew` VALUES ('595b30e2-93a0-11eb-a502-00ff9885c460','Orlando Bloom','Male','http://www.gstatic.com/tv/thumb/persons/288723/288723_v9_bc.jpg','Canterbury, Kent'),('595d7ec6-93a0-11eb-a502-00ff9885c460','Viggo Mortensen','Male','http://www.gstatic.com/tv/thumb/persons/71706/71706_v9_bb.jpg','New York City'),('6e31c1e0-93a0-11eb-a502-00ff9885c460','Robert Downey Jr','Male','http://www.gstatic.com/tv/thumb/persons/67369/67369_v9_bb.jpg','Manhattan, New York City'),('6e338d37-93a0-11eb-a502-00ff9885c460','Chris Evans','Male','http://www.gstatic.com/tv/thumb/persons/173489/173489_v9_ba.jpg','Boston, Massachusetts'),('6e358622-93a0-11eb-a502-00ff9885c460','Jennifer Aniston','Female','http://www.gstatic.com/tv/thumb/persons/30905/30905_v9_bc.jpg','Sherman Oaks, California'),('6e38250f-93a0-11eb-a502-00ff9885c460','Leighton Meester','Female','http://www.gstatic.com/tv/thumb/persons/238590/238590_v9_bc.jpg','Fort Worth'),('b4f02ab6-9e72-11eb-bff6-00ff9885c460','Andy Serkis','Male','http://www.gstatic.com/tv/thumb/persons/85991/85991_v9_bb.jpg','Ruislip, London'),('b4f17f75-9e72-11eb-bff6-00ff9885c460','Billy Boyd','Male','http://www.gstatic.com/tv/thumb/persons/249412/249412_v9_ba.jpg','Glasgow, Scotland'),('b4f182c3-9e72-11eb-bff6-00ff9885c460','Dominic Monaghan','Male','http://www.gstatic.com/tv/thumb/persons/188867/188867_v9_bc.jpg','Berlin'),('b4f18473-9e72-11eb-bff6-00ff9885c460','Liv Tyler','Female','http://www.gstatic.com/tv/thumb/persons/39912/39912_v9_bc.jpg','New York City, New York'),('b4f18684-9e72-11eb-bff6-00ff9885c460','Cate Blanchett','Female','http://www.gstatic.com/tv/thumb/persons/70375/70375_v9_bc.jpg','Melbourne, Victoria'),('b4f18a60-9e72-11eb-bff6-00ff9885c460','John Rhys-Davies','Male','http://www.gstatic.com/tv/thumb/persons/67941/67941_v9_ba.jpg','Ammanford, Wales'),('b4f18d74-9e72-11eb-bff6-00ff9885c460','Sean Astin','Male','http://www.gstatic.com/tv/thumb/persons/79912/79912_v9_bb.jpg','Santa Monica, California'),('b4f24dd3-9e72-11eb-bff6-00ff9885c460','Sean Bean','Male','http://www.gstatic.com/tv/thumb/persons/58316/58316_v9_bc.jpg','Sheffield, South Yorkshire, England'),('b4f2a6ee-9e72-11eb-bff6-00ff9885c460','Sala Baker','Male','http://www.gstatic.com/tv/thumb/persons/698874/698874_v9_ba.jpg','Wellington, New Zealand'),('b4f2ac6a-9e72-11eb-bff6-00ff9885c460','Stan Lee','Male','https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/stan-lee-arrives-at-the-premiere-of-disney-and-marvels-news-photo-950501274-1542049801.jpg','New York City, New York'),('b4f2aebd-9e72-11eb-bff6-00ff9885c460','Scarlett Johansson','Female','http://www.gstatic.com/tv/thumb/persons/69369/69369_v9_bc.jpg','Manhattan, New York City, New York'),('b4f2b14a-9e72-11eb-bff6-00ff9885c460','Chris Hemsworth','Male','http://www.gstatic.com/tv/thumb/persons/528854/528854_v9_bb.jpg','Melbourne, Victoria'),('b4f2b341-9e72-11eb-bff6-00ff9885c460','Mark Ruffalo','Male','http://www.gstatic.com/tv/thumb/persons/43389/43389_v9_bc.jpg','Kenosha, Wisconsin'),('b4f2b5f5-9e72-11eb-bff6-00ff9885c460','Samuel L. Jackson','Male','http://www.gstatic.com/tv/thumb/persons/71048/71048_v9_ba.jpg','Washington, District of Columbia'),('b4f2b952-9e72-11eb-bff6-00ff9885c460','Jeremy Renner','Male','http://www.gstatic.com/tv/thumb/persons/31106/31106_v9_bb.jpg','Modesto, California'),('b4f2baf8-9e72-11eb-bff6-00ff9885c460','Elizabeth Olsen','Female','http://www.gstatic.com/tv/thumb/persons/620481/620481_v9_bb.jpg','Sherman Oaks, California'),('b4f2bd05-9e72-11eb-bff6-00ff9885c460','Paul Bettany','Male','http://www.gstatic.com/tv/thumb/persons/149859/149859_v9_bc.jpg','Harlesden, London, England'),('b4f2bfca-9e72-11eb-bff6-00ff9885c460','Anthony Mackie','Male','http://www.gstatic.com/tv/thumb/persons/308495/308495_v9_bb.jpg','New Orleans, Louisiana'),('b4f2c3a6-9e72-11eb-bff6-00ff9885c460','Tom Holland','Male','http://www.gstatic.com/tv/thumb/persons/733885/733885_v9_bb.jpg','Kingston upon Thames, England'),('b4f2eef4-9e72-11eb-bff6-00ff9885c460','Jon Favreau','Male','http://www.gstatic.com/tv/thumb/persons/71093/71093_v9_bb.jpg','Queens, New York City, New York'),('b4f2f1bb-9e72-11eb-bff6-00ff9885c460','Daniel Radcliffe','Male','http://www.gstatic.com/tv/thumb/persons/233401/233401_v9_bd.jpg','Fulham, London, England'),('b4f2fe21-9e72-11eb-bff6-00ff9885c460','Emma Watson','Female','http://www.gstatic.com/tv/thumb/persons/247026/247026_v9_bb.jpg','Paris'),('b4f30115-9e72-11eb-bff6-00ff9885c460','Rupert Grint','Male','http://www.gstatic.com/tv/thumb/persons/247025/247025_v9_bc.jpg','Stevenage, Hertfordshire, England'),('b4f30295-9e72-11eb-bff6-00ff9885c460','Tom Felton','Male','http://www.gstatic.com/tv/thumb/persons/171726/171726_v9_bb.jpg','Epsom, Surrey, England'),('b4f30383-9e72-11eb-bff6-00ff9885c460','Alan Rickman','Male','http://www.gstatic.com/tv/thumb/persons/2894/2894_v9_ba.jpg','Hammersmith, London, England'),('b4f30456-9e72-11eb-bff6-00ff9885c460','Bonnie Wright','Female','http://www.gstatic.com/tv/thumb/persons/265108/265108_v9_ba.jpg','London, England'),('b4f30533-9e72-11eb-bff6-00ff9885c460','Matthew Lewis','Male','http://www.gstatic.com/tv/thumb/persons/230095/230095_v9_bb.jpg','Leeds, West Yorkshire, England'),('b4f3066f-9e72-11eb-bff6-00ff9885c460','Robbie Coltrane','Male','http://www.gstatic.com/tv/thumb/persons/71006/71006_v9_ba.jpg','Rutherglen, Scotland'),('b4f3b955-9e72-11eb-bff6-00ff9885c460','Maggie Smith','Female','http://www.gstatic.com/tv/thumb/persons/41544/41544_v9_ba.jpg','Ilford, Essex, England'),('b4f3be61-9e72-11eb-bff6-00ff9885c460','Richard Harris','Male','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHIy9dzk_32D2Vp7gB7NwWkgnZHMkNfsDcdQ&usqp=CAU','Limerick, Ireland'),('b4f3bfd0-9e72-11eb-bff6-00ff9885c460','Michael Gambon','Male','http://www.gstatic.com/tv/thumb/persons/71763/71763_v9_bb.jpg','Cabra, Dublin'),('b4f3c0e9-9e72-11eb-bff6-00ff9885c460','Kaley Cuoco','Female','http://www.gstatic.com/tv/thumb/persons/169721/169721_v9_bc.jpg','Camarillo, California'),('b4f3c259-9e72-11eb-bff6-00ff9885c460','Jim Parsons','Male','http://www.gstatic.com/tv/thumb/persons/314170/314170_v9_bb.jpg','Houston, Texas'),('b4f3c333-9e72-11eb-bff6-00ff9885c460','Johnny Galecki','Male','http://www.gstatic.com/tv/thumb/persons/33631/33631_v9_bb.jpg','Bree, Flanders'),('b4f3c3fa-9e72-11eb-bff6-00ff9885c460','Mayim Bialik','Female','http://www.gstatic.com/tv/thumb/persons/155/155_v9_bb.jpg','San Diego, California'),('b4f3c4cb-9e72-11eb-bff6-00ff9885c460','Melissa Rauch','Female','http://www.gstatic.com/tv/thumb/persons/530748/530748_v9_bc.jpg','Marlboro, New Jersey'),('b4f3c58e-9e72-11eb-bff6-00ff9885c460','Kunal Nayyar','Male','http://www.gstatic.com/tv/thumb/persons/508075/508075_v9_ba.jpg','London, England'),('b4f3c65e-9e72-11eb-bff6-00ff9885c460','Simon Helberg','Male','http://www.gstatic.com/tv/thumb/persons/220961/220961_v9_ba.jpg','Los Angeles, California'),('b4f3c729-9e72-11eb-bff6-00ff9885c460','Kevin Sussman','Male','http://www.gstatic.com/tv/thumb/persons/308458/308458_v9_bb.jpg','Staten Island, New York City, New York'),('b4f3c87b-9e72-11eb-bff6-00ff9885c460','John Ross Bowie','Male','http://www.gstatic.com/tv/thumb/persons/260209/260209_v9_bb.jpg','New York City, New York'),('b4f3c945-9e72-11eb-bff6-00ff9885c460','Christine Baranski','Female','http://www.gstatic.com/tv/thumb/persons/71247/71247_v9_bc.jpg','Buffalo, New York'),('b4f3cd4c-9e72-11eb-bff6-00ff9885c460','Courteney Cox','Female','http://www.gstatic.com/tv/thumb/persons/13912/13912_v9_ba.jpg','Birmingham, Alabama'),('b4f4671e-9e72-11eb-bff6-00ff9885c460','Matthew Perry','Male','http://www.gstatic.com/tv/thumb/persons/44418/44418_v9_bb.jpg','Williamstown, Massachusetts'),('b4f46c49-9e72-11eb-bff6-00ff9885c460','Lisa Kudrow','Female','http://www.gstatic.com/tv/thumb/persons/67988/67988_v9_bb.jpg','Encino, Los Angeles, California'),('b4f46e88-9e72-11eb-bff6-00ff9885c460','David Schwimmer','Male','http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcQT_7SzWfoQ_8sGohXiBrmoguXZJgUxW1pbOgOz4Su_lo3NeoyPujecCF8xLehD','Astoria, New York'),('b4f4707a-9e72-11eb-bff6-00ff9885c460','Matt LeBlanc','Male','http://www.gstatic.com/tv/thumb/persons/44345/44345_v9_bb.jpg','Newton, Massachusetts'),('b4f47232-9e72-11eb-bff6-00ff9885c460','James Michael Tyler','Male','http://www.gstatic.com/tv/thumb/persons/433625/433625_v9_ba.jpg','Winona, Mississippi'),('b4f474b5-9e72-11eb-bff6-00ff9885c460','Maggie Wheeler','Female','http://www.gstatic.com/tv/thumb/persons/71370/71370_v9_bb.jpg','New York City, New York'),('b4f476f6-9e72-11eb-bff6-00ff9885c460','Paul Rudd','Male','http://www.gstatic.com/tv/thumb/persons/50640/50640_v9_bb.jpg','Passaic, New Jersey'),('b4f47957-9e72-11eb-bff6-00ff9885c460','Tom Kenny','Male','http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcRwlVdhsQpFhP40i5p05z4arqDqJx1KogUXUYlauour8YLR4hqIHkJUSG1D60fH','East Syracuse, New York'),('b4f47b35-9e72-11eb-bff6-00ff9885c460','Bill Fagerbakke','Male','http://t2.gstatic.com/licensed-image?q=tbn:ANd9GcTebaFN_cjI0p_JRKFAwnvqF1MhVoouUSLP6Ja84IZsCFV3QHrb-mJNFTVmuEfL','Fontana, California'),('b4f47d34-9e72-11eb-bff6-00ff9885c460','Clancy Brown','Male','http://www.gstatic.com/tv/thumb/persons/82031/82031_v9_bb.jpg','Urbana, Ohio'),('b4f47f1f-9e72-11eb-bff6-00ff9885c460','Rodger Bumpass','Male','https://static.tvtropes.org/pmwiki/pub/images/rb.jpg','Jonesboro, Arkansas'),('b4f48105-9e72-11eb-bff6-00ff9885c460','Carolyn Lawrence','Female','http://www.gstatic.com/tv/thumb/persons/248312/248312_v9_bb.jpg','Baltimore, Maryland'),('b4f482b8-9e72-11eb-bff6-00ff9885c460','Mr. Lawrence','Male','http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcTDmDndGdJeKQvKe2sazj6JvNGXYUG_fDTAN_98DJmWRnirofKHdLB_5VqSrB-n','East Brunswick, New Jersey'),('b4f49956-9e72-11eb-bff6-00ff9885c460','Jill Talley','Female','http://www.gstatic.com/tv/thumb/persons/221414/221414_v9_ba.jpg','Chicago, Illinois'),('b4f49d91-9e72-11eb-bff6-00ff9885c460','Mary Jo Catlett','Female','http://www.gstatic.com/tv/thumb/persons/223748/223748_v9_ba.jpg','Denver, Colorado'),('b4f4a00e-9e72-11eb-bff6-00ff9885c460','Lori Alan','Female','http://www.gstatic.com/tv/thumb/persons/228870/228870_v9_ba.jpg','Potomac, Maryland'),('b4f4a50e-9e72-11eb-bff6-00ff9885c460','Dee Bradley Baker','Male','http://www.gstatic.com/tv/thumb/persons/162424/162424_v9_bc.jpg','Bloomington, Indiana'),('d068adc4-939f-11eb-a502-00ff9885c460','Ian McKellen','Male','http://www.gstatic.com/tv/thumb/persons/71249/71249_v9_bb.jpg','Burnley, Lancashire'),('dc6ad6d3-939f-11eb-a502-00ff9885c460','Elijah Wood','Male','http://www.gstatic.com/tv/thumb/persons/19046/19046_v9_bb.jpg','Cedar Rapids, Iowa');

--
-- Table structure for table `favourites`
--
DROP TABLE IF EXISTS `favourites`;
CREATE TABLE `favourites` (
  `Email` varchar(50) NOT NULL,
  `Uid` varchar(36) DEFAULT NULL,
  `Cid` varchar(36) DEFAULT NULL,
  `Name` varchar(70) NOT NULL,
  PRIMARY KEY (`Email`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `favourites`
--
INSERT INTO `favourites` VALUES ('anisha.williams@email.com',NULL,'b4f3cd4c-9e72-11eb-bff6-00ff9885c460','Courteney Cox'),('anisha.williams@email.com',NULL,'b4f46e88-9e72-11eb-bff6-00ff9885c460','David Schwimmer'),('anisha.williams@email.com','1f3cd877-93ca-11eb-a502-00ff9885c460',NULL,'Friends'),('anisha.williams@email.com','1f3cd961-93ca-11eb-a502-00ff9885c460',NULL,'Gossip Girl'),('anisha.williams@email.com',NULL,'6e358622-93a0-11eb-a502-00ff9885c460','Jennifer Aniston'),('anisha.williams@email.com',NULL,'6e38250f-93a0-11eb-a502-00ff9885c460','Leighton Meester'),('dennis.scott@email.com','270d1129-9e70-11eb-bff6-00ff9885c460',NULL,'Arthur'),('dennis.scott@email.com','1f3cd355-93ca-11eb-a502-00ff9885c460',NULL,'Avengers: Endgame'),('dennis.scott@email.com',NULL,'6e338d37-93a0-11eb-a502-00ff9885c460','Chris Evans'),('dennis.scott@email.com',NULL,'d068adc4-939f-11eb-a502-00ff9885c460','Ian McKellen'),('dennis.scott@email.com',NULL,'6e31c1e0-93a0-11eb-a502-00ff9885c460','Robert Downey Jr'),('dennis.scott@email.com',NULL,'b4f2ac6a-9e72-11eb-bff6-00ff9885c460','Stan Lee'),('dennis.scott@email.com','270d09fe-9e70-11eb-bff6-00ff9885c460',NULL,'The Simpsons'),('jonathan.smith@email.com','1f3cd5cd-93ca-11eb-a502-00ff9885c460',NULL,'Adventure Time'),('jonathan.smith@email.com','1f3cda28-93ca-11eb-a502-00ff9885c460',NULL,'Phineas and Ferb'),('jonathan.smith@email.com','1f3cdad1-93ca-11eb-a502-00ff9885c460',NULL,'SpongeBob SquarePants'),('michael.miller@email.com','1f3cd5cd-93ca-11eb-a502-00ff9885c460',NULL,'Adventure Time'),('michael.miller@email.com','270ca3f9-9e70-11eb-bff6-00ff9885c460',NULL,'Avengers: Age of Ultron'),('michael.miller@email.com','1f3cd355-93ca-11eb-a502-00ff9885c460',NULL,'Avengers: Endgame'),('michael.miller@email.com','270ca757-9e70-11eb-bff6-00ff9885c460',NULL,'Avengers: Infinity War'),('michael.miller@email.com',NULL,'6e338d37-93a0-11eb-a502-00ff9885c460','Chris Evans'),('michael.miller@email.com',NULL,'b4f2b14a-9e72-11eb-bff6-00ff9885c460','Chris Hemsworth'),('michael.miller@email.com','270d04da-9e70-11eb-bff6-00ff9885c460',NULL,'Game of Thrones'),('michael.miller@email.com',NULL,'b4f2b341-9e72-11eb-bff6-00ff9885c460','Mark Ruffalo'),('michael.miller@email.com','1f3cda28-93ca-11eb-a502-00ff9885c460',NULL,'Phineas and Ferb'),('michael.miller@email.com',NULL,'6e31c1e0-93a0-11eb-a502-00ff9885c460','Robert Downey Jr'),('michael.miller@email.com',NULL,'b4f2b5f5-9e72-11eb-bff6-00ff9885c460','Samuel L. Jackson'),('michael.miller@email.com','1f3cdad1-93ca-11eb-a502-00ff9885c460',NULL,'SpongeBob SquarePants'),('michael.miller@email.com',NULL,'b4f2ac6a-9e72-11eb-bff6-00ff9885c460','Stan Lee'),('michael.miller@email.com','270c3efa-9e70-11eb-bff6-00ff9885c460',NULL,'The Avengers'),('michael.miller@email.com','270d0c53-9e70-11eb-bff6-00ff9885c460',NULL,'The Big Bang Theory'),('michael.miller@email.com',NULL,'b4f47957-9e72-11eb-bff6-00ff9885c460','Tom Kenny'),('sam.santiago@email.com','270d1129-9e70-11eb-bff6-00ff9885c460',NULL,'Arthur'),('sam.santiago@email.com','1f3cd355-93ca-11eb-a502-00ff9885c460',NULL,'Avengers: Endgame'),('sam.santiago@email.com','270ca757-9e70-11eb-bff6-00ff9885c460',NULL,'Avengers: Infinity War'),('sam.santiago@email.com',NULL,'6e338d37-93a0-11eb-a502-00ff9885c460','Chris Evans'),('sam.santiago@email.com',NULL,'b4f2b14a-9e72-11eb-bff6-00ff9885c460','Chris Hemsworth'),('sam.santiago@email.com',NULL,'d068adc4-939f-11eb-a502-00ff9885c460','Ian McKellen'),('sam.santiago@email.com',NULL,'595b30e2-93a0-11eb-a502-00ff9885c460','Orlando Bloom'),('sam.santiago@email.com',NULL,'6e31c1e0-93a0-11eb-a502-00ff9885c460','Robert Downey Jr'),('sam.santiago@email.com',NULL,'b4f2aebd-9e72-11eb-bff6-00ff9885c460','Scarlett Johansson'),('sam.santiago@email.com',NULL,'b4f2ac6a-9e72-11eb-bff6-00ff9885c460','Stan Lee'),('sam.santiago@email.com','1f3caffd-93ca-11eb-a502-00ff9885c460',NULL,'The Lord of the Rings: The Fellowship of the Ring'),('sam.santiago@email.com','1f3ccf51-93ca-11eb-a502-00ff9885c460',NULL,'The Lord of the Rings: The Return of the King'),('sam.santiago@email.com','1f3ccc8a-93ca-11eb-a502-00ff9885c460',NULL,'The Lord of the Rings: The Two Towers'),('sam.santiago@email.com',NULL,'595d7ec6-93a0-11eb-a502-00ff9885c460','Viggo Mortensen');

DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `favourites_BEFORE_INSERT` BEFORE INSERT ON `favourites` FOR EACH ROW BEGIN
	IF (NEW.Cid = '') THEN 
		SET NEW.Name = (SELECT p.Name FROM program AS p WHERE p.Uid=NEW.Uid);
        SET NEW.Cid = null; 
    ELSEIF (NEW.Uid = '') THEN
		SET NEW.Name = (SELECT c.Name FROM crew AS c WHERE c.Cid=NEW.Cid);
        SET NEW.Uid = null; 
	END IF; 
END */;;
DELIMITER ;

--
-- Table structure for table `list_of_services`
--
DROP TABLE IF EXISTS `list_of_services`;
CREATE TABLE `list_of_services` (
  `Sid` varchar(36) NOT NULL,
  `Service_name` varchar(50) NOT NULL,
  PRIMARY KEY (`Sid`,`Service_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `list_of_services`
--
INSERT INTO `list_of_services` VALUES ('9a056be9-9e70-11eb-bff6-00ff9885c460','Illico'),('9a07046f-9e70-11eb-bff6-00ff9885c460','Microsoft Store'),('aac58fbd-93a2-11eb-a502-00ff9885c460','Netflix'),('aac5b4a1-93a2-11eb-a502-00ff9885c460','Amazon Prime Video'),('aac5b687-93a2-11eb-a502-00ff9885c460','Disney+'),('aac5b731-93a2-11eb-a502-00ff9885c460','Apple TV+'),('aac5b7ad-93a2-11eb-a502-00ff9885c460','Cineplex'),('aac5ba07-93a2-11eb-a502-00ff9885c460','Google Play'),('dd114ab6-93d9-11eb-a502-00ff9885c460','YouTube');

--
-- Table structure for table `list_of_user_services`
--
DROP TABLE IF EXISTS `list_of_user_services`;
CREATE TABLE `list_of_user_services` (
  `Email` varchar(50) NOT NULL,
  `Service_name` varchar(50) NOT NULL,
  PRIMARY KEY (`Email`,`Service_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `list_of_user_services`
--
INSERT INTO `list_of_user_services` VALUES ('anisha.williams@email.com','Apple TV+'),('anisha.williams@email.com','Cineplex'),('dennis.scott@email.com','Amazon Prime Video'),('dennis.scott@email.com','Disney+'),('dennis.scott@email.com','Google Play'),('dennis.scott@email.com','Microsoft Store'),('jonathan.smith@email.com','Apple TV+'),('jonathan.smith@email.com','Disney+'),('jonathan.smith@email.com','Google Play'),('michael.miller@email.com','Amazon Prime Video'),('michael.miller@email.com','Apple TV+'),('michael.miller@email.com','Disney+'),('michael.miller@email.com','Google Play'),('michael.miller@email.com','Netflix'),('michael.miller@email.com','YouTube'),('sam.santiago@email.com','Amazon Prime Video'),('sam.santiago@email.com','Apple TV+'),('sam.santiago@email.com','Cineplex'),('sam.santiago@email.com','Disney+'),('sam.santiago@email.com','Google Play'),('sam.santiago@email.com','Netflix');

--
-- Table structure for table `list_of_users`
--
DROP TABLE IF EXISTS `list_of_users`;
CREATE TABLE `list_of_users` (
  `Email` varchar(50) NOT NULL,
  `User_id` varchar(36) NOT NULL,
  PRIMARY KEY (`Email`,`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `list_of_users`
--
INSERT INTO `list_of_users` VALUES ('anisha.williams@email.com','807b72b5-9ea2-11eb-bff6-00ff9885c460'),('dennis.scott@email.com','807cbdeb-9ea2-11eb-bff6-00ff9885c460'),('jonathan.smith@email.com','807cc02b-9ea2-11eb-bff6-00ff9885c460'),('michael.miller@email.com','807cc083-9ea2-11eb-bff6-00ff9885c460'),('nolandeutsch@gmail.com','807cc0cb-9ea2-11eb-bff6-00ff9885c460'),('sam.santiago@email.com','807cc113-9ea2-11eb-bff6-00ff9885c460');

--
-- Table structure for table `program`
--
DROP TABLE IF EXISTS `program`;
CREATE TABLE `program` (
  `Uid` varchar(36) NOT NULL,
  `Name` varchar(70) NOT NULL,
  `Type` varchar(7) NOT NULL,
  `Image` varchar(300) NOT NULL,
  `Service_name` varchar(50) NOT NULL,
  PRIMARY KEY (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `program`
--
INSERT INTO `program` VALUES ('1f3caffd-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Fellowship of the Ring','Movie','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT9J7XACn3tlD6v4UXRMvT2wJN8FGCCPeh8U3RkZ6__tR4wGhSo','Apple TV+'),('1f3ccc8a-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Two Towers','Movie','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR6nJbgIc4VDmwLzaMo8CLOYiPkpgd5Bdm8EpL9hna4XZggrlit','Google Play'),('1f3ccf51-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Return of the King','Movie','https://upload.wikimedia.org/wikipedia/en/b/be/The_Lord_of_the_Rings_-_The_Return_of_the_King_%282003%29.jpg','Apple TV+'),('1f3cd13c-93ca-11eb-a502-00ff9885c460','The Hobbit: The Desolation of Smaug','Movie','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT8e9aFTxDo5jCIaaDNYgNcjJ4JFIz8MVlJr3-nhggVytaoFLOu','Amazon Prime Video'),('1f3cd355-93ca-11eb-a502-00ff9885c460','Avengers: Endgame','Movie','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSzYzZ8fnuDOmDN2dmhVFHoPwTZozfcjtlvsf3zdjzfgduLR0jy','Disney+'),('1f3cd5cd-93ca-11eb-a502-00ff9885c460','Adventure Time','TV Show','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDh1BrFLCYBpDe622TlZ2qzP4KCJmquflMec2AOfh_ke9kxPpB','Google Play'),('1f3cd877-93ca-11eb-a502-00ff9885c460','Friends','TV Show','https://m.media-amazon.com/images/M/MV5BNDVkYjU0MzctMWRmZi00NTkxLTgwZWEtOWVhYjZlYjllYmU4XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_UY1200_CR93,0,630,1200_AL_.jpg','Apple TV+'),('1f3cd961-93ca-11eb-a502-00ff9885c460','Gossip Girl','TV Show','https://www.blakespectrum.org/wp-content/uploads/2020/05/unnamed.png','YouTube'),('1f3cda28-93ca-11eb-a502-00ff9885c460','Phineas and Ferb','TV Show','https://m.media-amazon.com/images/M/MV5BMTc1NjcxNzg4MF5BMl5BanBnXkFtZTgwOTMzNzgyMDE@._V1_.jpg','Disney+'),('1f3cdad1-93ca-11eb-a502-00ff9885c460','SpongeBob SquarePants','TV Show','https://img.reelgood.com/content/show/2a3749d1-4ff9-4be8-a706-1048804a6e64/poster-780.jpg','Google Play'),('270c3efa-9e70-11eb-bff6-00ff9885c460','The Avengers','Movie','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTp0qlAoWcOOswIkL_qpjYzJqCCDmWXiBzCXiqbE43Obo8c0Z-s','Netflix'),('270ca3f9-9e70-11eb-bff6-00ff9885c460','Avengers: Age of Ultron','Movie','http://www.movienewsletters.net/photos/183976R1.jpg','Netflix'),('270ca757-9e70-11eb-bff6-00ff9885c460','Avengers: Infinity War','Movie','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmE2vwxy5KaCu7cRuYYdgNdQKddux5OYgGwsPo0kqP_xzLnsDV','Disney+'),('270ca9a5-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Philosopher\'s Stone','Movie','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_9nrOnN8sYfZZHJ06EIBSoEO5qjx7uHHEs6VtKNplGVuGhZuC','YouTube'),('270cabc0-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Chamber of Secrets','Movie','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTltzcooPkGcy1fKKqzSuO8U6S9XBpNDR9MuYc9SS_L5AbAn66O','YouTube'),('270cad5a-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Prisoner of Azkaban','Movie','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSkFf3MN_oao6q3gysHpVfJA2lICz2ckgXE2VoKRWEGk0huoKnQ','YouTube'),('270d04da-9e70-11eb-bff6-00ff9885c460','Game of Thrones','TV Show','https://cdn.europosters.eu/image/750/posters/game-of-thrones-throne-of-the-dead-i73402.jpg','Illico'),('270d09fe-9e70-11eb-bff6-00ff9885c460','The Simpsons','TV Show','https://m.media-amazon.com/images/M/MV5BYjFkMTlkYWUtZWFhNy00M2FmLThiOTYtYTRiYjVlZWYxNmJkXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_.jpg','Disney+'),('270d0c53-9e70-11eb-bff6-00ff9885c460','The Big Bang Theory','TV Show','https://i.pinimg.com/originals/23/82/72/238272081b493b783d2cab0a70f97192.jpg','Microsoft Store'),('270d0dfd-9e70-11eb-bff6-00ff9885c460','The Office','TV Show','https://m.media-amazon.com/images/M/MV5BMDNkOTE4NDQtMTNmYi00MWE0LWE4ZTktYTc0NzhhNWIzNzJiXkEyXkFqcGdeQXVyMzQ2MDI5NjU@._V1_.jpg','Google Play'),('270d0f8b-9e70-11eb-bff6-00ff9885c460','We Bare Bears','TV Show','https://i.pinimg.com/originals/d9/27/5d/d9275d9a07f9a43e7b93095f7dafbfa6.jpg','Google Play'),('270d1129-9e70-11eb-bff6-00ff9885c460','Arthur','TV Show','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSotyG477gnl_xuU8RFTbpvys1E2ptod6gYXEzSZLbG69Eu8OiB','Amazon Prime Video'),('396f2a44-9e7a-11eb-bff6-00ff9885c460','Into the Beat','Movie','https://m.media-amazon.com/images/M/MV5BZDUwMjRhYTctY2QwNS00MGYyLWE0OWQtYWZmMzY0MTM0ZmViXkEyXkFqcGdeQXVyMDU5MDEyMA@@._V1_.jpg','Netflix'),('927c494b-9ea1-11eb-bff6-00ff9885c460','Green Zone','Movie','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRRW4RGAqnhGU7iKN2mPczb_NpzHDLMY8wdk_5BBC_X2ImByZ9-','Netflix'),('927cd9ef-9ea1-11eb-bff6-00ff9885c460','Madagascar 3: Europe’s Most Wanted (2012)','Movie','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSNcaF0aosPieM3u3uiifEONefEmTnkkyDn4AFEEhB_hRuPyyKX','Netflix'),('927cde50-9ea1-11eb-bff6-00ff9885c460','Your Highness (2011)','Movie','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSd9p75PEmaXNhpzYiRXYn2qy3kXVx4b8BcUXl-O-uGklFUEnxE','Netflix'),('927ce0bf-9ea1-11eb-bff6-00ff9885c460','Jurassic World Camp Cretaceous','TV Show','https://m.media-amazon.com/images/M/MV5BYTlmOWM4YzUtNDE5Yy00ZmI3LTkzOTQtMGNlMjNkMDM5MDk3XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg','Netflix');

--
-- Table structure for table `program_details`
--
DROP TABLE IF EXISTS `program_details`;
CREATE TABLE `program_details` (
  `Uid` varchar(36) NOT NULL,
  `User_rating` float(3,1) NOT NULL,
  `Age_rating` varchar(15) NOT NULL,
  `No_of_seasons` int DEFAULT NULL,
  `Year` int NOT NULL,
  `Genre` varchar(45) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Run_time` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `program_details`
--
INSERT INTO `program_details` VALUES ('1f3caffd-93ca-11eb-a502-00ff9885c460',8.8,'14A',NULL,2001,'Fantasy, Drama, Action, Adventure','A young hobbit, Frodo, who has found the One Ring that belongs to the Dark Lord Sauron, begins his journey with eight companions to Mount Doom, the only place where it can be destroyed.','2h59min'),('1f3ccc8a-93ca-11eb-a502-00ff9885c460',8.7,'PG-13',NULL,2002,'Fantasy, Adventure','Frodo and Sam arrive in Mordor with the help of Gollum. A number of new allies join their former companions to defend Isengard as Saruman launches an assault from his domain.','3h 43min'),('1f3ccf51-93ca-11eb-a502-00ff9885c460',8.9,'PG-13',NULL,2003,'Fantasy, Adventure','The former Fellowship members prepare for the final battle. While Frodo and Sam approach Mount Doom to destroy the One Ring, they follow Gollum, unaware of the path he is leading them to.','4h 11min'),('1f3cd13c-93ca-11eb-a502-00ff9885c460',7.8,'PG-13',NULL,2013,'Fantasy, Adventure','Bilbo Baggins, a hobbit, and his companions face great dangers on their journey to Laketown. Soon, they reach the Lonely Mountain, where Bilbo comes face-to-face with the fearsome dragon Smaug.','3h 7min'),('1f3cd355-93ca-11eb-a502-00ff9885c460',8.4,'PG-13',NULL,2019,'Action, Sci-fi','After Thanos, an intergalactic warlord, disintegrates half of the universe, the Avengers must reunite and assemble again to reinvigorate their trounced allies and restore balance.','3h 2min'),('1f3cd5cd-93ca-11eb-a502-00ff9885c460',8.6,'C8',10,2010,'Adventure','Living in the post-apocalyptic land of Ooo, Finn, a 14-year-old boy, and his magical dog, Jake, embark on a series of missions to prove themselves as virtuous adventurers.',NULL),('1f3cd877-93ca-11eb-a502-00ff9885c460',8.9,'G',10,1994,'Sitcom','Follow the lives of six reckless adults living in Manhattan, as they indulge in adventures which make their lives both troublesome and happening.','13min'),('1f3cd961-93ca-11eb-a502-00ff9885c460',7.4,'G',6,2007,'Drama','Follow the lives of six reckless adults living in Manhattan, as they indulge in adventures which make their lives both troublesome and happening.','42min'),('1f3cda28-93ca-11eb-a502-00ff9885c460',8.0,'G',4,2007,'Comedy','Phineas and Ferb embark on various adventures during their summer vacation, while trying to keep their sister from interfering with their plans.','19min'),('1f3cdad1-93ca-11eb-a502-00ff9885c460',8.2,'G',13,1999,'Comedy','A yellow sea sponge named SpongeBob SquarePants, who enjoys being a cook at Krusty Krab, lives in the Pacific Ocean. He embarks on various adventures with his friends at Bikini Bottom.','18min'),('270c3efa-9e70-11eb-bff6-00ff9885c460',8.0,'PG-13',NULL,2012,'Adventure, Action','Nick Fury is compelled to launch the Avengers Initiative when Loki poses a threat to planet Earth. His squad of superheroes put their minds together to accomplish the task.','2h 24min'),('270ca3f9-9e70-11eb-bff6-00ff9885c460',7.3,'PG-13',NULL,2015,'Action, Adventure','Tony Stark builds an artificial intelligence system named Ultron with the help of Bruce Banner. When the sentient Ultron makes plans to wipe out the human race, the Avengers set out to stop him.','2h 22min'),('270ca757-9e70-11eb-bff6-00ff9885c460',8.4,'PG-13',NULL,2018,'Action, Sci-fi','The Avengers must stop Thanos, an intergalactic warlord, from getting his hands on all the infinity stones. However, Thanos is prepared to go to any lengths to carry out his insane plan.','2h 40min'),('270ca9a5-9e70-11eb-bff6-00ff9885c460',7.6,'PG',NULL,2001,'Fantasy, Family','Harry Potter, an eleven-year-old orphan, discovers that he is a wizard and is invited to study at Hogwarts. Even as he escapes a dreary life and enters a world of magic, he finds trouble awaiting him.','2h 39min'),('270cabc0-9e70-11eb-bff6-00ff9885c460',7.4,'PG',NULL,2002,'Fantasy, Adventure','A house-elf warns Harry against returning to Hogwarts, but he decides to ignore it. When students and creatures at the school begin to get petrified, Harry finds himself surrounded in mystery.','2h 54min'),('270cad5a-9e70-11eb-bff6-00ff9885c460',7.9,'PG',NULL,2004,'Fantasy, Adventure','Harry, Ron and Hermoine return to Hogwarts just as they learn about Sirius Black and his plans to kill Harry. However, when Harry runs into him, he learns that the truth is far from reality.','2h 22min'),('270d04da-9e70-11eb-bff6-00ff9885c460',9.3,'18+',8,2001,'Drama','Nine noble families wage war against each other in order to gain control over the mythical land of Westeros. Meanwhile, a force is rising after millenniums and threatens the existence of living men.',NULL),('270d09fe-9e70-11eb-bff6-00ff9885c460',8.6,'14+',32,1989,'Sitcom','Working-class father Homer Simpson and his dysfunctional family deal with comical situations and the ups-and-downs of life in the town of Springfield.',NULL),('270d0c53-9e70-11eb-bff6-00ff9885c460',8.1,'PG',12,2007,'Sitcom, Comedy','The lives of four socially awkward friends, Leonard, Sheldon, Howard and Raj, take a wild turn when they meet the beautiful and free-spirited Penny.',NULL),('270d0dfd-9e70-11eb-bff6-00ff9885c460',8.9,'14+',9,2005,'Comedy, Sitcom','The Office is an American mockumentary sitcom television series that depicts the everyday work lives of office employees in the Scranton, Pennsylvania, branch of the fictional Dunder Mifflin Paper Company',NULL),('270d0f8b-9e70-11eb-bff6-00ff9885c460',7.9,'PG',4,2015,'Kids & Family, Comedy, Animation, Fantasy','Three bears, Grizzly, Panda and Ice, go on a series of adventures and struggle to find their place amongst the humans of the San Francisco Bay Area.',NULL),('270d1129-9e70-11eb-bff6-00ff9885c460',7.3,'C',24,1996,'Animation, Comedy, Drama, Kids & Family','Bespectacled aardvark Arthur Read demonstrates to kids how to deal with such childhood traumas and challenges as homework, teachers and bullies. He also has to contend with his sisters, but loves playing with his friends: tomboy Francine, foodie and best pal Buster, supersmart Brain, rich girl Muffy and geography expert Sue Ellen.',NULL);

--
-- Table structure for table `reviews`
--
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews` (
  `Uid` varchar(36) NOT NULL,
  `Author` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Rating` int NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Uid`,`Author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reviews`
--
INSERT INTO `reviews` VALUES ('1f3caffd-93ca-11eb-a502-00ff9885c460','anisha.williams','2021-04-16',3,'Kind of interesting but still not that great. '),('1f3caffd-93ca-11eb-a502-00ff9885c460','jonathan.smith','2021-04-16',4,'Good Movie. '),('1f3caffd-93ca-11eb-a502-00ff9885c460','michael.miller','2021-04-16',4,'Cool Movie!'),('1f3caffd-93ca-11eb-a502-00ff9885c460','sam.santiago','2021-04-16',5,'Off to a great start. Love this already. Cannot wait to watch the rest of the trilogy. '),('1f3ccc8a-93ca-11eb-a502-00ff9885c460','jonathan.smith','2021-04-16',4,'Good Movie.'),('1f3ccc8a-93ca-11eb-a502-00ff9885c460','michael.miller','2021-04-16',4,'Interesting movie. Love all the scenes and the action. '),('1f3ccc8a-93ca-11eb-a502-00ff9885c460','sam.santiago','2021-04-16',4,'Did not disappoint. Can\'t wait until the third one!'),('1f3ccf51-93ca-11eb-a502-00ff9885c460','anisha.williams','2021-04-16',2,'A little too intense for me. Not what I was looking for. '),('1f3ccf51-93ca-11eb-a502-00ff9885c460','jonathan.smith','2021-04-16',4,'Good Movie. '),('1f3ccf51-93ca-11eb-a502-00ff9885c460','michael.miller','2021-04-16',4,'MY PRECIOUSSSSS!!! Love Gollum in this!'),('1f3ccf51-93ca-11eb-a502-00ff9885c460','sam.santiago','2021-04-16',5,'Great way to end this. Absolutely love it. '),('1f3cd13c-93ca-11eb-a502-00ff9885c460','dennis.scott','2021-04-16',4,'Cool Movie!'),('1f3cd355-93ca-11eb-a502-00ff9885c460','dennis.scott','2021-04-16',5,'NOOOOO!!!!!!! IRON MAN!!!!!!'),('1f3cd355-93ca-11eb-a502-00ff9885c460','jonathan.smith','2021-04-16',3,'Too Intense.'),('1f3cd355-93ca-11eb-a502-00ff9885c460','michael.miller','2021-04-16',5,'Epic and Awesome!'),('1f3cd355-93ca-11eb-a502-00ff9885c460','sam.santiago','2021-04-16',5,'Intensity and epic to the MAXXXXX!!!!!'),('1f3cd877-93ca-11eb-a502-00ff9885c460','anisha.williams','2021-04-16',5,'Best show ever!!'),('1f3cd877-93ca-11eb-a502-00ff9885c460','sam.santiago','2021-04-16',0,'This is dumb. Did not enjoy it at all. '),('1f3cd961-93ca-11eb-a502-00ff9885c460','anisha.williams','2021-04-16',4,'Glad its on. Love Blair!'),('1f3cdad1-93ca-11eb-a502-00ff9885c460','dennis.scott','2021-04-16',5,'SQUIDWARD!!!!!!!!'),('1f3cdad1-93ca-11eb-a502-00ff9885c460','michael.miller','2021-04-16',4,'Didn\'t think I would like this, but this was actually quite a good show. '),('1f3cdad1-93ca-11eb-a502-00ff9885c460','sam.santiago','2021-04-16',0,'Why did I even bother with this. Was a waste of my time. '),('270c3efa-9e70-11eb-bff6-00ff9885c460','michael.miller','2021-04-16',5,'This is how it all starts. Cannot wait for the rest!'),('270ca3f9-9e70-11eb-bff6-00ff9885c460','michael.miller','2021-04-16',5,'Continuation of an awesome journey. Love the crew and the action. '),('270ca757-9e70-11eb-bff6-00ff9885c460','dennis.scott','2021-04-16',5,'PLEASE DON\'T DIEEEE!!!'),('270ca757-9e70-11eb-bff6-00ff9885c460','jonathan.smith','2021-04-16',3,'Too intense'),('270ca757-9e70-11eb-bff6-00ff9885c460','michael.miller','2021-04-16',5,'Love the movie. Has maximum suspense and the epic action scenes. Cannot wait for the last one!'),('270ca757-9e70-11eb-bff6-00ff9885c460','sam.santiago','2021-04-16',5,'Love this! Awesome movie!'),('270ca9a5-9e70-11eb-bff6-00ff9885c460','anisha.williams','2021-04-16',3,'Not great but not bad. '),('270ca9a5-9e70-11eb-bff6-00ff9885c460','michael.miller','2021-04-16',4,'Good review'),('270cabc0-9e70-11eb-bff6-00ff9885c460','anisha.williams','2021-04-16',3,'Quite interesting. Better than the first one. '),('270cad5a-9e70-11eb-bff6-00ff9885c460','anisha.williams','2021-04-16',1,'Confused from the start. Had not idea what was going on. '),('270cad5a-9e70-11eb-bff6-00ff9885c460','michael.miller','2021-04-16',2,'Not my type. I did not get it at all. '),('270d0c53-9e70-11eb-bff6-00ff9885c460','dennis.scott','2021-04-16',5,'Absolutely love this show. So many good memories!'),('270d0c53-9e70-11eb-bff6-00ff9885c460','michael.miller','2021-04-16',5,'Love this show! So effortlessly funny and relaxing to watch. '),('270d1129-9e70-11eb-bff6-00ff9885c460','dennis.scott','2021-04-16',5,'Brings back the good old memories. Best show ever!');

--
-- Table structure for table `role`
--
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `Cid` varchar(36) NOT NULL,
  `Crew_role` varchar(45) NOT NULL,
  PRIMARY KEY (`Cid`,`Crew_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--
INSERT INTO `role` VALUES ('595b30e2-93a0-11eb-a502-00ff9885c460','Actor'),('595b30e2-93a0-11eb-a502-00ff9885c460','Producer'),('595d7ec6-93a0-11eb-a502-00ff9885c460','Actor'),('595d7ec6-93a0-11eb-a502-00ff9885c460','Producer'),('6e31c1e0-93a0-11eb-a502-00ff9885c460','Actor'),('6e31c1e0-93a0-11eb-a502-00ff9885c460','Producer'),('6e338d37-93a0-11eb-a502-00ff9885c460','Actor'),('6e338d37-93a0-11eb-a502-00ff9885c460','Producer'),('6e358622-93a0-11eb-a502-00ff9885c460','Actress'),('6e358622-93a0-11eb-a502-00ff9885c460','Producer'),('6e38250f-93a0-11eb-a502-00ff9885c460','Actress'),('b4f02ab6-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f02ab6-9e72-11eb-bff6-00ff9885c460','Director'),('b4f02ab6-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f17f75-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f182c3-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f182c3-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f18473-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f18473-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f18684-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f18684-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f18a60-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f18a60-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f18d74-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f18d74-9e72-11eb-bff6-00ff9885c460','Director'),('b4f18d74-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f24dd3-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f24dd3-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f2ac6a-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f2ac6a-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f2ac6a-9e72-11eb-bff6-00ff9885c460','Writer'),('b4f2aebd-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f2aebd-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f2b341-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f2b341-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f2b5f5-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f2b5f5-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f2b952-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f2b952-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f2bd05-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f2bd05-9e72-11eb-bff6-00ff9885c460','Director'),('b4f2bfca-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f2bfca-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f2c3a6-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f2c3a6-9e72-11eb-bff6-00ff9885c460','Director'),('b4f2c3a6-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f2eef4-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f2eef4-9e72-11eb-bff6-00ff9885c460','Director'),('b4f2eef4-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f2f1bb-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f2fe21-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f30115-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f30295-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f30383-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f30383-9e72-11eb-bff6-00ff9885c460','Director'),('b4f30456-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f30456-9e72-11eb-bff6-00ff9885c460','Director'),('b4f30533-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f3066f-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f3066f-9e72-11eb-bff6-00ff9885c460','Writer'),('b4f3b955-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f3be61-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f3bfd0-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f3c0e9-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f3c0e9-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f3c259-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f3c259-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f3c333-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f3c3fa-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f3c4cb-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f3c58e-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f3c65e-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f3c65e-9e72-11eb-bff6-00ff9885c460','Comedian'),('b4f3c729-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f3c87b-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f3c945-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f3cd4c-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f3cd4c-9e72-11eb-bff6-00ff9885c460','Director'),('b4f3cd4c-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f4671e-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f4671e-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f4671e-9e72-11eb-bff6-00ff9885c460','Writer'),('b4f46c49-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f46c49-9e72-11eb-bff6-00ff9885c460','Comedian'),('b4f46c49-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f46c49-9e72-11eb-bff6-00ff9885c460','Writer'),('b4f46e88-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f46e88-9e72-11eb-bff6-00ff9885c460','Comedian'),('b4f46e88-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f46e88-9e72-11eb-bff6-00ff9885c460','Writer'),('b4f4707a-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f4707a-9e72-11eb-bff6-00ff9885c460','Comedian'),('b4f47232-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f474b5-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f476f6-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f476f6-9e72-11eb-bff6-00ff9885c460','Producer'),('b4f476f6-9e72-11eb-bff6-00ff9885c460','Screenwriter'),('b4f47957-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f47957-9e72-11eb-bff6-00ff9885c460','Comedian'),('b4f47b35-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f47d34-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f47f1f-9e72-11eb-bff6-00ff9885c460','Actor'),('b4f48105-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f482b8-9e72-11eb-bff6-00ff9885c460','Voice Actor'),('b4f49956-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f49d91-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f4a00e-9e72-11eb-bff6-00ff9885c460','Actress'),('b4f4a50e-9e72-11eb-bff6-00ff9885c460','Voice Actor'),('d068adc4-939f-11eb-a502-00ff9885c460','Actor'),('d068adc4-939f-11eb-a502-00ff9885c460','Writer'),('dc6ad6d3-939f-11eb-a502-00ff9885c460','Actor'),('dc6ad6d3-939f-11eb-a502-00ff9885c460','Producer');

--
-- Table structure for table `streaming_schedule`
--
DROP TABLE IF EXISTS `streaming_schedule`;
CREATE TABLE `streaming_schedule` (
  `Uid` varchar(36) NOT NULL,
  `Arrival_month` varchar(9) NOT NULL,
  `Arrival_day` int NOT NULL,
  `Arrival_year` int NOT NULL,
  `Departure_month` varchar(9) DEFAULT NULL,
  `Departure_day` int DEFAULT NULL,
  `Departure_year` int DEFAULT NULL,
  `Status` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `streaming_schedule`
--
INSERT INTO `streaming_schedule` VALUES ('1f3caffd-93ca-11eb-a502-00ff9885c460','December',1,2018,'December ',31,2023,NULL),('1f3ccc8a-93ca-11eb-a502-00ff9885c460','December',1,2018,'December ',31,2023,NULL),('1f3ccf51-93ca-11eb-a502-00ff9885c460','December',1,2018,'December ',31,2023,NULL),('1f3cd13c-93ca-11eb-a502-00ff9885c460','December',1,2018,'December ',31,2023,NULL),('1f3cd355-93ca-11eb-a502-00ff9885c460','December',1,2018,'December ',31,2023,NULL),('1f3cd5cd-93ca-11eb-a502-00ff9885c460','December',1,2018,'December ',31,2023,NULL),('1f3cd877-93ca-11eb-a502-00ff9885c460','December',1,2018,'December ',31,2023,NULL),('1f3cd961-93ca-11eb-a502-00ff9885c460','December',1,2018,'December ',31,2023,NULL),('1f3cda28-93ca-11eb-a502-00ff9885c460','December',1,2018,'December ',31,2023,NULL),('1f3cdad1-93ca-11eb-a502-00ff9885c460','December',1,2018,'December ',31,2023,NULL),('270c3efa-9e70-11eb-bff6-00ff9885c460','June',23,2013,'May',17,2021,'Leaving'),('270ca3f9-9e70-11eb-bff6-00ff9885c460','September',4,2015,'Decemeber',31,2023,NULL),('270ca757-9e70-11eb-bff6-00ff9885c460','November',18,2019,'Decemeber',31,2023,NULL),('270ca9a5-9e70-11eb-bff6-00ff9885c460','May',27,2012,'May',17,2021,'Leaving'),('270cabc0-9e70-11eb-bff6-00ff9885c460','May',27,2012,'May',17,2021,'Leaving'),('270cad5a-9e70-11eb-bff6-00ff9885c460','May',27,2012,'May',17,2021,'Leaving'),('270d04da-9e70-11eb-bff6-00ff9885c460','March',9,2015,'Decemeber',31,2023,NULL),('270d09fe-9e70-11eb-bff6-00ff9885c460','February',22,2011,'Decemeber',31,2023,NULL),('270d0c53-9e70-11eb-bff6-00ff9885c460','July',3,2012,'May',17,2021,'Leaving'),('270d0dfd-9e70-11eb-bff6-00ff9885c460','August',16,2017,'Decemeber',31,2023,NULL),('270d0f8b-9e70-11eb-bff6-00ff9885c460','April',2,2019,'Decemeber',31,2023,NULL),('270d1129-9e70-11eb-bff6-00ff9885c460','October',25,2017,'Decemeber',31,2023,NULL),('396f2a44-9e7a-11eb-bff6-00ff9885c460','April',21,2021,'Decemeber',21,2035,'Coming'),('927c494b-9ea1-11eb-bff6-00ff9885c460','May',1,2021,'Decemeber',31,2023,'Coming'),('927cd9ef-9ea1-11eb-bff6-00ff9885c460','May',1,2021,'Decemeber',31,2023,'Coming'),('927cde50-9ea1-11eb-bff6-00ff9885c460','May',1,2021,'Decemeber',31,2023,'Coming'),('927ce0bf-9ea1-11eb-bff6-00ff9885c460','May',21,20121,'Decemeber',31,2023,'Coming');

--
-- Table structure for table `streaming_service`
--
DROP TABLE IF EXISTS `streaming_service`;
CREATE TABLE `streaming_service` (
  `Service_name` varchar(50) NOT NULL,
  `Location` varchar(45) NOT NULL,
  `Price` float(5,2) NOT NULL,
  `Logo` varchar(300) NOT NULL,
  PRIMARY KEY (`Service_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `streaming_service`
--
INSERT INTO `streaming_service` VALUES ('Amazon Prime Video','Canada',7.99,'https://images.justwatch.com/icon/52449861/s100'),('Apple TV+','Canada',5.99,'https://images.justwatch.com/icon/152862153/s100'),('Cineplex','Canada',14.95,'https://images.justwatch.com/icon/5278783/s100'),('Disney+','Canada',11.99,'https://images.justwatch.com/icon/147638351/s100'),('Google Play','Canada',9.99,'https://images.justwatch.com/icon/169478387/s100'),('Illico','Canada',9.99,'https://images.justwatch.com/icon/208862776/s100'),('Microsoft Store','Canada',9.99,'https://images.justwatch.com/icon/820542/s100'),('Netflix','Canada',9.99,'https://images.justwatch.com/icon/207360008/s100'),('YouTube','Canada',11.99,'https://images.justwatch.com/icon/59562423/s100');

--
-- Table structure for table `user_details`
--
DROP TABLE IF EXISTS `user_details`;
CREATE TABLE `user_details` (
  `Name` varchar(255) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `Language` varchar(255) DEFAULT NULL,
  `Picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_details`
--
INSERT INTO `user_details` VALUES (NULL,'ndeutsch','nolandeutsch@gmail.com',NULL,NULL,NULL,NULL),(NULL,'nolan.deutsch','nolan.deutsch@ucalgary.ca',NULL,NULL,NULL,NULL),('Tiffany Tang','tiffany.tang','tiffany.tang@ucalgary.ca',20,'Female','English',NULL),('Anisha Williams','anisha.williams','anisha.williams@email.com',23,'Female','English',NULL),('Dennis Scott','dennis.scott','dennis.scott@email.com',33,'Female','French',NULL),('Jonathan Smith','jonathan.smith','jonathan.smith@email.com',54,'Male','English',NULL),('Michael Miller','michael.miller','michael.miller@email.com',19,'Male','English',NULL),('Sam','sam.santiago','sam.santiago@email.com',17,'Male','English',NULL);

--
-- Table structure for table `work_on`
--
DROP TABLE IF EXISTS `work_on`;
CREATE TABLE `work_on` (
  `Cid` varchar(36) NOT NULL,
  `Uid` varchar(36) NOT NULL,
  `Program_name` varchar(50) NOT NULL,
  PRIMARY KEY (`Cid`,`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `work_on`
--
INSERT INTO `work_on` VALUES ('595b30e2-93a0-11eb-a502-00ff9885c460','1f3caffd-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Fellowship of the Ring'),('595b30e2-93a0-11eb-a502-00ff9885c460','1f3ccc8a-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Two Towers'),('595b30e2-93a0-11eb-a502-00ff9885c460','1f3ccf51-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Return of the King'),('595b30e2-93a0-11eb-a502-00ff9885c460','1f3cd13c-93ca-11eb-a502-00ff9885c460','The Hobbit: The Desolation of Smaug'),('595d7ec6-93a0-11eb-a502-00ff9885c460','1f3caffd-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Fellowship of the Ring'),('595d7ec6-93a0-11eb-a502-00ff9885c460','1f3ccc8a-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Two Towers'),('595d7ec6-93a0-11eb-a502-00ff9885c460','1f3ccf51-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Return of the King'),('6e31c1e0-93a0-11eb-a502-00ff9885c460','1f3cd355-93ca-11eb-a502-00ff9885c460','Avengers: Endgame'),('6e31c1e0-93a0-11eb-a502-00ff9885c460','270c3efa-9e70-11eb-bff6-00ff9885c460','The Avengers'),('6e31c1e0-93a0-11eb-a502-00ff9885c460','270ca3f9-9e70-11eb-bff6-00ff9885c460','Avengers: Age of Ultron'),('6e31c1e0-93a0-11eb-a502-00ff9885c460','270ca757-9e70-11eb-bff6-00ff9885c460','Avengers: Infinity War'),('6e338d37-93a0-11eb-a502-00ff9885c460','1f3cd355-93ca-11eb-a502-00ff9885c460','Avengers: Endgame'),('6e338d37-93a0-11eb-a502-00ff9885c460','270c3efa-9e70-11eb-bff6-00ff9885c460','The Avengers'),('6e338d37-93a0-11eb-a502-00ff9885c460','270ca3f9-9e70-11eb-bff6-00ff9885c460','Avengers: Age of Ultron'),('6e338d37-93a0-11eb-a502-00ff9885c460','270ca757-9e70-11eb-bff6-00ff9885c460','Avengers: Infinity War'),('6e358622-93a0-11eb-a502-00ff9885c460','1f3cd877-93ca-11eb-a502-00ff9885c460','Friends'),('6e38250f-93a0-11eb-a502-00ff9885c460','1f3cd961-93ca-11eb-a502-00ff9885c460','Gossip Girl'),('b4f02ab6-9e72-11eb-bff6-00ff9885c460','1f3caffd-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Fellowship of the Ring'),('b4f02ab6-9e72-11eb-bff6-00ff9885c460','1f3ccc8a-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Two Towers'),('b4f02ab6-9e72-11eb-bff6-00ff9885c460','1f3ccf51-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Return of the King'),('b4f17f75-9e72-11eb-bff6-00ff9885c460','1f3caffd-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Fellowship of the Ring'),('b4f17f75-9e72-11eb-bff6-00ff9885c460','1f3ccc8a-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Two Towers'),('b4f17f75-9e72-11eb-bff6-00ff9885c460','1f3ccf51-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Return of the King'),('b4f182c3-9e72-11eb-bff6-00ff9885c460','1f3caffd-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Fellowship of the Ring'),('b4f182c3-9e72-11eb-bff6-00ff9885c460','1f3ccc8a-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Two Towers'),('b4f182c3-9e72-11eb-bff6-00ff9885c460','1f3ccf51-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Return of the King'),('b4f18473-9e72-11eb-bff6-00ff9885c460','1f3caffd-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Fellowship of the Ring'),('b4f18473-9e72-11eb-bff6-00ff9885c460','1f3ccc8a-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Two Towers'),('b4f18473-9e72-11eb-bff6-00ff9885c460','1f3ccf51-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Return of the King'),('b4f18684-9e72-11eb-bff6-00ff9885c460','1f3caffd-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Fellowship of the Ring'),('b4f18684-9e72-11eb-bff6-00ff9885c460','1f3ccc8a-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Two Towers'),('b4f18684-9e72-11eb-bff6-00ff9885c460','1f3ccf51-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Return of the King'),('b4f18a60-9e72-11eb-bff6-00ff9885c460','1f3caffd-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Fellowship of the Ring'),('b4f18a60-9e72-11eb-bff6-00ff9885c460','1f3ccc8a-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Two Towers'),('b4f18a60-9e72-11eb-bff6-00ff9885c460','1f3ccf51-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Return of the King'),('b4f18d74-9e72-11eb-bff6-00ff9885c460','1f3caffd-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Fellowship of the Ring'),('b4f18d74-9e72-11eb-bff6-00ff9885c460','1f3ccc8a-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Two Towers'),('b4f18d74-9e72-11eb-bff6-00ff9885c460','1f3ccf51-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Return of the King'),('b4f24dd3-9e72-11eb-bff6-00ff9885c460','1f3caffd-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Fellowship of the Ring'),('b4f24dd3-9e72-11eb-bff6-00ff9885c460','1f3ccc8a-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Two Towers'),('b4f24dd3-9e72-11eb-bff6-00ff9885c460','1f3ccf51-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Return of the King'),('b4f2a6ee-9e72-11eb-bff6-00ff9885c460','1f3caffd-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Fellowship of the Ring'),('b4f2a6ee-9e72-11eb-bff6-00ff9885c460','1f3ccc8a-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Two Towers'),('b4f2a6ee-9e72-11eb-bff6-00ff9885c460','1f3ccf51-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Return of the King'),('b4f2ac6a-9e72-11eb-bff6-00ff9885c460','1f3cd355-93ca-11eb-a502-00ff9885c460','Avengers: Endgame'),('b4f2ac6a-9e72-11eb-bff6-00ff9885c460','270c3efa-9e70-11eb-bff6-00ff9885c460','The Avengers'),('b4f2ac6a-9e72-11eb-bff6-00ff9885c460','270ca3f9-9e70-11eb-bff6-00ff9885c460','Avengers: Age of Ultron'),('b4f2ac6a-9e72-11eb-bff6-00ff9885c460','270ca757-9e70-11eb-bff6-00ff9885c460','Avengers: Infinity War'),('b4f2aebd-9e72-11eb-bff6-00ff9885c460','1f3cd355-93ca-11eb-a502-00ff9885c460','Avengers: Endgame'),('b4f2aebd-9e72-11eb-bff6-00ff9885c460','270c3efa-9e70-11eb-bff6-00ff9885c460','The Avengers'),('b4f2aebd-9e72-11eb-bff6-00ff9885c460','270ca3f9-9e70-11eb-bff6-00ff9885c460','Avengers: Age of Ultron'),('b4f2aebd-9e72-11eb-bff6-00ff9885c460','270ca757-9e70-11eb-bff6-00ff9885c460','Avengers: Infinity War'),('b4f2b14a-9e72-11eb-bff6-00ff9885c460','1f3cd355-93ca-11eb-a502-00ff9885c460','Avengers: Endgame'),('b4f2b14a-9e72-11eb-bff6-00ff9885c460','270c3efa-9e70-11eb-bff6-00ff9885c460','The Avengers'),('b4f2b14a-9e72-11eb-bff6-00ff9885c460','270ca3f9-9e70-11eb-bff6-00ff9885c460','Avengers: Age of Ultron'),('b4f2b14a-9e72-11eb-bff6-00ff9885c460','270ca757-9e70-11eb-bff6-00ff9885c460','Avengers: Infinity War'),('b4f2b341-9e72-11eb-bff6-00ff9885c460','1f3cd355-93ca-11eb-a502-00ff9885c460','Avengers: Endgame'),('b4f2b341-9e72-11eb-bff6-00ff9885c460','270c3efa-9e70-11eb-bff6-00ff9885c460','The Avengers'),('b4f2b341-9e72-11eb-bff6-00ff9885c460','270ca3f9-9e70-11eb-bff6-00ff9885c460','Avengers: Age of Ultron'),('b4f2b341-9e72-11eb-bff6-00ff9885c460','270ca757-9e70-11eb-bff6-00ff9885c460','Avengers: Infinity War'),('b4f2b5f5-9e72-11eb-bff6-00ff9885c460','1f3cd355-93ca-11eb-a502-00ff9885c460','Avengers: Endgame'),('b4f2b5f5-9e72-11eb-bff6-00ff9885c460','270c3efa-9e70-11eb-bff6-00ff9885c460','The Avengers'),('b4f2b5f5-9e72-11eb-bff6-00ff9885c460','270ca3f9-9e70-11eb-bff6-00ff9885c460','Avengers: Age of Ultron'),('b4f2b5f5-9e72-11eb-bff6-00ff9885c460','270ca757-9e70-11eb-bff6-00ff9885c460','Avengers: Infinity War'),('b4f2b952-9e72-11eb-bff6-00ff9885c460','1f3cd355-93ca-11eb-a502-00ff9885c460','Avengers: Endgame'),('b4f2b952-9e72-11eb-bff6-00ff9885c460','270c3efa-9e70-11eb-bff6-00ff9885c460','The Avengers'),('b4f2b952-9e72-11eb-bff6-00ff9885c460','270ca3f9-9e70-11eb-bff6-00ff9885c460','Avengers: Age of Ultron'),('b4f2baf8-9e72-11eb-bff6-00ff9885c460','1f3cd355-93ca-11eb-a502-00ff9885c460','Avengers: Endgame'),('b4f2baf8-9e72-11eb-bff6-00ff9885c460','270ca3f9-9e70-11eb-bff6-00ff9885c460','Avengers: Age of Ultron'),('b4f2baf8-9e72-11eb-bff6-00ff9885c460','270ca757-9e70-11eb-bff6-00ff9885c460','Avengers: Infinity War'),('b4f2bd05-9e72-11eb-bff6-00ff9885c460','270c3efa-9e70-11eb-bff6-00ff9885c460','The Avengers'),('b4f2bd05-9e72-11eb-bff6-00ff9885c460','270ca3f9-9e70-11eb-bff6-00ff9885c460','Avengers: Age of Ultron'),('b4f2bd05-9e72-11eb-bff6-00ff9885c460','270ca757-9e70-11eb-bff6-00ff9885c460','Avengers: Infinity War'),('b4f2bfca-9e72-11eb-bff6-00ff9885c460','1f3cd355-93ca-11eb-a502-00ff9885c460','Avengers: Endgame'),('b4f2bfca-9e72-11eb-bff6-00ff9885c460','270ca3f9-9e70-11eb-bff6-00ff9885c460','Avengers: Age of Ultron'),('b4f2bfca-9e72-11eb-bff6-00ff9885c460','270ca757-9e70-11eb-bff6-00ff9885c460','Avengers: Infinity War'),('b4f2c3a6-9e72-11eb-bff6-00ff9885c460','1f3cd355-93ca-11eb-a502-00ff9885c460','Avengers: Endgame'),('b4f2c3a6-9e72-11eb-bff6-00ff9885c460','270ca757-9e70-11eb-bff6-00ff9885c460','Avengers: Infinity War'),('b4f2eef4-9e72-11eb-bff6-00ff9885c460','1f3cd355-93ca-11eb-a502-00ff9885c460','Avengers: Endgame'),('b4f2eef4-9e72-11eb-bff6-00ff9885c460','270c3efa-9e70-11eb-bff6-00ff9885c460','The Avengers'),('b4f2eef4-9e72-11eb-bff6-00ff9885c460','270ca3f9-9e70-11eb-bff6-00ff9885c460','Avengers: Age of Ultron'),('b4f2eef4-9e72-11eb-bff6-00ff9885c460','270ca757-9e70-11eb-bff6-00ff9885c460','Avengers: Infinity War'),('b4f2f1bb-9e72-11eb-bff6-00ff9885c460','270ca9a5-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Philosopher\'s Stone'),('b4f2f1bb-9e72-11eb-bff6-00ff9885c460','270cabc0-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Chamber of Secrets'),('b4f2f1bb-9e72-11eb-bff6-00ff9885c460','270cad5a-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Prisoner of Azkaban'),('b4f2fe21-9e72-11eb-bff6-00ff9885c460','270ca9a5-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Philosopher\'s Stone'),('b4f2fe21-9e72-11eb-bff6-00ff9885c460','270cabc0-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Chamber of Secrets'),('b4f2fe21-9e72-11eb-bff6-00ff9885c460','270cad5a-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Prisoner of Azkaban'),('b4f30115-9e72-11eb-bff6-00ff9885c460','270ca9a5-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Philosopher\'s Stone'),('b4f30115-9e72-11eb-bff6-00ff9885c460','270cabc0-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Chamber of Secrets'),('b4f30115-9e72-11eb-bff6-00ff9885c460','270cad5a-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Prisoner of Azkaban'),('b4f30295-9e72-11eb-bff6-00ff9885c460','270ca9a5-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Philosopher\'s Stone'),('b4f30295-9e72-11eb-bff6-00ff9885c460','270cabc0-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Chamber of Secrets'),('b4f30295-9e72-11eb-bff6-00ff9885c460','270cad5a-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Prisoner of Azkaban'),('b4f30383-9e72-11eb-bff6-00ff9885c460','270ca9a5-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Philosopher\'s Stone'),('b4f30383-9e72-11eb-bff6-00ff9885c460','270cabc0-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Chamber of Secrets'),('b4f30383-9e72-11eb-bff6-00ff9885c460','270cad5a-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Prisoner of Azkaban'),('b4f30456-9e72-11eb-bff6-00ff9885c460','270ca9a5-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Philosopher\'s Stone'),('b4f30456-9e72-11eb-bff6-00ff9885c460','270cabc0-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Chamber of Secrets'),('b4f30456-9e72-11eb-bff6-00ff9885c460','270cad5a-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Prisoner of Azkaban'),('b4f30533-9e72-11eb-bff6-00ff9885c460','270ca9a5-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Philosopher\'s Stone'),('b4f30533-9e72-11eb-bff6-00ff9885c460','270cabc0-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Chamber of Secrets'),('b4f30533-9e72-11eb-bff6-00ff9885c460','270cad5a-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Prisoner of Azkaban'),('b4f3066f-9e72-11eb-bff6-00ff9885c460','270ca9a5-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Philosopher\'s Stone'),('b4f3066f-9e72-11eb-bff6-00ff9885c460','270cabc0-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Chamber of Secrets'),('b4f3066f-9e72-11eb-bff6-00ff9885c460','270cad5a-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Prisoner of Azkaban'),('b4f3b955-9e72-11eb-bff6-00ff9885c460','270ca9a5-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Philosopher\'s Stone'),('b4f3b955-9e72-11eb-bff6-00ff9885c460','270cabc0-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Chamber of Secrets'),('b4f3b955-9e72-11eb-bff6-00ff9885c460','270cad5a-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Prisoner of Azkaban'),('b4f3be61-9e72-11eb-bff6-00ff9885c460','270ca9a5-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Philosopher\'s Stone'),('b4f3be61-9e72-11eb-bff6-00ff9885c460','270cabc0-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Chamber of Secrets'),('b4f3bfd0-9e72-11eb-bff6-00ff9885c460','270cad5a-9e70-11eb-bff6-00ff9885c460','Harry Potter and the Prisoner of Azkaban'),('b4f3c0e9-9e72-11eb-bff6-00ff9885c460','270d0c53-9e70-11eb-bff6-00ff9885c460','The Big Bang Theory'),('b4f3c259-9e72-11eb-bff6-00ff9885c460','270d0c53-9e70-11eb-bff6-00ff9885c460','The Big Bang Theory'),('b4f3c333-9e72-11eb-bff6-00ff9885c460','270d0c53-9e70-11eb-bff6-00ff9885c460','The Big Bang Theory'),('b4f3c3fa-9e72-11eb-bff6-00ff9885c460','270d0c53-9e70-11eb-bff6-00ff9885c460','The Big Bang Theory'),('b4f3c4cb-9e72-11eb-bff6-00ff9885c460','270d0c53-9e70-11eb-bff6-00ff9885c460','The Big Bang Theory'),('b4f3c58e-9e72-11eb-bff6-00ff9885c460','270d0c53-9e70-11eb-bff6-00ff9885c460','The Big Bang Theory'),('b4f3c65e-9e72-11eb-bff6-00ff9885c460','270d0c53-9e70-11eb-bff6-00ff9885c460','The Big Bang Theory'),('b4f3c729-9e72-11eb-bff6-00ff9885c460','270d0c53-9e70-11eb-bff6-00ff9885c460','The Big Bang Theory'),('b4f3c87b-9e72-11eb-bff6-00ff9885c460','270d0c53-9e70-11eb-bff6-00ff9885c460','The Big Bang Theory'),('b4f3c945-9e72-11eb-bff6-00ff9885c460','270d0c53-9e70-11eb-bff6-00ff9885c460','The Big Bang Theory'),('b4f3cd4c-9e72-11eb-bff6-00ff9885c460','1f3cd877-93ca-11eb-a502-00ff9885c460','Friends'),('b4f4671e-9e72-11eb-bff6-00ff9885c460','1f3cd877-93ca-11eb-a502-00ff9885c460','Friends'),('b4f46c49-9e72-11eb-bff6-00ff9885c460','1f3cd877-93ca-11eb-a502-00ff9885c460','Friends'),('b4f46e88-9e72-11eb-bff6-00ff9885c460','1f3cd877-93ca-11eb-a502-00ff9885c460','Friends'),('b4f4707a-9e72-11eb-bff6-00ff9885c460','1f3cd877-93ca-11eb-a502-00ff9885c460','Friends'),('b4f47232-9e72-11eb-bff6-00ff9885c460','1f3cd877-93ca-11eb-a502-00ff9885c460','Friends'),('b4f474b5-9e72-11eb-bff6-00ff9885c460','1f3cd877-93ca-11eb-a502-00ff9885c460','Friends'),('b4f476f6-9e72-11eb-bff6-00ff9885c460','1f3cd877-93ca-11eb-a502-00ff9885c460','Friends'),('b4f47957-9e72-11eb-bff6-00ff9885c460','1f3cdad1-93ca-11eb-a502-00ff9885c460','SpongeBob SquarePants'),('b4f47b35-9e72-11eb-bff6-00ff9885c460','1f3cdad1-93ca-11eb-a502-00ff9885c460','SpongeBob SquarePants'),('b4f47d34-9e72-11eb-bff6-00ff9885c460','1f3cdad1-93ca-11eb-a502-00ff9885c460','SpongeBob SquarePants'),('b4f47f1f-9e72-11eb-bff6-00ff9885c460','1f3cdad1-93ca-11eb-a502-00ff9885c460','SpongeBob SquarePants'),('b4f48105-9e72-11eb-bff6-00ff9885c460','1f3cdad1-93ca-11eb-a502-00ff9885c460','SpongeBob SquarePants'),('b4f482b8-9e72-11eb-bff6-00ff9885c460','1f3cdad1-93ca-11eb-a502-00ff9885c460','SpongeBob SquarePants'),('b4f49956-9e72-11eb-bff6-00ff9885c460','1f3cdad1-93ca-11eb-a502-00ff9885c460','SpongeBob SquarePants'),('b4f49d91-9e72-11eb-bff6-00ff9885c460','1f3cdad1-93ca-11eb-a502-00ff9885c460','SpongeBob SquarePants'),('b4f4a00e-9e72-11eb-bff6-00ff9885c460','1f3cdad1-93ca-11eb-a502-00ff9885c460','SpongeBob SquarePants'),('b4f4a50e-9e72-11eb-bff6-00ff9885c460','1f3cdad1-93ca-11eb-a502-00ff9885c460','SpongeBob SquarePants'),('d068adc4-939f-11eb-a502-00ff9885c460','1f3caffd-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Fellowship of the Ring'),('d068adc4-939f-11eb-a502-00ff9885c460','1f3ccc8a-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Two Towers'),('d068adc4-939f-11eb-a502-00ff9885c460','1f3ccf51-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Return of the King'),('d068adc4-939f-11eb-a502-00ff9885c460','1f3cd13c-93ca-11eb-a502-00ff9885c460','The Hobbit: The Desolation of Smaug'),('dc6ad6d3-939f-11eb-a502-00ff9885c460','1f3caffd-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Fellowship of the Ring'),('dc6ad6d3-939f-11eb-a502-00ff9885c460','1f3ccc8a-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Two Towers'),('dc6ad6d3-939f-11eb-a502-00ff9885c460','1f3ccf51-93ca-11eb-a502-00ff9885c460','The Lord of the Rings: The Return of the King');

-- ------------------------- END OF CREATING DATABASE TABLES -----------------------------

-- ------------------------- STORED PROCEDURES -----------------------------

--
-- Dumping routines for database 'cpsc471_project_db'
--

/*!50003 DROP PROCEDURE IF EXISTS `addReview` */;
-- Adding a user review to a specific program 
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addReview`(IN Uid varchar(36), IN Email varchar(50), IN Rating INT, IN Description varchar(300))
BEGIN
	SET @username = (SELECT a.username FROM account a WHERE a.Email=Email); 
	INSERT INTO reviews (Uid, Author, Date, Rating, Description) VALUES (Uid, @username, curdate(), Rating, Description);
    SET @date = curdate(); 
    SELECT @username AS Username, @date AS Date; 
END ;;
DELIMITER ;

/*!50003 DROP PROCEDURE IF EXISTS `addUser` */;
-- Adding a new user from sign up 
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addUser`(IN Username varchar(36), IN Email varchar(50), IN Password varchar(36))
BEGIN
	INSERT INTO account (Email, Username, Password) VALUES (Email, Username, Password);
	INSERT INTO user_details (Email, Username) VALUES (Email, Username);
END ;;
DELIMITER ;

/*!50003 DROP PROCEDURE IF EXISTS `getAdmin` */;
-- Getting all admin users 
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAdmin`()
BEGIN
	SELECT Email FROM admin; 
END ;;
DELIMITER ;

/*!50003 DROP PROCEDURE IF EXISTS `getAllCrew` */;
-- Getting all crew members 
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCrew`()
BEGIN
	SELECT Image, Cid, Name FROM crew; 
END ;;
DELIMITER ;

/*!50003 DROP PROCEDURE IF EXISTS `getAllPrograms` */;
-- Getting all programs 
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllPrograms`(IN Type varchar(7))
BEGIN
	IF Type ='Movie' THEN 
		SELECT Image, Uid, Name FROM program p WHERE p.Type=Type; 
    ELSEIF Type ='TV Show' THEN 
		SELECT Image, Uid, Name FROM program p WHERE p.Type=Type; 
	END IF;
END ;;
DELIMITER ;

/*!50003 DROP PROCEDURE IF EXISTS `getAllProgramSchedule` */;
-- Getting schedule (programs that are coming to and leaving of every streaming service
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllProgramSchedule`(IN Status varchar(7))
BEGIN
		IF Status ='Coming' THEN 
		SELECT Image, p.Uid AS Uid FROM program p, streaming_schedule s WHERE p.Uid=s.Uid AND s.Status=Status; 
    ELSEIF Status ='Leaving' THEN 
		SELECT Image, p.Uid AS Uid FROM program p, streaming_schedule s WHERE p.Uid=s.Uid AND s.Status=Status; 
	END IF;
END ;;
DELIMITER ;

/*!50003 DROP PROCEDURE IF EXISTS `getAllUsers` */;
-- Getting all general users (Not admin) 
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllUsers`(IN Email varchar(50))
BEGIN
	SELECT u.Username AS Username, u.Name AS Name, u.Email AS Email 
    FROM user_details u 
    WHERE Email IN (SELECT a.Email FROM admin a) AND u.EMAIL NOT IN (SELECT a.Email FROM admin a); 
END ;;
DELIMITER ;

/*!50003 DROP PROCEDURE IF EXISTS `getCrewDetails` */;
-- Getting all deatils of a crew member (infomration and involved programs) 
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCrewDetails`(IN Cid varchar(36), IN detailsType varchar(8))
BEGIN
	IF detailsType='info' THEN 
		SELECT * FROM crew c WHERE c.Cid=Cid;
	ELSEIF detailsType = 'programs' THEN 
		SELECT Program_name, w.Uid AS Uid, p.Image AS Image 
        FROM crew c, work_on w, program p 
        WHERE c.Cid=Cid AND w.Cid=c.Cid AND w.Uid=p.Uid; 
    ELSEIF detailsType = 'roles' THEN
		SELECT Crew_role FROM role r WHERE r.Cid=Cid; 
	END IF;
END ;;
DELIMITER ;

/*!50003 DROP PROCEDURE IF EXISTS `getProgramDetails` */;
-- Getting details of a specific program (information, crew members involved and user reviews) 
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProgramDetails`(IN Uid varchar(36), IN detailsType varchar(8))
BEGIN
	IF detailsType='info' THEN 
		SELECT Uid, Name, Type, Image, p.Service_name AS Service_name, User_rating, Age_rating, No_of_seasons, Year, Genre, Description, Run_time, 
		   Arrival_month, Arrival_day, Arrival_year, Departure_month, Departure_day, Departure_year, Logo 
		FROM program p, program_details pd, streaming_schedule s, streaming_service ss 
		WHERE p.Uid = Uid AND p.Uid=pd.Uid AND s.Uid=p.Uid AND ss.Service_name = p.Service_name;  
	ELSEIF detailsType = 'crew' THEN 
		SELECT c.Cid AS Cid, Name, Image FROM work_on w, crew c WHERE w.Uid=Uid AND w.Cid=c.Cid; 
    ELSEIF detailsType = 'reviews' THEN
		SELECT Author, Date, Rating, Description FROM reviews r WHERE r.Uid=Uid;  
	END IF; 	
END ;;
DELIMITER ;

/*!50003 DROP PROCEDURE IF EXISTS `getPrograms` */;
-- Getting programs that are offered by streaming services that the user is subscribed to 
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPrograms`(IN Type varchar(7), IN Email varchar(50))
BEGIN
	SELECT Image, Uid 
    FROM program p 
    WHERE p.Type=Type AND p.Service_name IN (SELECT Service_name 
											 FROM list_of_user_services s
											 WHERE s.Email = Email); 
END ;;
DELIMITER ;

/*!50003 DROP PROCEDURE IF EXISTS `getServices` */;
-- Getting all streaming services 
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getServices`()
BEGIN
	SELECT Sid, s.Service_name AS Service_name, Logo, Location, Price FROM list_of_services ls, streaming_service s WHERE ls.Service_name=s.Service_name; 
END ;;
DELIMITER ;

/*!50003 DROP PROCEDURE IF EXISTS `getUserDetails` */;
-- Getting information of a specific user 
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserDetails`(IN Email varchar(50))
BEGIN
		SELECT Name, Username, Age, Gender, Language
			FROM user_details u 
			WHERE u.Email = Email;
END ;;
DELIMITER ;

/*!50003 DROP PROCEDURE IF EXISTS `getUserFavourites` */;
-- Getting user favourites (crew members, movies, and tv shows) 
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserFavourites`(IN Email varchar(50), IN favType varchar(7))
BEGIN
	IF favType='crew' THEN 
		SELECT f.Name AS Name, f.Cid AS Cid, c.Image AS Image FROM favourites f, crew c WHERE f.Email=Email AND f.Cid=c.Cid; 
	ELSEIF favType='movies' THEN 
		SELECT f.Name AS Name, f.Uid AS Uid, p.Image AS Image FROM favourites f, program p WHERE f.Email=Email AND f.Uid=p.Uid AND p.Type='Movie';  
    ELSEIF favType='tvshows' THEN 
		SELECT f.Name AS Name, f.Uid AS Uid, p.Image AS Image FROM favourites f, program p WHERE f.Email=Email AND f.Uid=p.Uid AND p.Type='TV Show'; 
	END IF; 
END ;;
DELIMITER ;

/*!50003 DROP PROCEDURE IF EXISTS `getUserProgramSchedule` */;
-- Getting the schedule (programs that are coming to or leaving the services that the user is subscribed to) 
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserProgramSchedule`(IN Email varchar(50), IN Status varchar(7))
BEGIN
	IF Status ='Coming' THEN 
		SELECT Image, p.Uid AS Uid 
        FROM program p, streaming_schedule s 
        WHERE p.Uid=s.Uid AND s.Status=Status AND p.Service_name IN (SELECT Service_name 
																	 FROM list_of_user_services l
																	 WHERE l.Email = Email); 
    ELSEIF Status ='Leaving' THEN 
		SELECT Image, p.Uid AS Uid 
        FROM program p, streaming_schedule s 
        WHERE p.Uid=s.Uid AND s.Status=Status AND p.Service_name IN (SELECT Service_name 
																	 FROM list_of_user_services l
																	 WHERE l.Email = Email); 
	END IF;
END ;;
DELIMITER ;

/*!50003 DROP PROCEDURE IF EXISTS `manageFavourites` */;
-- Allows for adding and removing a user favourite (can be a crew member or a program) 
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manageFavourites`(IN Email varchar(50), IN Uid varchar(36), IN Cid varchar(36), IN method varchar(6))
BEGIN
	IF method='POST' THEN 
		INSERT INTO favourites (Email, Uid, Cid) VALUES (Email, Uid, Cid);  
    ELSEIF method='DELETE' THEN 
		IF Cid = '' THEN 
			DELETE FROM favourites f WHERE f.Email=Email AND f.Uid=Uid; 
		ELSEIF Uid = '' THEN 
			DELETE FROM favourites f WHERE f.Email=Email AND f.Cid=Cid; 
		END IF; 
	END IF; 
END ;;
DELIMITER ;

/*!50003 DROP PROCEDURE IF EXISTS `manageUserService` */;
-- Allows for getting, adding, and removing a user streaming service 
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manageUserService`(IN Email varchar(50), IN Service_name varchar(50), IN method varchar(6))
BEGIN
	IF method='GET' THEN 
		SELECT * FROM streaming_service AS s, list_of_user_services AS u WHERE u.Email=Email AND s.Service_name=u.Service_name; 
	ELSEIF method = 'POST' THEN 
		INSERT INTO list_of_user_services (Email, Service_name) VALUES (Email, Service_name); 
    ELSEIF method = 'DELETE' THEN
		DELETE FROM list_of_user_services s WHERE s.Email=Email AND s.Service_name=Service_name; 
	END IF; 
END ;;
DELIMITER ;

/*!50003 DROP PROCEDURE IF EXISTS `updateUser` */;
-- Updating user information 
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser`(IN Name varchar(36), IN Username varchar(36), IN Email varchar(50), IN Age INT, IN Gender varchar(36), IN Language varchar(36), IN Password varchar(50))
BEGIN
	UPDATE user_details u
	SET u.Name = Name, u.Username = Username, u.Age = Age, u.Gender = Gender, u.Language = Language
	WHERE u.Email = Email;
    UPDATE account a 
    SET a.Password = Password 
    WHERE a.Email = Email;
END ;;
DELIMITER ;

-- ------------------------- END OF STORED PROCEDURES -----------------------------