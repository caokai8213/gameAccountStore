<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="en">

	<head>
		<jsp:include page="../common.jsp"/>
		<link href="${pageContext.request.contextPath }/css/fileinput.css" rel="stylesheet">

	</head>

	<body>
	<jsp:include page="../top.jsp"/>

		<div class="banner-area" style="padding: 30px 0px;">
			<div class="container">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row">
							<div>
								<h4 class="col-md-4">寄售账号信息</h4>
							</div>
						</div>

					</div>
					<div>
						<div class="container-fluid main-content" style="padding: 20px;">
							<div class="widget-container fluid-height clearfix mwi1200">
								<div class="widget-content padded clearfix">
									<form  class="form-horizontal">
										<div class="form-group field-contacts-name required">
											<label class="control-label col-sm-2" for="account">游戏账号</label>
											<div class="col-sm-8">
												<input type="text" id="account" class="form-control" name="" maxlength="20" placeholder="请输入游戏账号">
											</div>
											<div class="help-block help-block-error"></div>
										</div>

										<div class="form-group field-contacts-honorific required">
											<label class="control-label col-sm-2" for="account_password">游戏密码</label>
											<div class="col-sm-8">
												<input type="text" id="account_password" class="form-control" name="Contacts[honorific]" maxlength="20" placeholder="请输入游戏密码">
											</div>
											<div class="help-block help-block-error"></div>
										</div>
										<div class="form-group field-contacts-post required">
											<label class="control-label col-sm-2" for="account_role_name">角色名称</label>
											<div class="col-sm-8">
												<input type="text" id="account_role_name" class="form-control" name="Contacts[post]" maxlength="20" placeholder="请输入角色名称">
											</div>
											<div class="help-block help-block-error"></div>
										</div>
										<div class="form-group field-contacts-post">
											<label class="control-label col-sm-2" for="account_question">密保问题</label>
											<div class="col-sm-8">
												<input type="text" id="account_question" class="form-control" name="Contacts[post]" maxlength="20" placeholder="请输入密保问题">
											</div>
											<div class="help-block help-block-error"></div>
										</div>
										<div class="form-group field-contacts-post">
											<label class="control-label col-sm-2" for="account_anwser">密保答案</label>
											<div class="col-sm-8">
												<input type="text" id="account_anwser" class="form-control" name="Contacts[post]" maxlength="20" placeholder="请输入密保答案">
											</div>
											<div class="help-block help-block-error"></div>
										</div>
										<div class="form-group field-contacts-post">
											<label class="control-label col-sm-2" for="account_email">密保邮箱</label>
											<div class="col-sm-8">
												<input type="text" id="account_email" class="form-control" name="Contacts[post]" maxlength="20" placeholder="请输入密保邮箱">
											</div>
											<div class="help-block help-block-error"></div>
										</div>
										<div class="form-group field-contacts-post">
											<label class="control-label col-sm-2" for="account_phone">密保手机</label>
											<div class="col-sm-8">
												<input type="text" id="account_phone" class="form-control" name="Contacts[post]" maxlength="20" placeholder="请输入密保手机">
											</div>
											<div class="help-block help-block-error"></div>
										</div>
										
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="banner-area" style="padding: 30px 0px;">
			<div class="container">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row">
							<div>
								<h4 class="col-md-4">商品详情</h4>
							</div>
						</div>
					</div>
					<div>

						<div class="container-fluid main-content" style="padding: 20px;">
							<div class="widget-container fluid-height clearfix mwi1200">
								<div class="widget-content padded clearfix">
									<form id="actionform" class="form-horizontal">

										<div class="form-group field-contacts-name required">
											<label class="control-label col-sm-2" for="product_name">商品名称</label>

											<div class="col-sm-8">
												<input type="text" id="product_name" class="form-control" name="Contacts[name]" maxlength="20" placeholder="请输入商品名称">
											</div>
											<div class="help-block help-block-error"></div>
										</div>
<div class="form-group field-customer-customer_industry required">
											<label class="control-label col-sm-2" for="game_id">所属游戏</label>
											<div class="col-sm-8">
												<select id="game_id" class="form-control" name="game-company">
													<option value="0">请选择..</option>
												</select>
											</div>
										</div>	
										<div class="form-group field-customer-customer_industry required">
											<label class="control-label col-sm-2" for="area_id">所属区服</label>
											<div class="col-sm-8">
												<select id="area_id" class="form-control" name="game-company">
													<option value="0">请选择..</option>
												</select>
											</div>
										</div>
										<div class="form-group field-contacts-honorific required">
											<label class="control-label col-sm-2" for="account_level">等级</label>

											<div class="col-sm-8">
												<input type="text" id="account_level" class="form-control" name="Contacts[honorific]" maxlength="20" placeholder="请输入等级">
											</div>
											<div class="help-block help-block-error"></div>
										</div>
										<div class="form-group field-contacts-post required">
											<label class="control-label col-sm-2" for="product_price">价格</label>

											<div class="col-sm-8">
												<input type="text" id="product_price" class="form-control" name="Contacts[post]" maxlength="20" placeholder="请输入价格">
											</div>
											<div class="help-block help-block-error"></div>
										</div>
										
										<div class="form-group field-contacts-sex required">
											<label class="control-label col-sm-2" for="account_band">账号绑定</label>

											<div class="col-sm-8">
												<input type="hidden" name="band" value="">
												<div id="account_band">
													<label class="label-radio inline">
				                                    <input type="radio" name="band" value="1"> <span
				                                        class="custom-radio" ></span>身份证</label>
													<label class="label-radio inline">
				                                    <input type="radio" name="band" value="0" checked> <span
				                                        class="custom-radio"></span>无绑定</label>
												</div>
											</div>
											<div class="help-block help-block-error"></div>
										</div>
										<div class="form-group field-contacts-mobile">
											<label class="control-label col-sm-2" >商品描述</label>

											<div class="col-sm-8">
												<textarea id="comment" style="resize:none; width: 100%;height: 80px;"></textarea>
											</div>
											<div class="help-block help-block-error"></div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">商品图片</label>
											<div class="col-sm-10">
												<input id="myFile" type="file" name="myFile" class="fileloading">
											</div>
											<input type="hidden" name="user.logo" id="product-picurl">
										</div>

									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="banner-area" style="padding-top: 0px;">
			<div class="container">
				<div class="agreement-content col-md-offset-1">
					<label><input name="" class="agreement-checkbox" type="checkbox" value="1" id="isAgreed" > 我已阅读，并同意
                    <a data-toggle="modal" data-target="#myModal" style="color: orange;">《飞天猫手机网游服务平台服务协议》</a> 以及承担以下交易风险</label><br>
					<span class="text-grey">1.账号交易有小概率出现游戏方检测到线下交易被封号的风险；</span><br>
					<span class="text-grey">2.如账号出售后无法正常使用，包括账号进入保护模式（冻结）且卖家无法配合解冻、账号被找回且无法判定责任方，将由卖家承担主要责任。</span>
					<br />
					<div class="">
						<label class="col-sm-2 control-label"></label>

						<div class="col-lg-10">
							<button type="button" id="tijiao" class="btn-lg btn-success" style="padding:5px 40px;" disabled>发布</button>
						</div>
						<!-- /.col -->
					</div>
				</div>
			</div>
		</div>

		<!--协议模态框-->
		<!-- Large modal -->

		<div id="myModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">寄售商品发布协议</h4>
					</div>
					<div class="modal-body pre-scrollable">
						
							<p>如您要使用本网站所提供的网络游戏物品寄售服务，您需要遵守以下内容。</p>
							<p>1、寄售，是指您将交易物品放置在自己账号内，发布寄售信息时将账号密码输入发布系统，由交易猫在交易时登录您账号发货给买家进行交易。</p>
							<p>2、您在发布物品前须确认所要发布物品真实存在，并保证此物品为合法所得且非违禁商品（如外服、抽奖类、外挂类、色情类商品等），且获得此物品之方式不违反该网络游戏开发商及运营商之相关游戏规定。 如发现所售商品为非法所得，交易猫有权下架商品，停止服务，以及封禁您的交易猫账号。</p>
							<p>3、您在使用寄售服务过程中发布所要寄售物品之时，须确认所发布信息与所要寄售物品之属性完全相符，并保证此物品在移交本网站之时，该属性未发生变化。</p>
							<p>4、您须确认此物品属性不会因游戏相关规则等非人为原因，而发生的属性变化。如该网络游戏营运规则中，此物品会因时间等原因而发生属性变化，则发布寄售信息时必须详细注明。</p>
							<p>5、本网站有权验证您所发布之寄售信息与该物品真实属性是否相符，并有权无条件拒绝寄售某物品。</p>
							<p>6、物品寄售于本网站之后，您不得再进行与该物品相关或间接相关之操作，如要取回物品，须在本网站取消该物品寄售。</p>
							<p>7、您与买家就其在交易猫平台已发布商品达成购买意向后，不得与买家在交易猫平台外进行交易；所售商品只能以支付宝进行交易。如在商品描述中公布联系方式（包含但不限于qq、旺旺、手机号码），交易猫有权删除商品发布信息。</p>
							<p>8、寄售于本网站之物品销售成功之后，即表示该物品之使用者已放弃该物品之使用权，今后不得以任何理由及方式索回该物品。</p>
							<p>9、寄售商品信息描述不清，或实际物品与描述不符，甚或存在价格、性能、质量、功能等方面的虚假宣传的，交易猫将有权利不提供相应服务，并要求您按照实际物品情况清晰、完整进行描述，否则将有权利禁止删除相关信息或关闭您的交易猫账号。</p>
							<p>10、所有寄售于本网站之游戏物品因游戏开发商或运营商之原因造成该物品属性变化或受到各类限制的，物品消失、封存等情况，交易猫概不负责。</p>
							<p>11、客户有权利保护好自己的ID密码，如自己保护不当遗失被别人冒领本站只能提供力所能及帮助但不承担责任。</p>
							<p>12、由于网络游戏虚拟物品的特殊性，交易猫有权利因运营商原因而自主将商品下架处理，包括不仅限于服务器关停、运营商倒闭等情况。</p>
							<p>13、游戏帐号交易涉及到您的交易帐号、密码、密保问题等信息会移交买家，如果交易成功后出现您恶意从运营商处收回帐号，或玩家因为所购买的物品导致账号被封，或所购买的物品被全部、部分清除，或其他利用各种方式骗取他人财物或损害买家利益的情况，一旦查实交易猫将有权利采取仲裁形式退回买家款项，具体退回比例参见【判赔比例】，交易猫保留修改退回比例的权利，同时将有权利禁止您再次发布任何商品。</p>
							<p>14、您发布出售帐号信息后，需保持联系方式的畅通，以便商品在有买家下单并出现争议时，客服能及时联系您协商处理，如连续3天都无法联系上您，交易猫有权在任何情况下无条件取消此帐号交易。</p>
							<p>15、您发布商品需谨慎定价，如发现您发布的价格与市场价严重偏离，交易猫有权在任何情况下无条件取消此类帐号的交易。交易猫将根据情况收取或调整服务费，服务费收取情况具体见交易界面提示。如您不接受服务费，请终止寄售。</p>
							<p>16、以下内容为账号类交易须知:<br> 所有帐号交易，在商品上架后因卖家自身原因被盗取或封存，交易猫概不负责。
								<br> 所有帐号交易，若查明有一号多卖的，交易猫有权查封用户的交易猫帐号。
								<br> 所有帐号交易，卖家在出售成功后利用游戏自身系统漏洞；利用研发方、发行发、渠道方政策或其他方式恶意找回帐号的，交易猫有权查封用户的交易猫帐号并将用户列入黑名单、锁定其银行帐号。
								<br> 所有帐号交易，在与市场价格差额幅度过大时，交易猫有权直接取消交易。
								<br> 由于帐号的特殊性，交易猫无法判定该帐号的来源及归属，由此类问题引发的交易纠纷，交易猫概不负责。
							</p>
							<p>17、发布商品信息中不允许包含诽谤、漫骂、色情、暴力威胁等攻击性言语以及其它非商品信息的（包含但不仅限于如下情况：在商品标题或描述中私自公布联系方式、他人ID、聊天记录、交易纠纷、使用不文明语言等）。</p>
							<p>18、您发布商品必须通过设置收款账户，并且必须确保所设置的收款账户（即支付宝账户）已经通过实名认证，一旦发现您违反规定则交易猫有权终止寄售服务提供。</p>
							<p>19、请您遵守诚实信用原则发布商品、进行交易，如交易猫发现您存在不当使用计算机信息系统或互联网的行为（包括但不限于利用大量注册帐号、利用程序漏洞进行商品发布和交易、破坏系统的稳定性影响其他用户等），交易猫有权取消相关交易、关闭您的交易账号或以其他方式终止对您提供服务。</p>
							<p>20、保密条款：<br> 本协议所称商业秘密包括但不限于本协议、任何补充协议所述内容及在合作过程中涉及的其他秘密信息。任何一方未经商业秘密提供方同意，均不得将该信息向任何第三方披露、传播、编辑或展示。本协议终止后仍承担此条款下的保密义务，保密期将另持续三年。
								<br> 因对方书面同意以及国家、行政、司法强制行为而披露商业秘密的，披露方不承担责任；该商业秘密已为公众所知悉的，披露方不承担责任。
								<br> 凡通过交易猫网站发布寄售信息，即表示接受并遵守以上内容。交易猫有权对以上条款不时进行补充和修改的权利，在交易猫更新协议版本后如您继续接受交易猫提供的服务，视为您已接受更新后的协议。
							</p>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-remove" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" id="agree">同意</button>
					</div>
				</div>
			</div>
		</div>


		<!-- all js here -->
	<jsp:include page="../footer.jsp"/>
	<script type="text/javascript"
			src="${pageContext.request.contextPath }/js/fileinput.js"></script>
	<script type="text/javascript"
			src="${pageContext.request.contextPath }/js/zh.js"></script>
		<script type="text/javascript">
		$(function () {
			$.ajax({
				url: "<%=request.getContextPath()%>/product/queryGameList",
				type: "GET",
				async:false,
				success: function (data) {
					$.each(data, function(index, item) {
						$("#game_id").append(  //此处向select中循环绑定数据
							"<option value="+item.id+">" + item.gameName+ "</option>");
					});
				}
			});
		});
		$("#game_id").change(function () {
		    $("#area_id").empty();
		    data={};
		    data.gameId=$("#game_id").val();
            $.ajax({
                url: "<%=request.getContextPath()%>/product/queryAreaList",
                type: "GET",
				data:data,
                async:false,
                success: function (data) {
                    $.each(data, function(index, item) {
                        $("#area_id").append(  //此处向select中循环绑定数据
                            "<option value="+item.id+">" + item.areaName+ "</option>");
                    });
                }
            });
        });
		$("#isAgreed").change(function(){
	        if($("#isAgreed").is(':checked')==true){
	            $("#tijiao").attr("disabled",false);
	            //$("#isAgreed").prop("checked",false);
	        }else{
	            $("#tijiao").attr("disabled",true);              
	            //$("#isAgreed").prop("checked",true);
	        }
	    });
	    $("#agree").click(function(){
	    	$("#isAgreed").prop("checked",true);
	    	$("#tijiao").attr("disabled",false);
	    	$('#myModal').modal('hide');
	    });
        $("#myFile").fileinput({
            language : 'zh',
            uploadUrl : "${pageContext.request.contextPath }/product/update/photo",
            autoReplace : true,
            maxFileCount : 1,
            allowedFileExtensions : [ "jpg", "png", "gif" ],
            browseClass : "btn btn-primary", //按钮样式
            previewFileIcon : "<i class='glyphicon glyphicon-king'></i>"
        }).on("fileuploaded", function(e, data) {
            var res = data.response;
            alert(res.success);
            $("#product-picurl").attr("value", res.success);
        });
        $("#tijiao").click(function () {
            var data={};
			data.producerId=$("#user_id").text();
			data.gameId=$("#game_id option:selected").val();
            data.areaId=$("#area_id option:selected").val();
            data.account=$("#account").val();
            data.accountRoleName=$("#account_role_name").val();
            data.accountPassword=$("#account_password").val();
            data.accountQuestion=$("#account_question").val();
            data.accountAnwser=$("#account_anwser").val();
            data.accountLevel=$("#account_level").val();
            data.productName=$("#product_name").val();
            data.productPrice=$("#product_price").val();
            data.productPicurl=$("#product-picurl").val();
            data.comment=$("#comment").val().replace(/\n|\r\n/g,"<br>");
            data.accountPhone=$("#account_phone").val();
            data.accountEmail=$("#account_email").val();
            data.accountBand=$('input:radio[name="band"]:checked').val();

	        var isMobile=/^(?:13\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/;
//	        var isPhone=/^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
            var ismail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
            var str = /^[1-9]\d*$/;
            if (data.account!=null&&data.account!=""&&data.account!="undefined") {

            }else{
                alert("请输入游戏账号");
                return;
            }
            if (data.accountPassword!=null&&data.accountPassword!=""&&data.accountPassword!="undefined") {

            }else{
                alert("请输入账号密码");
                return;
            }
            if (data.accountRoleName!=null&&data.accountRoleName!=""&&data.accountRoleName!="undefined") {

            }else{
                alert("请输入角色名称");
                return;
            }
            if(data.accountEmail!=null&&data.accountEmail!=""&&data.accountEmail!="undefined"&&!ismail.test(data.accountEmail)){
                alert("请输入正确的邮箱格式");
                return;
            }
            if(data.accountPhone!=null&&data.accountPhone!=""&&data.accountPhone!="undefined"&&!isMobile.test(data.accountPhone)){
                alert("请输入正确的手机格式");
                return;
            }
            if (data.productName!=null&&data.productName!=""&&data.productName!="undefined") {

            }else{
                alert("请输入商品名称");
                return;
            }
            if (data.gameId!=null&&data.gameId!=""&&data.gameId!="undefined"&&data.gameId!=0) {

            }else{
                alert("请选择游戏");
                return;
            }
            if (data.areaId!=null&&data.areaId!=""&&data.areaId!="undefined"&&data.areaId!=0) {

            }else{
                alert("请选择区服");
                return;
            }
            if (data.accountLevel!=null&&data.accountLevel!=""&&data.accountLevel!="undefined") {
                if(!str.test(data.accountLevel)){
                    alert("账号等级为正整数");
                    return;
				}
            }else{
                alert("请输入账号等级");
                return;
            }
            if (data.productPrice!=null&&data.productPrice!=""&&data.productPrice!="undefined") {
                if(!str.test(data.productPrice)){
                    alert("价格等级为正整数");
                    return;
                }
            }else{
                alert("请输入价格");
                return;
            }
            $.ajax({
                type: 'POST',
                url: '<%=request.getContextPath()%>/product/addproduct',
                data: JSON.stringify(data),
                dataType:"json",
                contentType:"application/json",
                cache: false,
                sync: true,
                success: function (data) {
                    //var res=data.response;
                    console.log(data);
                    if(0== data.flag){
                        alert(data.msg);
                        return;
                    }else{
                        alert("发布成功");
                        window.location.href='${pageContext.request.contextPath}/user/userinfo';
                    }
                },error :function (){
                    alert("请求失败");
                    return false;
                }
            });
        });
		</script>
	</body>

</html>