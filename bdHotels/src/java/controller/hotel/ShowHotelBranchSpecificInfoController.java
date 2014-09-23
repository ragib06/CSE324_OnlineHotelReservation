/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.hotel;

import service.hotel.ShowHotelBranchSpecificInfoService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.ParameterizableViewController;

/** 
 *
 * @author NAUTILUS
 */
public class ShowHotelBranchSpecificInfoController extends ParameterizableViewController {

    private ShowHotelBranchSpecificInfoService showHotelBranchSpecificInfoService;

    public ShowHotelBranchSpecificInfoController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        //setCommandClass(MyCommand.class);
        //setCommandName("MyCommandName");
        //setSuccessView("successView");
        //setFormView("formView");
    }

    public void setShowHotelBranchSpecificInfoService(ShowHotelBranchSpecificInfoService showHotelBranchSpecificInfoService) {
        this.showHotelBranchSpecificInfoService = showHotelBranchSpecificInfoService;
    }
    
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView(getViewName());
        int hotelID = Integer.parseInt(request.getParameter("hotelid").toString());
        int branchID = Integer.parseInt(request.getParameter("branchid").toString());

        System.out.println("DEBUG(ShowHotelBranchController): hotelID="+hotelID+" branchID="+branchID);
        mv.addObject("branchspecificinfo", showHotelBranchSpecificInfoService.getBranchSpecificInfo(hotelID, branchID));
        return mv;
    }
}