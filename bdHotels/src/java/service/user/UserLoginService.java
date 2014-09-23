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
import springModel.user.UserLoginInfo;

/**
 *
 * @author santu
 */
public class UserLoginService {

    public UserLoginInfo login(UserLoginInfo li,HttpServletRequest request)
    {
        UserLoginInfo userLoginInfo=null;
        Session session=null;
        List result=null;
        try
        {
              session= HibernateUtil.getSessionFactory().getCurrentSession();
              session.beginTransaction();
              result=session.createQuery("from Customer where username='"+li.getUsername()+"' and password='"+li.getPassword()+"'").list();
              if(result.isEmpty())
              {
                  return null;
              }
              else
              {
                  userLoginInfo=new UserLoginInfo();
                  Customer thisCustomer=(Customer) result.get(0);
                  userLoginInfo.setCustomerId(thisCustomer.getCustomerId());
                  userLoginInfo.setFirstName(thisCustomer.getFirstName());
                  userLoginInfo.setMiddleName(thisCustomer.getMiddleName());
                  userLoginInfo.setLastName(thisCustomer.getLastName());
                  userLoginInfo.setStreetNo(thisCustomer.getStreetNo());
                  userLoginInfo.setStreetName(thisCustomer.getStreetName());
                  userLoginInfo.setApartmentNo(thisCustomer.getApartmentNo());
                  userLoginInfo.setAreaCode(thisCustomer.getAreaCode());
                  userLoginInfo.setCity(thisCustomer.getCity());
                  userLoginInfo.setDistrict(thisCustomer.getDistrict());
                  userLoginInfo.setDivision(thisCustomer.getDivision());
                  userLoginInfo.setUsername(thisCustomer.getUsername());
                  userLoginInfo.setPassword(thisCustomer.getPassword());
                  userLoginInfo.setEmail(thisCustomer.getEmail());
                  userLoginInfo.setAlternateEmail(thisCustomer.getAlternateEmail());
                  
                  request.getSession().setAttribute("loggedUser",result.get(0));
              }
              session.getTransaction().commit();

        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        return userLoginInfo;
    }
}
