/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service.user;

import springModel.user.RegistrationForm;
import hibernateModel.Customer;
import hibernateModel.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author NAUTILUS
 */
public class RegistrationService {

    public void register(RegistrationForm ri)
    {
        Session session=null;
        try
        {
              session= HibernateUtil.getSessionFactory().getCurrentSession();
              session.beginTransaction();
              Customer customer = new Customer();
              customer.setFirstName(ri.getFirstname());
              customer.setMiddleName(ri.getMiddlename());
              customer.setLastName(ri.getLastname());
              customer.setApartmentNo(ri.getApartmentno());
              customer.setStreetNo(ri.getStreetno());
              customer.setStreetName(ri.getStreetname());
              customer.setCity(ri.getCity());
              customer.setDistrict(ri.getDistrict());
              customer.setDivision(ri.getDivision());
              customer.setAreaCode(ri.getZipcode());
              customer.setEmail(ri.getEmail());
              customer.setAlternateEmail(ri.getAlteremail());
              customer.setUsername(ri.getUsername());
              customer.setPassword(ri.getPassword());
              if(ri.getMobile().equals("")==false)
              {
                  customer.setMobileNo(ri.getMobile());
              }
              if(ri.getPhone().equals("")==false)
              {
                  customer.setTelephoneNo(ri.getPhone());
              }
              session.save(customer);
              System.out.println("Successfully data insert in database");
              session.getTransaction().commit();
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        finally
        {
            //if(session!=null)
            {
               // session.close();
            }
        }
    }

    public List UserNameList()
    {
        List result=null;
        Session session=null;
        ArrayList userNameList=new ArrayList();
        session= HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        result= session.createQuery("from Customer").list();
        for(int i=0; i<result.size();i++)
        {
            userNameList.add(((Customer)result.get(i)).getUsername());
        }
        return userNameList;
    }

}
