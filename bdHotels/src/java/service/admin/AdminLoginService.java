/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service.admin;

import springModel.admin.AdminLoginInfo;
/**
 *
 * @author NAUTILUS
 */
public class AdminLoginService {

    public boolean login(AdminLoginInfo li){
        return (li.getUsername().compareTo("admin")==0 && li.getPassword().compareTo("admin")==0);
    }
}
