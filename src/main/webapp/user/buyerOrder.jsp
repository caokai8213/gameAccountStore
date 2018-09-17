<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <li >
                        <a class="on" >查看我的订单</a>
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
                        <a  href="${pageContext.request.contextPath}/user/product1?state=all">管理我的商品</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/user/order/sellerlist?state=all">查看我的订单</a>
                    </li>

                </ul>

                <h3>账号设置</h3>
                <ul class="con">
                    <li>
                        <a href="${pageContext.request.contextPath}/user/userinfo">个人信息</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/user/accountpwd.jsp">修改密码</a>
                    </li>
                </ul>

                <h3>消息中心</h3>
                <ul class="con">
                    <li>
                        <a href="${pageContext.request.contextPath}/user/message?state=all">我的站内信</a>
                    </li>
                </ul>

            </div>
        </div>
        <div class="col-md-9" style="background-color: whitesmoke;padding: 30px;border: solid lightgray 1px; ">
            <h4>查看我的订单</h4>
            <div id="gerenxinxi" style="padding: 20px 10px;">
                <div class="" style="">
                    <div>
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li <c:if test="${state=='all'}">class='active'</c:if>>
                                <a href="${pageContext.request.contextPath}/user/order/buylist?state=all">全部订单</a>
                            </li>

                            <li <c:if test="${state=='1'}">class='active'</c:if>>
                                <a href="${pageContext.request.contextPath}/user/order/buylist?state=1" >未支付</a>
                            </li>
                            <li <c:if test="${state=='2'}">class='active'</c:if>>
                                <a href="${pageContext.request.contextPath}/user/order/buylist?state=2"  >交易成功</a>
                            </li>
                            <li <c:if test="${state=='3'}">class='active'</c:if>>
                                <a href="${pageContext.request.contextPath}/user/order/buylist?state=3" >交易失败</a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <div class="col-md-12">
                                <div class="row" style="border: solid 1px lightgray;">
                                    <div class="col-md-6">商品名称</div>
                                    <div class="col-md-2">价格</div>
                                    <div class="col-md-2">交易状态</div>
                                    <div class="col-md-2">操作</div>
                                </div>
                                <div class="row" style="border: solid 1px lightgray;" id="show">
                                    <c:if test="${orderVos.size()==0}">
                                        <span class='col-md-offset-5'>暂无记录</span>
                                    </c:if>
                                    <c:forEach begin="0" step="1" items="${orderVos}" var="i">
                                        <div class="row" style="padding: 2px 0px;">
                                            <div class="panel panel-default" style="margin:0px 15px;">
                                                <div class="panel-heading" style="padding: 5px;">
                                                    <span>订单号：${i.orderId}</span>
                                                    <span>订单时间：
                                                    <fmt:formatDate value="${i.createTime}" pattern="yyyy/MM/dd HH:mm:ss"/>
                                                    </span>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="col-md-6">
                                                        <a style="font-size: 15px; color: blue; text-decoration: underline;" href="">
                                                          ${i.productName}</a><br />
                                                    </div>
                                                    <div class="col-md-2">￥${i.productPrice}</div>
                                                    <div class="col-md-2">${i.orderStateName}</div>
                                                    <div class="col-md-2">
                                                        <c:if test="${'1'.equals(i.orderState)}">
                                                            <button id="${i.orderId}_zf" onclick="updatestate(this.id)" class="btn-sm btn-warning">继续支付</button><br />
                                                            <button id="${i.orderId}_qx" onclick="updatestate(this.id)" class="btn-sm ">取消订单</button><br />
                                                        </c:if>
                                                        <c:if test="${'2'.equals(i.orderState)}">
                                                            <button id="${i.productId}"class="btn-sm btn-success" onclick="view(this.id)">查看账号</button><br />
                                                        </c:if>
                                                        <c:if test="${'3'.equals(i.orderState)}">
                                                            <button id="${i.orderId}" onclick="deleteOrder(this.id)" class="btn-sm btn-danger">删除订单</button><br />
                                                        </c:if>
                                                    </div>
                                                </div>
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
                                                    <a href="${pageContext.request.contextPath}/user/order/buylist?state=${state}&page=1">首页</a>
                                                </li>
                                                <!-- 如果还有前页就访问当前页码-1的页面， -->

                                                <li>
                                                    <a href="${pageContext.request.contextPath}/user/order/buylist?state=${state}&page=${page.pageNum-1}" aria-label="Previous" <c:if test="${!page.hasPreviousPage}">disabled</c:if> >
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
                                                    <li ><a href="${pageContext.request.contextPath}/user/order/buylist?state=${state}&page=${page_Nums}">${page_Nums}</a></li>
                                                </c:if>
                                                </c:forEach>
                                                </li>
                                                <!-- 如果没有后页就禁止点击当前页码的页面， -->
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/user/order/buylist?state=${state}&page=${page.pageNum+1}" aria-label="Next" <c:if test="${!page.hasNextPage}">disabled</c:if>>
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                                <li><a href="${pageContext.request.contextPath}/user/order/buylist?state=${state}&page=${page.pages}">末页</a></li>
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
<!--协议模态框-->
<!-- Large modal -->

<div id="myModal" class="modal fade " tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog " role="document" style="width: 500px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">账号信息</h4>
            </div>
            <div id="showaccount" class="modal-body pre-scrollable" style="padding: 0px 50px">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-remove" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>
<!-- footer-start -->
<jsp:include page="../footer.jsp"/>
<!-- footer-end -->
<!-- all js here -->
    <script type="text/javascript">
        function updatestate(id) {
            var data={
                id:id.split("_")[0],
                type:id.split("_")[1]
            };
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/user/order/update',
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
                        window.location.href="${pageContext.request.contextPath}/user/order/buylist?state=all";
                    }
                },error :function (){
                    alert("请求失败");
                    return false;
                }
            });
        }
         function deleteOrder(id){
             var data={
                 id:id
             };
             $.ajax({
                 type: 'post',
                 url: '${pageContext.request.contextPath}/user/order/delete',
                 data: data,
                 cache: false,
                 sync: true,
                 success: function (data) {
                     console.log(data);
                     if(0== data.flag){
                         alert(data.error);
                         return;
                     }else{
                         alert(data.success);
                         window.location.href="${pageContext.request.contextPath}/user/order/buylist?state=all";
                     }
                 },error :function (){
                     alert("请求失败");
                     return false;
                 }
             });
         }
        function view(id){
            var data={
                id:id
            };
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/user/productDetail',
                data: data,
                cache: false,
                sync: true,
                success: function (data) {
                    console.log(data);
                    var i=data.productVo;
                    $("#showaccount").empty();
                   var item2="<span class=\"col-md-4\">游戏区服:</span> <span class=\"col-md-8\">"+data.productVo.game.gameName+">"+data.productVo.gameArea.areaName+"</span> <span class=\"col-md-4\">账号:</span> <span class=\"col-md-8\">"+i.account+"</span> <span class=\"col-md-4\">角色名称:</span> <span class=\"col-md-8\">"+i.accountRoleName+"</span> <span class=\"col-md-4\">密码：</span> <span class=\"col-md-8\">"+i.accountPassword+"</span><div class=\"col-md-12\" style=\"padding-left: 0px;\"><span class=\"col-md-4\">密保问题:</span> <span class=\"col-md-8\">"+i.accountQuestion+"</span></div> <span class=\"col-md-4\">密保答案:</span> <span class=\"col-md-8\">"+i.accountAnwser+"</span> <span class=\"col-md-4\">密保邮箱:</span> <span class=\"col-md-8\"> "+i.accountEmail+" </span><span class=\"col-md-4\">密保手机:</span> <span class=\"col-md-8\">"+i.accountPhone+" </span>";
                    $("#showaccount").append(item2);
                },error :function (){
                    alert("请求失败");
                    return false;
                }
            });
            $("#myModal").modal();
        }
    </script>
</body>

</html>