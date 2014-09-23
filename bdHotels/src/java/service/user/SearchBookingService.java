/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service.user;

import hibernateModel.HibernateUtil;
import hibernateModel.Hotel;
import springModel.hotel.HotelRooms;
import springModel.hotel.RoomInfo;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.Vector;
import java.util.StringTokenizer;
import javax.xml.namespace.QName;
import org.hibernate.Session;



/**
 *
 * @author NAUTILUS
 */
public class SearchBookingService {

    Session session = null;
    List hotels = null;
    Vector<HotelRooms> result = null;

    public Vector<HotelRooms> searchRoom(java.lang.String location, int noOfDays, java.lang.String checkInDate, int noOfBeds, int floorNo, java.lang.String sideView,double rent) throws MalformedURLException {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        hotels = session.createQuery("from Hotel").list();

        System.out.println("Successfully return hotelBranches from database");
        session.getTransaction().commit();


        result = new Vector<HotelRooms>();
        for (int i = 0; i < hotels.size(); i++) {                               //iterate hotels
            Hotel hotel = (Hotel)hotels.get(i);                                 //current hotel
            HotelRooms hotelRooms = new HotelRooms();
            hotelRooms.setHotelID(""+((Hotel) hotels.get(i)).getHotelId());
            hotelRooms.setHotelName(((Hotel) hotels.get(i)).getName());

            org.services.reservation.ReservationWSService service = new org.services.reservation.ReservationWSService(new URL("http://" + hotel.getIpaddress() + ":" + hotel.getPort() + "/" + hotel.getContextPath() + "/ReservationWS?wsdl"), new QName("http://reservation.services.org/", "ReservationWSService"));
            org.services.reservation.ReservationWS port = service.getReservationWSPort();

            Vector<RoomInfo> roomInfo = parseRoomInfo(port.serachForRoom(location, noOfDays, checkInDate, noOfBeds, floorNo, sideView,rent));

            if(roomInfo.isEmpty() == false){
                hotelRooms.setRooms(roomInfo);
                result.add(hotelRooms);
            }
        }
        
        return result;
    }

    public Vector<RoomInfo> parseRoomInfo(String resultString) {
        Vector<RoomInfo> availableRooms = new Vector<RoomInfo>();

        StringTokenizer rows = new StringTokenizer(resultString, ";");

        while (rows.hasMoreTokens()) {
            RoomInfo thisRoom = new RoomInfo();
            StringTokenizer attributes = new StringTokenizer(rows.nextToken(), ",");

            thisRoom.setBranchID(attributes.nextToken());
            thisRoom.setApartmentNo(attributes.nextToken());
            thisRoom.setStreetNo(attributes.nextToken());
            thisRoom.setStreetName(attributes.nextToken());
            thisRoom.setCity(attributes.nextToken());
            thisRoom.setDistrict(attributes.nextToken());
            thisRoom.setDivision(attributes.nextToken());
            thisRoom.setAreaCode(attributes.nextToken());
            thisRoom.setFaxNo(attributes.nextToken());
            thisRoom.setRoomID(attributes.nextToken());
            thisRoom.setFloorNo(attributes.nextToken());
            thisRoom.setNoOfBeds(attributes.nextToken());
            thisRoom.setSideView(attributes.nextToken());
            thisRoom.setRent(attributes.nextToken());

            availableRooms.add(thisRoom);
            //System.out.println("Street Name: " + thisRoom.getStreetName());
        }
    
        return availableRooms;
    }
}
