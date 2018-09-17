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
			.con>li >a {
				display: block;
			}
			.con>li>a:hover {
				width: 100%;
				color: black;
				border-left: solid salmon 10px;
				display: block;
				background-color: #ddd;
			}
			.on{
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
		<!-- header-end -->

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
							<li>
								<a href="${pageContext.request.contextPath}/user/order/buylist?state=all">查看我的订单</a>
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
								<a href="${pageContext.request.contextPath}/user/product1?state=all">管理我的商品</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/user/order/sellerlist?state=all">查看我的订单</a>
							</li>

						</ul>

						<h3>账号设置</h3>
						<ul class="con">
							<li>
								<a  href="${pageContext.request.contextPath}/user/userinfo">个人信息</a>
							</li>
							<li>
								<a class="on">修改密码</a>
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
				<div class="col-md-9" style="background-color: whitesmoke;height: 700px;padding: 10px;border: solid lightgray 1px; ">
					<h4>修改密码</h4>
					<div id="gerenxinxi"style="border-top: dotted 1px darkgrey;padding: 7px 5px;">

						<form class="form-horizontal">
							<div class="form-group">
								<label for="oldpassword" class="col-md-2 control-label">旧密码</label>
								<div class="col-md-6">
									<input type="password" class="form-control" id="oldpassword" placeholder="password">
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-md-2 control-label">新密码</label>
								<div class="col-md-6">
									<input type="password" class="form-control" id="password" placeholder="password"
										   onblur="check_password()">
								<label class="col-md-12" id="passwordcheck"></label>
								</div>
							</div>
							<div class="form-group">
								<label for="repassword" class="col-md-2 control-label">重复密码</label>
								<div class="col-md-6">
									<input type="password" class="form-control" id="repassword" placeholder="rePassword"
									onblur="check_repassword()">
									<label class="col-md-12" id="repasswordcheck"></label>
								</div>

							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="btn btn-default btn-lg" onclick="update()">提交</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


		<!-- all js here -->
		<jsp:include page="../footer.jsp"/>
		<script type="text/javascript">
            function check_password() {
                var password=$("#password").val();
                var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
                var msg = document.getElementById("passwordcheck");
                if(!reg.exec(password)) {
                    msg.innerHTML = "<font color='red'>最少6位,包含字母和数字</font>";
                    return false;
                }else{
                    msg.innerHTML = "";
                    return true;
                }
            }
            function check_repassword() {
                var msg = document.getElementById("repasswordcheck");
                if ($("#password").val() != $("#repassword").val()){
                    msg.innerHTML="<font color='red'>两次密码请一致</font>";
                    return false;
                }else{
                    msg.innerHTML="";
                    return true;
                }
            }
			function update() {
                var flag=check_password()&&check_repassword();
                if(flag){
                    var data={};
                    data.password=$("#password").val();
                    data.oldpassword=$("#oldpassword").val();
                    $.ajax({
                        type: 'post',
                        url: '${pageContext.request.contextPath }/user/updatepwd',
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
                                location.href="${pageContext.request.contextPath}/user/userinfo";
                            }
                        },error :function (){
                            alert("请求失败");
                            return false;
                        }
                    });
				}else{
                    return false;
				}
            }
		</script>
	</body>

</html>