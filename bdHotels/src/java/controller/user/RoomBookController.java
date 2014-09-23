/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.user;

import java.util.Vector;
import service.user.SearchBookingService;
import service.user.RoomBookService;
import springModel.user.SearchBookingForm;
import springModel.user.BookingInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import springModel.hotel.HotelRooms;

/** 
 *
 * @author NAUTILUS
 */
public class RoomBookController extends SimpleFormController {

    private RoomBookService roomBookService;

    public RoomBookController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        setCommandClass(BookingInfo.class);
        setCommandName("bookinginfo");
        setSuccessView("booking_success");
    }

    public void setRoomBookService(RoomBookService roomBookService) {
        this.roomBookService = roomBookService;
    }
    
    @Override
	protected ModelAndView processFormSubmission(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
		ModelAndView mv = new ModelAndView(getSuccessView());

                if(request.getSession().getAttribute("loggedUser") == null){
                    response.sendRedirect("login.htm");
                    return mv;
                }

		BookingInfo bi = (BookingInfo)command;
                SearchBookingForm sbf = (SearchBookingForm)request.getSession().getAttribute("bookingFormInfo");

                int bookID = this.roomBookService.bookRoom(bi, sbf);
                if(bookID == -1){
                    SearchBookingService sbs = new SearchBookingService();
                    Vector<HotelRooms> hotelRooms = sbs.searchRoom(sbf.getCity(), sbf.getNoOfDays(),sbf.getYear()+"-"+sbf.getMonth()+"-"+sbf.getDay() , sbf.getPerson(), sbf.getFloorNo(), sbf.getSideView(),sbf.getRent());
                    mv.addObject("searchresult", hotelRooms);
                    mv.addObject("searchcount", hotelRooms.size());
                    mv.addObject("success", "no");
                } else {
                    mv.addObject("bookingId", bookID);
                    mv.addObject("room", bi);
                    mv.addObject("roomdetails", sbf);
                    mv.addObject("success", "yes");
                }
                
                return mv;
	}

}