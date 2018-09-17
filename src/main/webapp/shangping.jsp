<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<html class="no-js" lang="en">

	<head>
	<jsp:include page="common.jsp"/>
		<style>
			.shangping-title {
				font-size: 15px;
				color: dodgerblue;
			}
			
			.shangping-title:hover {
				color: orangered;
				text-decoration: underline;
			}
			
			.shangpingdiv {
				background-color: #EEEEEE;
				padding: 10px;
			}
			
			.chaxun li {
				margin: 0px 13px 3px;
			}
			.on{
				color:red;
			}
		</style>
	</head>

	<body>
	<jsp:include page="top.jsp"/>

		<!--路径-->
		<div class=" banner-area" style="padding: 10px;">
			<div class="container">
				<ol class="breadcrumb" style="padding:10px;text-align: left; font-size: 15px;">
					<li>
						<a href="#">首页</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/gamelist.jsp">游戏专区</a>
					</li>
					<li class="active">${game.gameName}</li>
				</ol>
			</div>
		</div>
		<div class="banner-area" style="padding: 10px;">
			<div class="container" style="border: dashed palegreen; font-size: 15px; padding: 4px;">
				<div class="row">
					<div class="col-md-2" style="text-align: center;">区服选择:</div>
					<div class="col-md-10">
						<ul class="list-inline chaxun">
							<li>
								<a href="${pageContext.request.contextPath}/product/productlist?gameId=${game.id}&areaId=&price=${price}"
								   <c:if test="${areaId==null||''.equals(areaId)}">class="on"</c:if>
								>不限</a>
							</li>
							<c:forEach var="i" items="${gameAreas}" >
								<li>
									<a href="${pageContext.request.contextPath}/product/productlist?gameId=${game.id}&areaId=${i.id}&price=${price}"
											<c:if test="${areaId==i.id}">class="on"</c:if>
									>${i.areaName}</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="row" style="border-top: dashed lavender; padding: 5px 0px;">
					<div class="col-md-2" style="text-align: center;">价格选择:</div>
					<div class="col-md-10">
						<ul class="list-inline chaxun">
							<li>
								<a href="${pageContext.request.contextPath}/product/productlist?gameId=${game.id}&areaId=${areaId}"
								   <c:if test="${price==null||''.equals(price)}">class="on"</c:if>
								>不限</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/product/productlist?gameId=${game.id}&areaId=${areaId}&price=0-20"
										<c:if test="${price=='0-20'}">class="on"</c:if>
								>0-20</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/product/productlist?gameId=${game.id}&areaId=${areaId}&price=20-50"
								   <c:if test="${price=='20-50'}">class="on"</c:if>
								>20-50</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/product/productlist?gameId=${game.id}&areaId=${areaId}&price=50-100"
								   <c:if test="${price=='50-100'}">class="on"</c:if>
								>50-100</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/product/productlist?gameId=${game.id}&areaId=${areaId}&price=100-200"
								   <c:if test="${price=='100-200'}">class="on"</c:if>
								>100-200</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/product/productlist?gameId=${game.id}&areaId=${areaId}&price=200-500"
								   <c:if test="${price=='200-500'}">class="on"</c:if>
								>200-500</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="banner-area">
			<div class="container" style="border:groove aliceblue">
				<div class="row">
					<div class="col-md-2" style="background-color: cornflowerblue;text-align: center;font-size: 20px;color: white;">
						${game.gameName}所有商品
					</div>
					<div class="col-md-2 col-md-offset-8">
						共<span style="color: red">${products.size()}</span>件商品
					</div>
				</div>
				<div class="row" style="border:1px solid lightgray;background-color: lightgray;">
					<div>
						<div class="col-md-4 col-md-offset-8">
							<div class="row" style="padding: 4px 0px;">
								<a href="${pageContext.request.contextPath}/product/productlist?gameId=${game.id}&areaId=${areaId}&price=${price}&flag=1" class="col-md-4 <c:if test="${'1'.equals(flag)}">on</c:if>">按价格降序</a>
								<a href="${pageContext.request.contextPath}/product/productlist?gameId=${game.id}&areaId=${areaId}&price=${price}&flag=2" class="col-md-4 <c:if test="${'2'.equals(flag)}">on</c:if>">按价格升序</a>
							</div>
						</div>
					</div>
				</div>
				<div class="row" style="text-align: center; padding: 5px;">
					<span class="col-md-6">商品标题</span>
					<div class="col-md-6">
						<span class="col-md-4">价格</span>
						<span class="col-md-3">保证</span>
					</div>
				</div>
				<div id="shangpingshow">
					<c:if test="${products.size()==0}"><div>暂无记录</div></c:if>
				<c:forEach items="${products}" var="i">
					<div class="row shangpingdiv">
						<div class="row">
							<span class="col-md-6"><a href="${pageContext.request.contextPath}/productDetail?productId=${i.productId}" class="shangping-title">${i.productName}</a> </span>
							<div class="col-md-6" style="text-align: center;">
								<span class="col-md-4">¥${i.productPrice}</span>
								<span class="col-md-3">信誉商品</span>
								<a href="${pageContext.request.contextPath}/productDetail?productId=${i.productId}" type="button" class="btn col-md-2 btn-warning col-md-offset-1">立即购买</a>
							</div>
						</div>
						<div class="row col-md-3 ">
							<div class="row">
								<span class="col-md-4">卖家信用:</span>
								<span class="col-md-8 col-md-pull-1">***</span>
							</div>
							<div class="row">
								<span class="col-md-4">发布时间:</span>
								<span class="col-md-8 col-md-pull-1">
										<fmt:formatDate value="${i.createTime}" pattern="yyyy/MM/dd HH:mm:ss"/>
								</span>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
				<div class="row">
					<!-- 分页文字信息 ：拿到控制器处理请求时封装在pageInfo里面的分页信息-->
					<div class="col-md-4" style="padding: 28px 5px;">
						当前${page.pageNum}页,共${page.pages }页,总${page.total }条记录
					</div>
					<!-- 分页码 -->
					<div class="col-md-8">
						<nav aria-label="Page navigation">
							<ul class="pagination">
								<!--
                        1.pageContext.request.contextPath表示当前项目路径，采用的是绝对路径表达方式。一般为http:localhost:8080/项目名 。
                        2.首页，末页的逻辑：pn=1访问第一次，pn=${page.pages}访问最后一页
                      -->
								<li>
									<a href="${pageContext.request.contextPath}/product/productlist?gameId=${game.id}&areaId=${areaId}&price=${price}&flag=${flag}&page=1">首页</a>
								</li>
								<!-- 如果还有前页就访问当前页码-1的页面， -->

								<li>
									<a href="${pageContext.request.contextPath}/product/productlist?gameId=${game.id}&areaId=${areaId}&price=${price}&flag=${flag}&page=${page.pageNum-1}" aria-label="Previous" <c:if test="${!page.hasPreviousPage}">disabled</c:if> >
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
									<li ><a href="${pageContext.request.contextPath}/product/productlist?gameId=${game.id}&areaId=${areaId}&price=${price}&flag=${flag}&page=${page_Nums}">${page_Nums}</a></li>
								</c:if>
								</c:forEach>
								</li>
								<!-- 如果没有后页就禁止点击当前页码的页面， -->
								<li>
									<a href="${pageContext.request.contextPath}/product/productlist?gameId=${game.id}&areaId=${areaId}&price=${price}&flag=${flag}&page=${page.pageNum+1}" aria-label="Next" <c:if test="${!page.hasNextPage}">disabled</c:if>>
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
								<li><a href="${pageContext.request.contextPath}/product/productlist?gameId=${game.id}&areaId=${areaId}&price=${price}&flag=${flag}&page=${page.pages}">末页</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>

		</div>

	<jsp:include page="footer.jsp"/>
	</body>

</html>