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

	<body id="mydiv">
	<jsp:include page="../top.jsp"/>
		<!-- header-end -->

		<!--路径-->
		<div class=" banner-2-area" style="padding: 10px;">
			<div class="container">
				<ol class="breadcrumb" style="padding:10px;text-align: left; font-size: 15px;">
					<li>
						<a href="#">首页</a>
					</li>

					<li class="active">个人中心</li>
				</ol>
			</div>
		</div>
		<div class="banner-2-area" style="padding: 10px;">
			<div class="container">
				<div class="col-md-2 " style="height: 700px; border: solid lightgray 1px;border-right: none;">
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
								<a class="on" >个人信息</a>
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
				<div class="col-md-9" style="height: 700px;padding: 10px;border: solid lightgray 1px; ">
					<h3>欢迎</h3>
					<div style="border-top: dotted 1px darkgrey;padding: 7px 5px;">
						<div class=""><span id="wen"></span> ${user.nickName}</div>
						<br/>
						<div class="">站内信：<a href="${pageContext.request.contextPath}/user/message?state=all">${count}条</a></div>
					</div>
					<div id="gerenxinxi"style="border-top: dotted 1px darkgrey;padding: 7px 5px;">
						
						<form role="form" class="col-md-10 col-md-offset-1" id="form1">
							<div class="form-group">
								<label class="col-md-2">账号</label>
								<span class="col-md-offset-2">${user.userName}</span>
							</div>
							<div class="form-group">
								<label class="col-md-2">昵称</label>
								<span class="col-md-offset-2">${user.nickName}</span>
							</div>
							<div class="form-group">
								<label class="col-md-2">邮箱</label>
								<span class="col-md-offset-2">${user.email}</span>
							</div>
							<div class="form-group">
								<label class="col-md-2">手机号</label>
								<span class="col-md-offset-2">${user.phone}</span>
							</div>
							<div class="form-group">
								<label class="col-md-2">QQ</label>
								<span class="col-md-offset-2">${user.qq}</span>
							</div>
							<button type="button" class="btn btn-success" id="submit">修改</button>
						</form>
						<form role="form" class="col-md-10 col-md-offset-1" id="form2" style="display: none;">
							<div class="form-group">
								<label>账号</label>
								<input class="form-control"  type="text" disabled="disabled" value="${user.userName}">
							</div>
							<div class="form-group">
								<label>昵称</label>
								<input class="form-control" id="nickname" type="text" value="${user.nickName}">
							</div>
							<div class="form-group">
								<label>邮箱</label>
								<input class="form-control" id="email" type="text" value="${user.email}">
							</div>
							
							<div class="form-group">
								<label>手机号</label>
								<input class="form-control" id="phone" type="text" value="${user.phone}">
							</div>
							<div class="form-group">
								<label>QQ</label>
								<input class="form-control" id="qq" type="text" value="${user.qq}">
							</div>
							<input type="hidden" id="userId" value="${user.userId}">
							<button type="submit" class="btn btn-success"  onclick="update()">保存</button>
							<button type="button" class="btn btn-primary" id="button1">取消</button>
						</form>
					</div>
				</div>
			</div>
		</div>


		<!-- all js here -->
		<jsp:include page="../footer.jsp"/>
		<script type="text/javascript">
			function update() {
			    var data={};
			    data.userId=$("#userId").val();
			    data.nickName=$("#nickname").val();
			    data.phone=$("#phone").val();
			    data.email=$("#email").val();
			    data.qq=$("#qq").val();
			    $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath }/user/update',
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
                            //alert(data.success);
                            window.href="${pageContext.request.contextPath}/user/userinfo";
                        }
                    },error :function (){
                        alert("请求失败");
                        return false;
                    }
                });
            }
			$("#submit").click(function(){
			  $("#form1").attr("style","display: none;");
			  $("#form2").removeAttr("style");
			});
			$("#button1").click(function(){
			  $("#form2").attr("style","display: none;");
			  $("#form1").removeAttr("style");
			});
		</script>
	<script type="text/javascript">
		$(function () {
            var date=new Date();
            var hour=date.getHours();
            var str='';
            if(hour<5){
                str='凌晨好！';
            }else if(hour<8){
                str='早上好！';
            }else if(hour<11){
                str='上午好！';
            }else if(hour<13){
                str='中午好！';
            }else if(hour<17){
                str='下午好！';
            }else if(hour<19){
                str='傍晚好！';
            }else if(hour<23){
                str='晚上好！';
            }else{
                str='太晚了，休息吧！';
            }
            $("#wen").html('现在是'+hour+'点'+'，'+str);
        })

        //document.write('现在是'+hour+'点'+'<br/>'+str);
	</script>
	<script type="text/javascript">
        window.onload = function() {
//配置
            var config = {
                vx: 4,	//小球x轴速度,正为右，负为左
                vy: 4,	//小球y轴速度
                height: 2,	//小球高宽，其实为正方形，所以不宜太大
                width: 2,
                count: 100,		//点个数
                color: "121, 162, 185", 	//点颜色
                stroke: "130,255,255", 		//线条颜色
                dist: 6000, 	//点吸附距离
                e_dist: 20000, 	//鼠标吸附加速距离
                max_conn: 10 	//点到点最大连接数
            }

//调用
            CanvasParticle(config);
        }
	</script>
	</body>

</html>