/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.user;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
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
public class RegistrationController4 extends SimpleFormController {

    private RegistrationService regService;
    private Map refData = new HashMap();

    public RegistrationController4() {
        //Initialize controller properties here or 
        //in the Web Application Context

        setCommandClass(RegistrationForm.class);
        setCommandName("register");
        setSuccessView("registration5");
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
        regForm.setUsername(ri.getUsername());
        regForm.setPassword(ri.getPassword());
        request.getSession().setAttribute("regFormInfo",regForm);
        mv.addObject("user", regForm);
        return mv;
    }
    

}