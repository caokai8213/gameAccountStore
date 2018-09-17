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
                        <a class="on" >我的站内信</a>
                    </li>
                </ul>

            </div>
        </div>
        <div class="col-md-9" style="background-color: whitesmoke;height: 700px;padding: 30px;border: solid lightgray 1px; ">
            <h4>我的站内信</h4>
            <div id="gerenxinxi" style="padding: 20px 10px;">
                <div class="" style="">
                    <div>
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li <c:if test="${state=='all'}">class='active'</c:if>>
                                <a href="${pageContext.request.contextPath}/user/message?state=all">全部消息</a>
                            </li>

                            <li <c:if test="${state=='1'}">class='active'</c:if>>
                                <a href="${pageContext.request.contextPath}/user/message?state=1" >未读</a>
                            </li>
                            <li <c:if test="${state=='2'}">class='active'</c:if>>
                                <a href="${pageContext.request.contextPath}/user/message?state=2"  >已读</a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <div class="col-md-12">
                                <div class="row" style="border: solid 1px lightgray;">
                                    <div class="col-md-1 col-md-offset-1 " >状态</div>
                                    <div class="col-md-2">类型</div>
                                    <div class="col-md-5">标题</div>
                                    <div class="col-md-3">时间</div>
                                </div>
                                <div class="row" style="border: solid 1px lightgray;" id="show">
                                    <c:if test="${message.size()==0}">
                                        <span class='col-md-offset-5'>暂无记录</span>
                                    </c:if>
                                    <c:forEach begin="0" step="1" items="${message}" var="i">
                                    <div class="row" style="padding: 8px 0px;">
                                        <div class="col-md-1 col-md-offset-1" >
                                            <c:if test="${'1'.equals(i.messageState)}">
                                                <img src="../images/email/blue-email.png" style="width:25px;height: 25px; margin-top:  -8px;">
                                            </c:if>
                                            <c:if test="${'2'.equals(i.messageState)}">
                                                <img src="../images/email/blue-emailopen.png" style="width:25px;height: 25px; margin-top:  -8px;">
                                            </c:if>
                                        </div>
                                        <div class="col-md-2">
                                           ${i.messageType}
                                        </div>
                                        <div class="col-md-5">
                                            <a style="font-size: 15px;
                                                <c:if test="${'1'.equals(i.messageState)}">color: blue;</c:if>
                                                <c:if test="${'2'.equals(i.messageState)}">color: darkgrey;</c:if>
                                            text-decoration: underline;" href="${pageContext.request.contextPath}/user/message/detail/${i.messageId}">${i.messageTitle}</a>
                                        </div>
                                        <div class="col-md-3">
                                            <fmt:formatDate value="${i.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>
                                <div class="row">
                                    <!-- 分页文字信息 ：拿到控制器处理请求时封装在pageInfo里面的分页信息-->
                                    <div class="col-md-5">
                                        当前${page.pageNum}页,共${page.pages }页,总${page.total }条记录
                                    </div>
                                    <!-- 分页码 -->
                                    <div class="col-md-7">
                                        <nav aria-label="Page navigation">
                                            <ul class="pagination">
                                                <!--
                        1.pageContext.request.contextPath表示当前项目路径，采用的是绝对路径表达方式。一般为http:localhost:8080/项目名 。
                        2.首页，末页的逻辑：pn=1访问第一次，pn=${page.pages}访问最后一页
                      -->
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/user/message?state=${state}&page=1">首页</a>
                                                </li>
                                                <!-- 如果还有前页就访问当前页码-1的页面， -->

                                                <li>
                                                    <a href="${pageContext.request.contextPath}/user/message?state=${state}&page=${page.pageNum-1}" aria-label="Previous" <c:if test="${!page.hasPreviousPage}">disabled</c:if> >
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>

                                                <li>
                                                    <!--遍历所有导航页码，如果遍历的页码页当前页码相等就高亮显示，如果相等就普通显示  -->
                                                    <c:forEach items="${page.navigatepageNums }" var="page_Nums">
                                                    <c:if test="${page_Nums==page.pageNum }">
                                                <li class="active"><a href="#">${page_Nums}</a></li>
                                                </c:if>
                                                <c:if test="${page_Nums!=page.pageNum }">
                                                    <li ><a href="${pageContext.request.contextPath}/user/message?state=${state}&page=${page_Nums}">${page_Nums}</a></li>
                                                </c:if>
                                                </c:forEach>
                                                </li>
                                                <!-- 如果没有后页就禁止点击当前页码的页面， -->
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/user/message?state=${state}&page=${page.pageNum+1}" aria-label="Next" <c:if test="${!page.hasNextPage}">disabled</c:if>>
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                                <li><a href="${pageContext.request.contextPath}/user/message?state=${state}&page=${page.pages}">末页</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- footer-start -->
<jsp:include page="../footer.jsp"/>
<!-- footer-end -->
<!-- all js here -->
    <script type="text/javascript">

    </script>
</body>

</html>