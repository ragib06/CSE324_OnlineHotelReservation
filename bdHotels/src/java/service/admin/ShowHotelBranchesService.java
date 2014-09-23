/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service.admin;

import hibernateModel.HibernateUtil;
import hibernateModel.Hotel;
import java.net.URL;
import springModel.hotel.HotelBranch;
import java.util.List;
import java.util.StringTokenizer;
import java.util.Vector;
import javax.xml.namespace.QName;
import org.hibernate.Session;
/**
 *
 * @author NAUTILUS
 */
public class ShowHotelBranchesService {
    public Vector<HotelBranch> getHotelBranch(String hotelID){
        Session session=null;
        List result=null;
        try
        {
              session= HibernateUtil.getSessionFactory().getCurrentSession();
              session.beginTransaction();
              result=session.createQuery("from Hotel where hotelId="+hotelID).list();
              Hotel myHotel=(Hotel)result.get(0);
              System.out.println("Successfully return hotelBranches from database");
              session.getTransaction().commit();
              
              org.services.reservation.ReservationWSService service = new org.services.reservation.ReservationWSService(new URL("http://" + myHotel.getIpaddress() + ":" + myHotel.getPort() + "/" + myHotel.getContextPath() + "/ReservationWS?wsdl"), new QName("http://reservation.services.org/", "ReservationWSService"));
              org.services.reservation.ReservationWS port = service.getReservationWSPort();           
              return  parseRoomInfo(port.searchBranch(myHotel.getHotelId()));
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    
    public Vector<HotelBranch> parseRoomInfo(String resultString)
    {
        Vector<HotelBranch> branches = new Vector<HotelBranch>();

        StringTokenizer rows = new StringTokenizer(resultString, ";");

        while (rows.hasMoreTokens()) {
            HotelBranch thisBranch = new HotelBranch();
            StringTokenizer attributes = new StringTokenizer(rows.nextToken(), ",");
            thisBranch.setId(Integer.parseInt(attributes.nextToken()));
            thisBranch.setApartmentNumber(Integer.parseInt(attributes.nextToken()));
            thisBranch.setStreetNumber(attributes.nextToken());
            thisBranch.setStreetName(attributes.nextToken());
            thisBranch.setCity(attributes.nextToken());
            thisBranch.setDistrict(attributes.nextToken());
            thisBranch.setDivision(attributes.nextToken());
            thisBranch.setAreacode(Integer.parseInt(attributes.nextToken()));
            thisBranch.setFaxNumber(attributes.nextToken());
            thisBranch.setMobileNumber(attributes.nextToken());
            thisBranch.setPhoneNumber(attributes.nextToken());
            branches.add(thisBranch);
            System.out.println("Street Name: " + thisBranch.getCity());
        }
        return branches;
    }
}
