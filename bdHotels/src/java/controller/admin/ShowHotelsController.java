/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.admin;

import service.admin.ShowHotelsService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.ParameterizableViewController;

/** 
 *
 * @author NAUTILUS
 */
public class ShowHotelsController extends ParameterizableViewController {

    private ShowHotelsService showHotelsService;

    public ShowHotelsController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        //setCommandClass(MyCommand.class);
        //setCommandName("MyCommandName");
        //setSuccessView("successView");
        //setFormView("formView");

    }

    public void setShowHotelsService(ShowHotelsService showHotelsService) {
        this.showHotelsService = showHotelsService;
    }

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView(getViewName());
        mv.addObject("hotellist", this.showHotelsService.getAllHotels());
        return mv;
    }

}