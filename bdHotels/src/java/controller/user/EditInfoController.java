package controller.user;


import hibernateModel.Customer;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import service.user.EditInfoService;
import springModel.user.RegistrationForm;





public class EditInfoController extends SimpleFormController {

    private EditInfoService editInfoService;
    private Map refData = new HashMap();

    public EditInfoController() {
        //Initialize controller properties here or
        //in the Web Application Context

        setCommandClass(RegistrationForm.class);
        setCommandName("edit");
        setSuccessView("edit_success");
        setFormView("editinfo");
        this.editInfoService =new EditInfoService();
    }

    

    @Override
    protected Map referenceData(HttpServletRequest request) throws ServletException {
        refData.put("customer",(Customer)request.getSession().getAttribute("loggedUser"));
        return refData;
    }

    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        ModelAndView mv = new ModelAndView(getSuccessView());
        RegistrationForm ri = (RegistrationForm) command;
        Customer c=(Customer)request.getSession().getAttribute("loggedUser");
        if(c!=null)
        {
            editInfoService.edit(ri,c.getCustomerId(),request);
            mv.addObject("user", ri);
        }
        else
        {
            System.out.println("bash");
        }

        
        return mv;
    }

}