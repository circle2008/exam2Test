<%--
  Created by IntelliJ IDEA.
  User: cf
  Date: 2017/4/11
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function paperDelete(paperId){
            if(confirm("确定要删除这条记录吗?")){
                $.post("paper!deletePaper",{paperId:paperId},
                        function(result){
                            alert(result);
                            var result=eval('('+result+')');
                            if(result.success){
                                alert("删除成功！");
                                window.location.href="${pageContext.request.contextPath}/paper!paperList";
                            }else{
                                alert(result.error);
                            }
                        }
                );
            }
        }
    </script>
</head>
<body>
<div class="data_list">
    <div class="data_info">
        <p>试卷信息管理</p>
    </div>
    <div class="search_content">
        <button style="float: right;margin-bottom: 8px;" class="btn btn-mini btn-primary" type="button" onclick="javascript:window.location='paper!preSave'">添加试卷</button>
    </div>
    <div class="data_content">
        <table class="table table-bordered table-hover">
            <tr>
                <th>序号</th>
                <th>试卷名称</th>
                <th>添加日期</th>
                <th>操作</th>

            </tr>
            <c:forEach var="papers" items="${paperList}" varStatus="status">
                <tr>
                    <td>${status.index+1}</td>
                    <td>${papers.paperName}</td>
                    <td><fmt:formatDate value="${papers.joinDate}" type="date" pattern="yyyy-MM-dd"/></td>
                    <td><button class="btn btn-mini btn-info" type="button" onclick="javascript:window.location='paper!preSave?paperId=${papers.id}'">修改</button>&nbsp;&nbsp;<button class="btn btn-mini btn-danger" type="button" onclick="paperDelete('${papers.id}')">删除</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>

</div>
</body>
</html>
