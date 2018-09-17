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
    <link href="${pageContext.request.contextPath }/css/summernote.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/summernote.js"></script>
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
            <li class="active">添加公告</li>
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
                <i class="icon-reorder"></i> 添加公告 <i class="icon-reply pull-right" onclick="history.go(-1);"></i>
            </div>
            <div class="widget-content padded clearfix">
                <form id="actionform" class="form-horizontal" action="view/customerManage/contacts/index.jsp"
                      method="get">
                    <div class="form-group field-contacts-name required">
                        <label class="control-label col-sm-2" for="noticetitle">公告标题</label>

                        <div class="col-sm-8">
                            <input type="text" id="noticetitle" class="form-control" name="Contacts[name]"
                                   maxlength="40" placeholder="请输入公告标题">
                        </div>
                        <div class="help-block help-block-error"></div>
                    </div>
                    <div class="form-group field-contacts-name required">
                        <label class="control-label col-sm-2" >公告内容</label>
                    </div>
                    <div class="form-group field-customer-customer_industry">

                        <div class="col-sm-10 col-sm-offset-1">
                        <div id="summernote" ></div>
                            </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>

                        <div class="col-lg-10">
                            <button type="button" onclick="addGameArea()" class="btn btn-primary">添加</button>
                            <button type="button" class="btn btn-default" onClick="history.go(-1);">返回</button>
                            <input type="hidden" name="reback"></div>
                        <!-- /.col -->
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {

            $('#summernote').summernote(
                {
                    placeholder: '请输入公告内容',
                    height: 300
                });
    });
    function addGameArea(){

        var data={};
        data.noticeTitle = $("#noticetitle").val();
        data.noticeContent=$('#summernote').summernote('code');
        //alert(data.noticeContent);

        if (data.noticeTitle!=null&&data.noticeTitle!=""&&data.noticeTitle!="undefined") {
        }else{
            alert("请输入公告标题");
            return;
        }
        $.ajax({
            type: 'post',
            url: 'add',
            data:  data,
            cache: false,
            sync: true,
            success: function (data) {
                //var res=data.response;
                console.log(data);
                if(0== data.flag){
                    alert(data.msg);
                    return;
                }else{

                    window.location.href='../notice';
                }
            },error :function (){
                alert("请求失败");
                return false;
            }
        });
    }
</script>
</html>
