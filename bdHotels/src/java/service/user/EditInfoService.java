/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service.user;

import hibernateModel.Customer;
import hibernateModel.HibernateUtil;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.Session;
import springModel.user.RegistrationForm;

/**
 *
 * @author santu
 */
public class EditInfoService {

    Session session=null;
    List result=null;

    public void edit(RegistrationForm ri,int customerID,HttpServletRequest request)
    {
        session= HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        result= session.createQuery("from Customer where customerId="+customerID).list();
        Customer myCustomer=(Customer)result.get(0);
        myCustomer.setFirstName(ri.getFirstname());
        myCustomer.setMiddleName(ri.getMiddlename());
        myCustomer.setLastName(ri.getLastname());
        myCustomer.setApartmentNo(ri.getApartmentno());
        myCustomer.setStreetNo(ri.getStreetno());
        myCustomer.setStreetName(ri.getStreetname());
        myCustomer.setCity(ri.getCity());
        myCustomer.setDistrict(ri.getDistrict());
        myCustomer.setDivision(ri.getDivision());
        myCustomer.setAreaCode(ri.getZipcode());
        myCustomer.setEmail(ri.getEmail());
        myCustomer.setAlternateEmail(ri.getAlteremail());
        myCustomer.setUsername(ri.getUsername());
        myCustomer.setPassword(ri.getPassword());
        myCustomer.setMobileNo(ri.getMobile());
        myCustomer.setTelephoneNo(ri.getPhone());
        session.save(myCustomer);
        System.out.println("Successfully data updated in Customer Table!");
        session.getTransaction().commit();
        request.getSession().setAttribute("loggedUser",myCustomer);
    }


    public Customer getCustomerSpecificInfo(String customerID)
     {
        try
        {
              session= HibernateUtil.getSessionFactory().getCurrentSession();
              session.beginTransaction();
              result=session.createQuery("from Customer where customerId="+customerID).list();
              session.getTransaction().commit();
              return (Customer)result.get(0);
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        return null;
     }
}
