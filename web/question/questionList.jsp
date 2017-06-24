<%--
  Created by IntelliJ IDEA.
  User: cf
  Date: 2017/4/11
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">

    </script>
</head>
<body>
<div class="data_list">
    <div class="data_info">
        <p>试题信息管理</p>
    </div>
    <div class="search_content">
        <form method="post" action="${pageContext.request.contextPath}/question!list">
            <table>
                <tr>
                    <td><label>考试题目：</label></td>
                    <td><input type="text" id="s_subject" name="s_question.subject" value="${s_question.subject}"></td>
                    <td>&nbsp;</td>

                    <td><button class="btn btn-primary" style="margin-bottom: 8px" type="submit">查询</button></td>

                </tr>
            </table>
        </form>
        <button style="float: right;margin-bottom: 8px;" class="btn btn-mini btn-primary" type="button" onclick="javascript:window.location='question!preSave'">添加考生题目</button>
    </div>
    <div class="data_content">
        <table class="table table-bordered table-hover">
            <tr>
                <th>序号</th>
                <th>考试题目</th>
                <th>加入时间</th>
                <th>题目类型</th>
                <th>所属试卷</th>
                <th>操作</th>

            </tr>
            <c:forEach var="question" items="${questionList }" varStatus="status">
                <tr>
                    <td>${status.index+1 }</td>
                    <td>${question.subject }</td>
                    <td><fmt:formatDate value="${question.joinTime }" type="date" pattern="yyyy-MM-dd"/></td>
                    <c:choose>
                        <c:when test="${question.type==1 }">
                            <td>单选题</td>
                        </c:when>
                        <c:otherwise>
                            <td>多选题</td>
                        </c:otherwise>
                    </c:choose>
                    <td>${question.paper.paperName }</td>
                    <td><button class="btn btn-mini btn-info" type="button" onclick="javascript:window.location='question!getQuestionById?questionId=${question.id}'">查看试题</button>&nbsp;&nbsp;<button class="btn btn-mini btn-info" type="button" onclick="javascript:window.location='question!preSave?questionId=${question.id}'">修改</button>&nbsp;&nbsp;<button class="btn btn-mini btn-danger" type="button" onclick="">删除</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div>
        <div class="pagination pagination-centered">
            <ul>
                ${pageCode }
            </ul>
        </div>
    </div>
</div>
</body>
</html>
