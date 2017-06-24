<%--
  Created by IntelliJ IDEA.
  User: cf
  Date: 2017/4/11
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function checkForm() {
            var subject=$("#subject").val();
            var type=$("#type").val();
            var paperName=$("#paperName").val();
            var joinTime=$("#joinTime").val();
            var optionA=$("#optionA").val();
            var optionB=$("#optionB").val();
            var optionC=$("#optionC").val();
            var optionD=$("#optionD").val();
            var answer=$("#answer").val();
            if(subject==null||subject==""){
                $("#error").html("考试题目不能为空！");
                return false;
            }
            if(type==null||type==""){
                $("#error").html("题目类别不能为空");
                return false;
            }
            if(paperName==null||paperName==""){
                $("#error").html("试卷名不能为空！");
                return false;
            }
            if(joinTime==null || joinTime==""){
                $("#error").html("加入时间不能为空！");
                return false;
            }

            if(optionA==null || optionA==""){
                $("#error").html("选项一不能为空！");
                return false;
            }
            if(optionB==null || optionB==""){
                $("#error").html("选项二不能为空！");
                return false;
            }
            if(optionC==null || optionC==""){
                $("#error").html("选项三不能为空！");
                return false;
            }
            if(optionD==null || optionD==""){
                $("#error").html("选项四不能为空！");
                return false;
            }
            if(answer==null || answer==""){
                $("#error").html("答案不能为空！");
                return false;
            }
            return true;
        }
    </script>

</head>
<body>
<div class="data_list">
    <div class="data_info">
        <p>${title}</p>
    </div>
    <div class="data_content">
        <form action="question!savaQuestion" method="post" onsubmit="checkForm()">
            <table width="90%" align="center">
                <tr>
                    <td><label>考试题目：</label></td>
                    <td>
                        <input type="text" id="subject" value="${question.subject }" name="question.subject" class="input-xxlarge"/>
                    </td>
                </tr>
                <tr>
                    <td><label>题目类型：</label></td>
                    <td>
                        <select id="type" name="question.type">
                            <option value="">请选择题目类型</option>
                            <option value="1" ${question.type==1?'selected':'' }>单选题</option>
                            <option value="2" ${question.type==2?'selected':'' }>多选题</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>所属试卷：</label></td>
                    <td>
                        <select id="paperName" name="question.paper.id">
                            <option value="">请选择试卷</option>
                            <c:forEach items="${paperList}" var="papers">
                                <option value="${papers.id}" ${papers.id==question.paper.id?'selected':'' }>${papers.paperName}</option>
                            </c:forEach>
                        </select>

                    </td>
                </tr>
                <tr>
                    <td><label>加入时间：</label></td>
                    <td>
                        <input type="text" id="joinTime" class="Wdate" onClick="WdatePicker()" value="<fmt:formatDate value="${question.joinTime }" type="date" pattern="yyyy-MM-dd"/>" name="question.joinTime"/>
                    </td>
                </tr>
                <tr>
                    <td><label>选项一：</label></td>
                    <td>
                        <input type="text" id="optionA" value="${question.optionA }" name="question.optionA"/>
                    </td>
                </tr>
                <tr>
                    <td><label>选项二：</label></td>
                    <td>
                        <input type="text" id="optionB" value="${question.optionB }" name="question.optionB"/>
                    </td>
                </tr>
                <tr>
                    <td><label>选项三：</label></td>
                    <td>
                        <input type="text" id="optionC" value="${question.optionC }" name="question.optionC "/>
                    </td>
                </tr>
                <tr>
                    <td><label>选项四：</label></td>
                    <td>
                        <input type="text" id="optionD" value="${question.optionD }" name="question.optionD"/>
                    </td>
                </tr>
                <tr>
                    <td><label>题目答案：</label></td>
                    <td>
                        <input type="text" id="answer" value="${question.answer }" name="question.answer"/>&nbsp;&nbsp;(多选题答案用逗号隔开，如"A,D")
                    </td>
                </tr>
                <tr>
                    <td>
                    <td><input type="hidden" id="questionId" name="question.id" value="${question.id }"/><button class="btn btn-primary" type="submit">保存</button>
                    </td>
                    <td colspan="4">
                        <button class="btn btn-primary" type="button" onclick="javascript:history.back()">返回</button>
                        &nbsp;&nbsp;<font id="error" color="red">${error }</font>
                    </td>
                </tr>
            </table>
        </form>

    </div>
</div>
</body>
</html>
