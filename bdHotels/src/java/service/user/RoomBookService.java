/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service.user;

import springModel.user.BookingInfo;
import springModel.user.SearchBookingForm;
import hibernateModel.HibernateUtil;
import hibernateModel.Hotel;

import org.hibernate.Session;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.xml.namespace.QName;

/**
 *
 * @author NAUTILUS
 */
public class RoomBookService {

    private String DATE_FORMAT = "yyyy-MM-dd";

    Session session=null;
    List hotels=null;

    public int bookRoom(BookingInfo bi, SearchBookingForm sbf) throws MalformedURLException{
        
        session= HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        hotels=session.createQuery("from Hotel where hotelId="+bi.getHotelID()).list();
        Hotel myHotel=(Hotel)hotels.get(0);
        session.getTransaction().commit();

        org.services.reservation.ReservationWSService service = new org.services.reservation.ReservationWSService(new URL("http://"+myHotel.getIpaddress()+":"+myHotel.getPort()+"/"+myHotel.getContextPath()+"/ReservationWS?wsdl"),new QName("http://reservation.services.org/", "ReservationWSService"));
        org.services.reservation.ReservationWS port = service.getReservationWSPort();


        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(DATE_FORMAT);
        Calendar cal = Calendar.getInstance();
        cal.set(sbf.getYear(), sbf.getMonth()-1, sbf.getDay());             //calender month values are 0 based (i.e. 0 for january)
        String checkIn = sdf.format(cal.getTime());
        cal.add(Calendar.DATE, sbf.getNoOfDays());
        String checkOut = sdf.format(cal.getTime());

        return port.giveBooking(Integer.parseInt(bi.getBranchID()), Integer.parseInt(bi.getRoomID()), 1, checkIn, checkOut, 500.00);
    }
}
