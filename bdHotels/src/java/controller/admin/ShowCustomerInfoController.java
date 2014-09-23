/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.admin;

import service.admin.ShowCustomerInfoService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.ParameterizableViewController;
import org.springframework.web.servlet.mvc.SimpleFormController;

/** 
 *
 * @author NAUTILUS
 */
public class ShowCustomerInfoController extends ParameterizableViewController {

    private ShowCustomerInfoService showCustomerInfoService;

    public ShowCustomerInfoController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        //setCommandClass(MyCommand.class);
        //setCommandName("MyCommandName");
        //setSuccessView("showcustomerinfo");
        
    }

    public void setShowCustomerInfoService(ShowCustomerInfoService showCustomerInfoService) {
        this.showCustomerInfoService = showCustomerInfoService;
    }

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView("showcustomerinfo");
        mv.addObject("customerlist", this.showCustomerInfoService.getCustomerInfo());
        return mv;
    }

}