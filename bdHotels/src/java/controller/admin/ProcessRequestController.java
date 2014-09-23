/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.admin;

import hibernateModel.Advertisements;
import hibernateModel.HibernateUtil;
import hibernateModel.Travelguide;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import springModel.admin.RequestInfo;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.validation.BindException;

import org.springframework.web.servlet.mvc.SimpleFormController;

/** 
 *
 * @author Dhiman
 */
public class ProcessRequestController extends SimpleFormController {
    private Session session;
    
    public ProcessRequestController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        setCommandClass(RequestInfo.class);
        setCommandName("processRequest");
        setSuccessView("requestresponse_success");
    }
    
    @Override
    protected ModelAndView processFormSubmission(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        ModelAndView mv = new ModelAndView(getSuccessView());
        //System.out.println("Entering onSubmit in ProcessRequestController");
        RequestInfo requestinfo=(RequestInfo) command;
        session= HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result=null;

        StringBuffer savedPath= (StringBuffer)request.getSession().getAttribute("savedpath");
        if(savedPath==null){
            savedPath=new StringBuffer("index.htm");
        }
        System.out.println("Got saved path : "+savedPath.toString());
        System.out.println("Request type : "+requestinfo.getRequesttype());
        if(requestinfo.getRequesttype().compareTo("advertisement")==0){
            //System.out.println("\tAction type : "+requestinfo.getAction());
            Advertisements advert=new Advertisements();

            if(requestinfo.getAction().compareTo("accept")==0){
                //System.out.println("in accept");
                result= session.createQuery("from Advertisements where advertisementId="+requestinfo.getId()).list();
                advert=(Advertisements)result.get(0);
                advert.setValid("yes");
                session.save(advert);
                System.out.println("Successfully data updated in Advertisement Table!");
                session.getTransaction().commit();

//                //query.setInteger("Id", requestinfo.getId());
//
//                //int rowCount = query.executeUpdate();
//                if(rowCount>0){
//                    System.out.println("Advertisement Succesfully updated !!");
//                }
            }else{
                Query query = session.createQuery("delete from Advertisements where advertisementId = "+requestinfo.getId());
                int rowCount = query.executeUpdate();
                System.out.println("Rows Deleted: " + rowCount);
                session.getTransaction().commit();

            }
            //response.sendRedirect("showadvertiserequest.adm");
        }
        else if(requestinfo.getRequesttype().compareTo("travelguide") == 0){
            Travelguide tGuide = new Travelguide();
            if(requestinfo.getAction().compareTo("accept")==0){
                result= session.createQuery("from Travelguide where travelGuideId="+requestinfo.getId()).list();
                tGuide=(Travelguide)result.get(0);
                tGuide.setValid("yes");
                session.save(tGuide);
                System.out.println("Successfully data insert in Travelguide Table!");
                session.getTransaction().commit();

            }else{
                Query query = session.createQuery("delete from Travelguide where travelGuideId = "+requestinfo.getId());
                int rowCount = query.executeUpdate();
                System.out.println("Rows Deleted: " + rowCount);
                session.getTransaction().commit();
            }
            //response.sendRedirect("showtravelguiderequest.adm");
        }
        response.sendRedirect(savedPath.toString());
        request.getSession().removeAttribute("savedpath");
        return mv;
    }
//    protected void doSubmitAction(Object command) throws Exception {
//        throw new UnsupportedOperationException("Not yet implemented");
//    }

    //Use onSubmit instead of doSubmitAction 
    //when you need access to the Request, Response, or BindException objects
    /*
    @Override
    protected ModelAndView onSubmit(
            HttpServletRequest request, 
            HttpServletResponse response, 
            Object command, 
            BindException errors) throws Exception {
        ModelAndView mv = new ModelAndView(getSuccessView());
        //Do something...
        return mv;
    }
    */

}