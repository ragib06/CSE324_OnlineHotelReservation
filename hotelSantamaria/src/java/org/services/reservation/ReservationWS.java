/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.services.reservation;




import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import java.sql.*;


/**
 *
 * @author santu
 */
@WebService()
public class ReservationWS {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "serachForRoom")
    public String serachForRoom(@WebParam(name = "location")
    final String location, @WebParam(name = "noOfDays")
    final int noOfDays, @WebParam(name = "checkInDate")
    final String checkInDate, @WebParam(name = "noOfBeds")
    final int noOfBeds, @WebParam(name = "floorNo")
    final int floorNo, @WebParam(name = "sideView")
    final String sideView, @WebParam(name = "price")
    final double price) {
        //TODO write your implementation code here:
        ResultSet rs=null;
        String result="";
        String queryString="select * from room,branch  where room.branch_id=branch.branch_id and branch.district='"+location+"' and room.noOfBeds="+noOfBeds+" and not exists(select * from booking where  (('"+checkInDate+"'>=check_in_date and '"+checkInDate+"'<=check_out_date) or(DATE_ADD('"+checkInDate+"', INTERVAL "+noOfDays+" DAY)>=check_in_date and DATE_ADD('"+checkInDate+"', INTERVAL "+noOfDays+" DAY)<=check_out_date) or ('"+checkInDate+"'<=check_in_date and DATE_ADD('"+checkInDate+"', INTERVAL "+noOfDays+" DAY)>=check_out_date)) and booking.roomId=room.roomId)";
        if(floorNo!=0)
        {
            queryString+=" and room.floorNo="+floorNo;
        }
        if(sideView!=null)
        {
            queryString+=" and room.sideView='"+sideView+"'";
        }        
        if(price>0.0)
        {
            queryString+=" and room.rent<="+price;
        }
        System.out.println(queryString);
        try
        {
            MySQLConnect dbc=new MySQLConnect("localhost","hotelSantamaria","santamaria","Omeca256");
            rs=dbc.searchDB(queryString);

            while(rs.next())
            {
                result=result+rs.getInt("branch_id");
                result=result+","+rs.getInt("apartment_no");
                result=result+","+rs.getInt("street_no");
                result=result+","+rs.getString("street_name");
                result=result+","+rs.getString("city");
                result=result+","+rs.getString("district");
                result=result+","+rs.getString("division");
                result=result+","+rs.getInt("areaCode");
                result=result+","+rs.getString("Fax_no");
                result=result+","+rs.getInt("roomId");
                result=result+","+rs.getInt("floorNo");
                result=result+","+rs.getInt("noOfBeds");
                result=result+","+rs.getString("sideView");
                result=result+","+rs.getDouble("rent");
                if(rs.isLast()==false)
                {
                    result=result+";";

                }
            }
            dbc.close();
        }catch(Exception e)
        {
            System.out.println(e.toString());
        }
        return result;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GiveBooking")
    public int GiveBooking(@WebParam(name = "branch_id")
    int branch_id, @WebParam(name = "roomId")
    int roomId, @WebParam(name = "customerId")
    int customerId, @WebParam(name = "check_in_date")
    String check_in_date, @WebParam(name = "check_out_date")
    String check_out_date, @WebParam(name = "advance")
    double advance) {
        //TODO write your implementation code here:
        int result=-1;
        try
        {
            MySQLConnect dbc=new MySQLConnect("localhost","hotelSantamaria","santamaria","Omeca256");
            String simpleProc = "{ call Book(?,?,?,?,?,?,?) }";
            result=dbc.executeProcedure(simpleProc,branch_id,roomId,customerId,check_in_date,check_out_date,advance);
            dbc.close();
        }
        catch(Exception e)
        {
            System.out.println("Booking failed");
            return result;
        }
        return result;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "searchBranch")
    public String searchBranch(@WebParam(name = "hotelId")
    final int hotelId) {
        //TODO write your implementation code here:
        ResultSet rs=null;
        String result="";
        String queryString="select * from branch";
        try
        {
            MySQLConnect dbc=new MySQLConnect("localhost","hotelSantamaria","santamaria","Omeca256");
            rs=dbc.searchDB(queryString);

            while(rs.next())
            {
                result=result+rs.getInt("branch_id");
                result=result+","+rs.getInt("apartment_no");
                result=result+","+rs.getInt("street_no");
                result=result+","+rs.getString("street_name");
                result=result+","+rs.getString("city");
                result=result+","+rs.getString("district");
                result=result+","+rs.getString("division");
                result=result+","+rs.getInt("areaCode");
                result=result+","+rs.getString("Fax_no");
                result=result+","+rs.getString("mobile_no");
                result=result+","+rs.getString("telephone_no");
                if(rs.isLast()==false)
                {
                    result=result+";";

                }
            }
            dbc.close();
        }catch(Exception e)
        {
            System.out.println(e.toString());
        }
        return result;
    }
}

