/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service.user;

import springModel.hotel.ReviewInfo;
import hibernateModel.HibernateUtil;
import hibernateModel.HotelReview;
import hibernateModel.Customer;
import hibernateModel.Hotel;

import org.hibernate.Session;
import java.util.Date;
/**
 *
 * @author NAUTILUS
 */
public class AddReviewService {


    public void addReview(ReviewInfo ri) throws Exception{
        Session session=null;

        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        HotelReview hr = new HotelReview();
        Customer user = (Customer)session.createQuery("from Customer where customerId = "+ri.getUserId()).uniqueResult();
        Hotel hotel = (Hotel)session.createQuery("from Hotel where hotelid = "+ri.getHotelId()).uniqueResult();

        hr.setText(ri.getText());
        hr.setCustomer(user);
        hr.setHotel(hotel);
        hr.setReviewDate(new Date());

        session.save(hr);

        session.getTransaction().commit();
    }
}
