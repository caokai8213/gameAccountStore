<%--
  Created by IntelliJ IDEA.
  User: yoona
  Date: 2018/3/20
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <jsp:include page="../common.jsp"/>
    <link href="<%=request.getContextPath()%>/css/fileinput.css" rel="stylesheet">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/fileinput.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/zh.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
</head>

<body>
<jsp:include page="../top.jsp"/>
<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <ul class="nav menu">
        <li ><a href="<%=request.getContextPath()%>/manage/index.jsp"><span class="glyphicon glyphicon-dashboard"></span>首页</a></li>
        <li class="active"><a href="<%=request.getContextPath()%>/manage/notice"><span class="glyphicon glyphicon-th"></span> 公告管理</a></li>
        <li><a href="<%=request.getContextPath()%>/manage/product"><span class="glyphicon glyphicon-stats"></span> 商品管理</a></li>
        <li><a href="<%=request.getContextPath()%>/manage/user"><span class="glyphicon glyphicon-list-alt"></span> 用户管理</a></li>
        <li ><a href="<%=request.getContextPath()%>/manage/order"><span class="glyphicon glyphicon-pencil"></span> 订单管理</a></li>
        <li class="parent">
            <a href="#">
                <span class="glyphicon glyphicon-list"></span> 游戏及区服管理 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
            </a>
            <ul class="children collapse" id="sub-item-1">
                <li>
                    <a class="" href="<%=request.getContextPath()%>/manage/game">
                        <span class="glyphicon glyphicon-share-alt"></span> 游戏管理
                    </a>
                </li>
                <li>
                    <a class="" href="<%=request.getContextPath()%>/manage/gameArea?id=">
                        <span class="glyphicon glyphicon-share-alt "></span>
                        游戏区服管理
                    </a>
                </li>
            </ul>
        </li>
    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active"><a href="../notice">公告管理</a></li>
            <li class="active">查看公告</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">公告管理</h1>
        </div>
    </div><!--/.row-->
    <div class="container-fluid main-content">
        <div class="widget-container fluid-height clearfix mwi1200">
            <div class="heading clearfix">
                <i class="icon-reorder"></i> 查看公告 <i class="icon-reply pull-right" onclick="history.go(-1);"></i>
            </div>
            <div class="widget-content padded clearfix">
                <div class="mod-con notice-detail">
                    <div class="bd" style="text-align: center;">
                        <div class="name">
                            <h2>${notice.noticeTitle}</h2>
                        </div>
                    </div>
                    <div class="date col-md-offset-10">
                        <fmt:formatDate value="${notice.createTime}" pattern="yyyy/MM/dd"/>
                    </div>
                    <div style="padding: 10px 20px;">
                        ${notice.noticeContent}
                    </div>
                </div>
            </div>
            <button type="button" class="btn btn-default" onClick="history.go(-1);">返回</button>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">

</script>
</html>
