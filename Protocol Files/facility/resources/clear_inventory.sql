/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
DROP TABLE IF EXISTS `volumes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `volumes` (
  `plate_id` int(11) NOT NULL,
  `row` int(11) NOT NULL,
  `col` int(11) NOT NULL,
  `volume` double NOT NULL,
  KEY `plate_id` (`plate_id`),
  CONSTRAINT `0_22` FOREIGN KEY (`plate_id`) REFERENCES `plates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
delete from locations;
delete from protocol_steps;
delete from storexdevice;
delete from plates;
update plategroups set plate_id = 0 where group_id in (select id from plategroup_names where type = 0);
delete from plategroups where group_id in (select id from plategroup_names where type = 1);
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;