/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package springModel.user;

/**
 *
 * @author NAUTILUS
 */
public class BookingInfo {
    private String hotelID;
    private String hotelName;
    private String branchID;
    private String roomID;

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
    
    public String getBranchID() {
        return branchID;
    }

    public void setBranchID(String branchID) {
        this.branchID = branchID;
    }

    public String getRoomID() {
        return roomID;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }
}
