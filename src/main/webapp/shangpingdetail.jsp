<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="en">

	<head>
	<jsp:include page="common.jsp"/>
	</head>

	<body>

		<!--[if lt IE 8]>
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
            <![endif]-->
		<!-- header-start -->
		<jsp:include page="top.jsp"/>
		<!-- header-end -->
		<!--路径-->
		<div class=" banner-area" style="padding: 10px;">
			<div class="container">
				<ol class="breadcrumb" style="padding:10px;text-align: left; font-size: 15px;">
					<li>
						<a href="index.jsp">首页</a>
					</li>
					<li>
						<a href="gamelist.jsp">游戏专区</a>
					</li>
					<li>
						<a href="#">${productVo.game.gameName}</a>
					</li>
					<li class="active">商品详情</li>
				</ol>
			</div>
		</div>
		<div class="banner-area" style="padding: 0px;">
			<div class="container" style="border: dashed palegreen; font-size: 15px; padding: 4px;">
				<div class="col-md-6 col-md-offset-1">
					<input type="hidden" id="productId" value="${productVo.productId}"/>
					<input type="hidden" id="producerId" value="${productVo.producerId}"/>
					<div class="" style="font-size: 18px;font-weight: 900">${productVo.productName}</div>
					<div class="">
						<span class="col-md-6" style="font-size: 18px;">商品价格</span>
						<span class="col-md-6 col-md-pull-4" style="font-size: 20px; color: red;">${productVo.productPrice}</span>
					</div>
					<div class="">
						<span class="col-md-6" style="font-size: 18px;">保障服务</span>
						<span class="col-md-6 col-md-pull-4" style="font-size: 20px; color: red;">
							<img src="images/zheng.png" style="width: 20px;height: 23px;" title="实名认证">
						</span>
					</div>
					<div class="col-md-4" style="padding: 10px 20px;">
						<a href="${pageContext.request.contextPath}/user/order/add?productId=${productVo.productId}" id="buy" class="btn btn-warning">立即购买</a>
					</div>
				</div>
				<div class="col-md-3 col-md-offset-2">
					<div style="border: groove indianred;">
						<div>卖家账号</div>
						<span>${productVo.user.userName}</span>
					</div>
					<br />
					<br />
					<br />
					<div>
						<span class="col-md-5">分享到：</span>
						<!-- JiaThis Button BEGIN -->
						<div class="bshare-custom"><a title="分享到QQ空间" class="bshare-qzone"></a>
							<a title="分享到新浪微博" class="bshare-sinaminiblog"></a>
							<a title="分享到人人网" class="bshare-renren"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a>
							<a title="分享到网易微博" class="bshare-neteasemb"></a>
							<a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a>
						</div>
						<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/button.js#style=-1&amp;uuid=&amp;pophcol=1&amp;lang=zh"></script>
						<a class="bshareDiv" onclick="javascript:return false;"></a>
						<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>

						<!-- JiaThis Button END -->

					</div>
				</div>
			</div>
		</div>

		<div class="contact-area">

			<div class="container" style="border: groove indianred;">
				<div>
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active">
							<a href="#home" aria-controls="home" role="tab" data-toggle="tab">商品介绍</a>
						</li>
						<li role="presentation">
							<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">交易说明</a>
						</li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="home">
							<div class="col-md-12">
								<div class="col-md-6 ">
									<c:if test="${''.equals(productVo.productPicurl)}"><img src="${pageContext.request.contextPath}/images/zanwutupian.png"></c:if>
									<c:if test="${!''.equals(productVo.productPicurl)}"><img src="${pageContext.request.contextPath}/${productVo.productPicurl}"></c:if>

								</div>
								<div class="goods-properties col-md-offset-6 ">
									<p class="">
										<span class="title">所属游戏：</span>
										<a href="${pageContext.request.contextPath}/product/productlist?gameId=${productVo.gameId}">${productVo.game.gameName}</a>&gt;
										<a href="${pageContext.request.contextPath}/product/productlist?gameId=${productVo.gameId}&areaId=${productVo.areaId}">${productVo.gameArea.areaName}</a>
									</p>
									<p class=""><span class="title">角色名称：</span>${productVo.accountRoleName}
									</p>
									<p><span class="title">角色等级：</span>${productVo.accountLevel}
									</p>
									<p class=""><span class="title">帐号绑定：</span>
									    <c:if test="${'0'.equals(productVo.accountBand)}">暂无绑定</c:if>
										<c:if test="${!'0'.equals(productVo.accountBand)}">身份证绑定</c:if>
									</p>

									<p class=""><span class="title">密保问题：</span>
										<c:if test="${''.equals(productVo.accountAnwser)}">无</c:if>
										<c:if test="${!''.equals(productVo.accountAnwser)}">有</c:if>
									</p>

									<p class=""><span class="title">密保邮箱：</span>
										<c:if test="${''.equals(productVo.accountEmail)}">无</c:if>
										<c:if test="${!''.equals(productVo.accountEmail)}">有</c:if>
									</p>

									<p class=""><span class="title">密保手机：</span>
										<c:if test="${''.equals(productVo.accountPhone)}">无</c:if>
										<c:if test="${!''.equals(productVo.accountPhone)}">有</c:if>
									</p>
									<p class=""><span class="title">描述：</span>
									<div>${productVo.comment}</div>
									</p>
									<br/>
									<br/>
									<br/>
									<br/>
									<br/>
								</div>
								
								<div class="clearfix" style="border-top: solid green;margin-top: 100px;">
								<div class="disclaimer">

									<span class="title col-md-2 ">免责声明：</span>
									<span class="notice col-md-9 col-md-pull-1">
                                    1.所展示的商品供求信息由买卖双方自行提供，其真实性、准确性和合法性由信息发布人负责。<br>
						            2.国家法律规定，未成年人不能参与虚拟物品交易。<br>
						            3.本平台提供的数字化商品根据商品性质不支持七天无理由退货服务。
          						</span>

								</div>
							</div>
							</div>

							
						</div>
						<div role="tabpanel" class="tab-pane" id="profile">
							<div class="col-md-12">
								<div class="step">
									<dl class="clearfix">
										<div class="col-md-2 col-md-offset-1" style="border:solid cadetblue;padding: 5px; text-align: center;">1. 下单支付</div>
										<div class="col-md-6 col-md-offset-1">进入在线发货聊天页面，排队等待</div>
									</dl>
									<i></i>
								</div>
								<div class="step">
									<dl class="clearfix">
										<div class="col-md-2 col-md-offset-1" style="border:solid cadetblue;padding: 5px; text-align: center;">2. 等待发货</div>
										<div class="col-md-6 col-md-offset-1">客服开始验号，截图给买家确认是否继续购买，客服进行改密、换绑<br> <strong class="text-red">【重要】帐号交易不使用QQ沟通，谨防骗子！</strong></div>

									</dl>
									<i></i>
								</div>
								<div class="step ">
									<dl class="clearfix">
										<div class="col-md-2 col-md-offset-1" style="border:solid cadetblue;padding: 5px; text-align: center;">3. 买家收货</div>
										<div class="col-md-6 col-md-offset-1">进入【个人中心&gt;未读消息】查看帐号密码
											<</div>

									</dl>
									<i></i>
									</div>
									<div class="step clearfix">
										<dl class="clearfix">
											<div class="col-md-2 col-md-offset-1" style="border:solid cadetblue;padding: 5px; text-align: center;">4. 确认收货</div>
											<div class="col-md-6 col-md-offset-1">待买家确认收货（登录游戏验证、改密等）<br>自动确认收货： 一般24小时；网易帐号36小时；QQ帐号96小时
											</div>

										</dl>
										<i></i>
									</div>
									<div class="step clearfix">
										<dl class="clearfix">
											<div class="col-md-2 col-md-offset-1" style="border:solid cadetblue;padding: 5px; text-align: center;">5. 卖家收款</div>
											<div class="col-md-6 col-md-offset-1">买家已确认收货，交易猫转账给卖家</div>

										</dl>
										<i></i>
									</div>

									<div class="step clearfix">
										<dl class="clearfix">
											<div class="col-md-2 col-md-offset-1" style="border:solid cadetblue;padding: 5px; text-align: center;">6. 交易成功</div>
											<div class="col-md-6 col-md-offset-1">卖家收到货款，交易完成</div>

										</dl>
									</div>
									<div class="goods-intro-block noborder col-md-offset-1">
										<dt>如果遇到以下情况，请警惕是骗子！！！</dt>
										<div>
											<ol class="">
												<li class="">向您索要游戏帐号和密码</li>
												<li>向您索要绑定手机号、验证码</li>
												<li>向买卖家索要【保证金】【手续费】【诚信金】等，要求支付宝转账等各种名目金钱的</li>
												<li>发送假冒链接（钓鱼链接）给买卖家，在您输入帐号密码后盗取您的游戏、支付宝、银行卡等帐号密码</li>
												<li>自称是交易猫客服，并添加您的QQ，但在官网验证不符的100%是骗子</li>
											</ol>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- footer-start -->
		<jsp:include page="footer.jsp"/>
		<script type="text/javascript" src="http://v3.jiathis.com/code_mini/jia.js?uid=" charset="utf-8"></script>
		<script type="text/javascript">
			<%--$("#buy").click(function () {--%>
			    <%--alert(1111);--%>
			    <%--var data={};--%>
			    <%--data.productId=$("#productId").val();--%>
                <%--$.ajax({--%>
                    <%--type: 'post',--%>
                    <%--url: "${pageContext.request.contextPath}/order/add",--%>
                    <%--data: data,--%>
                    <%--cache: false,--%>
                    <%--sync: true,--%>
                    <%--success: function (data) {--%>

                        <%--//var res=data.response;--%>
                        <%--console.log(data);--%>
                        <%--if(0== data.flag){--%>
                            <%--alert(data.msg);--%>
                            <%--return;--%>
                        <%--}else{--%>
                            <%--alert("chenggong");--%>
                           <%--// window.location.href='../game';--%>
                        <%--}--%>
                    <%--},error :function (){--%>
                        <%--alert("请求失败");--%>
                        <%--return false;--%>
                    <%--}--%>
                <%--});--%>
            <%--});--%>
		</script>
	</body>

</html>