/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package springModel.hotel;

/**
 *
 * @author NAUTILUS
 */
public class Advertise {
    private int advertisementId;
    private byte[] advertiseImageFile;
    private String hotelname;
    private String title;
    private String text;
    private String pictureUrl;

    public int getAdvertisementId() {
        return advertisementId;
    }

    public void setAdvertisementId(int advertisementId) {
        this.advertisementId = advertisementId;
    }
    
    public String getHotelname() {
        return hotelname;
    }

    public void setHotelname(String hotelname) {
        this.hotelname = hotelname;
    }
    
    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public byte[] getAdvertiseImageFile() {
        return advertiseImageFile;
    }

    public void setAdvertiseImageFile(byte[] advertiseImageFile) {
        this.advertiseImageFile = advertiseImageFile;
    }
}
