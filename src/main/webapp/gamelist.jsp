<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="en">

	<head>
		<jsp:include page="common.jsp"/>
		<style>


			.navbar ul li a{
				width: 18px;
				text-align: center;
				display: block;

			}
			.navbar ul li a:hover{
				background-color: cornflowerblue;
			}
			.navbar{
				min-height: 30px;
				padding: 3px 1px;
				text-align: center;
			}
		</style>
	</head>

	<body id="mydiv">

<jsp:include page="top.jsp"/>
  <nav class="navbar navbar-default" >
  <div class="container">
    <ul class="list-inline" id="daohang">
	</ul>
  </div>
</nav>
		<!-- 游戏推荐-start -->
        <div  id="container">
		</div>
		<!-- banner-2-area-end -->
		<jsp:include page="footer.jsp"/>
			<script type="text/javascript">
			$(function(){
                $.ajax({
                    type: 'get',
                    url: 'index/allGame',
                    cache: false,
                    sync: true,
                    success: function (data) {
                        for(var i=65;i<=90;i++)
                        {//主要划分了放a-z的26个区域
							//ascii码转成字符
                            var str=String.fromCharCode(i);
                            //拼接html语句，导航栏对应的地方(其中给要放图片的div加了id对应首字母)
                            var item="<div class=\"banner-2-area\" style=\"box-shadow:none\"><div class=\"container\"><div class=\"row\"><div class=\"col-md-12\"><div class=\"section-heading\"><h3>游戏推荐<a name="+str+">"+str+"</a></h3></div></div></div><div class=\"row\" id="+str+"></div></div></div>";
							//拼接html语句，导航栏
                            var item1="<li><a href=#"+str+">"+str+"</a></li>";
							$("#daohang").append(item1);
							$("#container").append(item);
							//遍历拿来的数据
                            $.each(data, function (index, obj)
							{//传来的数据有一个字段是游戏名字首字母大写，用substr()拿到他的第一个字符进行判断
									if(obj.gameIndex.substr(0,1)==str)
									  {  var item2="<div class=\"col-md-3 col-sm-4 col-xs-6\"> <div class=\"single-banner wow fadeIn\" data-wow-duration=\".5s\" data-wow-delay=\".5s\" style=\"text-align: center;\"> <a href=\"${pageContext.request.contextPath}/product/productlist?gameId="+index+"\" ><img src=${pageContext.request.contextPath}"+(obj.picUrl==null?"/images/zanwutupian.png":obj.picUrl)+" alt=\"\" style=\"width: 140px; height: 140px;\" />"+obj.gameName+"</a> </div> </div>";
										  //通过拿对应首字母的id，将他们放到对应的地方
									      $("#"+str).append(item2);
									  }
							});
                        }
                    },
					error :function (){
                        //如果请求失败，弹框提示并会退到上个页面;
                        alert("请求失败");
                        history.back(-1);
                        return false;
                    }
                });
			var nav=$(".navbar"); //得到导航对象
			var win=$(window); //得到窗口对象
			var sc=$(document);//得到document文档对象。
			win.scroll(function(){
			  if(sc.scrollTop()>=237){
			    nav.addClass("navbar-fixed-top"); 
			  }else{
			   nav.removeClass("navbar-fixed-top");
			  }
			}) ;
			});
			</script>
			
	</body>

</html>
