/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service.admin;

import hibernateModel.HibernateUtil;
import hibernateModel.Customer;
import hibernateModel.Hotel;
import hibernateModel.HotelReview;
import hibernateModel.Travelguide;
import hibernateModel.Advertisements;
import springModel.hotel.ReviewInfo;

import java.util.List;
import java.util.Vector;
import org.hibernate.Session;
/**
 *
 * @author NAUTILUS
 */
public class ShowHotelInfoService {

    public static final int REVIEW_CHUNK = 5;
    private String hotelID;
    private int reviewOffset;
    private int reviewCount;

    public void setHotelID(String hotelID) {
        this.hotelID = hotelID;
    }

    public void setReviewOffset(int reviewOffset) {
        this.reviewOffset = reviewOffset;
    }

    public int getNextReviewOffset(){
        if((reviewOffset + this.REVIEW_CHUNK) >= this.reviewCount){
            return 0;
        }
        return reviewOffset + this.REVIEW_CHUNK;
    }

    public int getPrevReviewOffset(){
        if((reviewOffset - this.REVIEW_CHUNK) < 0){
            if(this.reviewCount <= this.REVIEW_CHUNK){
                return 0;
            }
            return this.reviewCount - this.REVIEW_CHUNK;
        }
        return reviewOffset - this.REVIEW_CHUNK;
    }
    
    public Hotel getBasicInfo() {
        //query for all hotels registered
        Session session = null;
        Hotel result = null;
        Hotel basicInfo = new Hotel();
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            result = (Hotel) session.createQuery("from Hotel where hotelId=" + hotelID).uniqueResult();
            System.out.println("Successfully return hotels from database");
            session.getTransaction().commit();
            
            basicInfo.setHotelId(result.getHotelId());
            basicInfo.setName(result.getName());
            basicInfo.setUsername((result.getUsername()));
            basicInfo.setPassword((result.getPassword()));
            basicInfo.setIpaddress((result.getIpaddress()));
            basicInfo.setPort(result.getPort());
            basicInfo.setContextPath(result.getContextPath());

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return basicInfo;
    }


    
    public Vector<ReviewInfo> getHotelReviews() {
        //query for all hotels registered
        Session session = null;
        List result = null;
        Vector<ReviewInfo> reviews = new Vector<ReviewInfo>();
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            result = session.createQuery("from HotelReview where hotelId=" + hotelID).list();
            System.out.println("Successfully return hotel reviews from database");
            this.reviewCount = result.size();
            
            if(reviewOffset>=result.size()){
                session.getTransaction().commit();
                return null;
            }
            
            for(int i=reviewOffset; i<result.size() && i<this.reviewOffset+this.REVIEW_CHUNK;i++){
                ReviewInfo hr = new ReviewInfo();
                
                HotelReview temp = (HotelReview)result.get(i);
                System.out.println(i+ " review by: " + temp.getCustomer().getCustomerId());

                Customer user = (Customer)session.createQuery("from Customer where customerId=" + temp.getCustomer().getCustomerId()).uniqueResult();

                hr.setUserId(user.getCustomerId());
                hr.setUsername(user.getUsername());
                hr.setHotelId(temp.getHotel().getHotelId());
                hr.setReviewDate(temp.getReviewDate());
                hr.setReviewId(temp.getReviewId());
                hr.setText(temp.getText());

                reviews.add(hr);
            }

            session.getTransaction().commit();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return reviews;
    }
    

    public Travelguide getTravelGuide(int index) {
        //query for all hotels registered
        Session session = null;
        List result = null;

        Travelguide travelGuide = new Travelguide();
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            result = session.createQuery("from Travelguide where hotelId=" + hotelID).list();
            System.out.println("Successfully return travel guide from database");
            session.getTransaction().commit();

            index = (index>=0)?index%result.size():result.size()+index;
            Travelguide temp = (Travelguide)result.get(index);

            travelGuide.setHotel(temp.getHotel());
            travelGuide.setPictureUrl(temp.getPictureUrl());
            travelGuide.setText(temp.getText());
            travelGuide.setTitle(temp.getTitle());
            travelGuide.setTravelGuideId(temp.getTravelGuideId());

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return travelGuide;
    }



    public Vector<Advertisements> getAdvertisements() {
        //query for all hotels registered
        Session session = null;
        List result = null;
        Vector<Advertisements> advertisements = new Vector<Advertisements>();
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            result = session.createQuery("from Advertisements where hotelId=" + hotelID).list();
            System.out.println("Successfully return advertisements from database");
            session.getTransaction().commit();

            for(int i=0;i<result.size();i++){
                Advertisements ad = new Advertisements();
                Advertisements temp = (Advertisements)result.get(i);

                ad.setAdvertisementId(temp.getAdvertisementId());
                ad.setHotel(temp.getHotel());
                ad.setPictureUrl(temp.getPictureUrl());
                ad.setText(temp.getText());
                ad.setTitle(temp.getTitle());

                advertisements.add(ad);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return advertisements;
    }

    
}
