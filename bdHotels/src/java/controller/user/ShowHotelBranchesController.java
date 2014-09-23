/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.user;

import java.util.Vector;
import service.admin.ShowHotelBranchesService;
import service.admin.ShowHotelInfoService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.ParameterizableViewController;
import springModel.hotel.HotelBranch;

/** 
 *
 * @author NAUTILUS
 */
public class ShowHotelBranchesController extends ParameterizableViewController {

    private ShowHotelBranchesService showHotelBranchesService;
    
    public ShowHotelBranchesController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        //setCommandClass(MyCommand.class);
        //setCommandName("MyCommandName");
        //setSuccessView("successView");
        //setFormView("formView");
    }

    public void setShowHotelBranchesService(ShowHotelBranchesService showHotelBranchesService) {
        this.showHotelBranchesService = showHotelBranchesService;
    }

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        String hotelID = request.getParameter("hotelID").toString();
        System.out.println("DEBUG(ShowHotelBranchController): hotelID="+hotelID);

        Vector<HotelBranch> branches = showHotelBranchesService.getHotelBranch(hotelID);

        ShowHotelInfoService hotelInfoService = new ShowHotelInfoService();
        hotelInfoService.setHotelID(hotelID);
        
        mv.addObject("hotel", hotelInfoService.getBasicInfo());
        mv.addObject("branchcount", branches.size());
        mv.addObject("hotelbranches", branches);
        
        return mv;
    }
}