/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.user;

import springModel.hotel.ReviewInfo;
import service.user.AddReviewService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/** 
 *
 * @author NAUTILUS
 */
public class AddReviewController extends SimpleFormController {
    private AddReviewService addReviewService;

    public void setAddReviewService(AddReviewService addReviewService) {
        this.addReviewService = addReviewService;
    }

    public AddReviewController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        setCommandClass(ReviewInfo.class);
        setCommandName("reviewinfo");
        setSuccessView("showhotels");
    }

    @Override
    protected ModelAndView processFormSubmission(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        ModelAndView mv = new ModelAndView(getSuccessView());
        ReviewInfo ri = (ReviewInfo)command;
        this.addReviewService.addReview(ri);
        response.sendRedirect("showhotelinfo.htm?hotelID="+ri.getHotelId()+"&rOffset=0&tGuide=0");
        return mv;
    }

}