/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service.admin;
import hibernateModel.HibernateUtil;
import hibernateModel.Hotel;
import org.hibernate.Session;
import springModel.hotel.HotelInfo;
/**
 *
 * @author NAUTILUS
 */
public class AddHotelService {
    Session session=null;
    public boolean add(HotelInfo hotel){
        try
        {
              session= HibernateUtil.getSessionFactory().getCurrentSession();
              session.beginTransaction();
              Hotel myHotel=new Hotel();
              myHotel.setName(hotel.getName());
              myHotel.setUsername(hotel.getUsername());
              myHotel.setPassword(hotel.getPassword());
              myHotel.setIpaddress(hotel.getIpaddress());
              myHotel.setPort(hotel.getPort());
              myHotel.setContextPath(hotel.getContextpath());
              session.save(myHotel);
              System.out.println("Successfully data insert in database");
              session.getTransaction().commit();
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
            return false;
        }
        return true;
    }
}
