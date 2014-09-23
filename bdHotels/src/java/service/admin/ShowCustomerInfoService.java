/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service.admin;

import hibernateModel.Customer;
import hibernateModel.HibernateUtil;
import java.util.List;
import java.util.Vector;
import org.hibernate.Session;

/**
 *
 * @author NAUTILUS
 */
public class ShowCustomerInfoService {
    
    Session session=null;
    List result=null;
    public Vector<Customer> getCustomerInfo()
    {
        //query for all hotels registered

        Vector<Customer> cusInfos = null;
        try
        {
              session= HibernateUtil.getSessionFactory().getCurrentSession();
              session.beginTransaction();
              result=session.createQuery("from Customer").list();
              System.out.println("Successfully return customers from database");
              session.getTransaction().commit();
              cusInfos= new Vector<Customer>();
              for (int i = 0; i < result.size(); i++)
              {
                  cusInfos.add((Customer)result.get(i));
              }
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        return cusInfos;
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
