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
public class RegistrationController5 extends SimpleFormController {

    private RegistrationService regService;

    public RegistrationController5() {
        //Initialize controller properties here or 
        //in the Web Application Context

        setCommandClass(RegistrationForm.class);
        setCommandName("register");
        setSuccessView("registration_success");
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
        regService.register(regForm);
        mv.addObject("user", regForm);
        return mv;
    }
    

}