/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.admin;

import service.admin.AdminLoginService;
import springModel.admin.AdminLoginInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
/**
 *
 * @author NAUTILUS
 */
public class AdminLoginController extends SimpleFormController{

    private AdminLoginService adminLoginService;

    public void setAdminLoginService(AdminLoginService adminLoginService) {
        this.adminLoginService = adminLoginService;
    }

    public AdminLoginController(){
        setCommandClass(AdminLoginInfo.class);
        setCommandName("adminlogin");
        setSuccessView("home");
    }

    @Override
    protected ModelAndView processFormSubmission(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        ModelAndView mv = new ModelAndView(getSuccessView());
        AdminLoginInfo li = (AdminLoginInfo) command;

        if(adminLoginService.login(li) == false){
            response.sendRedirect("index.adm");
            return mv;
        }

        System.out.println("DEBUG(AdminLoginCotroller): gotcha !");

        request.getSession().setAttribute("adminlogininfo", li);
        mv.addObject("loginfo", li);
        return mv;
    }

}
