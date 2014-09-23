/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package springModel.hotel;

import java.util.Vector;

/**
 *
 * @author NAUTILUS
 */
public class HotelRooms {

    private String hotelID;
    private String hotelName;
    private Vector<RoomInfo> rooms;

    public String getHotelID() {
        return hotelID;
    }

    public void setHotelID(String hotelID) {
        this.hotelID = hotelID;
    }
    
    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public Vector<RoomInfo> getRooms() {
        return rooms;
    }

    public void setRooms(Vector<RoomInfo> rooms) {
        this.rooms = rooms;
    }
}
