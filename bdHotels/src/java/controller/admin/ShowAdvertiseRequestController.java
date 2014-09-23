/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.admin;

import service.admin.ShowAdvertiseRequestService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.servlet.mvc.ParameterizableViewController;
import springModel.admin.AdminLoginInfo;

/** 
 *
 * @author NAUTILUS
 */
public class ShowAdvertiseRequestController extends ParameterizableViewController {

    private ShowAdvertiseRequestService showAdvertiseRequestService;

    public ShowAdvertiseRequestController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        //setCommandClass(MyCommand.class);
        //setCommandName("MyCommandName");
        //setSuccessView("successView");
        //setFormView("formView");
    }

    public void setShowAdvertiseRequestService(ShowAdvertiseRequestService showAdvertiseRequestService) {
        this.showAdvertiseRequestService = showAdvertiseRequestService;
    }

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.getSession().setAttribute("savedpath", request.getRequestURL());
        ModelAndView mv = new ModelAndView(getViewName());
        AdminLoginInfo li= (AdminLoginInfo)request.getSession().getAttribute("adminlogininfo");
        if(li==null){
            response.sendRedirect("index.adm");
        }

        mv.addObject("advertiserequests",this.showAdvertiseRequestService.getAdvertiseRequests());
        return mv;
    }

}