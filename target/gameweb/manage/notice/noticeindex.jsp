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
		<li class="active"><a href="<%=request.getContextPath()%>/manage/notice"><span class="glyphicon glyphicon-th"></span> 公告管理</a></li>
		<li><a href="<%=request.getContextPath()%>/manage/product"><span class="glyphicon glyphicon-stats"></span> 商品管理</a></li>
		<li><a href="<%=request.getContextPath()%>/manage/user"><span class="glyphicon glyphicon-list-alt"></span> 用户管理</a></li>
		<li ><a href="<%=request.getContextPath()%>/manage/order"><span class="glyphicon glyphicon-pencil"></span> 订单管理</a></li>
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
				<li class="active">公告管理</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">公告管理</h1>
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
					<a id="add-row"
					 class="btn btn-sm btn-primary-outline pull-right"S
					href="notice/create.jsp"><i class="icon-plus"></i>
					新增公告</a>
				</div>
				<br/>
				<div class="widget-content padded clearfix">

					<div id="w0" class="grid-view">
						<div class="table-responsive">
							<table class="table table-hover table-striped table-condensed" id="example"  >
								<thead>
								<tr>
									<th align="center">公告标题</th>
									<th nowrap>公告发布时间</th>
									<th nowrap>公告内容</th>
									<th nowrap class="action-column">操作</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach begin="0" step="1" items="${notices}" var="i">
									<tr data-key="${i.noticeId}">
										<td><div style="width:100px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;" >
												${i.noticeTitle}</div></td>
										<td><fmt:formatDate value="${i.createTime}" pattern="yyyy/MM/dd HH:mm:ss" /></td>
										<%--内容过多显示省略号--%>
										<td><xmp style="width:160px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;" >
											${i.noticeContent}</xmp></td>
										<td>
											<div>
												<button type="button"  name="updatebtn"
														class="btn btn-warning btn-sm"
														id="${i.noticeId}_ck"
														onclick="viewNotice(this.id)">查看</button>
												<button type="button"  name="updatebtn"
												class="btn btn-warning btn-sm"
												id="${i.noticeId}_xg"
												onclick="updateNotice(this.id)">修改</button>
												<button type="button"  name="deletebtn"
														class="btn btn-blue-mini btn-sm"
														id="${i.noticeId}_sc"
														onclick="deleteNotice(this.id)"
												>删除</button>
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
			</div>
		</div>
	</div>

		<script type="text/javascript">
            function viewNotice(id) {
                var data={
                    id:id.split("_")[0]
				};
                var id=id.split("_")[0];
               location.href = '${pageContext.request.contextPath}/manage/notice/'+id;
			}
            //删除
            function deleteNotice(id) {
                var data={
                    id:id.split("_")[0]
                };
                $.ajax({
                    type: 'post',
                    url: 'notice/delete',
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
                            window.location.href='notice?page=${page.pageNum}';
                        }
                    },error :function (){
                        alert("请求失败");
                        return false;
                    }
                });
            }
            function updateNotice(id) {
                var id = id.split("_xg")[0];
				location.href = 'notice/query?id='+id+'&page=${page.pageNum}';
            }
		</script>
</body>
</html>
