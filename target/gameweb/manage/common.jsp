<%--
  Created by IntelliJ IDEA.
  User: yoona
  Date: 2018/3/20
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%--%>
    <%--String path = request.getContextPath();--%>
    <%--String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";--%>
<%--%>--%>
<%--<base href="<%=basePath%>">--%>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>飞天猫后台管理系统</title>
<link href="<%=request.getContextPath()%>/manage/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/backstyles.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath }/js/html5shiv.js"></script>
<script src="${pageContext.request.contextPath }/js/respond.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<%--<script type="text/javascript"--%>
        <%--src="${pageContext.request.contextPath }/js/jquery-3.0.0.js"></script>--%>
<script src="${pageContext.request.contextPath }/js/jquery-ui.min.js"></script>
<%--<script type="text/javascript"--%>
        <%--src="${pageContext.request.contextPath }/js/bootstrap-3.3.4.js"></script>--%>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/js/jquery.dataTables-1.10.13.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/js/dataTables.bootstrap-1.10.13.js"></script>
<script src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
<script type="text/javascript">
    layer.load({time: 5*1000});
    document.onreadystatechange = completeLoading;
    //加载状态为complete时移除loading效果
    function completeLoading() {
        if (document.readyState == "complete") {
            layer.closeAll('loading');
        }
    }
</script>
