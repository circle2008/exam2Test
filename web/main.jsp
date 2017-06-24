<%--
  Created by IntelliJ IDEA.
  User: cf
  Date: 2017/4/8
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/style/exam.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
    <%
        String mainPage=(String) request.getAttribute("mainPage");
        if(mainPage==null ||mainPage.equals("")){
            mainPage="commen/default.jsp";
        }
    %>
</head>
<body>
<table width="1000px" align="center">
    <tr>
        <td>
            <jsp:include page="commen/header.jsp"></jsp:include>
        </td>
    </tr>
    <tr>
        <td>
            <jsp:include page="commen/menu.jsp"></jsp:include>
        </td>
    </tr>
    <tr>
        <td>
            <jsp:include page="<%=mainPage%>"></jsp:include>
        </td>
    </tr>
    <tr>
        <td>
            <jsp:include page="commen/footer.jsp"></jsp:include>
        </td>
    </tr>
</table>
</body>
</html>
