<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="imagemode" content="force" />
<title>飞天猫</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/css-pc-94_c4a4190.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/nc.css">
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/css-pc-point-produit_f6144d7.css" />
<style>
	.middle_right{  margin-left: 350px;}
#lunbobox {
	width:500px;
	height:300px;
	position:relative;
}
.lunbo {
	width:500px;
	height:300px;
}
.lunbo img {
	width:500px;
	height:300px;
	position:absolute;
	top:0px;
	left:0px;
}
#lunbobox ul {
	width:285px;
	position:absolute;
	bottom:10px;
	right:0px;
	z-index:5;
}
#lunbobox ul li {
	cursor:pointer;
	width:10px;
	height:4px;
	border:1px solid #cccccc;
	float:left;
	list-style:none;
	background:#cccccc;
	text-align:center;
	margin:0px 5px 0px 0px;
}
#toleft {
	display:none;
	width:30px;
	height:100px;
	font-size:40px;
	line-height:100px;
	text-align:center;
	color:#f4f4f4;
	/*background:#cccccc;
	*/
	/*background:url("../images/toleft.jpg")no-repeat center;
    */
	position:absolute;
	top:90px;
	left:12px;
	cursor:pointer;
	z-index:99;
	opacity:0.4;
}
#toright {
	display:none;
	width:30px;
	height:100px;
	font-size:40px;
	line-height:100px;
	text-align:center;
	color:#f4f4f4;
	/*background:#cccccc;
	*/
	position:absolute;
	top:90px;
	right:0px;
	cursor:pointer;
	z-index:99;
	opacity:0.4;
}

</style>

</head>

<body>
	<div class="header header-login">
		<div class="top-show">
			<!-- 	  跳转到主页面      -->
			<a	href="#">
			<div style="background-image:url(images/feitianmaologo.png); background-repeat:no-repeat; width:220px; height:60px; display:inline-block;">
			 
			</div>
			<span class="logo-text">专业手游交易平台 </span>
			</a>
		</div>
	</div>
	<div class="wrap">
		<div class="mod-con login-con">
			<div class="hd">
				<h2>
					使用账号登录<span class="link">飞天猫</span>
				</h2>
			</div>
			<div class="bd">

				<!-- 表单 -->
				<form id="dLoginForm" action="<%=request.getContextPath()%>/login" method="post">

					<div class="main-login">
						<!-- 账号 -->
						<div id="dLoginName" class="row">
							<label>账号：</label> <input type="text" id="username"
								name="userName" value="" maxlength="100" class="input-login"
								placeholder="请输入用户名" autocomplete="off">
						</div>

						<!-- 密码 -->
						<div id="dPassword" class="row">
							<label>密码：</label> <input type="password" maxlength="20"
								id="password" name="password" value="" class="input-login"
								placeholder="请输入密码" autocomplete="off">
						</div>

						<!-- 验证码 -->

						<!-- 错误提示 -->
						<div id="dMessageError" class="login-tips hot">${msg}</div>

						<div class="row">
							<input type="submit" value="登录" class="btn-login">
						</div>
						<div class="login-info row">
							<a
								href="#"
								class="forget em">忘记密码？</a> |&nbsp;&nbsp;&nbsp;<a
								href="#"
								class="forget em">遇到问题?</a> <a href="register.jsp"
								class="register em">免费注册</a>
						</div>
					</div>
				</form>
				<!-- 轮播图 -->
				<div class="middle_right">
					<div id="lunbobox">
						<div id="toleft">
							&lt;</div>
						<div class="lunbo">
							<a href="#"><img src="images/1.jpg"></a>
							<a href="#"><img src="images/2.jpg"></a>
							<a href="#"><img src="images/3.jpg"></a>
							<a href="#"><img src="images/4.jpg"></a>
							<a href="#"><img src="images/5.jpg"></a>
						</div>
						<div id="toright">&gt;</div>
						<ul>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
						</ul>
						<span></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="_umfp"
		style="display: inline; width: 1px; height: 1px; overflow: hidden"></div>

	<div class="footer-wrap">
		<div class="footer">
			<div class="footer-link">
				<ul>
					<li><strong>新手入门</strong> <a
						href="https://api.open.uc.cn/cas/register?register_type=email&client_id=94&amp;redirect_uri=https%3A%2F%2Fwww.jiaoyimao.com%2Flogin%3FredirectUrl%3Dhttps%253A%252F%252Fwww.jiaoyimao.com%252F%253FloginBack%253Dtrue&amp;display=pc&amp;change_uid=1&amp;t=1517456355871">免费注册</a><br>
						<a href="http://www.jiaoyimao.com/help/category/1" target="_blank">如何购买商品</a><br>
						<a href="http://www.jiaoyimao.com/help/category/2" target="_blank">如何发布商品</a>
					</li>
					<li><strong>诚信服务</strong> <a
						href="http://www.jiaoyimao.com/agreement" target="_blank">用户协议</a><br>
						<a href="http://www.jiaoyimao.com/agreement/8" target="_blank">免责声明</a><br>
						<a href="http://www.jiaoyimao.com/help/detail/46" target="_blank">7*24小时服务</a>
					</li>
					<li><strong>交易保障</strong> <a
						href="http://www.jiaoyimao.com/help/detail/47" target="_blank">寄售交易</a><br>
						<a href="http://www.jiaoyimao.com/help/detail/49" target="_blank">支付宝交易</a><br>
						<a href="http://www.jiaoyimao.com/feedbackCenter/feedback"
						target="_blank">投诉与建议</a></li>
					<li><strong>售后服务</strong> <a
						href="http://www.jiaoyimao.com/help/detail/46" target="_blank">联系客服</a><br>
					</li>
					<li><strong>友情链接</strong> <a href="http://www.9game.cn/"
						target="_blank">九游门户</a><br> <a href="http://bbs.9game.cn/"
						target="_blank">九游论坛</a></li>
				</ul>
			</div>
			<div class="company-info">Copyright &copy; 2018 jiaoyimao.com
				&nbsp;&nbsp; 版权所有 &nbsp;&nbsp; ICP证：粤ICP备13009613号-2</div>
		</div>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
	<%--<script type="text/javascript"--%>
		<%--src="<%=request.getContextPath()%>/js/jquery.dataTables-1.10.13.js"></script>--%>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
	<!--导入jquery.validate核心JS-->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery.validate.js"></script>
	<!--导入中文翻译-->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/messages_zh.js"></script>
	<script type="text/javascript">
		$(function() {
			/*表单与校验方法整合*/
			$("#dLoginForm").validate({
				rules : {
					userName : {
						required : true,
						minlength : 4
					},
					password : {
						required : true
					},
				},
				messages : {
					userName : {
						required : "用户名不能为空~",
						minlength : "用户名长度不能少于4位"
					},
					password : {
						required : "密码不能为空"
					},
				}
			});

		});
	</script>
<script >
    $("#username").focus(function(){
        $("#dMessageError").html("");
    });
    ///轮播
    $(function() {
        //$("#toright").hide();
        //$("#toleft").hide();
        $('#toright').hover(function() {
            $("#toleft").hide()
        }, function() {
            $("#toleft").show()
        })
        $('#toleft').hover(function() {
            $("#toright").hide()
        }, function() {
            $("#toright").show()
        })
    })

    var t;
    var index = 0;
    /////自动播放
    t = setInterval(play, 2000)

    function play() {
        index++;
        if (index > 4) {
            index = 0
        }
        // console.log(index)
        $("#lunbobox ul li").eq(index).css({
            "background": "#999",
            "border": "1px solid #ffffff"
        }).siblings().css({
            "background": "#cccccc",
            "border": ""
        })

        $(".lunbo a ").eq(index).fadeIn(1000).siblings().fadeOut(1000);
    };

    ///点击鼠标 图片切换
    $("#lunbobox ul li").click(function() {

        //添加 移除样式
        //$(this).addClass("lito").siblings().removeClass("lito"); //给当前鼠标移动到的li增加样式 且其余兄弟元素移除样式   可以在样式中 用hover 来对li 实现
        $(this).css({
            "background": "#999",
            "border": "1px solid #ffffff"
        }).siblings().css({
            "background": "#cccccc"
        })
        var index = $(this).index(); //获取索引 图片索引与按钮的索引是一一对应的
        // console.log(index);

        $(".lunbo a ").eq(index).fadeIn(1000).siblings().fadeOut(1000); // siblings  找到 兄弟节点(不包括自己）
    });

    /////////////上一张、下一张切换
    $("#toleft").click(function() {
        index--;
        if (index <= 0) //判断index<0的情况为：开始点击#toright  index=0时  再点击 #toleft 为负数了 会出错
        {
            index = 4
        }
        console.log(index);
        $("#lunbobox ul li").eq(index).css({
            "background": "#999",
            "border": "1px solid #ffffff"
        }).siblings().css({
            "background": "#cccccc"
        })

        $(".lunbo a ").eq(index).fadeIn(1000).siblings().fadeOut(1000); // siblings  找到 兄弟节点(不包括自己）必须要写
    }); // $("#imgbox a ")获取到的是一个数组集合 。所以可以用index来控制切换

    $("#toright").click(function() {
        index++;
        if (index > 4) {
            index = 0
        }
        console.log(index);
        $(this).css({
            "opacity": "0.5"
        })
        $("#lunbobox ul li").eq(index).css({
            "background": "#999",
            "border": "1px solid #ffffff"
        }).siblings().css({
            "background": "#cccccc"
        })
        $(".lunbo a ").eq(index).fadeIn(1000).siblings().fadeOut(1000); // siblings  找到 兄弟节点(不包括自己）
    });
    $("#toleft,#toright").hover(function() {
            $(this).css({
                "color": "black"
            })
        },
        function() {
            $(this).css({
                "opacity": "0.3",
                "color": ""
            })
        })
    ///

    ///////鼠标移进  移出
    $("#lunbobox ul li,.lunbo a img,#toright,#toleft ").hover(
        ////////鼠标移进
        function() {
            $('#toright,#toleft').show()
            clearInterval(t);

        },
        ///////鼠标移开
        function() {
            //$('#toright,#toleft').hide()
            //alert('aaa')
            t = setInterval(play, 3000)

            function play() {
                index++;
                if (index > 4) {
                    index = 0
                }
                $("#lunbobox ul li").eq(index).css({
                    "background": "#999",
                    "border": "1px solid #ffffff"
                }).siblings().css({
                    "background": "#cccccc"
                })
                $(".lunbo a ").eq(index).fadeIn(1000).siblings().fadeOut(1000);
            }
        })
</script>
</body>
</html>
