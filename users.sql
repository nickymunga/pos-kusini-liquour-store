/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.21 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `tec_users` (
	`username` varchar (300),
	`password` varchar (120),
	`salt` varchar (120),
	`email` varchar (300),
	`activation_code` varchar (120),
	`forgotten_password_code` varchar (120),
	`forgotten_password_time` int (10),
	`remember_code` varchar (120),
	`created_on` int (10),
	`last_login` int (10),
	`active` tinyint (3),
	`first_name` varchar (150),
	`last_name` varchar (150),
	`company` varchar (300),
	`phone` varchar (60),
	`avatar` varchar (165),
	`gender` varchar (60),
	`group_id` int (10),
	`store_id` int (11)
); 
insert into `tec_users` (`username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) values('admin','243f8d261af9f29d246f3c233d24c99bc162f3d5',NULL,'nickymunga@gmail.com',NULL,NULL,NULL,NULL,'1435204774','1592481594','1','Byte','Brain','Byte Brain','0720578842',NULL,'male','1','1');
insert into `tec_users` (`username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) values('kusini','95eaa3a9721437ecd30f80c71e92e66d7c4b51f9',NULL,'kusinitavern@gmail.com',NULL,NULL,NULL,'5b8b4d2eee53c77d30b61621a0f49b57feb8ec04','1592235860','1594814243','1','Kusini','Tavern',NULL,'0701 520441',NULL,'male','1','1');
insert into `tec_users` (`username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) values('nmbuthia','54f3236d17d61aed7e887e952b4bf20a6b6979ce',NULL,'nickcy.mbuthia@gmail.com',NULL,NULL,NULL,'fbf46b52c6227839e94f7e65b884e49960449a5b','1592235978','1592656898','1','Nickcy','Mbuthia',NULL,'0701 520441',NULL,'female','1','1');
insert into `tec_users` (`username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) values('skuria','b5fdb38de3d320983bbf50ef900dd0adcb787056',NULL,'skuria@kusini-tavern.com',NULL,NULL,NULL,'85eac2a3d2755efe013fb81786ce616ec13075ed','1592236080','1593836729','1','Shadrack','Kuria',NULL,'0701 520441',NULL,'male','1','1');
insert into `tec_users` (`username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) values('smasha','60595a420b11dc5a20d17a4c2b3fe65f577b2c0c',NULL,'schengo@gmail.com',NULL,NULL,NULL,'9a681451e6832527d6b37e6be920d88f07a59a60','1592236137','1593365466','1','Simon','Masha',NULL,'0701 520441',NULL,'male','1','1');
insert into `tec_users` (`username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) values('mkasembeli','95eaa3a9721437ecd30f80c71e92e66d7c4b51f9',NULL,'barman@kusini-tavern.com',NULL,NULL,NULL,'5b8b4d2eee53c77d30b61621a0f49b57feb8ec04','1592236213','1593869460','1','Manfred','Kasembeli',NULL,'0701 520441',NULL,'male','1','1');
insert into `tec_users` (`username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) values('mshiboka','776d7d782b1e692e650dfd8c1f03f03668411d21',NULL,'mshiboka@kusini-tavern.com',NULL,NULL,NULL,'361e3bb0071d2e751c8d1ce3abcb0b84514768d1','1592236333','1593799704','1','Maureen','Shiboka',NULL,'0701 520441',NULL,'female','3','1');
insert into `tec_users` (`username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) values('ckarisa','fc23a7b525c581604fab815d5c8e24ce50847547',NULL,'ckarisa@kusini-tavern.com',NULL,NULL,NULL,'90d91a0ec5645c72c810572b4ac3c292e5104917','1592236384','1593803000','1','Christine','Karisa',NULL,'0701 520441',NULL,'female','3','1');
insert into `tec_users` (`username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) values('jsaid','cdaf8a9540a3b7192db10146e5219f1b860e2432',NULL,'jsaid@kusini-tavern.com',NULL,NULL,NULL,'41fc1ee93b4459dc2382c18b3a13abc7b1700d0d','1592236493','1593801394','1','Juma','Said',NULL,'0701 520441',NULL,'male','3','1');
insert into `tec_users` (`username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) values('agodana','05911f4e294ec82735e55a4f9a63132158ef4da8',NULL,'kusini@gmail.com',NULL,NULL,NULL,'62ce9759ab7d2ac39d6c26a9f9a7ab169febd64d','1592484164','1593451797','1','Amina','Godana',NULL,'+254733380411',NULL,'female','2','1');
insert into `tec_users` (`username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) values('edna','8e1f5582b695c5f242703333d6303402b518383b',NULL,'muindiwamalwa@gmail.com','23a6761d1b5864af6862b2742d68e572809bfad3',NULL,NULL,'2d5f1ecaaab6540da292b04f0d7f10f936d99b3b','1593598884','1593799289','1','edna','muindi',NULL,'0720653110',NULL,'female','3','1');
