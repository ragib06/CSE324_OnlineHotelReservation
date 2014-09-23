
select * from room,branch  where room.branch_id=branch.branch_id
and branch.district='dhaka' and room.noOfBeds=2 and not exists(select * from booking where  
(('2010-10-21'>=check_in_date and '2010-10-21'<=check_out_date)
or(DATE_ADD('2010-10-21', INTERVAL 10 DAY)>=check_in_date and 
DATE_ADD('2010-10-21', INTERVAL 10 DAY)<=check_out_date)
or ('2010-10-21'<=check_in_date and 
DATE_ADD('2010-10-21', INTERVAL 10 DAY)>=check_out_date))
and booking.roomId=room.roomId);