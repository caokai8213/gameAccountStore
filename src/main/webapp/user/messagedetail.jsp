<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <jsp:include page="../common.jsp"/>
    <style>
        h3 {
            margin-top: 10px;
        }

        .con {
            padding: 3px 2px;
            border-top: dashed lavender;
        }

        .con li {
            padding: 3px;
        }

        .con>li>a {
            display: block;
        }

        .con>li>a:hover {
            width: 100%;
            color: black;
            border-left: solid salmon 10px;
            display: block;
            background-color: #ddd;
        }

        .on {
            width: 100%;
            color: black;
            border-left: solid salmon 10px;
            display: block;
            background-color: #ddd;
        }
        .line{
            padding: 20px;
            border-bottom: solid lightgray 1px;
        }
        .line-detail{
            padding: 20px;
        }
        .title{
            padding: 20px;
        }
        .line-detail .title{
            float: left;
            padding-top: 0px;
        }
    </style>
</head>

<body>
<jsp:include page="../top.jsp"/>
<!--路径-->
<div class=" banner-area" style="padding: 10px;">
    <div class="container">
        <ol class="breadcrumb" style="padding:10px;text-align: left; font-size: 15px;">
            <li>
                <a href="#">首页</a>
            </li>

            <li class="active">个人中心</li>
        </ol>
    </div>
</div>
<div class="banner-area" style="padding: 10px;">
    <div class="container">
        <div class="col-md-2 " style="background-color: #eee;height: 700px; border: solid lightgray 1px;border-right: none;">
            <div class="mycenter-tag">

                <h3>我是买家</h3>
                <ul class="con">
                    <li>
                        <a href="${pageContext.request.contextPath}/gamelist.jsp">我要买</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/user/order/buylist?state=all">查看我的订单</a>
                    </li>
                    <%--<li>--%>
                    <%--<a href="https://www.jiaoyimao.com/goods/favorite/list.html">收藏的商品<i class="icon-min-new"></i></a>--%>
                    <%--</li>--%>
                </ul>

                <h3>我是卖家</h3>
                <ul class="con">
                    <li>
                        <a  href="${pageContext.request.contextPath}/user/publish.jsp">我要卖</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/user/product1?state=all">管理我的商品</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/user/order/sellerlist?state=all">查看我的订单</a>
                    </li>

                </ul>

                <h3>账号设置</h3>
                <ul class="con">
                    <li>
                        <a  href="${pageContext.request.contextPath}/user/userinfo">个人信息</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/user/accountpwd.jsp">修改密码</a>
                    </li>
                </ul>

                <h3>消息中心</h3>
                <ul class="con">
                    <li>
                        <a class="on" href="${pageContext.request.contextPath}/user/message?state=all">我的站内信</a>
                    </li>
                </ul>

            </div>
        </div>
        <div class="col-md-9" style="background-color: whitesmoke;height: 700px;padding: 30px;border: solid lightgray 1px; ">
            <h4>我的站内信</h4>
            <div id="gerenxinxi" style="padding: 20px 10px;">
                <c:if test="${message!=null}">
                <div class=" line">
                    <span class="title"> 标题:</span>
                    ${message.messageTitle}
                </div>
                <div class=" line">
                    <span class="title"> 类型:</span>
                    ${message.messageType}
                </div>
                <div class=" line">
                    <span class="title"> 时间:</span>
                    <fmt:formatDate value="${message.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                </div>
                <div class="line-detail">
                    <span class="title"> 内容:</span>
                    <div style="display: block;float: left; width: 600px">
                    ${message.messageContent}
                    </div>
                </div>
                </div>
                <div  style="clear: both">
                    <a class="btn btn-default" href="${pageContext.request.contextPath}/user/message?state=all">返回</a>
                    <a id="${message.messageId}" class="btn btn-default" onclick="deletemessage(this.id)">删除</a>
                </div>
            </c:if>
            <c:if test="${message==null}">
                消息不存在
            </c:if>
                <%--<div class="banner-area" style="padding: 10px 0px; margin: 10px 150px; border: groove indianred; background-color: white;">--%>
                    <%--<div>--%>
                        <%--<div class="mod-con notice-detail">--%>
                            <%--<div class="bd" style="text-align: center;">--%>
                                <%--<div class="name">--%>
                                    <%--<h2>${message.messageTitle}</h2>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="date col-md-offset-10">--%>
                                <%--<fmt:formatDate value="${message.createTime}" pattern="yyyy/MM/dd"/>--%>
                            <%--</div>--%>
                            <%--<div style="padding: 10px 20px;">--%>
                                <%--${message.messageContent}--%>
                            <%--</div>--%>
                            <%--<div style="height: 200px;"></div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            </div>
        </div>
    </div>
</div>
<!-- footer-start -->
<jsp:include page="../footer.jsp"/>
<!-- footer-end -->
<!-- all js here -->
    <script type="text/javascript">
        function deletemessage(id){
            var data={
                id:id
            };
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/user/message/delete',
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
                        window.location.href='${pageContext.request.contextPath}/user/message?state=all';
                    }
                },error :function (){
                    alert("请求失败");
                    return false;
                }
            });
        }
    </script>
</body>

</html>