<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<jsp:include page="../common.jsp"/>
</head>

<body>
<jsp:include page="../top.jsp"/>
<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
	<ul class="nav menu">
		<li ><a href="<%=request.getContextPath()%>/manage/index.jsp"><span class="glyphicon glyphicon-dashboard"></span>首页</a></li>
		<li ><a href="<%=request.getContextPath()%>/manage/notice"><span class="glyphicon glyphicon-th"></span> 公告管理</a></li>
		<li><a href="<%=request.getContextPath()%>/manage/product"><span class="glyphicon glyphicon-stats"></span> 商品管理</a></li>
		<li><a href="<%=request.getContextPath()%>/manage/user"><span class="glyphicon glyphicon-list-alt"></span> 用户管理</a></li>
		<li ><a href="<%=request.getContextPath()%>/manage/order"><span class="glyphicon glyphicon-pencil"></span> 订单管理</a></li>
		<li class="parent" >
			<a href="#" class="active">
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
				<li class="active">游戏区服管理</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">区服管理</h2>
			</div>
		</div><!--/.row-->

		<div class="container-fluid main-content">
			<div class="widget-container fluid-height clearfix">
				<div class="heading clearfix">
					<a id="add-row"
													   class="btn btn-sm btn-primary-outline pull-right"
													   href="gameArea/create.jsp"><i class="icon-plus"></i>
					新增区服</a>
				</div>
				<div class="widget-content padded clearfix">

					<div id="w0" class="grid-view">
						<div class="table-responsive">
							<table class="table table-hover table-striped table-condensed " id="example"  >
								<thead>
								<tr>
									<th><label class="label-checkbox"> <input
											type="checkbox" class="select-on-check-all"
											name="selection_all" value="1"><span
											class="custom-checkbox"></span> </label>
									</th>
									<th >区服名字</th>
									<th nowrap>服务器状态</th>
									<th nowrap>对应游戏名字</th>
									<th nowrap>游戏状态</th>
									<th class="action-column">操作</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${gamesArea}" var="i">
									<tr data-key="${i.id}">
										<td><label class="label-checkbox"> <input
												type="checkbox" name="selection[]" value="13"><span
												class="custom-checkbox"></span> </label>
										</td>
										<td>${i.areaName}</td>
										<c:if test="${i.state==0}" ><td>禁用</td></c:if>
										<c:if test="${i.state==1}" ><td>正常</td></c:if>
										<td>${i.game.gameName}</td>
										<c:if test="${i.game.state==0}" ><td>禁用</td></c:if>
										<c:if test="${i.game.state==1}" ><td>正常</td></c:if>
										<td>
											<div>
												<c:if test="${i.state==1}">
													<button type="button"  name="updatebtn"
															  class="btn btn-success btn-sm"
															  id="${i.id}_jy"
															  onclick="updatestate(this.id)"
															<c:if test="${i.game.state==0}">disabled</c:if>
													>正常</button>
												</c:if>
												<c:if test="${i.state==0}">
													<button type="button"  name="updatebtn"
															class="btn btn-danger btn-sm"
															id="${i.id}_qy"
															onclick="updatestate(this.id)"
															<c:if test="${i.game.state==0}">disabled</c:if>
													>禁用</button>
												</c:if>

												<button type="button"  name="updatebtn"
												class="btn btn-warning btn-sm"
												id="${i.id}_xg"
												onclick="updateGame(this.id)"
												<c:if test="${i.game.state==0}">disabled</c:if>
												>修改</button>
												<button type="button"  name="updatebtn"
														class="btn btn-blue-mini btn-sm"
														id="${i.id}_sc"
														onclick="deleteGame(this.id)"
														<c:if test="${i.game.state==0}">disabled</c:if>
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
							当前${page.pageNum}页,共${page.pages}页,总${page.total}条记录
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
										<a href="gameArea?id=${id}&&page=1">首页</a>
									</li>
									<!-- 如果还有前页就访问当前页码-1的页面， -->

									<li>
										<a href="gameArea?id=${id}&&page=${page.pageNum-1}" aria-label="Previous" <c:if test="${!page.hasPreviousPage}">disabled</c:if> >
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
										<li ><a href="gameArea?id=${id}&&page=${page_Nums}">${page_Nums}</a></li>
									</c:if>
									</c:forEach>
									</li>
									<!-- 如果没有后页就禁止点击当前页码的页面， -->
									<li>
										<a href="gameArea?id=${id}&&page=${page.pageNum+1}" aria-label="Next" <c:if test="${!page.hasNextPage}">disabled</c:if>>
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
									<li><a href="gameArea?id=${id}&&page=${page.pages}">末页</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

		<script type="text/javascript">
			//修改状态
            function updatestate(id) {
                var data={
                    id:id.split("_")[0],
					type:id.split("_")[1]
				};
                $.ajax({
                    type: 'post',
                    url: 'gameArea/update',
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
                            window.location.href='gameArea?id=${id}&page=${page.pageNum}';

                        }
                    },error :function (){
                        alert("请求失败");
                        return false;
                    }
                });
            }
            //修改
            function updateGame(id) {
                var gameId = id.split("_xg")[0];
				location.href = 'gameArea/query?id=${id}&areaid='+gameId+"&page=${page.pageNum}";
            }
            //删除
            function deleteGame(id) {
                var data={
                    id:id.split("_")[0]
                };
                $.ajax({
                    type: 'post',
                    url: 'gameArea/delete',
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
                            window.location.href='gameArea?id=${id}&page=${page.pageNum}';
                        }
                    },error :function (){
                        alert("请求失败");
                        return false;
                    }
                });
            }
            $(function() {
//                $("#example").DataTable({
//                    "bSort": true, //是否启动各个字段的排序功能
//                    "aaSorting": [
//                        [1, "asc"]
//                    ], //默认的排序方式，第4列，升序排列
//                    "bFilter": true, //是否启动过滤、搜索功能
//                    "aLengthMenu": [
//                        [5, 10, 20, -1],
//                        [5, 10, 20, "All"]
//                    ], //更改显示记录数选项
//                    "iDisplayLength": -1, //默认显示的记录数
//                    "language": {
//                        "lengthMenu": "每页 _MENU_ 条记录",
//                        "zeroRecords": "没有找到记录",
//                        "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
//                        "infoEmpty": "无记录",
//                        "infoFiltered": "(从 _MAX_ 条记录过滤)",
//                        'paginate': {
//                            'next': '下一页',
//                            'previous': '上一页'
//                        },
//                        'search': '搜索:',
//                        'processing': '查询中...',
//                    },
//                });
            });
		</script>
</body>
</html>
