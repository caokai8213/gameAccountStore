<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <jsp:include page="common.jsp"/>
</head>

<body>
<jsp:include page="top.jsp"/>

<!-- service-area-start -->
<div class="service-area">
    <div class="container">
        <div class="row">

            <div class="service wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                <div class="col-md-12 col-xs-12 col-sm-12">
                    <c:if test="${flag==1}">
                    <div class="single-service" style="padding: 0px 0px 20px 0px;">
                        <div style="height: 40px; background-color:lemonchiffon;text-align: left">
                            <h2>下订单失败</h2>
                        </div>
                        <h3>${message}</h3>
                        <p></p>
                    </div>
                    </c:if>
                    <c:if test="${flag==3}">
                        <div class="single-service" style="padding: 0px 0px 20px 0px;">
                            <div style="height: 40px; background-color:lemonchiffon;text-align: left">
                                <h2>下订单成功</h2>
                            </div>
                            <div style="text-align: left">客人${user.userName}你好</div>
                            <div style="text-align: left"><h3>订单已提交，请尽快付款！</h3></div>
                            <div style="padding-left:30px;text-align: left">订单编号:${orderNo}</div>
                            <div style="padding-left:30px;text-align: left">商品价格:${price}</div>
                            <a href="${pageContext.request.contextPath}/user/order/buylist?state=all">查看我的订单</a>
                        </div>
                    </c:if>
                    <a href="#" onclick="javascript :history.go(-1);">返回上一页</a>
                </div>


            </div>
        </div>
    </div>
</div>
<!-- service-area-end -->


<!-- all js here -->
<!-- jquery latest version -->
<jsp:include page="footer.jsp"/>
</body>

</html>
