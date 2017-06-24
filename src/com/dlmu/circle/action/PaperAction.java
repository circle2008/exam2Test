package com.dlmu.circle.action;

import com.dlmu.circle.dao.PaperDao;
import com.dlmu.circle.dao.QuestionDao;
import com.dlmu.circle.model.Paper;
import com.dlmu.circle.model.Question;
import com.dlmu.circle.util.ResponseUtil;
import com.dlmu.circle.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import java.util.*;

/**
 * Created by cf on 2017/4/8.
 */
public class PaperAction extends ActionSupport {
    private QuestionDao questionDao=new QuestionDao();
    private PaperDao paperDao=new PaperDao();

    private String mainPage;
    private List<Paper> paperList=new ArrayList<Paper>();
    private String title;
    //试卷构建随机问题的变量
    private String paperId;
    private Paper paper;
    private List<Question> squestionList=new ArrayList<Question>();//单选
    private List<Question> mquestionList=new ArrayList<Question>();//双选


    public String getMainPage() {
        return mainPage;
    }

    public void setMainPage(String mainPage) {
        this.mainPage = mainPage;
    }

    public List<Paper> getPaperList() {
        return paperList;
    }

    public void setPaperList(List<Paper> paperList) {
        this.paperList = paperList;
    }

    public String getPaperId() {
        return paperId;
    }

    public void setPaperId(String paperId) {
        this.paperId = paperId;
    }

    public Paper getPaper() {
        return paper;
    }

    public void setPaper(Paper paper) {
        this.paper = paper;
    }

    public List<Question> getSquestionList() {
        return squestionList;
    }

    public void setSquestionList(List<Question> squestionList) {
        this.squestionList = squestionList;
    }

    public List<Question> getMquestionList() {
        return mquestionList;
    }

    public void setMquestionList(List<Question> mquestionList) {
        this.mquestionList = mquestionList;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String list() throws Exception{
        paperList=paperDao.getPapers();
        mainPage="exam/selectPaper.jsp";
        return SUCCESS;

    }
    public String paperList()throws Exception{
        paperList=paperDao.getPapers();
        mainPage="paper/paperList.jsp";
        return SUCCESS;
    }
    public String deletePaper()throws Exception{
        paper=paperDao.getPaper(paperId);
        JSONObject resultJson=new JSONObject();
        if(questionDao.existQuestionByPaperId(paperId)){
            resultJson.put("error", "试卷下有题目，不能删除");
        }else {
            paperDao.paperDelete(paper);
            resultJson.put("success", true);
        }
        ResponseUtil.write(resultJson, ServletActionContext.getResponse());
        return null;
    }
    public String preSave() throws Exception{
        if(StringUtil.isNotEmpty(paperId)){
            title="修改试卷";
            paper=paperDao.getPaper(paperId);
        }else {
            title="添加试卷";
        }

        mainPage="paper/paperAdd.jsp";
        return SUCCESS;
    }
    public String savePaper()throws Exception{
        if(StringUtil.isNotEmpty(paperId)){
            paper.setId(Integer.parseInt(paperId));
        }else {
            paper.setJoinDate(new Date());
        }
       paperDao.savePaper(paper);
        return "save";
    }
    public String getDetailPaper() throws Exception{
        paper=paperDao.getPaper(paperId);
        //随机获取问题集合
        Set<Question> questionSet=paper.getQuestions();
        Iterator<Question> it=questionSet.iterator();
        while (it.hasNext()){
            Question q=it.next();
            if(q.getType().equals("1")){
                squestionList.add(q);
            }else {
                mquestionList.add(q);
            }
        }
        //在单选和多选中随机抽取一定数量的题目
        squestionList=getRandomQuestions(squestionList,3);
        mquestionList=getRandomQuestions(mquestionList,2);
        mainPage="exam/paper.jsp";
        return SUCCESS;

    }
    private List<Question> getRandomQuestions(List<Question> questionList, int num){
        List<Question> resultList=new ArrayList<Question>();
        Random random=new Random();
        if(num>0){
            for(int i=1;i<=num;i++){
                int n=random.nextInt(questionList.size());
                Question q=questionList.get(n);
                //避免产生问题重复
                if(resultList.contains(q)){
                    i--;
                }else {
                    resultList.add(q);
                }
            }
        }
        return resultList;
    }
}
