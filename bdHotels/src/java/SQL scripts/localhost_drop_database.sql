mysql --user=root -p
dp6276

drop database online_hotel_reservation;

commit;
exit;


mysql --user=santamaria -p
Omeca256

drop database hotelSantamaria;

commit;
exit;


mysql --user=sheraton -p
Omeca256

drop database hotelSheraton;

commit;
exit;

mysql --user=root -p
dp6276

drop user 'sheraton'@'localhost';
drop user 'santamaria'@'localhost';
drop user 'bdhotels'@'localhost';

commit;
exit;

