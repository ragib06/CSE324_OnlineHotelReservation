/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import service.user.UserLoginService;
import springModel.user.UserLoginInfo;

/** 
 *
 * @author NAUTILUS
 */
public class UserLoginController extends SimpleFormController {

    private UserLoginService userLoginService;

    public void setUserLoginService(UserLoginService userLoginService) {
        this.userLoginService = userLoginService;
    }
    
    public UserLoginController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        setCommandClass(UserLoginInfo.class);
        setCommandName("userlogin");
        setSuccessView("home");
    }

    @Override
    protected ModelAndView processFormSubmission(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        ModelAndView mv = new ModelAndView(getSuccessView());
        UserLoginInfo li = (UserLoginInfo) command;

        UserLoginInfo check = this.userLoginService.login(li, request);
        if(check == null){
            response.sendRedirect("home.htm");
        }
        return mv;
    }

}