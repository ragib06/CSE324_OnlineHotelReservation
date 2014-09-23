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
public class AdvancedSearchBookingController extends SimpleFormController {

	private SearchBookingService searchBookingService;


	public AdvancedSearchBookingController(){
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
                
                if(sbf.getSideView().equalsIgnoreCase(""))
                {
                   sbf.setSideView(null);
                   System.out.println("hmm"); 
                }
                request.getSession().setAttribute("bookingFormInfo", sbf);

                Vector<HotelRooms> hotelRooms = searchBookingService.searchRoom(sbf.getCity(),sbf.getNoOfDays(),String.valueOf(sbf.getYear())+"-"+String.valueOf(sbf.getMonth())+"-"+String.valueOf(sbf.getDay()),sbf.getPerson(),sbf.getFloorNo(),sbf.getSideView(),sbf.getRent());
		mv.addObject("searchresult", hotelRooms);
                mv.addObject("searchcount", hotelRooms.size());
		return mv;
	}
}