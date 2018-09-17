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
</head>

<body>
<jsp:include page="../top.jsp"/>
<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <ul class="nav menu">
        <li ><a href="<%=request.getContextPath()%>/manage/index.jsp"><span class="glyphicon glyphicon-dashboard"></span>首页</a></li>
        <li ><a href="<%=request.getContextPath()%>/manage/notice"><span class="glyphicon glyphicon-th"></span> 公告管理</a></li>
        <li><a href="<%=request.getContextPath()%>/manage/product"><span class="glyphicon glyphicon-stats"></span> 商品管理</a></li>
        <li><a href="<%=request.getContextPath()%>/manage/user"><span class="glyphicon glyphicon-list-alt"></span> 用户管理</a></li>
        <li ><a href="<%=request.getContextPath()%>/manage/order"><span class="glyphicon glyphicon-pencil"></span> 订单管理</a></li>
        <li class="parent" >
            <a href="#" class="active">
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
            <li class="active"><a href="../game">游戏管理</a></li>
            <li class="active">修改游戏</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">游戏管理</h1>
        </div>
    </div><!--/.row-->
    <div class="container-fluid main-content">
        <div class="widget-container fluid-height clearfix mwi1200">
            <div class="heading clearfix">
                <i class="icon-reorder"></i> 修改游戏 <i class="icon-reply pull-right" onclick="history.go(-1);"></i>
            </div>
            <div class="widget-content padded clearfix">
                <form id="actionform" class="form-horizontal" action="view/customerManage/contacts/index.jsp"
                      method="get">
                    <input type="hidden" id="page" value="${pagenum}"/>
                    <input type="hidden" name="search" id="search" value="${search}">
                    <input type="hidden" id="game-id" name="game[id]" value="${game.id}">

                    <div class="form-group field-contacts-name required">
                        <label class="control-label col-sm-2" for="game-name">游戏名字</label>

                        <div class="col-sm-8">
                            <input type="text" id="game-name" class="form-control" name="Contacts[name]"
                                   maxlength="20" placeholder="请输入游戏名字" value="${game.gameName}">
                        </div>
                        <div class="help-block help-block-error"></div>
                    </div>

                    <div class="form-group field-contacts-honorific required">
                        <label class="control-label col-sm-2" for="game-all">拼音全拼</label>

                        <div class="col-sm-8">
                            <input type="text" id="game-all" class="form-control" name="Contacts[honorific]"
                                   maxlength="20" placeholder="请输入拼音全拼" value="${game.pinyin}">
                        </div>
                        <div class="help-block help-block-error"></div>
                    </div>
                    <div class="form-group field-contacts-post">
                        <label class="control-label col-sm-2" for="game-simple">首字母大写简拼</label>

                        <div class="col-sm-8">
                            <input type="text" id="game-simple" class="form-control" name="Contacts[post]"
                                   maxlength="20" placeholder="请输入游戏首字母大写简拼" value="${game.gameIndex}">
                        </div>
                        <div class="help-block help-block-error"></div>
                    </div>
                    <div class="form-group field-customer-customer_industry required">
                        <label class="control-label col-sm-2"
                               for="game-company">所属公司</label>
                        <div class="col-sm-8">
                            <select id="game-company" class="form-control" name="game-company">
                                <option value="腾讯"<c:if test="${'腾讯'.equals(game.company)}">selected</c:if>>腾讯</option>
                                <option value="网易"<c:if test="${'网易'.equals(game.company)}">selected</c:if>>网易</option>
                                <option value="完美"<c:if test="${'完美'.equals(game.company)}">selected</c:if>>完美</option>
                                <option value="金山游戏"<c:if test="${'金山游戏'.equals(game.company)}">selected</c:if>>金山游戏</option>
                                <option value="光宇"<c:if test="${'光宇'.equals(game.company)}">selected</c:if>>光宇</option>
                                <option value="搜狐"<c:if test="${'搜狐'.equals(game.company)}">selected</c:if>>搜狐</option>
                                <option value="盛大"<c:if test="${'盛大'.equals(game.company)}">selected</c:if>>盛大</option>
                                <option value="17game"<c:if test="${'17game'.equals(game.company)}">selected</c:if>>17game</option>
                                <option value="麒麟"<c:if test="${'麒麟'.equals(game.company)}">selected</c:if>>麒麟</option>
                                <option value="网龙"<c:if test="${'网龙'.equals(game.company)}">selected</c:if>>网龙</option>
                                <option value="巨人"<c:if test="${'巨人'.equals(game.company)}">selected</c:if>>巨人</option>
                                <option value="ElectronicArts"<c:if test="${'ElectronicArts'.equals(game.company)}">selected</c:if>>ElectronicArts</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group field-contacts-sex required">
                        <label class="control-label col-sm-2" for="game-redu">游戏热度</label>

                        <div class="col-sm-8">
                            <input type="hidden" name="game-[hot]" value="">
                            <div id="game-redu">
                                <label class="label-radio inline">
                                    <input type="radio" name="game-[hot]" value="1" <c:if test="${game.gameHot==1}">checked</c:if>> <span
                                        class="custom-radio" ></span>火爆</label>
                                <label class="label-radio inline">
                                    <input type="radio" name="game-[hot]" value="0" <c:if test="${game.gameHot==0}">checked</c:if>> <span
                                        class="custom-radio"></span>普通</label>
                            </div>
                        </div>
                        <div class="help-block help-block-error"></div>
                    </div>
                    <div class="form-group field-contacts-mobile">
                        <label class="control-label col-sm-2" for="game-paiming">游戏排名</label>

                        <div class="col-sm-8">
                            <input type="text" id="game-paiming" class="form-control" name="Contacts[mobile]"
                                   placeholder="可以输入排名，不输也可以" value="${game.orderIndex}">
                        </div>
                        <div class="help-block help-block-error"></div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">原来游戏图标</label>
                        <div class="col-sm-10">
                            <c:if test="${game.picUrl!=null&&!''.equals(game.picUrl)}"><img src="${pageContext.request.contextPath}${game.picUrl}" height="80px" width="80px"></c:if>
                            <c:if test="${game.picUrl==null||''.equals(game.picUrl)}"><img src="${pageContext.request.contextPath}/images/zanwutupian.png" height="80px" width="80px"></c:if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">游戏图标</label>
                        <div class="col-sm-10">
                            <input id="myFile" type="file" name="myFile" class="fileloading">
                        </div>
                        <input type="hidden" name="user.logo" id="game-picurl">
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>

                        <div class="col-lg-10">
                            <button type="button" onclick="updateGame()" class="btn btn-primary">修改</button>
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
    function updateGame(){
        var data={};
        data.id = $("#game-id").val();
        data.gameName = $("#game-name").val();
        data.pinyin=$("#game-all").val();
        data.gameHot=$('input:radio[name="game-[hot]"]:checked').val();
        data.company=$("#game-company option:selected").val();
        data.gameIndex=$("#game-simple").val();
        data.orderIndex=$("#game-paiming").val();
        data.picUrl=$("#game-picurl").val();
        var str = /^-?[1-9]\d*$/;
        if(data.orderIndex!=null&&data.orderIndex!=""&&data.orderIndex!="undefined"&&!str.test(data.orderIndex)){
            alert("排名请输入数字类型");
            return;
        }

        if (data.gameName!=null&&data.gameName!=""&&data.gameName!="undefined") {

        }else{
            alert("请输入游戏名字");
            return;
        }
        if (data.pinyin!=null&&data.pinyin!=""&&data.pinyin!="undefined") {

        }else{
            alert("请输入拼音");
            return;
        }
        if (data.gameIndex!=null&&data.gameIndex!=""&&data.gameIndex!="undefined") {

        }else{
            alert("请输入简写");
            return;
        }
        $.ajax({
            type: 'post',
            url: 'update2',
            data: data,
            cache: false,
            sync: true,
            success: function (data) {
                //var res=data.response;
                console.log(data);
                if(0== data.flag){
                    alert(data.msg);
                    return;
                }else{
                    window.location.href='../game?search=${search}&page='+${pagenum};
                }
            },error :function (){
                alert("请求失败");
                return false;
            }
        });
    }
    $("#myFile").fileinput({
        language : 'zh',
        uploadUrl : "uplode/photo",
        autoReplace : true,
        maxFileCount : 1,
        allowedFileExtensions : [ "jpg", "png", "gif" ],
        browseClass : "btn btn-primary", //按钮样式
        previewFileIcon : "<i class='glyphicon glyphicon-king'></i>"
    }).on("fileuploaded", function(e, data) {
        var res = data.response;
        alert(res.success);
        $("#game-picurl").attr("value", res.success);
    })

</script>


</html>
