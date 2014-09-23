/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service.hotel;
import hibernateModel.HibernateUtil;
import hibernateModel.Hotel;
import hibernateModel.Travelguide;
import org.hibernate.classic.Session;
import springModel.hotel.Advertise;
import springModel.hotel.TravelGuide;
/**
 *
 * @author NAUTILUS
 */
public class AddTravelGuideService {
    private Session session;
    private Travelguide tGuide;

    public void add(TravelGuide guide, Hotel hotel) throws Exception{
        try
        {
              session= HibernateUtil.getSessionFactory().getCurrentSession();
              session.beginTransaction();
              tGuide=new Travelguide();
              tGuide.setHotel(hotel);
              tGuide.setPictureUrl(guide.getPictureUrl());
              tGuide.setText(guide.getText());
              tGuide.setTitle(guide.getTitle());
              tGuide.setValid("no");
              session.save(tGuide);
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
