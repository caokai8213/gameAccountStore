<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!--[if lt IE 8]>
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
            <![endif]-->
        <!-- header-start -->
        <header>
            <div class="header-top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-sm-12 hidden-xs">
                            <div class="header-top-left">
                                <div class="welcome-msg">
                                    <span class="default-msg hidden-xs">欢迎来到飞天猫!</span>
                                    <span class="phone">Call support free: <span class="number">01234-567890</span></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 col-sm-12">
                            <div class="header-top-right">
                                <ul class="header-links ">
                                    <shiro:lacksRole name="common">
                                        <li><a class="my-account" href="${pageContext.request.contextPath}/register.jsp">注册</a></li>
                                        <li><a class="login" href="${pageContext.request.contextPath}/login.jsp">登录</a></li>
                                    </shiro:lacksRole>
                                    <shiro:hasRole name="common">
                                        <li>您好，<div style="display: none" id="user_id"><shiro:principal property="userId"/></div>
                                        <shiro:principal property="userName"/>[
                                        <a href="/gameweb/logout" class="hot">退出</a>]
                                        </li>
                                        <li>
                                        <a href="${pageContext.request.contextPath}/user/message?state=all" class="">消息
                                            <span class="hot" id="count"></span>
                                        </a></li>
                                    </shiro:hasRole>
                                    <li><a class="checkout" href="${pageContext.request.contextPath}/user/order/buylist?state=all">购买记录</a></li>
                                    <li><a class="my-wishlist" href="${pageContext.request.contextPath}/user/product1?state=all">我是卖家</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-middle" >
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-12 col-xs-8">
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath }/images/feitianmaologo.png" alt="" /></a>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-6  col-md-offset-3 col-sm-offset-3 ">
                            <div class="search-box">
                                <form action="#">
                                    <input class="form-control search-form" type="text" placeholder="Search" />
                                    <button class="search-button" value="Search" type="submit"><i class="fa fa-search"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-menu-area hidden-xs hidden-sm" >
                <div class="container">
                    <div class="row">
                        <div class="colo-md-12">
                            <div class="main-menu">
                                <nav>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
										<li><a href="${pageContext.request.contextPath}/gamelist.jsp">游戏专区</a></li>
										<li><a href="${pageContext.request.contextPath}/user/userinfo">个人中心</a></li>
                                        <li><a href="${pageContext.request.contextPath}/contact.html">帮助中心</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- mobile-menu-area-start -->
            <div class="mobile-menu-area visible-xs visible-sm">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mobile_menu">
                                <nav id="mobile_menu_active">
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
                                        <li><a href="${pageContext.request.contextPath}/gamelist.jsp">游戏专区</a></li>
                                        <li><a href="${pageContext.request.contextPath}/user/userinfo">个人中心</a></li>
                                        <li><a href="${pageContext.request.contextPath}/contact.html">帮助中心</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- mobile-menu-area-end -->
        </header>
<shiro:hasRole name="common">
<script>
    $.ajax({
        type: 'get',
        url: '${pageContext.request.contextPath}/user/messagecount',
        cache: false,
        sync: true,
        success: function (data) {
            if(data.count!="0") {
                $("#count").text("(" + data.count + ")");
            }
        },error :function (){
            console.log("请求失败");
            return false;
        }
    });
</script>
</shiro:hasRole>