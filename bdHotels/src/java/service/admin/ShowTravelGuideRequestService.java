/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service.admin;

import hibernateModel.HibernateUtil;
import hibernateModel.Travelguide;
import java.util.ArrayList;
import springModel.hotel.TravelGuide;
import java.util.List;
import org.hibernate.Session;
/**
 *
 * @author NAUTILUS
 */
public class ShowTravelGuideRequestService {

    public List<TravelGuide> getTravelGuideRequests(){
        
        Session session=null;
        List result=null;
        ArrayList<TravelGuide> tgresult = new ArrayList<TravelGuide>();
        try
        {
              session= HibernateUtil.getSessionFactory().getCurrentSession();
              session.beginTransaction();
              result=session.createQuery("from Travelguide a where a.valid='no'").list();

              for(int i=0;i<result.size();i++){
                  TravelGuide tg = new TravelGuide();
                  Travelguide tgd = (Travelguide)result.get(i);

                  tg.setTravelGuideId(tgd.getTravelGuideId());
                  tg.setHotelname(tgd.getHotel().getName());
                  tg.setText(tgd.getText());
                  tg.setTitle(tgd.getTitle());
                  tg.setPictureUrl(tgd.getPictureUrl());
                  
                  //session.createQuery("from Hotel h where h.hotelId="+adm.getHotel().getName());

                  tgresult.add(tg);
              }

        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        finally
        {
            //session.getTransaction().commit();
        }
        return tgresult;
    }

}
