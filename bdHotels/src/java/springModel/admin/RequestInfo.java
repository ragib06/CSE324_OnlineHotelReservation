/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package springModel.admin;

/**
 *
 * @author Dhiman
 */
public class RequestInfo {

    private int id;
    private String requesttype;
    private String action;

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRequesttype() {
        return requesttype;
    }

    public void setRequesttype(String requesttype) {
        this.requesttype = requesttype;
    }

    
}
