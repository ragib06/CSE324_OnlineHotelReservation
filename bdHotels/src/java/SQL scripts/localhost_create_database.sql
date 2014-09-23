mysql --user=root -p
nautilus
        
CREATE USER 'bdhotels'@'localhost' IDENTIFIED BY 'bdhotels';
SELECT User, Host, Password FROM mysql.user;
GRANT ALL PRIVILEGES ON *.* TO 'bdhotels'@'localhost' WITH GRANT OPTION;
SHOW GRANTS FOR 'bdhotels'@'localhost';

CREATE USER 'santamaria'@'localhost' IDENTIFIED BY 'Omeca256';
SELECT User, Host, Password FROM mysql.user;
GRANT ALL PRIVILEGES ON *.* TO 'santamaria'@'localhost' WITH GRANT OPTION;
SHOW GRANTS FOR 'santamaria'@'localhost';

CREATE USER 'sheraton'@'localhost' IDENTIFIED BY 'Omeca256';
SELECT User, Host, Password FROM mysql.user;
GRANT ALL PRIVILEGES ON *.* TO 'sheraton'@'localhost' WITH GRANT OPTION;
SHOW GRANTS FOR 'sheraton'@'localhost';

commit;
exit;

mysql --user=bdhotels -p
bdhotels

create database online_hotel_reservation;
use online_hotel_reservation;

create table customer
(
	customerId int not null AUTO_INCREMENT,
	first_name varchar(20) not null,
	middle_name varchar(20),
	last_name varchar(20) not null,
	apartmentNo int not null,
	streetNo int not null,
	streetName varchar(40) not null,
	city varchar(20) not null,
	district varchar(20) not null,
	division varchar(20) not null,
	areaCode int not null,
	email varchar(35),
	alternateEmail varchar(35),
	username varchar(30) not null,
	password varchar (30) not null,
        mobile_no varchar(15),
        telephone_no varchar(15),
	primary key(customerId),
	check(apartment_no>= 0),
	check(street_no>= 0),
	check(areaCode>= 0)
)ENGINE=INNODB;

insert into customer (first_name,middle_name,last_name,apartmentNo,streetNo,streetName,city,district,division,
areaCode,email,alternateEmail,username,password,mobile_no,telephone_no) values ('shubhra','kanti','karmaker',18,2,'Haji ismail Road','khulna','khulna','khulna',4,
'kanti_shubhra@yahoo.com','drtcp_drtcp@yahoo.com','santu','sunrise','01718019966','041732082');




create table hotel
(
	hotelId int not null AUTO_INCREMENT,
	name varchar(50) not null,
	username varchar(30) not null,
	password varchar (30) not null,
	ipaddress varchar(15) not null,
	contextPath varchar(30) not null,
	port varchar(5) not null,
	INDEX hotel_ind (hotelId),
	primary key(hotelId)
)ENGINE=INNODB;

insert into hotel (name,username,password, ipaddress, port,contextPath) values ('Santamaria','santa','maria', 'localhost', '8084','hotelSantamaria');
insert into hotel (name,username,password, ipaddress, port,contextPath) values ('Sheraton','shera','ton', 'localhost', '8084','hotelSheraton');



create table Advertisements
(
	hotelId int not null,
	AdvertisementId int not null AUTO_INCREMENT,
	title varchar(50) not null,
	text varchar(1000) not null,
	pictureUrl varchar(100),
	INDEX hotel_ind (hotelId),
	valid varchar(3) not null,
 	primary key(AdvertisementId),
	foreign key (hotelId) references hotel(hotelId) on delete cascade,
	check (valid in('yes','no'))
)ENGINE=INNODB;


insert into Advertisements (hotelId,title,text,valid) values (1,'enjoy your summer in santamaria','enjoy', 'yes');



create table Offers
(
	hotelId int not null,
	offerId int not null AUTO_INCREMENT,
	title varchar(50) not null,
	text varchar(1000) not null,
	price double not null,
	INDEX hotel_ind (hotelId),
 	primary key(offerId),
	foreign key (hotelId) references hotel(hotelId) on delete cascade,
	check(price>= 0)
)ENGINE=INNODB;

insert into Offers (hotelId,title,text,price) values (1,'50% off','enjoy 50% off',1000.80);



create table travelGuide
(
	hotelId int not null,
	travelGuideId int not null AUTO_INCREMENT,
	title varchar(50) not null,
	text varchar(1000) not null,
	pictureUrl varchar(100),
	valid varchar(3) not null,
	INDEX hotel_ind (hotelId),
 	primary key(travelGuideId),
	foreign key (hotelId) references hotel(hotelId) on delete cascade,
	check (valid in ('yes','no'))
)ENGINE=INNODB;


insert into travelGuide (hotelId,title,text,valid) values (1,'roam in coxs bazar','1. enjoy your summer in santamaria 2. go to sea','yes'); 






create table hotel_review
(
	hotelId int,
	customerId int,
	reviewId int not null AUTO_INCREMENT,
	reviewDate date not null,
	text varchar(1000) not null,
	INDEX hotel_ind (hotelId),
	INDEX customer_ind (customerId),
	primary key(reviewId),
	foreign key (hotelId) references hotel(hotelId) on delete cascade,
	foreign key (customerId) references customer(customerId) on delete cascade
)ENGINE=INNODB;


insert into hotel_review (hotelId,customerId,reviewDate,text) values (1,1,curdate(),'valo');





commit;
exit;






mysql --user=santamaria -p
Omeca256

create database hotelSantamaria;
use hotelSantamaria;


create table branch	(
	branch_id int,
	apartment_no int not null,
	street_no int not null,
	street_name varchar(20) not null,
	city varchar(20) not null,
	district varchar(20) not null,
	division varchar(20) not null,
	areaCode int not null,
	Fax_no varchar(10),
        mobile_no varchar(15),
        telephone_no varchar(15),
	primary key(branch_id),
	check(apartment_no>= 0),
	check(street_no>= 0)
)ENGINE=INNODB;


insert into branch (branch_id,apartment_no,street_no,street_name,city,district,division,areaCode,Fax_no,mobile_no,telephone_no) values
(1,24,5,'kamal ataturk avenue','dhaka','dhaka','dhaka',1,'fx-4685923','01711229993','0217354695');
insert into branch (branch_id,apartment_no,street_no,street_name,city,district,division,areaCode,Fax_no,mobile_no,telephone_no) values
(2,24,5,'kamal ataturk avenue','khulna','khulna','khulna',1,'fx-4685923','01712030499','027895324');
insert into branch (branch_id,apartment_no,street_no,street_name,city,district,division,areaCode,Fax_no,mobile_no,telephone_no) values
(3,24,5,'kamal ataturk avenue','rajshahi','rajshahi','rajshahi',1,'fx-4685923','01818453235','025478566');







create table room
(
	branch_id int not null,
	roomId int not null,
	floorNo int not null,
	noOfBeds int not null,
	sideView varchar(30),
	rent double not null,
	INDEX branch_ind (branch_id),
	primary key(branch_id,roomId),
	foreign key (branch_id) references branch(branch_id) on delete cascade,
	check(roomId>= 0),
	check(noOfBeds>= 0),
	check(rent>= 0)
)ENGINE=INNODB;




insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,401,3,2,'garden',500.25);
insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,402,3,1,'river',300.25);
insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,403,3,3,'seabeach',800.25);
insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,404,3,1,'garden',300.25);
insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,101,3,2,'river',500.25);
insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,102,3,2,'seabeach',500.25);
insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,103,3,2,'garden',500.25);
insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,104,3,4,'river',1000.25);
insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,105,3,2,'seabeach',500.25);




create table booking
(
	branch_id int not null,
	roomId int not null,
	customerId int,
	date_of_booking date,
	booking_entry int not null AUTO_INCREMENT,
	check_in_date date not null,
	check_out_date date not null,
	advance double default '0.0',
	INDEX room_ind (branch_id,roomId),
	primary key(booking_entry),
	foreign key (branch_id,roomId) references room(branch_id,roomId) on delete cascade,
	check(advance>= 0)
)ENGINE=INNODB;


insert into booking (branch_id,roomId,customerId,date_of_booking,check_in_date,check_out_date,advance) values
(1,401,1,curdate(),'2010-10-24','2010-10-28',200.5);




DELIMITER //

CREATE PROCEDURE Book(
	OUT id INT,
	IN b_id INT,
	IN rId INT,
        IN cId INT,
	IN c_in_date date,
	IN c_out_date date,
	IN advnnc double
)
BEGIN
	DECLARE roomfree INT default 0;
	select count(*) into roomfree from room where room.branch_id=
b_id and room.roomId=rId and
not exists(select * from booking where
((c_in_date>=check_in_date and c_in_date<=check_out_date)
or(c_out_date>=check_in_date and c_out_date<=check_out_date)
or (c_in_date<=check_in_date and c_out_date>=check_out_date))
and booking.roomId=room.roomId);
	select -1 into id;
	IF roomfree=1 THEN
      		insert into booking (branch_id,roomId,customerId,date_of_booking,check_in_date,check_out_date,advance) values
(b_id,rId,cId,curdate(),c_in_date,c_out_date,advnnc);
	select LAST_INSERT_ID() into id;
   	END IF;
END//

DELIMITER ;






commit;
exit;






mysql --user=sheraton -p
Omeca256

create database hotelSheraton;
use hotelSheraton;


create table branch	(
	branch_id int,
	apartment_no int not null,
	street_no int not null,
	street_name varchar(20) not null,
	city varchar(20) not null,
	district varchar(20) not null,
	division varchar(20) not null,
	areaCode int not null,
	Fax_no varchar(10),
        mobile_no varchar(15),
        telephone_no varchar(15),
	primary key(branch_id),
	check(apartment_no>= 0),
	check(street_no>= 0)
)ENGINE=INNODB;

insert into branch (branch_id,apartment_no,street_no,street_name,city,district,division,areaCode,Fax_no,mobile_no,telephone_no) values
(1,24,5,'kamal ataturk avenue','dhaka','dhaka','dhaka',1,'fx-4685923','01711229993','0217354695');
insert into branch (branch_id,apartment_no,street_no,street_name,city,district,division,areaCode,Fax_no,mobile_no,telephone_no) values
(2,24,5,'kamal ataturk avenue','khulna','khulna','khulna',1,'fx-4685923','01712030499','027895324');
insert into branch (branch_id,apartment_no,street_no,street_name,city,district,division,areaCode,Fax_no,mobile_no,telephone_no) values
(3,24,5,'kamal ataturk avenue','rajshahi','rajshahi','rajshahi',1,'fx-4685923','01818453235','025478566');





create table room
(
	branch_id int not null,
	roomId int not null,
	floorNo int not null,
	noOfBeds int not null,
	sideView varchar(30),
	rent double not null,
	INDEX branch_ind (branch_id),
	primary key(branch_id,roomId),
	foreign key (branch_id) references branch(branch_id) on delete cascade,
	check(roomId>= 0),
	check(noOfBeds>= 0),
	check(rent>= 0)
)ENGINE=INNODB;




insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,201,3,2,'garden',500.25);
insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,202,3,1,'river',300.25);
insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,203,3,3,'seabeach',800.25);
insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,204,3,1,'garden',300.25);
insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,301,3,2,'river',500.25);
insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,302,3,2,'seabeach',500.25);
insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,303,3,2,'garden',500.25);
insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,304,3,4,'river',1000.25);
insert into room (branch_id,roomId,floorNo,noOfBeds,sideView,rent) values (1,305,3,2,'seabeach',500.25);




create table booking
(
	branch_id int not null,
	roomId int not null,
	customerId int,
	date_of_booking date,
	booking_entry int not null AUTO_INCREMENT,
	check_in_date date not null,
	check_out_date date not null,
	advance double default '0.0',
	INDEX room_ind (branch_id,roomId),
	primary key(booking_entry),
	foreign key (branch_id,roomId) references room(branch_id,roomId) on delete cascade,
	check(advance>= 0)
)ENGINE=INNODB;



insert into booking (branch_id,roomId,customerId,date_of_booking,check_in_date,check_out_date,advance) values
(1,201,1,curdate(),'2010-10-24','2010-10-28',200.5);



DELIMITER //

CREATE PROCEDURE Book(
	OUT id INT,
	IN b_id INT,
	IN rId INT,
        IN cId INT,
	IN c_in_date date,
	IN c_out_date date,
	IN advnnc double
)
BEGIN
	DECLARE roomfree INT default 0;
	select count(*) into roomfree from room where room.branch_id=
b_id and room.roomId=rId and
not exists(select * from booking where
((c_in_date>=check_in_date and c_in_date<=check_out_date)
or(c_out_date>=check_in_date and c_out_date<=check_out_date)
or (c_in_date<=check_in_date and c_out_date>=check_out_date))
and booking.roomId=room.roomId);
	select -1 into id;
	IF roomfree=1 THEN
      		insert into booking (branch_id,roomId,customerId,date_of_booking,check_in_date,check_out_date,advance) values
(b_id,rId,cId,curdate(),c_in_date,c_out_date,advnnc);
	select LAST_INSERT_ID() into id;
   	END IF;
END//

DELIMITER ;




commit;
exit;



