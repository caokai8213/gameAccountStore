<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="en">

	<head>
<jsp:include page="common.jsp"/>
	</head>

	<body>


		<!-- header-start -->
       <jsp:include page="top.jsp"/>
		<!-- header-end -->
		<!--路径-->
		<div class=" banner-area" style="padding: 10px;">
			<div class="container">
				<ol class="breadcrumb" style="padding:10px;text-align: left; font-size: 15px;">
					<li>
						<a href="#">首页</a>
					</li>
					<li class="active">
						公告
					</li>
				</ol>
			</div>
		</div>

		<div class="banner-area" style="padding: 0px 0px; margin: 10px 250px; background-color: white;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="row">
						<div>
							<h4 class="col-md-4">公告列表</h4>
						</div>
					</div>
				</div>
				<div class="container-fluid main-content" style="padding: 10px;">
					<div class="widget-container fluid-height clearfix mwi1200">
						<div class="widget-content padded clearfix">
							<c:forEach begin="0" step="1" items="${notices}" var="i">
							<div class="row" style="margin: 20px 0px;">
								<div class="col-md-9">
									<a href="notice/${i.noticeId}">${i.noticeTitle}</a>
								</div>
								<div class="col-md-3">
								<fmt:formatDate value="${i.createTime}" pattern="yyyy/MM/dd HH:mm:ss"/>		</div>
							</div>
							</c:forEach>


					</div>
				</div>
			</div>
		</div>
			<div class="row">
				<!-- 分页文字信息 ：拿到控制器处理请求时封装在pageInfo里面的分页信息-->
				<div class="col-md-7">
					当前${page.pageNum}页,共${page.pages }页,总${page.total }条记录
				</div>
				<!-- 分页码 -->
				<div class="col-md-5 ">
					<nav aria-label="Page navigation">
						<ul class="pagination">
							<!--
                        1.pageContext.request.contextPath表示当前项目路径，采用的是绝对路径表达方式。一般为http:localhost:8080/项目名 。
                        2.首页，末页的逻辑：pn=1访问第一次，pn=${page.pages}访问最后一页
                      -->
							<li>
								<a href="notice?page=1">首页</a>
							</li>
							<!-- 如果还有前页就访问当前页码-1的页面， -->

							<li>
								<a href="notice?page=${page.pageNum-1}" aria-label="Previous" <c:if test="${!page.hasPreviousPage}">disabled</c:if> >
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
								<li ><a href="notice?page=${page_Nums}">${page_Nums}</a></li>
							</c:if>
							</c:forEach>
							</li>
							<!-- 如果没有后页就禁止点击当前页码的页面， -->
							<li>
								<a href="notice?page=${page.pageNum+1}" aria-label="Next" <c:if test="${!page.hasNextPage}">disabled</c:if>>
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
							<li><a href="notice?page=${page.pages}">末页</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	<jsp:include page="footer.jsp"/>
	</body>

</html>