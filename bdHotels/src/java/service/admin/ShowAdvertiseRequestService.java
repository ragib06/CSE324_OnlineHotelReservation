/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service.admin;

import hibernateModel.Advertisements;
import hibernateModel.HibernateUtil;
import springModel.hotel.Advertise;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
/**
 *
 * @author NAUTILUS
 */
public class ShowAdvertiseRequestService {
   
    public List<Advertise> getAdvertiseRequests(){
       
        Session session=null;
        List result=null;
        ArrayList<Advertise> adresult = new ArrayList<Advertise>();
        try
        {
              session= HibernateUtil.getSessionFactory().getCurrentSession();
              session.beginTransaction();
              result=session.createQuery("from Advertisements a where a.valid='no'").list();

              for(int i=0;i<result.size();i++){
                  Advertise ad = new Advertise();
                  Advertisements adm = (Advertisements)result.get(i);

                  ad.setAdvertisementId(adm.getAdvertisementId());
                  ad.setTitle(adm.getTitle());
                  ad.setText(adm.getText());
                  ad.setPictureUrl(adm.getPictureUrl());
                  ad.setHotelname(adm.getHotel().getName());
                  //session.createQuery("from Hotel h where h.hotelId="+adm.getHotel().getName());

                  adresult.add(ad);
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
        return adresult;
    }
}
