/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.hotel;

import hibernateModel.HibernateUtil;
import hibernateModel.Hotel;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.ParameterizableViewController;
/**
 *
 * @author NAUTILUS
 */
public class ViewAdvertTravelguideController extends ParameterizableViewController {

    private Map refData = new HashMap();

 
    public ViewAdvertTravelguideController() {
        //setCommandClass(HotelLoginInfo.class);
        //setCommandName("MyCommandName");
        //setSuccessView("successView");
        //setFormView("formView");
        //setSuccessView("showadvertisetravelguide");
        
    }




    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView("showadvertisetravelguide");
        Hotel loggedHotel=(Hotel) request.getSession().getAttribute("loggedHotel");
        if(loggedHotel==null){
            response.sendRedirect("index.htl");
            return mv;
        }
        request.getSession().setAttribute("savedpath", request.getRequestURL());
        int hotelId = loggedHotel.getHotelId();
        System.out.println("Got hotelid : "+hotelId);

        Session session=null;
        List result1=null,result2=null;
        Hotel hotel=null;
        try
        {
              session= HibernateUtil.getSessionFactory().getCurrentSession();
              session.beginTransaction();
              hotel=(Hotel)session.createQuery("from Hotel ht where ht.hotelId = "+String.valueOf(hotelId)).uniqueResult();
              mv.addObject("hotel",hotel);
              System.out.println("Got Hotel : "+hotel.getName());
              result1=session.createQuery("from Advertisements ad where ad.hotel.hotelId="+String.valueOf(hotelId)+" and ad.valid='yes'").list();
              mv.addObject("advert", result1);
              System.out.println("Got "+result1.size()+" Adverise(s)");
              result2=session.createQuery("from Travelguide tg where tg.hotel.hotelId="+String.valueOf(hotelId)+" and tg.valid='yes'").list();
              mv.addObject("tGuide", result2);
              System.out.println("Got "+result2.size()+" Travelguide(s)");

        }catch(Exception e){
            e.printStackTrace();
        }

        //mv.addObject("loginInfo", hotelinfo);
        System.out.println();
        return mv;
    }
}
