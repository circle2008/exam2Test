<%--
  Created by IntelliJ IDEA.
  User: cf
  Date: 2017/4/8
  Time: 20:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    function logout() {
        if(confirm("你确定要推出系统吗")){
            window.location.href="student!logout";
        }
    }
    function logout2() {
        if(confirm("你确定要推出系统吗")){
            window.location.href="Manager!logout";
        }
    }
</script>
<div class="navbar">
    <div class="navbar-inner">
        <a class="brand" href="${pageContext.request.contextPath}/main.jsp">首页</a>

        <ul class="nav">
            <c:choose>
                <c:when test="${currentUser.flag==1}">
                    <li><a href="${pageContext.request.contextPath}/student!list">考生信息管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/Exam!list">考生成绩查询</a></li>
                    <li><a href="${pageContext.request.contextPath}/paper!paperList">试卷管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/question!list">题目管理</a></li>
                    <li><a href="javascript:logout2()">退出系统</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageContext.request.contextPath}/paper!list">在线考试</a></li>
                    <li><a href="${pageContext.request.contextPath}/Exam!getExams?s_exam.student.id=${currentUser.id}">成绩查询</a></li>
                    <li><a href="${pageContext.request.contextPath}/student!preUpdatePassword">修改密码</a></li>
                    <li><a href="javascript:logout()">退出系统</a></li>
                </c:otherwise>
            </c:choose>

        </ul>

    </div>
</div>
