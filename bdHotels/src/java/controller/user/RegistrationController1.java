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
public class RegistrationController1 extends SimpleFormController {

    private RegistrationService regService;

    public RegistrationController1() {
        //Initialize controller properties here or 
        //in the Web Application Context

        setCommandClass(RegistrationForm.class);
        setCommandName("register");
        setSuccessView("registration2");
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
        if(regForm!=null)
        {
            regForm.setFirstname(ri.getFirstname());
            regForm.setMiddlename(ri.getMiddlename());
            regForm.setLastname(ri.getLastname());
            regForm.setEmail(ri.getEmail());
            regForm.setAlteremail(ri.getAlteremail());
            request.getSession().setAttribute("regFormInfo",regForm);
            request.setAttribute("record", regForm);
        }
        else
        {
            request.getSession().setAttribute("regFormInfo",ri);
            request.setAttribute("record", ri);
        }
        return mv;
    }
    

}