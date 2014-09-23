/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.user;

import springModel.hotel.HotelRooms;
import service.user.SearchBookingService;
import springModel.user.SearchBookingForm;

import java.sql.*;
import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.validation.BindException;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;


/** 
 *
 * @author NAUTILUS
 */
public class SearchBookingController extends SimpleFormController {

	private SearchBookingService searchBookingService;
        
	
	public SearchBookingController(){
		setCommandClass(SearchBookingForm.class);
		setCommandName("search");
		setSuccessView("search_result");
	}

       
	public void setSearchBookingService(SearchBookingService searchBookingService) {
		this.searchBookingService = searchBookingService;
	}

	@Override
	protected ModelAndView processFormSubmission(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
		ModelAndView mv = new ModelAndView(getSuccessView());
		SearchBookingForm sbf = (SearchBookingForm) command;
                sbf.setRent(0.0);
                sbf.setSideView(null);
                sbf.setFloorNo(0);
                request.getSession().setAttribute("bookingFormInfo", sbf);
                
                Vector<HotelRooms> hotelRooms = searchBookingService.searchRoom(sbf.getCity(),sbf.getNoOfDays(),String.valueOf(sbf.getYear())+"-"+String.valueOf(sbf.getMonth())+"-"+String.valueOf(sbf.getDay()),sbf.getPerson(),0,null,0.0);
		mv.addObject("searchresult", hotelRooms);
                mv.addObject("searchcount", hotelRooms.size());
		return mv;
	}
}