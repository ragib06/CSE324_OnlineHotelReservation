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
 * @author santu
 */
public class UserLogoutController extends SimpleFormController{
    

    public UserLogoutController(){
        //setCommandClass(UserLoginInfo.class);
        //setCommandName("userlogin");
        setSuccessView("index");
    }

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView(getSuccessView());
        request.getSession().removeAttribute("loggedUser");
        return mv;
    }
}
