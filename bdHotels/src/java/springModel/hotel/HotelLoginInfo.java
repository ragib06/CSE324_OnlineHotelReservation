/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package springModel.hotel;

/**
 *
 * @author NAUTILUS
 */
public class HotelLoginInfo {
    private String username;
    private String password;
    private int hotelId;
    private String hotelName;

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }


    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    
}
