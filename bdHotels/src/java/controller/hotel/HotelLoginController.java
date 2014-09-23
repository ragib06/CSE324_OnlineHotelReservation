/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.hotel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import springModel.hotel.HotelLoginInfo;
import service.hotel.HotelLoginService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
/**
 *
 * @author NAUTILUS
 */
public class HotelLoginController extends SimpleFormController{

    private HotelLoginService hotelLoginService;
    private List hotels=null;
    private Map refData = new HashMap();

    public void setHotelLoginService(HotelLoginService hotelLoginService) {
        this.hotelLoginService = hotelLoginService;
    }

    public HotelLoginController(){
        setSessionForm(true);
        setBindOnNewForm(true);
        setSuccessView("home");
    }

    @Override
    protected Map referenceData(HttpServletRequest request) throws ServletException {
                hotels=hotelLoginService.findHotels();
		refData.put("hotels", hotels);
		return refData;
    }


    @Override
    protected Object formBackingObject(HttpServletRequest request) throws ServletException {
		// get the Pet referred to by id in the request
        return new HotelLoginInfo();
    }





    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        ModelAndView mv = new ModelAndView(getSuccessView());
        int hotelId = ServletRequestUtils.getRequiredIntParameter(request, "hotelId");
        String username = ServletRequestUtils.getStringParameter(request, "username");
        String password = ServletRequestUtils.getStringParameter(request, "password");
        HotelLoginInfo hotelinfo=hotelLoginService.findSpecificHotel(hotelId,username,password,request,response);
        mv.addObject("loginInfo",hotelinfo);
        System.out.println();
        return mv;
    }
}
