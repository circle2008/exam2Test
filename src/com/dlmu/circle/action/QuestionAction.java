package com.dlmu.circle.action;

import com.dlmu.circle.dao.PaperDao;
import com.dlmu.circle.dao.QuestionDao;
import com.dlmu.circle.model.PageBean;
import com.dlmu.circle.model.Paper;
import com.dlmu.circle.model.Question;
import com.dlmu.circle.util.PageUtil;
import com.dlmu.circle.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by cf on 2017/4/27.
 */
public class QuestionAction extends ActionSupport implements ServletRequestAware {
    private HttpServletRequest request;
    private QuestionDao questionDao=new QuestionDao();
    private PaperDao paperDao=new PaperDao();
    private Question s_question;
    private List<Question> questionList;
    private List<Paper> paperList;

    private String mainPage;
    private String page;//当前页
    private int total;//记录数
    private String pageCode;//传回页面的分页代码
    private String questionId;
    private Question question;
    private String title;

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public String getQuestionId() {
        return questionId;
    }

    public void setQuestionId(String questionId) {
        this.questionId = questionId;
    }

    public Question getS_question() {
        return s_question;
    }

    public void setS_question(Question s_question) {
        this.s_question = s_question;
    }

    public List<Question> getQuestionList() {
        return questionList;
    }

    public void setQuestionList(List<Question> questionList) {
        this.questionList = questionList;
    }

    public String getMainPage() {
        return mainPage;
    }

    public void setMainPage(String mainPage) {
        this.mainPage = mainPage;
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

    public List<Paper> getPaperList() {
        return paperList;
    }

    public void setPaperList(List<Paper> paperList) {
        this.paperList = paperList;
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request=httpServletRequest;
    }
    public String list()throws Exception{
        HttpSession session=request.getSession();
        if(StringUtil.isEmpty(page)){
            page="1";
        }
        if(s_question==null){
            Object o=session.getAttribute("s_question");
            if(o!=null){
                s_question=(Question) o;
            }else{
                s_question=new Question();
            }

        }else {
            session.setAttribute("s_question", s_question);
        }
        PageBean pageBean=new PageBean(Integer.parseInt(page),5);
        questionList=questionDao.getQuestions(s_question,pageBean);
        mainPage="question/questionList.jsp";
        total=questionDao.questionCount(s_question);
        pageCode= PageUtil.genPagination(request.getContextPath()+"/question!list",total,Integer.parseInt(page),5);
        return SUCCESS;
    }
    public String getQuestionById()throws Exception{
        question=questionDao.getQuestion(questionId);
        mainPage="question/questionShow.jsp";
        return SUCCESS;
    }
    public String preSave() throws Exception{
        paperList=paperDao.getPapers();
        if(StringUtil.isNotEmpty(questionId)){
            title="修改试卷信息";
            question=questionDao.getQuestion(questionId);
        }else {
            title="添加试卷信息";
        }

        mainPage="question/questionAdd.jsp";
        return SUCCESS;
    }
    public String savaQuestion()throws Exception{
        if(StringUtil.isNotEmpty(question.getId()+"")){
            question.setId(question.getId());
        }
        questionDao.saveQuestion(question);
        return "save";
    }
}
