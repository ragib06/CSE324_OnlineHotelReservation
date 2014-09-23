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
import org.hibernate.classic.Session;
import springModel.hotel.Advertise;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import service.hotel.AddAdvertiseService;

/**
 *
 * @author santu
 */
public class AddAdvertiseController extends SimpleFormController {

    private AddAdvertiseService addAvertiseService;
    private Session session;
    private List result;
   
    public AddAdvertiseController ()
    {
        setCommandClass(Advertise.class);
        setCommandName("fileuploadform");
        setSuccessView("addadvertise_success");
        addAvertiseService=new AddAdvertiseService();
    }

//    public void setAddAdvertiseService(AddAdvertiseService addAvertiseService) {
//        this.addAvertiseService = addAvertiseService;
//    }


    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response,
            Object command, BindException errors) throws Exception {

         // cast the bean
        Advertise advertise = (Advertise) command;
        //System.out.println(request.getRequestURL());

        byte[] file = advertise.getAdvertiseImageFile();
        Hotel loggedHotel=(Hotel) request.getSession().getAttribute("loggedHotel");
        if(loggedHotel==null){
            response.sendRedirect("index.htl");
        }
        session= HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        result=session.createQuery("select max(advertisementId)from Advertisements").list();
        String imageid="";
        if(result.get(0) != null){
            Integer id=Integer.parseInt(result.get(0).toString());
            id++;
            imageid=id.toString()+".jpg";
            System.out.println("image id is : "+imageid);
        }else{
            imageid = "1.jpg";
        }
        if(file!=null)
        {
            // make reference to image directory
            String basePath = request.getSession().getServletContext().getRealPath("");
            String imageDir = basePath + "/images/advertises/";
            File dir=new File(imageDir);
            if(dir.exists()==false){
                dir.mkdir();
            }
            imageDir = basePath + "/images/advertises/"+loggedHotel.getName();
            dir=new File(imageDir);
            if(dir.exists()==false){
                dir.mkdir();
            }

            System.out.println("Image Directory : "+imageDir);
            OutputStream f1 = new FileOutputStream(imageDir+"/"+imageid);
            f1.write(file);
            f1.close();
            System.out.println("Image file "+imageid+" saved!!");
            advertise.setPictureUrl("images/advertises/"+loggedHotel.getName()+"/"+imageid);
        }

        this.addAvertiseService.add(advertise, loggedHotel);

        ModelAndView mv = new ModelAndView(getSuccessView());
        //regService.register(ri);
        //bean.setPictureUrl("images/"+"image1.jpg");
        mv.addObject("advert", advertise);
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

