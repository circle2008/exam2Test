package com.dlmu.circle.action;

import com.dlmu.circle.dao.StudentDao;
import com.dlmu.circle.model.PageBean;
import com.dlmu.circle.model.Student;
import com.dlmu.circle.util.DateUtil;
import com.dlmu.circle.util.PageUtil;
import com.dlmu.circle.util.ResponseUtil;
import com.dlmu.circle.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by cf on 2017/4/8.
 */
public class StudentAction extends ActionSupport implements ServletRequestAware {
    private HttpServletRequest request;
    private StudentDao studentDao=new StudentDao();
    private List<Student> studentList;
    private Student student;
    private Student s_student;
    private String error;
    private String mainPage;
    private String page;//当前页
    private int total;//记录数
    private String pageCode;//传回页面的分页代码
    private String title;
    private String id;

    public Student getStudent() {
        return student;
    }



    public void setStudent(Student student) {
        this.student = student;
    }



    public String getError() {
        return error;
    }



    public void setError(String error) {
        this.error = error;
    }

    public String getMainPage() {
        return mainPage;
    }

    public void setMainPage(String mainPage) {
        this.mainPage = mainPage;
    }

    public List<Student> getStudentList() {
        return studentList;
    }

    public void setStudentList(List<Student> studentList) {
        this.studentList = studentList;
    }

    public Student getS_student() {
        return s_student;
    }

    public void setS_student(Student s_student) {
        this.s_student = s_student;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getPageCode() {
        return pageCode;
    }

    public void setPageCode(String pageCode) {
        this.pageCode = pageCode;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String login()throws Exception{
        HttpSession session=request.getSession();
        Student currentUser=studentDao.login(student);
        System.out.println(currentUser);
        if(currentUser==null){
            error="准考证号或密码错误";
            return ERROR;
        }else{
            session.setAttribute("currentUser", currentUser);
            return SUCCESS;
        }
    }
    //修改预操作
    public String preUpdatePassword()throws Exception{
        mainPage="student/updatePassword.jsp";
        return SUCCESS;
    }

    public String updatePassword()throws Exception{
        Student s=studentDao.getStudentById(student.getId());
        s.setPassword(student.getPassword());
        studentDao.saveStudent(s);
        mainPage="student/updateSuccess.jsp";
        return SUCCESS;
    }
    public String list()throws Exception{
        HttpSession session=request.getSession();
        if(StringUtil.isEmpty(page)){
            page="1";
        }
        if(s_student==null){
            Object o=session.getAttribute("s_student");
            if(o!=null){
                s_student=(Student)o;
            }else{
                s_student=new Student();
            }

        }else {
            session.setAttribute("s_student", s_student);
        }
        PageBean pageBean=new PageBean(Integer.parseInt(page),5);
        studentList=studentDao.getStudents(s_student,pageBean);
        mainPage="student/studentList.jsp";
        total=studentDao.studentCount(s_student);
        pageCode= PageUtil.genPagination(request.getContextPath()+"/student!list",total,Integer.parseInt(page),5);
        return SUCCESS;
    }
    public String preSave() throws Exception{
        if(StringUtil.isNotEmpty(id)){
            title="修改学生信息";
            student=studentDao.getStudentById(id);
        }else {
            title="添加学生信息";
        }

        mainPage="student/studentAdd.jsp";
        return SUCCESS;
    }
    public String savaStudent()throws Exception{
        if(StringUtil.isEmpty(student.getId())){
            student.setId("JS"+ DateUtil.getCurrentDateStr());
        }
        studentDao.saveStudent(student);
        return "save";
    }
    public String deleteStudent()throws Exception{
        student=studentDao.getStudentById(id);
        studentDao.studentDelete(student);
        JSONObject resultJson=new JSONObject();
        resultJson.put("success", true);
        ResponseUtil.write(resultJson, ServletActionContext.getResponse());
        return null;
    }
    public String logout() throws Exception{
        //把所有的logout给清掉

        request.getSession().invalidate();
        return "logout";
    }
    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request=httpServletRequest;
    }
}
