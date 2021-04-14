-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: AttendanceDB
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `active`
--

DROP TABLE IF EXISTS `active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active` (
  `id` int NOT NULL AUTO_INCREMENT,
  `studentID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `studentID` (`studentID`),
  CONSTRAINT `active_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active`
--

LOCK TABLES `active` WRITE;
/*!40000 ALTER TABLE `active` DISABLE KEYS */;
/*!40000 ALTER TABLE `active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `studentID` int DEFAULT NULL,
  `subjectID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `studentID` (`studentID`),
  KEY `subjectID` (`subjectID`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `students` (`id`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`subjectID`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (2,'2021-04-13',3,31),(3,'2021-04-14',3,28),(4,'2021-04-14',3,29),(5,'2021-04-14',3,31),(6,'2021-04-14',3,27);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `enrollmentNo` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `course` varchar(30) NOT NULL,
  `section` varchar(5) NOT NULL,
  `subjectID` int NOT NULL,
  `semester` int NOT NULL,
  `identity` blob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enrollmentNo` (`enrollmentNo`),
  KEY `subjectID` (`subjectID`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`subjectID`) REFERENCES `subjectList` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (3,1514902018,'Arjun Bajaj','BCA','A',9,6,_binary '\0\0\0\0.K\�@L�@\�z\�=�\�?\0\0\0\0}q\n=�\�O@\0\0\0\0\�\�\�@\0\0\0\0\0\0\0\0\0\0\0\0C��@C>\�8?�.\�>{D\�<��h@��@\0\0\0\0\"g@\0\0\0\0\0\0\0\0\0\0\0\0�\�\�?\�}\�>�.�;\0\0\0\0l�\n?\�\�>\�\�\�@\0\0\0\0\0\0\0\0��\"?Mc�@\0\0\0\0\0\0\0\0A\�e>X�)=\0\0\0\0\0\0\0\08�t>���9E7�?}\�?\0\0\0\0\�9�>\0\0\0\0XF\�=�n�>\�_�?��@J�>�82@\0\0\0\0\0\0\0\0\0\0\0\0crx@%��>��-?\0\0\0\0]�\�?\0\0\0\0��?\�[@ߗ=\�\�?�\�;@{i	?\0\0\0\0\�F=Ǉ\�;!=\0\0\0\0\0\0\0\0\�\��?A> @\'E\�<\0\0\0\0\0\0\0\0\0\0\0\0*��@\�\�?=\�\�@H\�u@\0\0\0\0\0\0\0\0�\�*>\0\0\0\0\0\0\0\0-\�>~\�?\0\0\0\0\�\�?\0\0\0\0\0\0\0\0\�N\Z>\0\0\0\0\n\�@\0\0\0\0<��<\0\0\0\0�p>nS@\�J�>��\�@�R=\0\0\0\0K��<\0\0\0\0R|�@ab�>�GI>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0pRc@\0\0\0\0\��\�>6�!=3DP=\0\0\0\0f�z=ޚ6>�2|;\0\0\0\0\0\0\0\0T�\�>\0\0\0\0n�$@\0\0\0\0bA\0\0\0\0\0\0\0\0k�	>!h�?\0\0\0\0\0\0\0\0E�\�?\0\0\0\0\0\0\0\0�K\�=x��>\0\0\0\0\0\0\0\0\0\0\0\0a\�\�=�\�=\�nA(\�=\�\�\�=VM�>\0\0\0\0\���;���?�\�=�>-@\�P=\0\0\0\0\0\0\0\0aEh?3I\r=/nA.\\J@\�\�6?\0\0\0\0Uִ@\0\0\0\0\0\0\0\0\�\� @\�U@\0\0\0\0\�ۘ@\0\0\0\0��@\0\0\0\0X,?��=\0\0\0\0\0\0\0\0tL�@\\�@\�\�z@GB\�<\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��@\0\0\0\0\0\0\0\0=�a@�\�\�?y��>\0\0\0\0��?�\�@\0\0\0\0\0\0\0\0\0\0\0\0��\�<\0\0\0\0\'�A�\�`@sc�<%h?\�(�@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�Bd>\�s@�E�<��,?\0\0\0\0y�@E\�>�yn?\0\0\0\0ߊ�@V�T<\0\0\0\0v��?\��j>\0\0\0\0\�zAtON@\0\0\0\01��@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,Y?�t\�=\0\0\0\0�y�>\0\0\0\0\�{�?/ژ@\0\0\0\0\0\0\0\0Ytt?\Zh@�Ֆ@�\�)>\0\0\0\0[�?fd�?���=�\�>.y@\0\0\0\0��?\0\0\0\0.\�@\�!Z?(�@2\�h@!�?rA.+\\@(�?���?�g`=\0\0\0\0\"\�?\Z��=^y?@\�A?\rŸ@?�=�?�=*�n@\0\0\0\0\0\0\0\0\0\0\0\0\�N�>\0\0\0\0n��=�@\'�\�>	�`A\0\0\0\0H6>4|8>\�s\�?�\�[?\0\0\0\0\0�=܏�@\�{D?\0\0\0\0\0\0\0\0���<�U\'>�\�E<�/�=�\�L?c�p?\��=\0\0\0\0%k\�>k�@\0\0\0\0w��@�DA\0\0\0\0h�>\�\�e@\��>�\�\�>H\'@�\�\�>ad\�@�r�?\�>�P�@\���>l�=��\�?\0\0\0\0��?Ag?c�@b\�>T\�?n\�@6�\�;\�Gd>��d>\0\0\0\0\0\0\0\0�O�?\0\0\0\0\r\�\�=?\�?�c5Ao�?\�q>\0\0\0\0\0\0\0\0�\�z=nl\�=\0\0\0\0\�\�aA\0\0\0\0\�@��(@���@\0\0\0\0�*\�>�j/@p�@�jA\�\Z\�>\0\0\0\090f>��?\0\0\0\0==/?�h�??h�?y_\�>\0\0\0\0]@\0\0\0\0\�\�>\0\0\0\0�y!>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T�\�>\0\0\0\0\0\0\0\0�\�>\0\0\0\0\�/�?t\�c?�v�>�\�h?�s�?\�@p�@\0\0\0\0�W�@(J=�H\n>D��>\0\0\0\0\�/A\��>\�_@\0\0\0\0�D?\0\0\0\0��A@\0\0\0\0*�h>��>\0\0\0\0\0\0\0\0\0\0\0\0/~?}\�2=\0\0\0\0��m<\0\0\0\0\�k?��=\�\�?��=\0\0\0\0\0\0\0\0�Ұ<�=\�|?J�#AZ�@N:=?\0\0\0\0\0\0\0\0�j;�h\�@\0\0\0\0\0\0\0\0{v\�@0F@\0\0\0\0y��@7�?*\">��?\0\0\0\0�2�>�A\0\0\0\0\�\�\�=\0\0\0\0\0\0\0\0\0\0\0\03jz@=��?\�?-\\@�,h=\�mV?J\�>\0\0\0\07�?\�\�?\�@\�?��@\0\0\0\0\0\0\0\0*m4>\0\0\0\0T�?E=$=�ʕ>\0\0\0\0$�=TZ?\0\0\0\0\�\�>�R�@\0\0\0\0Ǣy@\0\0\0\0c\�=\�c\\?M%@H��?\0\0\0\0\0\0\0\0\0\0\0\0Q\r\�@\0\0\0\0E\r?\�\\1A�5X?2\�@�\�?�!�>�\�@[�;��g?\0\0\0\0\0\0\0\0\0\0\0\0��:?�\�:=!\�\�@f��>v]�?O=a.\�?r	5?\�\�=ec�=�gP?p_�?\�B@\0\0\0\0\�;\�?\�\"\�@\0\0\0\0\0\0\0\0�*?\��_@\�UN?\0\0\0\0\0\0\0\0\0\0\0\0Y�?=\0\0\0\0\0\0\0\0;%�?\0\0\0\0�u�?\0\0\0\0ͮ�?��A,Α?E4,>T��>\�`�=r\'@\0\0\0\0-��>\0\0\0\0;�E@{\\@]K�=\�\�\�=\0\0\0\0ݸl@�\�?��\r@\0\0\0\0\0\0\0\0d\��@7\��>\0\0\0\0Qg�?\0\0\0\0���<\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\r�>2L>�\�>\�Pj?\0\0\0\0\0\0\0\0a_;g�\�<�@�7�;D[�>\�v�=�A��\0Ax�@\0\0\0\0\0\0\0\0�\�\n=-٥@\0\0\0\0��\�?�kt=Jv\�@=G=\�\�|?\��?�\�\�?\0\0\0\0�\0�?92s>\0\0\0\0\��8>\0\0\0\0\0\0\0\0�m}@��M?\�@��?�+=\�\�>\0\0\0\0�j\�>l��?\0\0\0\09<�>\0\0\0\0^\�\�=�g:>C��@\n>\"�\0A\Z)�;�ҙ=\�K�@\�/�=\0\0\0\0���>�+�=\0\0\0\0\�|f?T�\�;\0\0\0\0\nnF=\0\0\0\0�\�<�*>�s<\0\0\0\0\�?\�\�?��.@\0\0\0\0e\�@\0\0\0\0\0\0\0\0Hͱ@\Z �=\0\0\0\0\0\0\0\0\0\0\0\0IR�>\0\0\0\0�6%@,@��A�D\�?�\��<3j�@\0\0\0\0\0\0\0\08<?�\�>:\�>�c�>\0\0\0\0\0\0\0\0HW>\0\0\0\0f~?\n@8��?*�F>\0\0\0\0\0\0\0\0L;�?\0\0\0\0+�>\0\0\0\0��?#\\:\0\0\0\0��@,��@\0\0\0\0*�i?\0\0\0\0\0\0\0\0l�\\?\�v+=�:@\�\�?\0\0\0\0��@�\�\�?\�Wt?\0\0\0\0(w?\0\0\0\0\�V\�@\0\0\0\0\0\0\0\0Y1>\0\0\0\0�v\\=�t\�>x��?\0\0\0\0\�ì@9Z�>\0\0\0\0��@\0\0\0\0\0\0\0\0�]@\0\0\0\02\�<8g@�<�@�O+@6�@\0\0\0\0\0\0\0\0\0\0\0\0�\�\"@c�P?\r`[<�fI?\�\�0@#f�@\0\0\0\0;~@\�\�.@\0\0\0\0�~\�=\���<\0\0\0\0\0\0\0\0HW?\��?\0\0\0\0\0\0\0\0_n�@1W�=9�R?\0\0\0\0e�>\�\�@\0\0\0\0\�k<,`E>JA\�\�8A�2@\0\0\0\0\0\0\0\0\0\0\0\0��\�?7�?C�>EN�@�\�?�\�>㽋@\0\0\0\0\�=P\�&=�&�=\0\0\0\0\0\0\0\0a��>ִ:>Y�?\Z\�,@\�9�<\�j>G\\}=��@\0\0\0\0\0\0\0\0\�@\0\0\0\0VA\�=�˨<\0\0\0\0YN=\�uACv�=Q\��<b��@\0\0\0\0\0\0\0\0\0\0\0\0��6@\0\0\0\0+l3@#�A\�}�@\0\0\0\0�?��?V\�!?�~A3\�=\0\0\0\0�w<\0\0\0\0���;\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0<F7A�=�&@n/\�?��k=\0\0\0\0\0\0\0\0?h�;�S\�=\0\0\0\0��A�X@0j>!q>\0\0\0\0	�t?vf@f}\�?\0\0\0\0\0\0\0\0���@�v5<\0\0\0\0P�@\0\0\0\0@K�@9�<\�,>;=\0@n-?��?�J<@\0\0\0\0�^>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��u?\0\0\0\0\0ً?\0\0\0\0\0\0\0\0\�[|>\0\0\0\0T\�.<9\��>�\�.>�G�>�\�?�\�>\0\0\0\0\0\0\0\0.?\0\0\0\0\�uA\0\0\0\0���@\0\0\0\0}�b@*��?N#\�>�z@\0\0\0\0\0\0\0\0\�ٕ>\�i�>4\�>+�\�=��!@\0\0\0\0\�\r@ns\\?�N�<\�\�>]J@\�\�>\0\0\0\0�\�A?ʙ�>Ǟ=\�\�?\0\0\0\0�@�?3A@\0\0\0\0�E\\>\0\0\0\0\0\0\0\0���?\0\0\0\0�\�>\�\�?���@\0\0\0\0\�l?o\�{>\"�0?\0\0\0\0\0\0\0\0j6�>4z=\0\0\0\0A=>\�@�t.@\�5�:\�\�\�>L2\�?\0\0\0\03�!=�T,?Σ=\0\0\0\0\0\0\0\0\0\0\0\0^\�\�?\0\0\0\0غ_?\0\0\0\0�P>\0\0\0\0\�IA\�\�@�u@/�8>8\�{>�1<\0\0\0\0�#�@ci9=c\�*<Q�@b�\�<*g?��Z>]P\�@\0\0\0\0^><\"Sj@�\�<\0\0\0\0\0\�\�<\0\0\0\0�\�aA\0\0\0\0�\�V?+OY=�H@�Ħ@\�@\0\0\0\0=\�A�O�>\0\0\0\0\0\0\0\0\�71@\0\0\0\0���@�ψ>�;@\0\0\0\0��9@\�f?�\�@�w_?\0\0\0\0\��q>t�>\0\0\0\0\0\0\0\00vT@�}�?\��;w�M@\0\0\0\0\0\0\0\0\�\�@�Ao?\0\0\0\0\�\�g@\�-#=\0\0\0\0{\ZW@\�\��?�*�@\0\0\0\0\0\0\0\0\0\0\0\0�\�\�@�\�\�@\���={_A\0\0\0\0\�ع;\Z/>\0\0\0\0\0\0\0\0\0\0\0\0M\�?���>k&�?<�=�\�}?\0\0\0\0��@v\�\n@{9t>A\�E=\0\0\0\0\0\0\0\0\�X�<,\�<Y�s@(@\�s\�>\"��;\0\0\0\0y\�t=\0\0\0\0\0\0\0\0g\�?�\�	?+?\�<�X�?G��>\0\0\0\0\0\0\0\0\0\�;\0\0\0\0\0\0\0\0\0\0\0\0\��\Z@�\�#?�CL?t��A\0\0\0\0��?T�;\�\��>�S�@\n3]?YO?*y3>R\�?k\�Adb%@\0\0\0\0\�n@,��=\0\0\0\0p�8>��=I�@\0\0\0\0@\�@�\�\�?\0\0\0\0\�?\0\0\0\0�e�@\�\0OAl�>IeK@�T�>\0\0\0\0\0\0\0\0\0}\r?Э?\0\0\0\0��\�=�v@\nQ^=�\�Y>\0\0\0\0I�#<\0\0\0\0g2A\0\0\0\0n\�G?�\�?\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�<Y@f\�@�\'�@\0\0\0\0��\�?�5V>�~\�<9\�);T�@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�F\0?\��@\0\0\0\0YO;:N\"\r@qז>C��?#�\�@\�y\�>�Q\�=�r=\�\�\�=U	\�>\Z;];\0\0\0\0\���<\0\0\0\0\0\0\0\0\�{@�,c@\�v\�@��\�:�>*\�i<\0\0\0\0<�_?\�\�+@\0\0\0\0\0\0\0\0\0\0\0\0n �?{\�?\0\0\0\0@}�@\0\0\0\0\�&@2\�d@\0\0\0\0\0\0\0\0}?M\�A>%/@\0\0\0\0\0\0\0\0�1n@ݽ�@\0\0\0\0\0\0\0\0k\�>*\n�<H��@/\�@�\�*>\0\0\0\0\"A\�\��@4�b@p[>\0\0\0\0��\�?\0\0\0\0��=\0\0\0\0�\r�?8��<\0\0\0\0%8\�?k�\�@}g�@\0\0\0\0\0\0\0\0\�[@,g?\0\0\0\0�\�*@��=\�\�A�\'>\0\0\0\0Y�\�;<�\�>�7�>\0\0\0\0\0\0\0\0\0\0\0\0TǞ?^%=M\�\�@\0\0\0\02i\�>r�I@�\�f?\0\0\0\0(��?�ޠ@\0\0\0\0Q \�@��>�;�@\�4�@\0\0\0\0x�\�@HAp>]dA?�r�?\0\0\0\0<�w@\�|@\0\0\0\0V\�?\�_�<\0\0\0\0pk?\r�?\0\0\0\0	\�\�@Z�F=\0\0\0\0��\�>\0\0\0\0\0\0\0\0\�*�?\�v\�@X&<��\�=\0\0\0\0\0\0\0\0�\��?vU4>Yi�@�@��?\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���?L�o>�\�4?\0\0\0\0m=\0\0\0\0\0\0\0\0\�\"�>\0\0\0\0P�=/\n;d��@\0\0\0\0\0\0\0\0�i�=�w=�\\�@nu�<��?\0\0\0\0\0\0\0\0���@9�.A�m�?JaA\0\0\0\0/\�>\�\rZ@\�\�?A�@�<v<J\�=�\�*@|\�t>\�\�n>a@?�\�@\0\0\0\0yj.@p\n#>\0\0\0\0\0\0\0\0\0\0\0\0\��A�.?}?;w\�?\�\�@\�^�>\0\0\0\0H�^=\0\0\0\0�ZBAk\�@��F>��@\0\0\0\0\0\0\0\0\0\0\0\0P?�^�@\�Y\�=�\�\�?\�-@nU\�?k9\0@\0\0\0\0\�Њ@\0\0\0\0�\�A�\0O>J�\�@\0\0\0\0L\��?��<0E@\0\0\0\0a%h>\0\0\0\0\0\0\0\0oҌ@\�@\0\0\0\0�@@*�(=\0\0\0\0�ǻ>�\�@xٱ=�5A@!\�\�?\�A\0\0\0\0IA\�F\�=��?\0\0\0\0\0\0\0\0\0\0\0\0�\��?,�=\0\0\0\0��S>\0\0\0\0�\�<�ި>\0\0\0\0w\�q>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0G<\�>��\�?\� A\0\0\0\0h=>=\0\0\0\0\0\0\0\0�շ>cӗ?6\�\�@\0\0\0\02��>\0\0\0\0\0\0\0\0c��>\0\0\0\0�\�\�?\0\0\0\0R\�@�<n\�?�>\0\0\0\0\rC;>_�\�:�\�9?\�\�?݃\�@\�\0\�?\0\0\0\0\0\0\0\0\0\0\0\0\�S:>E\�\�?�@\0\0\0\0\0\0\0\0\�$�?\0\0\0\0��A\�\�\Z@_\��?8)1A\0\0\0\0G�Y>P@Q>9s?\0\0\0\0\�[\�@\0\0\0\0M�9\0\0\0\0\0\0\0\0*\�?\0\0\0\0\0\0\0\0\0\0\0\0ɟ\�?\0\0\0\0yB�?�\�\�>\0\0\0\0*��:\0\0\0\0�\�c<\0\0\0\0\0\0\0\0!_�@ʂ�=�ϧ=\0�P?貲@�BA=\r\"@7�	<\n\�@\0\0\0\0\0\0\0\0�צ@|�{>��M>\0\0\0\0\�\�>@\�.\�>\0\0\0\0\0\0\0\0B\�@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�YB?\0\0\0\0\0\0\0\0\0\0\0\0\�4\�<_�\�?�\�>\�;O=\�\�@U�\�@�\�At<��<2l+>�\�\�=\�c>\0\0\0\0eD=\�:@C��?0H=\0\0\0\0\0\0\0\0�C�@\0\0\0\0D#kA\�\�@\0\0\0\0;\�?��@�8@���?\�*�=D\�\�>��=�U�@�\�N?	I=(\�\r?\0\0\0\0\�\\\�<�\�@X\��@\0\0\0\0<E9=?�?\0\0\0\0\0\0\0\0G=\�?4N\Z;\"�\�?\0\0\0\0sO?\�%�>=\�?\0\0\0\0\0\0\0\0\0\0\0\0�O\�>#\�X<Z(�=\0\0\0\0\'ɴ@��?\0\0\0\0���=+�>\��@E2@\0\0\0\0���:\0\0\0\0\�}@ਣ@\0\0\0\0Z�\�=�v=\0\0\0\0AA\0\0\0\0/R7?�\�>�l�>\0\0\0\03H�<\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\�F>\0\0\0\0�j�<\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�m\�:��?\0\0\0\0\0\0\0\0\0\0\0\046w>\0\0\0\0\�\">\�\��>\�Us<�hc>bk@�\r\�?�?l=\0\0\0\0N\�j=\0\0\0\0#�<\�\�=\0\0\0\0\�(@\�8\�@�\�>\0\0\0\0��R@\0\0\0\0\0\0\0\0и@\0\0\0\0\0\0\0\0/,\�;\0\0\0\0�ʏ?0\�vA��S?Ѱl<�\�=\�>t\�<�e�?��@��D@�@\�\�4=\"/\�=\0\0\0\0��@@���A蹃?��\Z@\0\0\0\0R\�A\0\0\0\0\0\0\0\0�\�\'@A��@�\�\0@h�\�;H�UA]G/?�5�=\0\0\0\06�n=�\�g<ϕ@x%�=���;�9�@\�}�=\0\0\0\0]:\Z?\"{E=Q,?\0\0\0\0n(@\0\0\0\03\�AA\0\0\0\0\0\0\0\0\�\�S>\�T\rA��l@\0\0\0\0\0\0\0\0\�_u@\0\0\0\0�?\�\�@?^\�\�?\0\0\0\0\0\0\0\0��L?�\0�<ҧ�?4�\�=v�\�=\0\0\0\0\0\0\0\0-� ?\0\0\0\0�F{?Ԑ<\0\0\0\0\0\0\0\0	߈=��@�DD<9�?v�=wD>�A�S�?榵>\0\0\0\02�@\�@\0\0\0\0�\�y:\0\0\0\0\0\0\0\0r�SA\0\0\0\0\0\0\0\0\�\�!@\0\0\0\0\�	)>\0\0\0\0\0\0\0\0:�@\0\0\0\0�h�?\0\0\0\0�:�@�(H>N\�\�>nq�@\0\0\0\0\�Q>%�Y>\�3Q>\0\0\0\0�X*?N\�*@\0\0\0\0\0\0\0\0\0\0\0\0T�\0=\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T~\�;�@��=^N8\0\0\0\0\0\0\0\0�\�5?v/�?2�?�C�=\0\0\0\0p\�?�!==��@\0\0\0\0�n�@���??׳@\0\0\0\0�\"u=��-@���?�\�\�>\0\0\0\0\0\0\0\0sd\�?\0\0\0\0\�w>?\0\0\0\0\0\0\0\0��>�\�\�?\0\0\0\0�.h=�\�}=\0\0\0\0�\�Y>\0\0\0\0\0\0\0\0n\�@\�Q=\0\0\0\0\�x�?#O}=\0\0\0\0Z\�>~&�@\0\0\0\0\0\0\0\0Z@��@\0\0\0\09q�;\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�˖@��?�\�)?\0\0\0\0\0\0\0\0\�\�=RȂ>*6;\�i=\0\0\0\0��\�?\�\�>MEV?R7\�@n\�E?\0\0\0\0�\�>��?�*\0AN3.>\0\0\0\0\0\0\0\0\0\0\0\0��=�\�<��\�=�|=\�\�@��>�,<>\0\0\0\0\�\�/>�M�?��o@I2s>�,�@\0\0\0\0)ٙ=��P=_\�>\0\0\0\0Y\�a?�[>\0\0\0\0Y�@q~?\0\0\0\0\0\0\0\0\0\0\0\0��`@�k�=\0\0\0\0,�s?*	@h\�<2�/A\0\0\0\0�\n&=\0\0\0\04B�?R$�?�5�?\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�L[@p@\�@Q�\�?\�\�\�@�\�\�<\0\0\0\0?\�|@@\0\0\0\0�\\=A\0\0\0\0\0>\�=*@\0\0\0\0\��i@��\�=h�?\0\0\0\0H�\�?\0\0\0\0�q5>�y\�>a�>\0\0\0\0�\�&?\0\0\0\0\�\�?\0\0\0\09�?\�\�?\0\0\0\0�\�@\0\0\0\0�A\�>\0\0\0\0\0\0\0\0�ܗ=pQ�?\n�\�;A\�\�;\0\0\0\0j�@\�<\0\0\0\0�\�@\0\0\0\0�\n\n>\0\0\0\0Q`\"A�\�	=��4@:\�>�\�:?\0\0\0\0V\�?��K;\0\0\0\0\�y>=��?\0\0\0\0�\�P?L�r?_w�@,\�\�?\0\0\0\0��}@\�A\��\�<\0\0\0\0?m.>\0\0\0\0}\�>\�\��?\0\0\0\0\0\0\0\0\0\0\0\0�6Q>\�Ib?0\n\�?\Z��@_\�@o@2r>��.>\0\0\0\0\0\0\0\0\�(AJ\�{;\0\0\0\0	�=\0\0\0\0\0\0\0\0Y1=\0\0\0\0�\�=]\�\�?p�D@��\�>ې\�>\0\0\0\0\�\�>\0\0\0\0��>�|�@,\�>\�%?\�.\�@\0\0\0\0\0\0\0\0�v�=,\�[==<\�\�?�]8@\�Jg=���?;�=\�A�?sK\�=n�>�\�@�@\0\0\0\0\0\0\0\0e\�T>\0\0\0\0\0lw<\0\0\0\0\�t\�<[$\�@���?MA!?PU/@\0\0\0\0l�=�|�@\0\0\0\0\0\0\0\0�b�<\n�>\0\0\0\0�\�;\0\0\0\0|�E=9o@\0\0\0\0\0\0\0\0�%i?,Y4@��\�?0-{@\�\�<\0\0\0\0�\�>\0\0\0\0\0\0\0\0\0\0\0\0\� �?��Y@\0\0\0\0Y0\�;q��?tK�>��C;8�\n?@\�\�@T�^?�.�@\0\0\0\0\0\0\0\0\�\�B?�\�\�=\�Y>\0\0\0\0\�\'�?\0\0\0\0ʟ\n?\0\0\0\0E��>��?ߜb?\0\0\0\0g\�?�\�X>�\�B@\0\0\0\0Y2r@�92?\�\Z>{lB@\�4�?��>\0\0\0\0\0\0\0\0c\�\�?hm�=\0\0\0\0t|\�?\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�e?\0\0\0\0\�E�@dB>\0\0\0\0\0\0\0\0\0\0\0\0�c@�\�>� 	A�\�\�@�<!>\�41@\0\0\0\0�\�\�?h�=\0\0\0\0}\�>\0\0\0\0[\�>��,?���>�\�>\0\0\0\0\0\0\0\0\��;N\��>�@\�=M�\�<(\�	>\�?\�=�>�փ>');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjectList`
--

DROP TABLE IF EXISTS `subjectList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjectList` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subjectList` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjectList`
--

LOCK TABLES `subjectList` WRITE;
/*!40000 ALTER TABLE `subjectList` DISABLE KEYS */;
INSERT INTO `subjectList` VALUES (1,'Maths_1, TC, ICIT, Physics, C'),(2,'Maths_2, POM, DE, DS, DBMS'),(3,'Maths_3, CA, FEDT, POA, C++'),(4,'Maths_4, WT, Java, SE, CN'),(5,'CG, Ecom, OS, BE'),(6,'CG, Ecom, OS, ST'),(7,'CG, Ecom, OS, PHP'),(8,'DWH & DM, MC, Linux, NS'),(9,'DWH & DM, MC, Linux, AI');
/*!40000 ALTER TABLE `subjectList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `subjectList` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectList` (`subjectList`),
  CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`subjectList`) REFERENCES `subjectList` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Maths_1',1),(2,'TC',1),(3,'ICIT',1),(4,'Physics',1),(5,'C',1),(6,'Maths_2',2),(7,'POM',2),(8,'DE',2),(9,'DS',2),(10,'DBMS',2),(11,'Maths_3',3),(12,'CA',3),(13,'FEDT',3),(14,'POA',3),(15,'C++',3),(16,'Maths_4',4),(17,'WT',4),(18,'Java',4),(19,'SE',4),(20,'CN',4),(21,'CG',5),(22,'ECOM',5),(23,'OS',5),(24,'BE',5),(25,'ST',6),(26,'PHP',7),(27,'DWH & DM',8),(28,'MC',8),(29,'LINUX',8),(30,'NS',8),(31,'AI',9);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'AttendanceDB'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-14 17:00:04
