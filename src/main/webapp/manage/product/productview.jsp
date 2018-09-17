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
        <li><a href="<%=request.getContextPath()%>/manage/notice"><span class="glyphicon glyphicon-th"></span> 公告管理</a></li>
        <li  class="active"><a href="<%=request.getContextPath()%>/manage/product"><span class="glyphicon glyphicon-stats"></span> 商品管理</a></li>
        <li><a href="<%=request.getContextPath()%>/manage/user"><span class="glyphicon glyphicon-list-alt"></span> 用户管理</a></li>
        <li><a href="<%=request.getContextPath()%>/manage/order"><span class="glyphicon glyphicon-pencil"></span> 订单管理</a></li>
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
            <li class="active"><a href="../product">商品管理</a></li>
            <li class="active">查看商品</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">商品管理</h1>
        </div>
    </div><!--/.row-->
    <div class="container-fluid main-content">
        <div class="widget-container fluid-height clearfix mwi1200">
            <div class="heading clearfix">
                <i class="icon-reorder"></i> 查看商品 <i class="icon-reply pull-right" onclick="history.go(-1);"></i>
            </div>
            <div class="widget-content padded clearfix">
                <div class="banner-area" style="padding: 30px 0px;">
                    <div class="container">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="row">
                                    <div>
                                        <h4 class="col-md-4">寄售账号信息</h4>
                                    </div>
                                </div>

                            </div>
                            <div>
                                <div class="container-fluid main-content" style="padding: 20px;">
                                    <div class="widget-container fluid-height clearfix mwi1200">
                                        <div class="widget-content padded clearfix">
                                            <form  class="form-horizontal">
                                                <div class="form-group field-contacts-name required">
                                                    <label class="control-label col-sm-2" >游戏账号</label>
                                                    <div class="col-sm-8">
                                                        <label class=" col-sm-8" >${productVo.account}</label>
                                                    </div>
                                                    <div class="help-block help-block-error"></div>
                                                </div>

                                                <div class="form-group field-contacts-honorific required">
                                                    <label class="control-label col-sm-2" >游戏密码</label>
                                                    <div class="col-sm-8">
                                                        <label class=" col-sm-8" >${productVo.accountPassword}</label>
                                                    </div>
                                                    <div class="help-block help-block-error"></div>
                                                </div>
                                                <div class="form-group field-contacts-post required">
                                                    <label class="control-label col-sm-2" >角色名称</label>
                                                    <div class="col-sm-8">
                                                        <label class=" col-sm-8" >${productVo.accountRoleName}</label>
                                                    </div>
                                                    <div class="help-block help-block-error"></div>
                                                </div>
                                                <div class="form-group field-contacts-post">
                                                    <label class="control-label col-sm-2">密保问题</label>
                                                    <div class="col-sm-8">
                                                        <label class=" col-sm-8" >${productVo.accountQuestion}</label>
                                                    </div>
                                                    <div class="help-block help-block-error"></div>
                                                </div>
                                                <div class="form-group field-contacts-post">
                                                    <label class="control-label col-sm-2" >密保答案</label>
                                                    <div class="col-sm-8">
                                                        <label class=" col-sm-8" >${productVo.accountAnwser}</label>
                                                    </div>
                                                    <div class="help-block help-block-error"></div>
                                                </div>
                                                <div class="form-group field-contacts-post">
                                                    <label class="control-label col-sm-2" >密保邮箱</label>
                                                    <div class="col-sm-8">
                                                        <label class=" col-sm-8" >${productVo.accountEmail}</label>
                                                    </div>
                                                    <div class="help-block help-block-error"></div>
                                                </div>
                                                <div class="form-group field-contacts-post">
                                                    <label class="control-label col-sm-2" >密保手机</label>
                                                    <div class="col-sm-8">
                                                        <label class=" col-sm-8" >${productVo.accountPhone}</label>
                                                    </div>
                                                    <div class="help-block help-block-error"></div>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="banner-area" style="padding: 30px 0px;">
                    <div class="container">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="row">
                                    <div>
                                        <h4 class="col-md-4">商品详情</h4>
                                    </div>
                                </div>
                            </div>
                            <div>

                                <div class="container-fluid main-content" style="padding: 20px;">
                                    <div class="widget-container fluid-height clearfix mwi1200">
                                        <div class="widget-content padded clearfix">
                                            <form id="actionform" class="form-horizontal">

                                                <div class="form-group field-contacts-name required">
                                                    <label class="control-label col-sm-2">商品名称</label>

                                                    <div class="col-sm-8">
                                                        <label class=" col-sm-8" >${productVo.productName}</label>
                                                    </div>
                                                    <div class="help-block help-block-error"></div>
                                                </div>
                                                <div class="form-group field-customer-customer_industry required">
                                                    <label class="control-label col-sm-2" >所属游戏</label>
                                                    <div class="col-sm-8">
                                                        <label class=" col-sm-2" >${productVo.game.gameName}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group field-customer-customer_industry required">
                                                    <label class="control-label col-sm-2" >所属区服</label>
                                                    <div class="col-sm-8">
                                                        <label class=" col-sm-8" >${productVo.gameArea.areaName}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group field-contacts-honorific required">
                                                    <label class="control-label col-sm-2">等级</label>

                                                    <div class="col-sm-8">
                                                        <label class=" col-sm-8" >${productVo.accountLevel}</label>
                                                    </div>
                                                    <div class="help-block help-block-error"></div>
                                                </div>
                                                <div class="form-group field-contacts-post required">
                                                    <label class="control-label col-sm-2" >价格</label>

                                                    <div class="col-sm-8">
                                                        <label class=" col-sm-8" >${productVo.productPrice}</label>
                                                    </div>
                                                    <div class="help-block help-block-error"></div>
                                                </div>

                                                <div class="form-group field-contacts-sex required">
                                                    <label class="control-label col-sm-2" >账号绑定</label>

                                                    <div class="col-sm-8">
                                                        <input type="hidden" name="band" value="">
                                                        <label class=" col-sm-8" >
                                                            <c:if test="${'0'.equals(productVo.accountBand)}">无绑定</c:if>
                                                            <c:if test="${'1'.equals(productVo.accountBand)}">身份证绑定</c:if>
                                                        </label>
                                                    </div>
                                                    <div class="help-block help-block-error"></div>
                                                </div>
                                                <div class="form-group field-contacts-mobile">
                                                    <label class="control-label col-sm-2" >商品描述</label>

                                                    <div class="col-sm-8">
                                                        <div>${productVo.comment}</div>
                                                    </div>
                                                    <div class="help-block help-block-error"></div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">商品图片</label>
                                                    <div class="col-sm-10">
                                                       <c:if test="${''.equals(productVo.productPicurl)}">
                                                           <img src="${pageContext.request.contextPath}/images/zanwutupian.png">
                                                       </c:if><c:if test="${!''.equals(productVo.productPicurl)}">
                                                        <img src="${pageContext.request.contextPath}${productVo.productPicurl}">
                                                    </c:if>

                                                    </div>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <c:if test="${'1'.equals(productVo.productState)}">
                <button type="button"  name="updatebtn"
                        class="btn btn-success btn-sm"
                        id="${productVo.productId}_ty"
                        onclick="updatestate(this.id)">同意</button>
                <button type="button"  name="updatebtn"
                        class="btn btn-danger btn-sm"
                        id="${productVo.productId}_jj"
                        onclick="updatestate(this.id)">拒绝</button>
            </c:if>
            <button type="button" class="btn btn-default" onClick="history.go(-1);">返回</button>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function updatestate(id) {
        var data={
            id:id.split("_")[0],
            type:id.split("_")[1]
        };
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/manage/product/update',
            data: data,
            cache: false,
            sync: true,
            success: function (data) {
                //var res=data.response;
                console.log(data);
                if(0== data.flag){
                    alert(data.error);
                    return;
                }else{
                    alert(data.success);
                    window.location.href='${pageContext.request.contextPath}/manage/product?search=${search}&page=${page.pageNum}';
                }
            },error :function (){
                alert("请求失败");
                return false;
            }
        });
    }
</script>
</html>
