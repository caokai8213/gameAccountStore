<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="en">

	<head>
	<jsp:include page="common.jsp"/>

	</head>

	<body id="mydiv" >
	<jsp:include page="top.jsp"/>
		
		<!-- slider-start -->
		<div class="banner-area" >
			<div class="container" style="border:dashed aliceblue">
				<div class="row">
					<div class="col-md-2 col-xs-2 ">
						<h4>热门游戏</h4>
					</div>
					<div class="col-md-10 col-xs-10" >
						<ul class="list-inline" id="gamehot">
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="slider-container">
			<div class="slider">
				<!-- Slider Image -->
				<div id="mainslider" class="nivoSlider slider-image">
					<img src="images/slider/41.jpg" alt="main slider" title="#htmlcaption1" />
					<img src="images/slider/42.jpg" alt="main slider" title="#htmlcaption2" />
				</div>
				<!-- Slider Caption 1 -->
				<div id="htmlcaption1" class="nivo-html-caption slider-caption-1">
					<div class="slider-progress"></div>
					<div class="slide1-text slide-1 hidden-xs">
						<div class="middle-text">
							<div class="cap-dec wow bounceInLeft" data-wow-duration="0.9s" data-wow-delay="0s">
								<h1>最好的服务</h1>
							</div>
							<div class="cap-title wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.2s">
								<h3>保证你们账号安全交易</h3>
							</div>
							<div class="cap-readmore wow bounceInUp" data-wow-duration="1.3s" data-wow-delay=".5s">
								<a href="${pageContext.request.contextPath}/gamelist.jsp">Shop Now</a>
							</div>
						</div>
					</div>
				</div>
				<!-- Slider Caption 2 -->
				<div id="htmlcaption2" class="nivo-html-caption slider-caption-2">
					<div class="slider-progress"></div>
					<div class="slide1-text slide-2 hidden-xs">
						<div class="middle-text">
							<div class="cap-dec wow bounceInLeft" data-wow-duration="0.9s" data-wow-delay="0s">
								<h1>最优惠的价格</h1>
							</div>
							<div class="cap-title wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.2s">
								<h3>节约你们的金钱</h3>
							</div>
							<div class="cap-readmore wow bounceInUp" data-wow-duration="1.3s" data-wow-delay=".5s">
								<a href="${pageContext.request.contextPath}/gamelist.jsp">Shop Now</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- slider-end -->

		<!-- 最新消息-->
		<br />
		<br />
		<div class="banner-2-area" style="box-shadow: none">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-heading">
							<h3>最新消息</h3>
						</div>
					</div>
				</div>
				<div class="row">

					<div class="col-md-3 col-xs-12" style="background-color:lemonchiffon;">
						<div class="row" style="padding: 5px;">
							<a href="${pageContext.request.contextPath}/gamelist.jsp" type="button" class="btn btn-info btn-lg btn-block"> 我要买 </a>

						</div>
						<div class="row" style="padding: 5px;">
							<a href="${pageContext.request.contextPath}/user/publish.jsp" type="button" class="btn btn-info btn-lg btn-block"> 我要卖 </a>
						</div>
						<div class="panel panel-default" >
							<div class="panel-heading">
								<div>
									<h4 class="col-md-4">公告</h4>
									<a href="notice" class="col-md-offset-6 ">更多</a>
								</div>
							</div>
							<div class="">
								<div class="list-group" id="notice">

								</div>
							</div>
						</div>
					</div>

					<div class="col-md-8 col-xs-12 col-md-offset-1 " style="background-color: lemonchiffon;">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="row">
									<div>
										<h4 class="col-md-4">最新发布</h4>
										<a class="col-md-offset-7" id="much">更多</a>
									</div>
								</div>
							</div>
							<div>
								<div class="list-group" id="lastedproduct">

								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<!-- 游戏推荐-start -->
		<div class="banner-2-area">
			<div class="container" >
				<div class="row">
					<div class="col-md-12">
						<div class="section-heading">
							<h3>游戏推荐</h3>
						</div>
					</div>
				</div>
				<div class="row" >
					<div class="team-members wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s" id="gameimg">
					<%--<div class="col-md-3 col-sm-4 col-xs-6">--%>
						<%--<div class="single-banner wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">--%>
							<%--<a href="#"><img src="img/banner/11.jpg" alt="" /></a>--%>
						<%--</div>--%>
					<%--</div>--%>
					</div>
				</div>
			</div>
		</div>
		<!-- banner-2-area-end -->
		<!-- service-area-start -->
		<div class="service-area">
			<div class="container">
				<div class="row">
					<div class="service wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
						<div class="col-md-3 col-xs-12 col-sm-3">
							<div class="single-service">
								<i class="fa fa-plane"></i>
								<h3>free shipping</h3>
								<p> worldwide in 7 days</p>
							</div>
						</div>
						<div class="col-md-3 col-xs-12 col-sm-3">
							<div class="single-service">
								<i class="fa fa-taxi"></i>
								<h3>快速处理</h3>
								<p>home delivery on all over country</p>
							</div>
						</div>
						<div class="col-md-3 col-xs-12 col-sm-3">
							<div class="single-service no-bor">
								<i class="fa fa-cc-visa"></i>
								<h3>安全体验</h3>
								<p>secure payment many methods</p>
							</div>
						</div>
						<div class="col-md-3 col-xs-12 col-sm-3">
							<div class="single-service no-bor">
								<i class="fa fa-phone"></i>
								<h3>24/7 全时间客户服务</h3>
								<p>online support</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- service-area-end -->
		<!-- brand-area-start -->
		<div class="brand-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-heading">
							<h3>我们的合作伙伴</h3>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="brands wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
						<div class="brand-carousel">
							<div class="col-md-12">
									<a href="https://www.alipay.com"><img src="images/hezuohuoban/alipay.png"  alt="" /></a>
							</div>
							<div class="col-md-12">
									<a href="https://www.paypal.com/c2/home"><img src="images/hezuohuoban/paypal.png" alt="" /></a>
							</div>
							<div class="col-md-12">
								<a href="#"><img src="images/hezuohuoban/unionpay.png" alt="" /></a>
							</div>
							<div class="col-md-12">
								<a href="#"><img src="images/hezuohuoban/amazon.png" alt="" /></a>
							</div>
							<div class="col-md-12">
								<a href="#"><img src="images/hezuohuoban/qq_3d.png" alt="" /></a>
							</div>
							<div class="col-md-12">
								<a href="#"><img src="images/hezuohuoban/weibo1.png" alt="" /></a>
							</div>
							<div class="col-md-12">
								<a href="#"><img src="images/hezuohuoban/weixin.png" alt="" /></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- brand-area-end -->

		<!-- all js here -->
		<!-- jquery latest version -->
        <jsp:include page="footer.jsp"/>
	<script>
		    //热门推荐
            $.ajax({
                type: 'get',
                url: 'index/hotgame',
                cache: false,
                sync: true,
                success: function (data) {
					var item;
                    $.each(data, function (index, obj) {
                        item = "<li><a href=\"${pageContext.request.contextPath}/product/productlist?gameId="+index+"\">"+obj.gameName+"</a></li>";
                        $("#gamehot").append(item);
                    });
                },error :function (){
                    console.log("请求失败");
                    return false;
                }
            });
            //游戏推荐
            $.ajax({
                type: 'get',
                url: 'index/gamerecommend',
                cache: false,
                sync: true,
                success: function (data) {

                    var item;
                    $.each(data, function (index, obj) {
                    item = "<div style=\"margin-bottom:20px;\" class=\"col-md-2  col-sm-3 col-xs-6\" > <div class=\"single-member\"> <div class=\"member-img\"> <img style=\"margin:0 auto;width:165px;height:165px;\" src=${pageContext.request.contextPath}"+(obj.picUrl==null?"/images/zanwutupian.png":obj.picUrl)+" 	alt="+obj.gameName+" /> </div> <div class=\"member-details\"> <div class=\"mb-wrap\"> <h4><a href=\"${pageContext.request.contextPath}/product/productlist?gameId="+index+"\">"+obj.gameName+"</a></h4> <h5></h5> </div> </div> </div> </div>";

                        $("#gameimg").append(item);
                    });
                },error :function (){
                    console.log("请求失败");
                    return false;
                }
            });
            //最新发布账号
            $.ajax({
                type: 'get',
                url: 'index/lastProduct',
                cache: false,
                sync: true,
                success: function (data) {
                    var item;
                    $.each(data, function (index, obj) {
                        item = "<a href=\"${pageContext.request.contextPath}/productDetail?productId="+index+"\" class=\"list-group-item\">"+obj.productName+"</a>";
                        $("#lastedproduct").append(item);
                    });
                },error :function (){
                    console.log("请求失败");
                    return false;
                }
            });
            //最新公告
            $.ajax({
                type: 'get',
                url: 'index/notice',
                cache: false,
                sync: true,
                success: function (data) {
                    var item;
                    $.each(data, function (index, obj) {
                        item = "<a href=\"${pageContext.request.contextPath}/notice/"+index+"\" class=\"list-group-item\" style=\"width:100%;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;\" >"+obj.noticeTitle+"</a>";
                        $("#notice").append(item);
                    });
                },error :function (){
                    console.log("请求失败");
                    return false;
                }
            });
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