/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.hotel;
import hibernateModel.HibernateUtil;
import hibernateModel.Hotel;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;
import org.hibernate.Session;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import service.hotel.AddTravelGuideService;
import springModel.hotel.TravelGuide;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/** 
 *
 * @author NAUTILUS
 */
public class AddTravelGuideController extends SimpleFormController {

    private AddTravelGuideService addTravelGuideService;
    private Session session;
    private List result;

    public void setAddTravelGuideService(AddTravelGuideService addTravelGuideService) {
        this.addTravelGuideService = addTravelGuideService;
    }
    
    public AddTravelGuideController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        setCommandClass(TravelGuide.class);
        setCommandName("addTravelGuide");
        setSuccessView("addtravelGuide_success");
        setFormView("addtravelguide");
    }
    
    //Use onSubmit instead of doSubmitAction 
    //when you need access to the Request, Response, or BindException objects
    
    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response,
            Object command, BindException errors) throws Exception {

        TravelGuide tGuide = (TravelGuide) command;

        byte[] file = tGuide.gettGuideImageFile();
        Hotel loggedHotel=(Hotel) request.getSession().getAttribute("loggedHotel");
        if(loggedHotel==null){
            response.sendRedirect("index.htl");
        }
        session= HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        result=session.createQuery("select max(travelGuideId)from Travelguide").list();
        String imageid="";
        if(result.get(0) != null){
            Integer id = Integer.parseInt(result.get(0).toString());
            id++;
            imageid=id.toString()+".jpg";
            System.out.println("image id is : "+imageid);
        }else{
            imageid="1.jpg";
        }
        if(file!=null)
        {
            // make reference to image directory
            String basePath = request.getSession().getServletContext().getRealPath("");
            String imageDir = basePath + "/images/travelguide/";
            File dir=new File(imageDir);
            if(dir.exists()==false){
                dir.mkdir();
            }
            imageDir = basePath + "/images/travelguide/"+loggedHotel.getName();
            dir=new File(imageDir);
            if(dir.exists()==false){
                dir.mkdir();
            }

            System.out.println("Image Directory : "+imageDir);
            OutputStream f1 = new FileOutputStream(imageDir+"/"+imageid);
            f1.write(file);
            f1.close();
            System.out.println("Image file "+imageid+" saved!!");
            tGuide.setPictureUrl("images/travelguide/"+loggedHotel.getName()+"/"+imageid);
        }

        this.addTravelGuideService.add(tGuide, loggedHotel);

        ModelAndView mv = new ModelAndView(getSuccessView());
        //regService.register(ri);
        //bean.setPictureUrl("images/"+"image1.jpg");
        mv.addObject("tGuide", tGuide);
        return mv;
    }

    @Override
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder)
        throws ServletException {
        // to actually be able to convert Multipart instance to byte[]
        // we have to register a custom editor
        binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
        // now Spring knows how to handle multipart object and convert them
    }
    

}