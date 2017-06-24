<%--
  Created by IntelliJ IDEA.
  User: cf
  Date: 2017/4/9
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="data_list">
    <div class="data_info">
        <p>${currentUser.name }&nbsp;成绩列表</p>
    </div>
    <div class="data_content">
        <table class="table table-bordered table-hover">
            <tr>
                <th>序号</th>
                <th>试卷名称</th>
                <th>考试日期</th>
                <th>单选题得分</th>
                <th>多选题得分</th>
                <th>总分</th>
            </tr>
            <c:forEach var="exam" items="${examList}" varStatus="status">
                <tr>
                    <td>${status.index+1}</td>
                    <td>${exam.paper.paperName}</td>
                    <td><fmt:formatDate value="${exam.examDate }" type="date" pattern="yyyy-MM-dd"/></td>
                    <td>${exam.singleScore}</td>
                    <td>${exam.moreScore}</td>
                    <td>${exam.score}</td>
                </tr>
            </c:forEach>

        </table>
    </div>
</div>
</body>
</html>
