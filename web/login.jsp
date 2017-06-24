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

    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        function checkForm(){
            var id=document.getElementById("id").value;
            var password=document.getElementById("password").value;
            if(id==null || id==""){
                alert("准考证号不能为空！");
                return false;
            }
            if(password==null || password==""){
                alert("登录密码不能为空！");
                return false;
            }
            return true;
        }
        function resetValue(){
            document.getElementById("id").value="";
            document.getElementById("password").value="";
        }
    </script>
</head>
<body>
<div align="center" style="padding-top: 20px;">
    <form action="student!login" method="post" onsubmit="return checkForm()">
        <table width="1004" height="584" background="${pageContext.request.contextPath}/image/login.jpg">
            <tr height="200">
                <td colspan="4"></td>
            </tr>
            <tr height="10">
                <td width="68%"></td>
                <td width="10%"><label>准号证号：</label></td>
                <td><input type="text" id="id" name="student.id" value="${student.id }"/></td>
                <td width="30%"></td>
            </tr>
            <tr height="10">
                <td width="68%"></td>
                <td width="10%"><label>登录密码：</label></td>
                <td><input type="password" id="password" name="student.password" value="${student.password }"/></td>
                <td width="30%"></td>
            </tr>
            <tr height="10">
                <td width="68%"></td>
                <td width="10%"><button class="btn btn-primary" type="submit">登录</button></td>
                <td><button class="btn btn-primary" type="button" onclick="resetValue()">重置</button></td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
<script>
    if('${error}'!=''){
        alert('${error}');
    }
</script>