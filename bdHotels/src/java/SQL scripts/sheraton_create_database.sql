mysql --user=root -p
nautilus

CREATE USER 'sheraton'@'localhost' IDENTIFIED BY 'Omeca256';
SELECT User, Host, Password FROM mysql.user;
GRANT ALL PRIVILEGES ON *.* TO 'sheraton'@'localhost' WITH GRANT OPTION;
SHOW GRANTS FOR 'sheraton'@'localhost';

commit;
exit;

mysql --user=sheraton -p
Omeca256

create database hotelSheraton;
use hotelSheraton


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
(3,24,5,'kamal ataturk avenue','rajshahi','rajshahi','rajshahi',1,'fx-4685923','01818453235','26302548');






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