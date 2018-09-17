<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/register.css">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>注册页面</title>



</head>
<body>
<div class="top">
	<div class="topInclude">
		<div class="topLeft">
			<ul>
				<li><a href="#"><img src="<%=request.getContextPath()%>/images/feitianmaologo.png"></a></li>
				<li><span>FTM账号是FTM各业务通行的账号。<br> 拥有FTM账号，你就可以玩转FTM！
					</span></li>
			</ul>
		</div>
		<div class="topRight">
			<a href="index.jsp"><img src="<%=request.getContextPath()%>/images/house.png"><span>返回首页</span></a>
		</div>
	</div>
</div>
<div class="register">
	<div class="registerInclude">
		<div class="registerLeft">
			<ul>

				<li>
					<div class="bgcolor">
						<img src="<%=request.getContextPath()%>/images/email.png"><span id="span1"
																						onclick="email()">邮箱注册</span>
					</div>
				</li>
				<li><img src="<%=request.getContextPath()%>/images/mobile.png"><span id="span2"
																					 onclick="mobile()">手机注册</span></li>

			</ul>
		</div>

		<div id="registerRight">
			<span class="title">提示：如果你已有FTM账号，请直接 <a href="login.jsp">登录</a></span>
			<%--<div>${msg}</div>--%>
			<%--<form class="registerForm"--%>
			<%--action="<%=request.getContextPath()%>/register.do" validate="true"--%>
			<%--method="post">--%>
			<div class="registerForm">
				登录账号 ：<input type="text" class="text" label="用户名" name="userName"
							 id="register" onblur="check_uesrName()"/> <b id="usernamecheck"></b> <br> <br>
				设置密码 ：<input type="password" class="text" label="输入密码"
							 name="password" id="password" onblur="check_password()"/> <b id="passwordcheck"></b><br> <br>
				确认密码 ：<input
					type="password" class="text" label="确认密码" name="repassword"
					id="repassword" onblur="check_repassword()"/> <b id="repasswordcheck"></b><br> <br>
				注册邮箱 ：<input type="text" id="email"
							 class="text" label="Mail" name="email" onblur="check_email()"/> <b id="emailcheck"></b><br> <br>
				<input type="submit" class="submit" id="submit" value="注册" />
				<%--</form>--%>
			</div>
		</div>

	</div>
</div>

<div class="footer">
		<span> <a href="#">FTM官网 </a><a href="#"> FTM产品 </a><a href="#">
				帮助中心 </a><a href="#"> 意见反馈 </a><br> FTM 2018-20XX © 版权所有
		</span>
</div>
<script type="text/javascript" charset="utf-8"
		src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
    function email() {
        document.getElementById("span1").style.backgroundcolor = "white";
    }
    function mobile() {
        document.getElementById("span1").style.backgroundcolor = "rgb(240,240,240)";
        document.getElementById("span2").style.backgroundcolor = "white";
        document.getElementById("RegisterRight").style.display = "block";
    }
</script>
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
    function check_email() {
        var reg = /\w+[@]{1}\w+[.]\w+/;
        var msg = document.getElementById("emailcheck");
        if (!reg.exec($("#email").val())){
            msg.innerHTML="<font color='red'>请输入正确的邮箱！</font>";
            return false;
        }else{
            msg.innerHTML="";
            return true;
        }
    }
    function  check_uesrName() {
        var a=$("#register").val().trim().length;
        var msg=document.getElementById("usernamecheck");
        var flag;
        if(a==0){
            msg.innerHTML="<font color='red'>请输入用户名</font>";
            flag=false;
        }else if(a<4){
            msg.innerHTML="<font color='red'>用户名不能小于四位</font>";
            flag=false;
        }
        else {
            $.ajax({
                url: "<%=request.getContextPath()%>/registercheck.do",
                type: "POST",
                datatype: "json",
                async:false,
                data: {
                    "userName": $("#register").val()
                },
                success: function (data) {
                    //alert(typeof data);测试代码
                    var str = data;
                    if (str == "success") {
                        msg.innerHTML = "<font color='green'>可以使用</font>";
                        flag=true;
                    } else {
                        msg.innerHTML = "<font color='red'>该昵称已注册</font>";
                        flag=false;
                    }
                }
            });
        }
        return flag;
    }
    $(document).ready(function() {
        $("#submit").click(function(){
            var flag=check_uesrName()&&check_password()&&check_repassword()&&check_email();
            //alert(flag);
            if(flag){
                var data={};
                data.userName = $("#register").val();
                data.password=$("#password").val();
                data.email=$("#email").val();
                $.ajax({
                    type: 'post',
                    url: 'register.do',
                    data: data,
                    cache: false,
                    success: function (data) {
                        //var res=data.response;
                        console.log(data);
                        if(0== data.flag){
                            alert(data.msg);
                            return;
                        }else{
                            alert("注册成功请登录邮箱激活！");
                            location.href="${pageContext.request.contextPath}/login.jsp";
                        }
                    },error :function (){
                        alert("请求失败");
                    }
                });
            }else {
                alert("请确认注册信息");
            }

        });

    });
</script>
</body>
</html>