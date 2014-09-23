/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.admin;

import service.admin.ShowTravelGuideRequestService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.ParameterizableViewController;
import springModel.admin.AdminLoginInfo;

/** 
 *
 * @author NAUTILUS
 */
public class ShowTravelGuideRequestController extends ParameterizableViewController {

    private ShowTravelGuideRequestService showTravelGuideRequestService;

    public ShowTravelGuideRequestController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        //setCommandClass(MyCommand.class);
        //setCommandName("MyCommandName");
        //setSuccessView("successView");
        //setFormView("formView");
    }

    public void setShowTravelGuideRequestService(ShowTravelGuideRequestService showTravelGuideRequestService) {
        this.showTravelGuideRequestService = showTravelGuideRequestService;
    }

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView(getViewName());
        AdminLoginInfo li= (AdminLoginInfo)request.getSession().getAttribute("adminlogininfo");
        if(li==null){
            response.sendRedirect("index.adm");
        }

        request.getSession().setAttribute("savedpath", request.getRequestURL());
        mv.addObject("travelguiderequests",this.showTravelGuideRequestService.getTravelGuideRequests());
        return mv;
    }

}