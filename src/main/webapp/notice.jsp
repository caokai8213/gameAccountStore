<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
						<a href="${pageContext.request.contextPath}/index.jsp">首页</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/notice">公告</a>
					</li>
					<li class="active">
						公告详情
					</li>
				</ol>
			</div>
		</div>

		<div class="banner-area" style="padding: 10px 0px; margin: 10px 150px; border: groove indianred; background-color: white;">
				<div>
					<div class="mod-con notice-detail">
						<div class="bd" style="text-align: center;">
							<div class="name">
								<h2>${notice.noticeTitle}</h2>
							</div>
						</div>
						<div class="date col-md-offset-10">
						<fmt:formatDate value="${notice.createTime}" pattern="yyyy/MM/dd"/>
						</div>
						<div style="padding: 10px 20px;">
							${notice.noticeContent}
						</div>
						<div style="height: 200px;"></div>
					</div>
				</div>
		</div>

	<jsp:include page="footer.jsp"/>
	</body>

</html>