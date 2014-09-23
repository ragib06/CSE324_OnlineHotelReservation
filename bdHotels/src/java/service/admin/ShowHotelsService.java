/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service.admin;

import hibernateModel.HibernateUtil;
import hibernateModel.Hotel;
import springModel.hotel.HotelInfo;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import org.hibernate.Session;
/**
 *
 * @author NAUTILUS
 */
public class ShowHotelsService {
    public Vector<HotelInfo> getAllHotels(){
        //query for all hotels registered
        Session session=null;
        List result=null;
        Vector<HotelInfo> hotelInfos = null;
        try
        {
              session= HibernateUtil.getSessionFactory().getCurrentSession();
              session.beginTransaction();
              result=session.createQuery("from Hotel").list();
              System.out.println("Successfully return hotels from database");
              session.getTransaction().commit();
              hotelInfos= new Vector<HotelInfo>();
              for (int i = 0; i < result.size(); i++)
              {
                  HotelInfo myHotel=new HotelInfo();
                  myHotel.setHotelId(((Hotel)result.get(i)).getHotelId());
                  myHotel.setName(((Hotel)result.get(i)).getName());
                  myHotel.setUsername((((Hotel)result.get(i)).getUsername()));
                  myHotel.setPassword((((Hotel)result.get(i)).getPassword()));
                  myHotel.setIpaddress((((Hotel)result.get(i)).getIpaddress()));
                  myHotel.setPort((((Hotel)result.get(i)).getPort()));
                  myHotel.setContextpath((((Hotel)result.get(i)).getContextPath()));
                  hotelInfos.add(myHotel);
              }
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        return hotelInfos;
    }
}
