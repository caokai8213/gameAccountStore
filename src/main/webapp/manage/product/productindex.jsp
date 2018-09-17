<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<jsp:include page="../common.jsp"/>
</head>


<body>
<jsp:include page="../top.jsp"/>
<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
	<ul class="nav menu">
		<li ><a href="<%=request.getContextPath()%>/manage/index.jsp"><span class="glyphicon glyphicon-dashboard"></span>首页</a></li>
		<li><a href="<%=request.getContextPath()%>/manage/notice"><span class="glyphicon glyphicon-th"></span> 公告管理</a></li>
		<li  class="active"><a href="<%=request.getContextPath()%>/manage/product"><span class="glyphicon glyphicon-stats"></span> 商品管理</a></li>
		<li><a href="<%=request.getContextPath()%>/manage/user"><span class="glyphicon glyphicon-list-alt"></span> 用户管理</a></li>
		<li><a href="<%=request.getContextPath()%>/manage/order"><span class="glyphicon glyphicon-pencil"></span> 订单管理</a></li>
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
				<li class="active">商品管理</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">商品管理</h1>
			</div>
		</div><!--/.row-->

		<div class="container-fluid main-content">
			<div class="widget-container fluid-height clearfix">

				<div class="heading clearfix" >
					<div class="dataTables_filter" style="display: inline-block">
						<div class="btn-group">
							<input type="text" class="form-control input-md" name="game-search" id="game-search" placeholder="请输入用户或游戏名">
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-success btn-sm" id="soo"  onclick="search()"><i
									class="glyphicon glyphicon-search"></i> 搜索
							</button>
						</div>
					</div>
					<%--<a id="add-row"--%>
					 <%--class="btn btn-sm btn-primary-outline pull-right"--%>
					<%--href="game/create.jsp"><i class="icon-plus"></i>--%>
					<%--新增游戏</a>--%>
				</div>
				<br/>
				<div class="widget-content padded clearfix">
					<div id="w0" class="grid-view">
						<div class="table-responsive">
							<table class="table table-hover table-striped table-condensed" id="example"  >
								<thead>
								<tr>
									<th align="center">商品id</th>
									<th nowrap>发布者</th>
									<th nowrap>商品名字</th>
									<th nowrap>游戏名字</th>
									<th nowrap>区服名字</th>
									<th nowrap>发布时间</th>
                                    <th nowrap>商品价格</th>
                                    <th nowrap>商品状态</th>
									<th nowrap class="action-column">操作</th>

								</tr>
								</thead>
								<tbody>
								<c:forEach begin="0" step="1" items="${products}" var="i">
									<tr data-key="${i.productId}">
										<td>${i.productId}</td>
										<td>${i.user.userName}</td>
										<td>${i.productName}</td>
										<td>${i.game.gameName}</td>
										<td>${i.gameArea.areaName}</td>
										<td><fmt:formatDate value="${i.createTime}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
                                        <td>${i.productPrice}</td>
										<td>
											<c:if test="${'1'.equals(i.productState)}" >待审核</c:if>
											<c:if test="${'2'.equals(i.productState)}" >审核通过待出售</c:if>
											<c:if test="${'3'.equals(i.productState)}" >审核失败</c:if>
											<c:if test="${'4'.equals(i.productState)}" >出售中</c:if>
											<c:if test="${'5'.equals(i.productState)}" >已出售</c:if>
										</td>
										<td>
											<div>
												<a type="button"  name="updatebtn"
												class="btn btn-warning btn-sm"
												href="${pageContext.request.contextPath}/manage/productDetail/${i.productId}">查看</a>
												<c:if test="${'1'.equals(i.productState)}">
													<button type="button"  name="updatebtn"
															class="btn btn-success btn-sm"
															id="${i.productId}_ty"
															onclick="updatestate(this.id)">同意</button>
													<button type="button"  name="updatebtn"
															class="btn btn-danger btn-sm"
															id="${i.productId}_jj"
															onclick="updatestate(this.id)">拒绝</button>
												</c:if>
											</div>
										</td>

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
										<a href="product?search=${search}&page=1">首页</a>
									</li>
									<!-- 如果还有前页就访问当前页码-1的页面， -->

										<li>
											<a href="product?search=${search}&page=${page.pageNum-1}" aria-label="Previous" <c:if test="${!page.hasPreviousPage}">disabled</c:if> >
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
										<li ><a href="product?search=${search}&page=${page_Nums}">${page_Nums}</a></li>
									</c:if>
									</c:forEach>
									</li>
									<!-- 如果没有后页就禁止点击当前页码的页面， -->
										<li>
											<a href="product?search=${search}&page=${page.pageNum+1}" aria-label="Next" <c:if test="${!page.hasNextPage}">disabled</c:if>>
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									<li><a href="product?search=${search}&page=${page.pages}">末页</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

		<script type="text/javascript">
			function search() {
				var search=$("#game-search").val();
				if(search==null){
				    return;
				}else
                {
                    window.location.href = "<%=request.getContextPath()%>/manage/product?search=" + search;
                }
            }
            function updatestate(id) {
                var data={
                    id:id.split("_")[0],
					type:id.split("_")[1]
				};
                $.ajax({
                    type: 'post',
                    url: 'product/update',
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
                            window.location.href='product?search=${search}&page=${page.pageNum}';
                        }
                    },error :function (){
                        alert("请求失败");
                        return false;
                    }
                });
            }
            //删除
            function deleteGame(id) {
                var data={
                    id:id.split("_")[0]
                };
                $.ajax({
                    type: 'post',
                    url: 'game/delete',
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
                            window.location.href='game?search=${search}&page=${page.pageNum}';
                        }
                    },error :function (){
                        alert("请求失败");
                        return false;
                    }
                });
            }
            function updateGame(id) {
                var gameId = id.split("_xg")[0];
				location.href = 'game/query?id='+gameId+'&page=${page.pageNum}&search=${search}';
            }
		</script>
</body>
</html>
