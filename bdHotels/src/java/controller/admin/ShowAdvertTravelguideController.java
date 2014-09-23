/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import hibernateModel.Advertisements;
import hibernateModel.HibernateUtil;
import hibernateModel.Hotel;
import hibernateModel.Travelguide;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import springModel.hotel.HotelLoginInfo;
import service.hotel.HotelLoginService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import springModel.admin.AdminLoginInfo;
import springModel.hotel.Advertise;
import springModel.hotel.TravelGuide;
/**
 *
 * @author NAUTILUS
 */
public class ShowAdvertTravelguideController extends SimpleFormController {

    private HotelLoginService hotelLoginService;
    private List hotels = null;
    private Map refData = new HashMap();

   
    public ShowAdvertTravelguideController() {
        setSessionForm(true);
        setBindOnNewForm(true);
        setFormView("selecthotel");
        setSuccessView("viewtravelguideadvertise");
    }

    @Override
    protected Map referenceData(HttpServletRequest request) throws ServletException {
        
        Session session = null;
        List result = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            result = session.createQuery("from Hotel").list();
            System.out.println("Successfully return hotels from database");
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
        }

        //hotels=hotelLoginService.findHotels();
        refData.put("hotels", result);
        return refData;
    }

    @Override
    protected Object formBackingObject(HttpServletRequest request) throws ServletException {
        // get the Pet referred to by id in the request
        return new HotelLoginInfo();
    }

    @Override
    protected ModelAndView processFormSubmission(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        ModelAndView mv = new ModelAndView(getSuccessView());
        AdminLoginInfo li= (AdminLoginInfo)request.getSession().getAttribute("adminlogininfo");
        if(li==null){
            response.sendRedirect("index.adm");
        }

        int hotelId = ServletRequestUtils.getRequiredIntParameter(request, "hotelId");
        System.out.println("Got hotelid : "+hotelId);
        request.getSession().setAttribute("savedpath", request.getRequestURL());
        Session session=null;
        List result1=null,result2=null;
        ArrayList<Advertise> adresult = new ArrayList<Advertise>();
        ArrayList<TravelGuide> tgresult = new ArrayList<TravelGuide>();
        Hotel hotel=null;
        try
        {
              session= HibernateUtil.getSessionFactory().getCurrentSession();
              session.beginTransaction();
              hotel=(Hotel)session.createQuery("from Hotel ht where ht.hotelId = "+String.valueOf(hotelId)).uniqueResult();
              mv.addObject("hotel",hotel);
              System.out.println("Got Hotel : "+hotel.getName());
              result1=session.createQuery("from Advertisements ad where ad.hotel.hotelId="+String.valueOf(hotelId)+" and ad.valid='yes'").list();
              for(int i=0;i<result1.size();i++){
                  Advertise ad = new Advertise();
                  Advertisements adm = (Advertisements)result1.get(i);

                  ad.setAdvertisementId(adm.getAdvertisementId());
                  ad.setTitle(adm.getTitle());
                  ad.setText(adm.getText());
                  ad.setPictureUrl(adm.getPictureUrl());
                  ad.setHotelname(adm.getHotel().getName());
                  //session.createQuery("from Hotel h where h.hotelId="+adm.getHotel().getName());

                  adresult.add(ad);
              }

              mv.addObject("advert", adresult);
              System.out.println("Got "+result1.size()+" Adverise(s)");
              result2=session.createQuery("from Travelguide tg where tg.hotel.hotelId="+String.valueOf(hotelId)+" and tg.valid='yes'").list();

              for(int i=0;i<result2.size();i++){
                  TravelGuide tg = new TravelGuide();
                  Travelguide tgd = (Travelguide)result2.get(i);

                  tg.setTravelGuideId(tgd.getTravelGuideId());
                  tg.setHotelname(tgd.getHotel().getName());
                  tg.setText(tgd.getText());
                  tg.setTitle(tgd.getTitle());
                  tg.setPictureUrl(tgd.getPictureUrl());

                  //session.createQuery("from Hotel h where h.hotelId="+adm.getHotel().getName());

                  tgresult.add(tg);
              }
              mv.addObject("tGuide", tgresult);
              System.out.println("Got "+result2.size()+" Travelguide(s)");

        }catch(Exception e){

        }

        //mv.addObject("loginInfo", hotelinfo);
        System.out.println();
        return mv;
    }
}
