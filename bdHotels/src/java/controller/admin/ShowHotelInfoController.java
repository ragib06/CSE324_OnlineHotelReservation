/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.admin;

import service.admin.ShowHotelInfoService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.ParameterizableViewController;

/** 
 *
 * @author NAUTILUS
 */
public class ShowHotelInfoController extends ParameterizableViewController {

    private ShowHotelInfoService showHotelInfoService;

    public ShowHotelInfoController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        //setCommandClass(MyCommand.class);
        //setCommandName("MyCommandName");
        //setSuccessView("successView");
        //setFormView("formView");

    }

    public void setShowHotelsService(ShowHotelInfoService showHotelsService) {
        this.showHotelInfoService = showHotelsService;
    }

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView(getViewName());
        String hotelID = request.getParameter("hotelID").toString();
        int rOffset = Integer.parseInt(request.getParameter("rOffset").toString());
        int tGuide = Integer.parseInt(request.getParameter("tGuide").toString());

        System.out.println("rOffset: "+rOffset);

        this.showHotelInfoService.setHotelID(hotelID);
        this.showHotelInfoService.setReviewOffset(rOffset);

        mv.addObject("basicinfo", this.showHotelInfoService.getBasicInfo());

        mv.addObject("reviews", this.showHotelInfoService.getHotelReviews());
        mv.addObject("currReviewOffset", rOffset);
        mv.addObject("prevReviewOffset", this.showHotelInfoService.getPrevReviewOffset());
        mv.addObject("nextReviewOffset", this.showHotelInfoService.getNextReviewOffset());
        
        mv.addObject("currTGOffset", tGuide);
        mv.addObject("prevTGOffset", tGuide-1);
        mv.addObject("nextTGOffset", tGuide+1);
        mv.addObject("travelguide", this.showHotelInfoService.getTravelGuide(tGuide));
        
        mv.addObject("advertisements", this.showHotelInfoService.getAdvertisements());
        return mv;
    }

}