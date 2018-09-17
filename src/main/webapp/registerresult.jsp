<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yoona
  Date: 2018/3/28
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>激活页面</title>
</head>
<body>
<div style="margin: 0 auto; text-align: center;">
<c:if test="${type=='1'}"><h3>激活成功，两秒后将自动跳转到登录界面，也可点击下方返回</h3><a href="login.jsp">返回</a></c:if>
<c:if test="${type=='2'}"><h3>激活失败，两秒后将自动跳转到登录界面，也可点击下方返回</h3><a href="index.jsp">返回</a></c:if>
</div>
<script type="text/javascript">
     window.onload=function() {
        setTimeout(function(){//两秒后跳转
            location.href = "${pageContext.request.contextPath}/login.jsp";//PC网页式跳转
        },2000);
    }

</script>
</body>
</html>
