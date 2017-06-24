<%--
  Created by IntelliJ IDEA.
  User: cf
  Date: 2017/4/9
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        function checkForm() {
            var paperId=$("#paperId").val();
            if(paperId==null||paperId==""){
                alert("请选择考试试卷！");
                return false;
            }else {
                return true;
            }
        }
    </script>
</head>
<body>
<div class="data_list">
    <div class="data_content">
        <form action="paper!getDetailPaper" method="post" onsubmit="return checkForm()">
            <table width="40%" align="center">
                <tr>
                    <td><label><strong>请选择考试试卷</strong></label></td>
                    <td>
                        <select id="paperId" name="paperId">
                            <option value="">——请选择——</option>
                            <c:forEach var="paper" items="${paperList}">
                                <option value="${paper.id}">${paper.paperName}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" class="btn btn-primary" value="确定"/>
                    </td>
                    <td>
                        <input type="button" class="btn btn-primary" value="返回" onclick="javascript:history.back()"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
