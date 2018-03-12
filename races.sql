USE `races`;

/*Table structure for table `competitors` */

DROP TABLE IF EXISTS `competitors`;

CREATE TABLE `competitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `position` int(2) DEFAULT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

/*Data for the table `competitors` */

insert  into `competitors`(`id`,`name`,`position`,`meeting_id`) values (1,'Competitor 1',1,1),(2,'Competitor 2',3,4),(3,'Competitor 3',4,6),(4,'Competitor 4',6,2),(5,'Competitor 5',8,5),(6,'Competitor 6',9,7),(7,'Competitor 7',10,2),(9,'Competitor 9',14,8),(10,'Competitor 10',14,3),(12,'Competitor 12',18,8),(13,'Competitor 13',18,3),(16,'Competitor 16',2,1),(17,'Competitor 17',4,4),(18,'Competitor 18',5,6),(19,'Competitor 19',7,2),(20,'Competitor 20',9,5),(21,'Competitor 21',10,7),(22,'Competitor 22',11,7),(23,'Competitor 23',11,2),(25,'Competitor 25',15,8),(26,'Competitor 26',15,3),(28,'Competitor 28',19,8),(29,'Competitor 29',19,4),(31,'Competitor 31',1,5),(32,'Competitor 32',3,1),(33,'Competitor 33',5,4),(34,'Competitor 34',6,6),(35,'Competitor 35',8,2),(36,'Competitor 36',10,5),(37,'Competitor 37',12,7),(38,'Competitor 38',12,2),(40,'Competitor 40',16,8),(41,'Competitor 41',16,3),(43,'Competitor 43',20,8),(44,'Competitor 44',21,8),(45,'Competitor 45',20,4),(46,'Competitor 46',1,4),(47,'Competitor 47',2,6),(48,'Competitor 48',4,1),(49,'Competitor 49',6,5),(50,'Competitor 50',7,6),(51,'Competitor 51',9,2),(53,'Competitor 53',13,7),(54,'Competitor 54',13,2),(56,'Competitor 56',17,8),(57,'Competitor 57',17,3),(60,'Competitor 60',21,4),(61,'Competitor 61',2,4),(62,'Competitor 62',3,6),(63,'Competitor 63',5,1),(64,'Competitor 64',7,5),(65,'Competitor 65',8,6);

/*Table structure for table `meeting` */

DROP TABLE IF EXISTS `meeting`;

CREATE TABLE `meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  `race_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting__race_type_id` (`race_type_id`),
  CONSTRAINT `meeting__race_type_id` FOREIGN KEY (`race_type_id`) REFERENCES `race_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `meeting` */

insert  into `meeting`(`id`,`location`,`race_type_id`) values (1,'Bunbury',1),(2,'Kapunda',1),(3,'Grafton',2),(4,'Seoul',2),(5,'Armidale',3),(6,'Collie',3),(7,'Collie',2),(8,'Kapunda',2);

/*Table structure for table `race_type` */

DROP TABLE IF EXISTS `race_type`;

CREATE TABLE `race_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `race_type` */

insert  into `race_type`(`id`,`name`) values (1,'Thoroughbred'),(2,'Greyhounds'),(3,'Harness');

/*Table structure for table `races` */

DROP TABLE IF EXISTS `races`;

CREATE TABLE `races` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) DEFAULT NULL,
  `close_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `race_meeting__meeting_id` (`meeting_id`),
  CONSTRAINT `race_meeting__meeting_id` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `races` */

insert  into `races`(`id`,`meeting_id`,`close_time`) values (1,3,'2018-03-13 08:03:00'),(2,4,'2018-03-13 08:06:00'),(3,1,'2018-03-12 08:09:00'),(4,5,'2018-03-12 08:12:00'),(5,2,'2018-03-12 23:15:00'),(6,6,'2018-03-12 23:18:00'),(7,5,'2018-03-13 22:21:00'),(8,8,'2018-03-13 22:24:00'),(9,2,'2018-03-13 21:27:00'),(10,4,'2018-03-13 23:30:00'),(11,5,'2018-03-13 23:33:00'),(12,7,'2018-03-13 22:36:00'),(13,8,'2018-03-13 21:29:00'),(14,6,'2018-03-12 21:59:00'),(15,NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`age`) values (1,'natilin',32),(2,'danilin',35),(3,'cocolinda',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
