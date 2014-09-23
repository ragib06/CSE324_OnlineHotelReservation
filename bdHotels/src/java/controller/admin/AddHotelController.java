/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.admin;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.validation.BindException;
import springModel.hotel.HotelInfo;
import service.admin.AddHotelService;
//import springModel.hotel.HotelInfo;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/** 
 *
 * @author NAUTILUS
 */
public class AddHotelController extends SimpleFormController {

    private AddHotelService addHotelService;

    public void setAddHotelService(AddHotelService addHotelService) {
        this.addHotelService = addHotelService;
    }
    
    public AddHotelController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        setCommandClass(HotelInfo.class);
        setCommandName("addHotel");
        setSuccessView("addhotel_success");
        setFormView("addhotel");
    }

    //Use onSubmit instead of doSubmitAction 
    //when you need access to the Request, Response, or BindException objects
    

    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        ModelAndView mv = new ModelAndView(getSuccessView());
        HotelInfo hotel = (HotelInfo) command;
        boolean success=addHotelService.add(hotel);
        //Do something...
        if(success)
        {
            mv.addObject("hotelinfo", hotel);
        }
        else
        {
            response.sendRedirect("addhotel.adm");
        }
        return mv;
    }

}