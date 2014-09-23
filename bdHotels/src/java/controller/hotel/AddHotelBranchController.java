/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.hotel;
import hibernateModel.Hotel;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.hotel.AddHotelBranchService;
import springModel.hotel.HotelBranch;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;


/** 
 *
 * @author NAUTILUS
 */
public class AddHotelBranchController extends SimpleFormController {

    private AddHotelBranchService addHotelBranchService;
    private static ThreadLocal tLocal = new ThreadLocal();

    public void setAddHotelBranchService(AddHotelBranchService addHotelBranchService) {
        this.addHotelBranchService = addHotelBranchService;
    }

    
    public AddHotelBranchController()
    {
        //Initialize controller properties here or 
        //in the Web Application Context
        
            setCommandClass(HotelBranch.class);
            setCommandName("addHotelBranch");
            setSuccessView("addhotelbranch_success");
            setFormView("addhotelbranch");

    }
    

    //Use onSubmit instead of doSubmitAction 
    //when you need access to the Request, Response, or BindException objects
    
    @Override
    protected ModelAndView onSubmit(Object command) throws Exception
    {
        ModelAndView mv = new ModelAndView(getSuccessView());
        //Do something...
        return mv;
    }    

}