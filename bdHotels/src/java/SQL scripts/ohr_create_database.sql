mysql --user=root -p
dp6276
        
CREATE USER 'bdhotels'@'localhost' IDENTIFIED BY 'bdhotels';
SELECT User, Host, Password FROM mysql.user;
GRANT ALL PRIVILEGES ON *.* TO 'bdhotels'@'localhost' WITH GRANT OPTION;
SHOW GRANTS FOR 'bdhotels'@'localhost';

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




commit;
exit;
