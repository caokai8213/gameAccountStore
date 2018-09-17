<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<jsp:include page="../common.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css" />
	<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
</head>
<body>
<jsp:include page="../top.jsp"/>
<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
	<ul class="nav menu">
		<li ><a href="<%=request.getContextPath()%>/manage/index.jsp"><span class="glyphicon glyphicon-dashboard"></span>首页</a></li>
		<li><a href="<%=request.getContextPath()%>/manage/notice"><span class="glyphicon glyphicon-th"></span> 公告管理</a></li>
		<li><a href="<%=request.getContextPath()%>/manage/product"><span class="glyphicon glyphicon-stats"></span> 商品管理</a></li>
		<li><a href="<%=request.getContextPath()%>/manage/user"><span class="glyphicon glyphicon-list-alt"></span> 用户管理</a></li>
		<li class="active"><a href="<%=request.getContextPath()%>/manage/order"><span class="glyphicon glyphicon-pencil"></span> 订单管理</a></li>
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
				<li class="active">订单管理</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">订单管理</h1>
			</div>
		</div><!--/.row-->

		<div class="container-fluid main-content">
			<div class="widget-container fluid-height clearfix">
				<div class="heading clearfix" >
					<div class="dataTables_filter" style="display: inline-block">
						<div class="btn-group">
							<div class="form-group">
								<label class="control-label">游戏：</label>
								<div class="input-group date form_date mr10">
									<select id="game" class="form-control" name="game-company">
										<option value="">请选择</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="dataTables_filter" style="display: inline-block">
						<div class="btn-group">
							<div class="form-group">
								<label class="control-label">开始日期:</label>
								<div class="input-group date form_date mr10">
									<input data-format="yyyy-MM-dd*hh:mm:ss" class="form-control" type="text" value="" id="startDate2">
								</div>
								<label class="control-label">结束日期:</label>
								<div class="input-group date form_date">
									<input class="form-control" type="text" value="" id="endDate2">
								</div>
							</div>
						</div>
						<div class="btn-group">
							<div class="form-group">
								<label class="control-label">状态：</label>
								<div class="input-group date form_date mr10">
									<select name="" id="orderstate" class="form-control">
										<option value="">请选择</option>
									</select>
								</div>
							</div>
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-success btn-sm" id="soo"  onclick="search()"><i
									class="glyphicon glyphicon-search"></i> 搜索
							</button>
						</div>
					</div>
				</div>
				<br/>
				<div class="widget-content padded clearfix">
					<div id="w0" class="grid-view">
						<div class="table-responsive">
							<table class="table table-hover table-striped table-condensed" id="example"  >
								<thead>
								<tr>
									<th align="center">订单号</th>
									<th nowrap>商品名字</th>
									<th nowrap>创建时间</th>
									<th nowrap>游戏</th>
									<th nowrap>出售者</th>
									<th nowrap>购买者</th>
                                    <th nowrap>商品价格</th>
									<th nowrap>交易状态</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach begin="0" step="1" items="${orderVos}" var="i">
									<tr data-key="${i.orderId}">
										<td>${i.orderId}</td>
										<td>${i.productName}</td>
										<td><fmt:formatDate value="${i.createTime}" pattern="yyyy/MM/dd HH:mm:dd"/></td>
										<td>${i.gameName}</td>
										<td>${i.sellerName}</td>
										<td>${i.buyerName}</td>
										<td>${i.productPrice}</td>
										<td>${i.orderStateName}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 提示分页信息行 -->
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
										<a href="order?page=1&gameId=${gameId}&ostate=${ostate}&stime=${stime}&etime=${etime}">首页</a>
									</li>
									<!-- 如果还有前页就访问当前页码-1的页面， -->

										<li>
											<a href="order?page=${page.pageNum-1}&gameId=${gameId}&ostate=${ostate}&stime=${stime}&etime=${etime}" aria-label="Previous" <c:if test="${!page.hasPreviousPage}">disabled</c:if> >
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
										<li ><a href="order?page=${page_Nums}&gameId=${gameId}&ostate=${ostate}&stime=${stime}&etime=${etime}">${page_Nums}</a></li>
									</c:if>
									</c:forEach>
									</li>
									<!-- 如果没有后页就禁止点击当前页码的页面， -->
										<li>
											<a href="order?page=${page.pageNum+1}&gameId=${gameId}&ostate=${ostate}&stime=${stime}&etime=${etime}" aria-label="Next" <c:if test="${!page.hasNextPage}">disabled</c:if>>
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									<li><a href="order?page=${page.pages}&gameId=${gameId}&ostate=${ostate}&stime=${stime}&etime=${etime}">末页</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
    $(function () {
        $.ajax({
            url: "<%=request.getContextPath()%>/manage/gamelist",
            type: "GET",
            async:false,
            success: function (data) {
                $.each(data, function(index, item) {
                    $("#game").append(  //此处向select中循环绑定数据
                        "<option value="+item.id+">" + item.gameName+ "</option>");
                });
            }
        });
        $.ajax({
            url: "<%=request.getContextPath()%>/manage/orderstatelist",
            type: "GET",
            async:false,
            success: function (data) {
                $.each(data, function(index, item) {
                    $("#orderstate").append(  //此处向select中循环绑定数据
                        "<option value="+item.orderStateId+">" + item.orderStateName+ "</option>");
                });
            }
        });
    });
        $("#startDate2").datetimepicker({
        });
        $("#endDate2").datetimepicker({});
		function search() {
            var startTime = $("#startDate2").val().replace(/\s+/g,"*");
            var endTime = $("#endDate2").val().replace(/\s+/g,"*");
            var gameId=$("#game option:selected").val();
            var orderstate=$("#orderstate option:selected").val();
            //alert("--"+startTime+"--"+endTime+"--"+gameId+"--"+orderstate);
			window.location.href = "<%=request.getContextPath()%>/manage/order?gameId="+ gameId+"&ostate="+orderstate+"&stime="+startTime+"&etime="+endTime;
            }
		</script>

</body>
</html>
