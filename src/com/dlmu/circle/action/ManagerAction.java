package com.dlmu.circle.action;

import com.dlmu.circle.dao.ManagerDao;
import com.dlmu.circle.model.Manager;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by cf on 2017/4/8.
 */
public class ManagerAction extends ActionSupport implements ServletRequestAware {
    private HttpServletRequest request;
    private ManagerDao managerDao=new ManagerDao();

    private Manager manager;
    private String error;

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String login()throws Exception{
        HttpSession session=request.getSession();
        Manager currentUser=managerDao.login(manager);
        System.out.println(currentUser);
        if(currentUser==null){
            error="用户名或密码错误";
            return ERROR;
        }else{
            session.setAttribute("currentUser", currentUser);
            return SUCCESS;
        }
    }
    public String logout() throws Exception{
        //把所有的sesssion给清掉

        request.getSession().invalidate();
        return "logout";
    }
    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request=httpServletRequest;
    }
}
