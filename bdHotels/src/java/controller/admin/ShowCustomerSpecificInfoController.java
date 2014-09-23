/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.admin;

import service.admin.ShowCustomerInfoService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.ParameterizableViewController;

/**
 *
 * @author NAUTILUS
 */
public class ShowCustomerSpecificInfoController extends ParameterizableViewController {

    private ShowCustomerInfoService showCustomerInfoService;

    public ShowCustomerSpecificInfoController() {
        //Initialize controller properties here or
        //in the Web Application Context

        //setCommandClass(MyCommand.class);
        //setCommandName("MyCommandName");
        //setSuccessView("successView");

    }

    public void setShowCustomerInfoService(ShowCustomerInfoService showCustomerInfoService) {
        this.showCustomerInfoService = showCustomerInfoService;
    }

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView("customerspecificinfo");
        String customerID = request.getParameter("customerID").toString();
        System.out.println("DEBUG(ShowCustomerInfoController): customerID="+customerID);
        mv.addObject("user", this.showCustomerInfoService.getCustomerSpecificInfo(customerID));
        return mv;
    }

}