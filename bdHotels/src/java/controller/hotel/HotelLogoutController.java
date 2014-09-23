/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.hotel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;


/**
 *
 * @author santu
 */
public class HotelLogoutController extends SimpleFormController{
    
    public HotelLogoutController(){
        //setCommandClass(UserLoginInfo.class);
        //setCommandName("userlogin");
        setSuccessView("logout");
    }


    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView(getSuccessView());
        request.getSession().removeAttribute("loggedHotel");
        return mv;
    }
}
