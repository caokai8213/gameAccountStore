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
		<li><a href="<%=request.getContextPath()%>/manage/product"><span class="glyphicon glyphicon-stats"></span> 商品管理</a></li>
		<li class="active"><a href="<%=request.getContextPath()%>/manage/user"><span class="glyphicon glyphicon-list-alt"></span> 用户管理</a></li>
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
				<li class="active">用户管理</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">用户管理</h1>
			</div>
		</div><!--/.row-->

		<div class="container-fluid main-content">
			<div class="widget-container fluid-height clearfix">

				<div class="heading clearfix" >
					<%--<div class="dataTables_filter" style="display: inline-block">--%>
						<%--<div class="btn-group">--%>
							<%--<input type="text" class="form-control input-md" name="game-search" id="game-search" placeholder="游戏">--%>
						<%--</div>--%>
						<%--<div class="btn-group">--%>
							<%--<button type="button" class="btn btn-success btn-sm" id="soo"  onclick="search()"><i--%>
									<%--class="glyphicon glyphicon-search"></i> 搜索--%>
							<%--</button>--%>
						<%--</div>--%>
					<%--</div>--%>
					<%--<a id="add-row"--%>
					 <%--class="btn btn-sm btn-primary-outline pull-right"S--%>
					<%--href="notice/create.jsp"><i class="icon-plus"></i>--%>
					<%--新增用户</a>--%>
				</div>
				<br/>
				<div class="widget-content padded clearfix">

					<div id="w0" class="grid-view">
						<div class="table-responsive">
							<table class="table table-hover table-striped table-condensed" id="example"  >
								<thead>
								<tr>
									<th align="center">用户id</th>
									<th nowrap>用户名</th>
									<th nowrap>昵称</th>
									<th>创建时间</th>
									<th>角色</th>
									<th>状态</th>
									<th nowrap class="action-column">操作</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach begin="0" step="1" items="${users}" var="i">
									<tr data-key="${i.userId}">
										<td>${i.userId}</td>
										<td>${i.userName}</td>
										<td>${i.nickName}</td>
										<td><fmt:formatDate value="${i.createTime}" pattern="yyyy/MM/dd HH:mm:ss" /></td>
										<td>${i.role}</td>
										<td>
											<c:if test="${'0'.equals(i.status)}">未激活</c:if>
											<c:if test="${'1'.equals(i.status)}">正常</c:if>
											<c:if test="${'2'.equals(i.status)}">封禁</c:if>
										</td>
										<td>
											<div>
												<c:if test="${'1'.equals(i.status)}">
													<button type="button"  name="updatebtn"
															class="btn btn-success btn-sm"
															id="${i.userName}_jy"
															onclick="updatestate(this.id)">正常</button>
												</c:if>
												<c:if test="${'2'.equals(i.status)}">
													<button type="button"  name="updatebtn"
															class="btn btn-danger btn-sm"
															id="${i.userName}_qy"
															onclick="updatestate(this.id)" >禁用</button>
												</c:if>
												<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" id="${i.userName}" onclick="view(this.id)">
													查看
												</button>
											</div></td>

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
										<a href="user?page=1">首页</a>
									</li>
									<!-- 如果还有前页就访问当前页码-1的页面， -->

										<li>
											<a href="user?page=${page.pageNum-1}" aria-label="Previous" <c:if test="${!page.hasPreviousPage}">disabled</c:if> >
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
										<li ><a href="user?page=${page_Nums}">${page_Nums}</a></li>
									</c:if>
									</c:forEach>
									</li>
									<!-- 如果没有后页就禁止点击当前页码的页面， -->
										<li>
											<a href="user?page=${page.pageNum+1}" aria-label="Next" <c:if test="${!page.hasNextPage}">disabled</c:if>>
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									<li><a href="user?page=${page.pages}">末页</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<div id="myModal" class="modal fade " tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog " role="document" style="width: 500px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">用户信息</h4>
			</div>
			<div id="showaccount" class="modal-body " style="padding: 0px 50px">

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-remove" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
			</div>
		</div>
	</div>
</div>
		<script type="text/javascript">
            function updatestate(id) {
                var data={
                    id:id.split("_")[0],
                    type:id.split("_")[1]
                };
                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath}/manage/user/update',
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
                            window.location.href='user?page=${page.pageNum}';
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
                    url: '${pageContext.request.contextPath}/manage/user/userinfo',
                    data: data,
                    cache: false,
                    sync: true,
                    success: function (data) {
                        console.log(data);
                        $("#showaccount").empty();
                        var item2="\t\t\t\t\t<div class=\"col-md-4\">用户名</div>\n" +
                            "\t\t\t\t\t<div class=\"col-md-8 \">"+data.userName+"</div>\n" +
                            "\t\t\t\t\t<div class=\"col-md-4\">手机</div>\n" +
                            "\t\t\t\t\t<div class=\"col-md-8\">"+data.phone+"</div>\n" +
                            "\t\t\t\t\t<div class=\"col-md-4\">邮箱</div>\n" +
                            "\t\t\t\t\t<div class=\"col-md-8\">"+data.email+"</div>\n" +
                            "\t\t\t\t\t<div class=\"col-md-4\">QQ</div>\n" +
                            "\t\t\t\t\t<div class=\"col-md-8\">"+data.qq+"</div>";
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
