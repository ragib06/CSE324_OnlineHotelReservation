/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.validation.BindException;
import springModel.user.RegistrationForm;
import service.user.RegistrationService;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/** 
 *
 * @author NAUTILUS
 */
public class RegistrationController3 extends SimpleFormController {

    private RegistrationService regService;

    public RegistrationController3() {
        //Initialize controller properties here or 
        //in the Web Application Context

        setCommandClass(RegistrationForm.class);
        setCommandName("register");
        setSuccessView("registration4");
    }
   
    public void setRegistrationService(RegistrationService helloService) {
        this.regService = helloService;
    }
    //Use onSubmit instead of doSubmitAction
    //when you need access to the Request, Response, or BindException objects
    
    @Override
    protected ModelAndView processFormSubmission(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        ModelAndView mv = new ModelAndView(getSuccessView());
        RegistrationForm ri = (RegistrationForm) command;
        RegistrationForm regForm=(RegistrationForm)request.getSession().getAttribute("regFormInfo");
        regForm.setMobile(ri.getMobile());
        regForm.setPhone(ri.getPhone());
        request.getSession().setAttribute("regFormInfo",regForm);
        request.setAttribute("record", regForm);
        return mv;
    }
    

}