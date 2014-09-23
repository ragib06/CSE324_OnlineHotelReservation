/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service.hotel;

import hibernateModel.HibernateUtil;
import hibernateModel.Hotel;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;
import org.hibernate.Session;
import springModel.hotel.HotelLoginInfo;

/**
 *
 * @author NAUTILUS
 */
public class HotelLoginService {
    private String username;
    private String password;

    public List findHotels()
    {
        Session session=null;
        List result=null;
        try
        {
              session= HibernateUtil.getSessionFactory().getCurrentSession();
              session.beginTransaction();
              result=session.createQuery("from Hotel").list();
              System.out.println("Successfully return hotels from database");
              session.getTransaction().commit();
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        finally
        {

        }
         return result;
    }



    public HotelLoginInfo findSpecificHotel(int hotelId,String username,String password,HttpServletRequest request,HttpServletResponse response)
    {

        Session session=null;
        List result=null;
        Hotel myHotel=null;
        HotelLoginInfo myHotelLoginInfo=new HotelLoginInfo();
        try
        {
              session= HibernateUtil.getSessionFactory().getCurrentSession();
              session.beginTransaction();
              result=session.createQuery("from Hotel hotel where hotel.hotelId="+String.valueOf(hotelId)+" and hotel.username='"+username+"' and hotel.password='"+password+"'").list();
              if(result.isEmpty())
              {
                  response.sendRedirect("index.htl");
              }
              else
              {
                  myHotel=(Hotel)result.get(0);
                  myHotelLoginInfo.setHotelId(myHotel.getHotelId());
                  myHotelLoginInfo.setHotelName(myHotel.getName());
                  myHotelLoginInfo.setPassword(myHotel.getPassword());
                  myHotelLoginInfo.setUsername(myHotel.getUsername());
                  System.out.println("Successfully return hotelBranches from database");
                  request.getSession().setAttribute("loggedHotel",myHotel);
              }
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        finally
        {
            session.getTransaction().commit();
        }
        return myHotelLoginInfo;
    }
}
