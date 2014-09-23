/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package springModel.hotel;

/**
 *
 * @author NAUTILUS
 */
public class TravelGuide {
    private String hotelname;
    private int travelGuideId;
    private byte[] tGuideImageFile;
    private String title;
    private String text;
    private String pictureUrl;

    public String getHotelname() {
        return hotelname;
    }

    public void setHotelname(String hotelname) {
        this.hotelname = hotelname;
    }
    
    public int getTravelGuideId() {
        return travelGuideId;
    }

    public void setTravelGuideId(int travelGuideId) {
        this.travelGuideId = travelGuideId;
    }

    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }

    public byte[] gettGuideImageFile() {
        return tGuideImageFile;
    }

    public void settGuideImageFile(byte[] tGuideImageFile) {
        this.tGuideImageFile = tGuideImageFile;
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
    

}
