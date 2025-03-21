-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: colleges
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_manage_colleges`
--

DROP TABLE IF EXISTS `admin_manage_colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_manage_colleges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_type` varchar(100) NOT NULL,
  `details` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_manage_colleges`
--

LOCK TABLES `admin_manage_colleges` WRITE;
/*!40000 ALTER TABLE `admin_manage_colleges` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_manage_colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_fetch_colleges`
--

DROP TABLE IF EXISTS `api_fetch_colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_fetch_colleges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filter_type` varchar(100) NOT NULL,
  `filter_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_fetch_colleges`
--

LOCK TABLES `api_fetch_colleges` WRITE;
/*!40000 ALTER TABLE `api_fetch_colleges` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_fetch_colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_manage_bookmarks`
--

DROP TABLE IF EXISTS `api_manage_bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_manage_bookmarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `college_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_manage_bookmarks_ibfk_1` (`college_id`),
  CONSTRAINT `api_manage_bookmarks_ibfk_1` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_manage_bookmarks`
--

LOCK TABLES `api_manage_bookmarks` WRITE;
/*!40000 ALTER TABLE `api_manage_bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_manage_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `college_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_manage_bookmarks_ibfk_1` (`college_id`),
  CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks`
--

LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `budgetminvalue` int NOT NULL,
  `budgetmaxvalue` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `budgetminvalue` (`budgetminvalue`),
  UNIQUE KEY `budgetmaxvalue` (`budgetmaxvalue`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
INSERT INTO `budget` VALUES (9,'0-2.99',0,299999),(10,'3-5.99',300000,599999),(11,'6-8.99',600000,899999),(12,'9-11.99',900000,1199999),(13,'12-18.99',1200000,1899999),(14,'19-29.99',1900000,2999999),(15,'30-100',3000000,10000000);
/*!40000 ALTER TABLE `budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colleges`
--

DROP TABLE IF EXISTS `colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colleges` (
  `college_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `budget` int DEFAULT NULL,
  `courses` varchar(255) NOT NULL,
  `placement` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `ranking` varchar(255) DEFAULT NULL,
  `facilities` varchar(255) DEFAULT NULL,
  `usp` varchar(255) DEFAULT NULL,
  `university` varchar(255) NOT NULL,
  `admission_process` text NOT NULL,
  `placement_details` text NOT NULL,
  `college_pdf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`college_id`),
  UNIQUE KEY `name` (`name`,`location`,`courses`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colleges`
--

LOCK TABLES `colleges` WRITE;
/*!40000 ALTER TABLE `colleges` DISABLE KEYS */;
INSERT INTO `colleges` VALUES (1,'Quantum University','Roorkee  Uttrakhand',470000,'MBA','7LPA','Finance Marketing,  International Business (IB), Human Resource Management, Supply Chain, Operations Management, E-Commerce, Agribusiness Management','55 out of Top 100 B-Schools in India.','Hostel Facility, Max Placement - 17LPA, Paid Internships, Seat Allot 18000, Reg 650.','International trips for global exposure, Value-added Programs (VAP),  MoU with Cambridge University Press to help students in their all-rounded development','','','',NULL),(2,'Accurate Institute of Management & Technology (AIMT)','Greater Noida  Uttar Pradesh',309000,'MBA','5LPA','Financial Management,Human Resource Management,Information Technology,International Business,Marketing Management,Operations Management','#145 out of 200 in India 2025','Seat Allot 30000,  Reg 600,  Max CTC 12L,  Job oriented summer internship,','Paid Internships, 13-15k for 6 Months','AKTU ','Registration, Basic Test, Personal Interview (PI), Offer Letter, Seat Allotment (Completed)','3LPA, 8LPA, 80%','uploads/67b72b846046a_Updated Questions and Answer.pdf'),(3,'Accurate Institute of Management & Technology (AIMT)','Greater Noida  Uttar Pradesh',625000,'PGDM','7LPA','Operations Management,Retail Management','#145 out of 200 in India 2025','Laptop, Barclays Bank, HDFC Bank, Indusind Bank, Reliance, Redington India Ltd, Bose Corp (USA), Kotak Mahindra Bank','More than 70% of our students are placed above 5 LPA, Market driven flexible curriculum,  Value Added Certification Programs, Global Immersion Program,','AKTU ','Registration, Basic Test, Personal Interview (PI), Offer Letter, Seat Allotment (Completed)','5LPA, 10LPA, 80% Placements','uploads/67b731bc6de7b_Updated Questions and Answer.pdf'),(6,'Bennett University','Greater Noida  Uttar Pradesh',1250000,'MBA','80%, 7LPA','Business Analytics,Financial Management,Human Resource Management,Marketing Management,Media Management','#156 out of 235 in India 2024','68 Acre campus, In house Hostel (12000 Capacity), Sports Facilities, Business Simulations, Live Projects,','NAAC A+,  AIU, Global Immersion Program, Summer Internship: 8 Week Winter Internship: 8 Week, Highest,S Package 25LPA,TIMES OF INDIA GROUP KI ALL COMPANYES,scholarship upto 1cr','Self','Registration, Basic Test, Personal Interview (PI), Offer Letter, Seat Allotment (Completed) (reg-1500, seat allotment- 1L','min 7LPA max 25 LPA','uploads/67b7320863189_Postman_API_Testing_Guide.pdf'),(20,'GNIOT / GIMS','Greater Noida  Uttar Pradesh',495000,'MBA','5LPA','Marketing, International Business, Human Resource Management','150 and 200 in the management institutes category, by NIRF In 2023,','30 K Seat Allotment Charge, 800 Reg Charge,','AKTU, AICTE, NAAC A+, Third Party Certifications.','','','',NULL),(27,'GNIOT / GIMS','Greater Noida  Uttar Pradesh',837000,'PGDM','8LPA','Marketing, Finace, Logistic and Supply Chain,  International Business (IB), Business Analytics,  Entrepreneurship and New Age Startups,  Electives - OB and HRM','150 and 200 in the management institutes category, by NIRF In 2023,','Paid Internships 9-15K per month, Global Immersion Program, 7 Days International Visit,  HLAC certification','Live Classes from Sonu Sharma,  Highest Package 23.31LPA,  Average 3 Offer (POP),','','','',NULL),(28,'Mangalmay','Greater Noida  Uttar Pradesh',309000,'MBA','4LPA','Marketing, Finance, Human Resource, Information Technology, International Business, Operations','Ranked 16th in Delhi-NCR by Mail Today (India Today Group)','Dual specialization program,  In campus Hostel & Mess,','Affordable Good Quality Program,  In House Campus,  NAAC A Certified,','','','',NULL),(29,'Mangalmay','Greater Noida  Uttar Pradesh',525000,'MBA++','9LPA','Marketing,  Finance,  Human Resource,  Information Technology,  International Business  Operations','Ranked 16th in Delhi-NCR by Mail Today (India Today Group)','Dual Specialization Program, Hiring Companies - Amazon, Asian Paints, Tommy Hilfiger, Bajaj Allianz, Ericsson','Value Added Certifications,  IIMBx Certification,  Written Agreement for Placement @5LPA, Max CTC 17LPA,','','','',NULL),(30,'IILM','Greater Noida  Uttar Pradesh',1170000,'MBA','11LPA','Human Resource Management','#47  out of 275 in  India 2024','Dual Specialization, Value Added Certifications,','Corporate Readiness Programme (CRP), Global Exposure and Industry Connections.,','Self','Registration, Basic Test, Personal Interview (PI), Offer Letter, Seat Allotment (Completed)','9LPA, 18LPA, 70%',NULL),(31,'Dronacharya','Greater Noida  Uttar Pradesh',209000,'MBA','4LPA','Marketing,human resourse,finance,information technology','The Dronacharya Group of Institutions (DGI) in Greater Noida was ranked 26–50 in India in 2020 by the NIRF Innovation Ranking','hostal in campuse,good placement facility','low budget in master program, direct tie ups in companyes','','','',NULL),(39,'GL BAJAJ','Greater Noida  Uttar Pradesh',785000,'PGDM','9 LPA','Human Resource Management, Finance, International Business, Marketing, Operations Management, Information Technology, and Data Analytics.','Ranked 5th among top PGDM institutes in the North Zone, 13th among top 20 B-schools in the North Zone, 20th among top 50 private institutes in India, and 32nd among top 100 B-schools in India','Hostal in campus ,medical ficility ,play ground,good invironment in campus','Academic excellence,Innovative pedagogy,Strong alumni network,Dual specializations,','','','',NULL),(40,'GIBS','Bangalore  Karnataka',950000,'PGDM','11','Finance management,Marketing ,HR,IB,Entrepreneurship management,Operations and supply chain management: ,Business analytics,Digital marketing: ,IT','Ranked 6th in Karnataka (Private) and 11th in the Category of Leading B-Schools','classrooms, libraries, labs, sports facilities, and a hostel.','strong industry focus, dual specialization options, high placement records, a comprehensive curriculum with practical exposure, and a strong emphasis on soft skills development through the \"CPMP\" finishing school program','','','',NULL),(41,'Lexicon MILE','Pune  Maharashtra',1030000,'PGDM','9LPA','Marketing, Finance, HR, International Business, Retail, and Business Analytics.','Among the top private institutes in India and West India by several ranking agencies.','special ventilated classrooms, a modern-day computer laboratory equipped with Wi-Fi facility, a large students\' activity area, yoga & meditation centre and many more.','Placement: Lexicon MILE has a track record of 100% placements. Internships: Lexicon MILE offers 9 months of paid internships. Infrastructure: Lexicon MILE has good infrastructure. Faculty: Lexicon MILE has supportive faculty members.','AICTE','Registration, Basic Test, Personal Interview (PI), Offer Letter, Seat Allotment (Completed) ','7LPA, 15LPA, 100% Placment, ',NULL),(48,'Lloyd','Greater Noida  Uttar Pradesh',325000,'MBA','70 PERCENT','Marketing,HR,IT,Finance,Opration','69 rank in 2024 in hlok','hostal in our campus, around 70 percent student placed,apple lab ','good placement,hostal in campus,direct tieups in a company for placement ','AKTU','registaion,basic test,pi,offerlatter,seatallotment charge, done','MINM- 4LPA.AVARAGE-6LPA, HIGEST-17LPA',NULL),(49,'Lloyd  ','Greater Noida  Uttar Pradesh',850000,'PGDM','75 PERCENT, ','HR,marketing,finance,opration management,IB,IT, ','in 2025 69 rank in outlook','hostal in our campus, around 70 percent student placed,apple lab ','good placement,hostal in campus,direct tieups in a company for placement ','AKTU ','registaion,basic test,pi,offerlatter,seatallotment charge, done ','MINM- 7LPA.AVARAGE-11LPA, HIGEST-21LPA',NULL),(50,'RIIM','Pune  Maharashtra',810000,'PGDM','75 PERCENT, ','Marketing,HR,IT,Finance,Opration ','There is not much information about the ranking of Ramachandran International Institute of Management (RIIM) Pune for its PGDM program, ',' labs, a library, canteen, and Wi-Fi. The institute also has a hostel. ','low budget good placement, goodlocation in highway',' self','registaion,basic test,pi,offerlatter,seatallotment charge, done ','MINM- 8LPA.AVARAGE-11LPA, HIGEST-17LPA',NULL),(51,'Divine Institute Of Management and Technology','Greater Noida  Uttar Pradesh',750000,'PGDM','7LPA','Business Analytics,Data Analytics,Financial Management,Human Resource Management,Information Technology,International Business,Marketing Management,Operations & Supply Chain Management','Good Ranking','Low budget in local area, hostel facility','Low budget in master program, direct tie-ups with companies, good environment on campus','AICTE','Registration, Basic Test, PI (Personal Interview), Offer Letter, Seat Allotment Charge, Done','Minimum - 4 LPA, Average - 6 LPA, Highest - 17 LPA, ',NULL),(52,'ATLAS SKILL TECH UNIVERSITY','Mumbai  Maharashtra',1100000,'MBA ','80%, 7L ROI ','Business Analytics,Digital Marketing,Entrepreneurship Management,Financial Management,Marketing Management','good ranking',' labs, a library, canteen, and Wi-Fi. The institute also has a hostel.  ',' paid internship good placement,hostal in campus,direct tieups in a company for placement,(TATA,FLIPKAT,WALMART,PAYTM) ','self','registaion ,basic test,pi,offerlatter,seatallotment charge, done ( registration fee- 1500, seat allotment fee- 45000 )','MINM- 8LPA.AVARAGE-10LPA, HIGEST-13LPA ',NULL),(53,'EMPI Institude','Delhi  Delhi',895000,'PGDM','11LPA','Financial Management,Human Resource Management,Information Technology,Insurance Management,International Business,Logistics and Supply Chain Management,Marketing Management,Media Management','among the top 25 management institutions in India, ',' labs, a library, canteen, and Wi-Fi. The institute also has a hostel.  ','good placement,hostal in campus,direct tieups in a company for placement ','AICTE','Registration, Basic Test, Personal Interview (PI), Offer Letter, Seat Allotment (Completed)','Min- 8LPA, .Avg -11LPA, HIGEST-17LPA ',NULL),(55,'ISMS','Pune  Maharashtra',450000,'MBA','75 PERCENT,  ','Marketing,HR,IT,Finance ','The Times of India: In 2021, The Times of India ranked ISMS 16th out of 80 colleges in India. They also ranked the MBA program at ISMS 25th out of 118.','low budget in lockal area,hostal facility, ','low budget good placement, goodlocation in highway ','AICTE ','registaion,basic test,pi,offerlatter,seatallotment charge, done  ','MINM- 4LPA.AVARAGE-6LPA, HIGEST-17LPA ',NULL),(56,'ISMS','Pune  Maharashtra',1100000,'GLOBAL MBA','75 PERCENT, ','Marketing,HR,IT,Finance,Opration  ,IB,RETAIL MGT,',' Silicon India ranked ISMS as the 11th-best institute in India.','The International School of Management Studies (ISMS) in Pune, India offers a Global Immersion Program as part of its MBA program','good placement,hostal in campus,direct tieups in a company for placement  ','self ','registaion,basic test,pi,offerlatter,seatallotment charge, done  ','MINM- 12LPA.AVARAGE-19LPA, HIGEST-33LPA ',NULL),(57,'ISMS','Pune  Maharashtra',750000,'PGDM','75 PERCENT,   ','Marketing,HR,IT,Finance,Opration  supply chain ,','The Times of India ranked ISMS 5th best in Pune.','a library, sports complex, labs, and seminar hall. ','The course is a two-year program at the PG level. ','self','registaion,basic test,pi,offerlatter,seatallotment charge, done  ','MINM- 7LPA.AVARAGE-11LPA, HIGEST-21LPA ',NULL),(58,'IIBS','Bangalore  Karnataka',900000,'MBA','75 PERCENT,  ','HR,marketing,finance,opration management,IB,IT, ',' among the top MBA colleges in India by NIRF','hostal in our campus, around 70 percent student placed,apple lab  ','good placement,hostal in campus,direct tieups in a company for placement   ','self','registaion,basic test,pi,offerlatter,seatallotment charge, done   ','MINM- 8LPA.AVARAGE-11LPA, HIGEST-17LPA ',NULL),(60,'FIIB','Delhi  Delhi',1155000,'PGDM','75 PERCENT,  ','Marketing,HR,IT,Finance,Opration  ','Academic Insights ranked FIIB 20th in India\'s Top 50 Non IIM\'s B Schools Survey. ',' labs, a library, canteen, and Wi-Fi. The institute also has a hostel.   ','air-conditioned classrooms, a library, computer labs, a sports complex, and an auditorium. ','AICTE ','registaion,basic test,pi,offerlatter,seatallotment charge, done   ','MINM- 10LPA.AVARAGE-15LPA, HIGEST-33LPA  ',NULL),(61,'ST Andrews','Gurugram  Haryana',265000,'MBA','75 PERCENT,  ','Marketing,HR,IT,Finance,Opration   ','India Today: Ranked 28th among the top 30 engineering colleges in India in 2023 Times of India: Ranked 8th in the Times Engineering Institute Ranking Survey','low budget in lockal area,hostal facility, ','low budget in master program,Direct tie ups in campanyes good inviroment in campus ','self','registaion,basic test,pi,offerlatter,seatallotment charge, done   ','minm 3 , avarage-5lpa,highest-13lpa ',NULL),(63,'RIT','Dehradun  Uttarakhand',350000,'MBA','60 percent','Marketing,HR,IT,Finance,Opration  ','goog ranking ','low budget in lockal area,hostal facility, ','low budget in master program,Direct tie ups in campanyes good inviroment in campus ','self','registaion,basic test,pi,offerlatter,seatallotment charge, done   ','minm 3 , avarage-5lpa,highest-13lpa ',NULL),(70,'IIEBM','Pune  Maharashtra',900000,'PGDM','12LPA','Marketing, Human Resources (HR), Finance, Supply Chain Management, Business Analytics','IIRF Ranking 2024: 44th among top private B-schools in India','Hostel In Campus, Placements 70%, ','AICTE Approved,  Good Placement, Direct tie-ups with Industry for placement ','NA','Registration,  Basic Test, Personal Interview, Offer Letter, Seat Allotment Charge, Done','Min 8LPA, Max 19LPA,  Placement Record - 65%',NULL),(71,'Lingyas University','Faridabad  Haryana',208000,'MBA','5LPA','Marketing, Human Resources (HR), Finance, Operation','Ranked 217th for its MBA program in 2024 by Business Today.',' Labs, Canteen, Hostel Facility, and Wi-Fi.','Low Budget Master\'s Program, Direct Tie-Ups with Companies, Good Campus Environment','Self','Registration 1000Rs. , Basic Test, Personal Interview (PI), Offer Letter, Seat Allotment Rs 25000','Min 3LPA, Max 13LPA, 70% Placement Record',NULL),(72,'Maharishi Universtiy','Lucknow  Uttar Pradesh',200000,'MBA','5LPA','Marketing,HR,IT,Finance','In 2025, US News Best Colleges ranked Maharishi International University between 149–164 out of 165 Regional Universities in the Midwest. ','Low budget, Good College in Lucknow Area,  Hostel Facility,','International University, All branch have good placement','Self','Registraion Fees,  Group Discussion, Personal Interview, Selection, Seat Allotment Charge,','Min 3LPA, Max 13LPA',NULL),(73,'IBI ','Greater Noida  Uttar Pradesh',985000,'PGDM','19 LPA','Marketing, Human Resources (HR), Information Technology (IT), Finance, Operations','IBI ranked 100th in the 2024 Times Top Management Institutes in India.','Facilities include labs, a library, canteen, Wi-Fi, and a hostel.','Only PGDM so placement chances high','AKTU ','Registration, Basic Test, Personal Interview (PI), Offer Letter, Seat Allotment (Completed)','Minimum CTC - 11 LPA, Average CTC - 19 LPA, Highest CTC - 50 LPA, 80% Placement Rate',NULL),(77,'Lexicon MILE','Pune  Maharashtra',2250000,'Global MBA','21LPA','Marketing Management ,Human Resource Management, Operations, Logistics, and Supply Chain Management, Accounting and Finance with KPMG, Business Analytics, Artificial Intelligence, Entrepreneurship and Innovation, Insurance Management , General Management','Top Ranked College, Ranked 5 in Top Private B Schools in West.','To Be filled','To Be filled','United Kingdom','Registration,  Basic Test, Personal Interview, Offer Letter, Seat Allotment Charge, Done','97.5%, 7.78 LPA to 19LPA',NULL),(81,'NIET','Greater Noida  Uttar Pradesh',550000,'Global PGDM','7LPA','Digital Marketing,Financial Management,Human Resource Management,Information Technology,Logistics and Supply Chain Management,Marketing Management','01-125th band for its MBA program by the NIRF in 2024.','hostal in our campus, around 70 percent student placed,apple lab  ','AUTONOUMAS Clg in gr noida , good placement in delhi nca','AKTU ','Registration, Basic Test, Personal Interview (PI), Offer Letter, Seat Allotment (Completed)','minm 5.6 lpaavarage 8 lpamax 51lpa',NULL),(83,'NIU','Bangalore  Karnataka',34567,'To Be Filled','To Be Filled','To Be Filled','To Be Filled','To Be Filled','To Be Filled','Self','To Be Filled by Nikhil','To Be Filled',NULL),(94,'Check','hello',234234,'23424','Check','Check','Check','Check','Check','Check','234234','Check','uploads/67b7346a24309_sodapdf-converted.pdf');
/*!40000 ALTER TABLE `colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (10,'Bangalore  Karnataka'),(8,'Dehradun  Uttarakhand'),(9,'Delhi  Delhi'),(4,'Faridabad  Haryana'),(3,'Ghaziabad  Uttar Pradesh'),(1,'Greater Noida  Uttar Pradesh'),(5,'Gurugram  Haryana'),(12,'hello'),(2,'Lucknow  Uttar Pradesh'),(6,'Mumbai  Maharashtra'),(7,'Pune  Maharashtra'),(11,'Roorkee  Uttrakhand');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specializations`
--

DROP TABLE IF EXISTS `specializations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specializations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specializations`
--

LOCK TABLES `specializations` WRITE;
/*!40000 ALTER TABLE `specializations` DISABLE KEYS */;
INSERT INTO `specializations` VALUES (20,'Agribusiness Management'),(16,'Artificial Intelligence'),(8,'Banking '),(6,'Business Analytics'),(13,'Data Analytics'),(12,'Digital Marketing'),(19,'E-Commerce'),(15,'Entrepreneurship and New Age Startups'),(11,'Entrepreneurship Management'),(3,'Financial Management'),(1,'Human Resource Management'),(5,'Information Technology'),(17,'Insurance Management'),(4,'International Business'),(10,'Logistics and Supply Chain Management'),(2,'Marketing Management'),(9,'Media Management'),(7,'Operations & Supply Chain Management'),(14,'Operations Management'),(18,'Retail Management');
/*!40000 ALTER TABLE `specializations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `activation_token` varchar(255) DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `password_reset_expires` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nikhil','nikhil.ahluwalia@gmail.com','$2y$10$EMgWgyvjZAvDpYtd31mrxuJhoOuzjrC96FwWXiEmN0ClGboEJbfL2','admin',NULL,NULL,NULL,NULL),(2,'TANU SINGH','tanusingh9224@gmail.com','$2y$10$1WDeIJbrAyhoPaKANJ9mhucNpUtU1d2NQGOlDtRpSLEdxMvuNvIsW','user',NULL,NULL,NULL,NULL),(3,'sarla yadav','sarla.mgs@gmail.com','$2y$10$sqyMaAgWtpcHQvEKK5bR..kPIytNV.SJF0lu98u6OxPAyAgLiZD2G','user',NULL,NULL,NULL,NULL),(10,'Sucheta','suchetaahluwalia1982@gmail.com','$2y$10$mY24ib2tnx6F/m3Tz3jmJ.SG8mCbkM7KqvSP/aKKcMRkAP3UxDuf.','user','f47fa706e030103f0780b10a588f9735',0,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-13 17:50:52
