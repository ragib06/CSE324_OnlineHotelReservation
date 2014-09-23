/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service.hotel;
import hibernateModel.Advertisements;
import hibernateModel.HibernateUtil;
import hibernateModel.Hotel;
import org.hibernate.classic.Session;
import springModel.hotel.Advertise;
/**
 *
 * @author NAUTILUS
 */
public class AddAdvertiseService {
    private Session session;
    private Advertisements advert;

    public void add(Advertise advertise, Hotel hotel) throws Exception{
        try
        {
              session= HibernateUtil.getSessionFactory().getCurrentSession();
              session.beginTransaction();
              advert=new Advertisements();
              advert.setHotel(hotel);
              advert.setPictureUrl(advertise.getPictureUrl());
              advert.setText(advertise.getText());
              advert.setTitle(advertise.getTitle());
              advert.setValid("no");
              session.save(advert);
              System.out.println("Successfully data insert in Advertisement Table!");
              session.getTransaction().commit();
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        finally
        {
            //if(session!=null)
            {
               // session.close();
            }
        }
        

    }

}
