/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.hotel;

import service.hotel.AddHotelOfferService;
import springModel.hotel.HotelOffer;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/** 
 *
 * @author NAUTILUS
 */
public class AddHotelOfferController extends SimpleFormController {

    private AddHotelOfferService addHotelOfferService;

    public void setAddHotelOfferService(AddHotelOfferService addHotelOfferService) {
        this.addHotelOfferService = addHotelOfferService;
    }
    
    public AddHotelOfferController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        setCommandClass(HotelOffer.class);
        setCommandName("addHotelOffer");
        setSuccessView("addhoteloffer_success");
        setFormView("addhoteloffer");
    }
    
    //Use onSubmit instead of doSubmitAction 
    //when you need access to the Request, Response, or BindException objects
    
    @Override
    protected ModelAndView onSubmit(
            Object command) throws Exception {
        ModelAndView mv = new ModelAndView(getSuccessView());
        //Do something...
        return mv;
    }
    

}