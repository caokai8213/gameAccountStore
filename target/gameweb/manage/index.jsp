<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<jsp:include page="common.jsp"/>

</head>

<body>
<jsp:include page="top.jsp"/>

	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<ul class="nav menu">
			<li class="active"><a href="<%=request.getContextPath()%>/manage/index.jsp"><span class="glyphicon glyphicon-dashboard"></span>首页</a></li>
			<li><a href="<%=request.getContextPath()%>/manage/notice"><span class="glyphicon glyphicon-th"></span> 公告管理</a></li>
			<li><a href="<%=request.getContextPath()%>/manage/product"><span class="glyphicon glyphicon-stats"></span> 商品管理</a></li>
			<li><a href="<%=request.getContextPath()%>/manage/user"><span class="glyphicon glyphicon-list-alt"></span> 用户管理</a></li>
			<li><a href="<%=request.getContextPath()%>/manage/order"><span class="glyphicon glyphicon-pencil"></span> 订单管理</a></li>
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
				<li class="active">SHOUYE </li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">INDEX</h1>
			</div>
		</div><!--/.row-->
        
        <div class="copyrights">Collect from <a href="" ></a></div>
		
		<div class="row">
			<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-blue panel-widget ">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<em class="glyphicon glyphicon-shopping-cart glyphicon-l"></em>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large" id="todayproduct"></div>
							<div class="text-muted">今日新增商品</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-orange panel-widget">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<em class="glyphicon glyphicon-comment glyphicon-l"></em>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large" id="todayorder"></div>
							<div class="text-muted">今日新增订单</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-teal panel-widget">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<em class="glyphicon glyphicon-user glyphicon-l"></em>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large" id="todayuser"></div>
							<div class="text-muted">今日新增用户</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-red panel-widget">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<em class="glyphicon glyphicon-stats glyphicon-l"></em>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large" id="todaymoney"></div>
							<div class="text-muted">今日交易金额</div>
						</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->
		


		<div id="useradd" class="col-md-6" style="height:400px;"></div>
		<div id="gamepercent" class="col-md-6" style="height:400px;"></div>
		<div id="dayMoney" class="col-md-6" style="height:400px;"></div>
		<div id="gameMoney" class="col-md-6"style="height:400px;"></div>
		<%--<div class="row">--%>
			<%--<div class="col-lg-12">--%>
				<%--<div class="panel panel-default">--%>
					<%--<div class="panel-heading">Site Traffic Overview</div>--%>
					<%--<div class="panel-body">--%>
						<%--<div class="canvas-wrapper">--%>
							<%--<canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>--%>
						<%--</div>--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</div>--%>
		<%--</div><!--/.row-->--%>
	</div>	<!--/.main-->

    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
	<script>

		!function ($) {
		    $(document).on("click","ul.nav li.parent > a > span.icon", function(){          
		        $(this).find('em:first').toggleClass("glyphicon-minus");      
		    }); 
		    $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>
<script type="text/javascript">
    $.get('${pageContext.request.contextPath}/report/index',function(data){
        $("#todayuser").append(data.todayuser);
        $("#todayproduct").append(data.todayproduct);
        $("#todayorder").append(data.todayorder);
        $("#todaymoney").append(data.todaymoney);
    });
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('useradd'));

    // 指定图表的配置项和数据
    myChart.setOption({
        title: {
            text: '最近30天新增用户'
        },
        tooltip: {},
        legend: {
            data:['用户量']
        },
        xAxis: {
            data: []
        },
        yAxis: {},
        series: [{
            name: '用户量',
            type: 'bar',
            data: []
        }]
    });

    // 使用刚指定的配置项和数据显示图表。
    myChart.showLoading();
    $.get('${pageContext.request.contextPath}/report/dayuser',function (data) {
        console.log(data);
        myChart.hideLoading();
        myChart.setOption({
            xAxis: {
                data: data.name
            },
            series: [{
                // 根据名字对应到相应的系列
                name: '用户量',
                data: data.value
            }]
        });
    });

    // 基于准备好的dom，初始化echarts实例
    var gamepercent = echarts.init(document.getElementById('gamepercent'));

    // 指定图表的配置项和数据
    // 使用刚指定的配置项和数据显示图表。
    gamepercent.showLoading();
    $.get('${pageContext.request.contextPath}/report/gamepercent',function (data) {
        console.log(data);
        gamepercent.hideLoading();
        gamepercent.setOption({
            title : {
                text: '游戏交易笔数',
                subtext: '所有',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                type: 'scroll',
                orient: 'vertical',
                right: 10,
                top: 20,
                bottom: 20,
                data: data.name

            },
            series : [
                {
                    name: '游戏名',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '50%'],
                    data: data.source,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        });
    });
    var gamemoney = echarts.init(document.getElementById('gameMoney'));
    gamemoney.showLoading();
    $.get('${pageContext.request.contextPath}/report/gameMoney',function (data) {
        console.log(data);
        gamemoney.hideLoading();
        gamemoney.setOption({
            title : {
                text: '游戏交易金额',
                subtext: '所有',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                type: 'scroll',
                orient: 'vertical',
                right: 10,
                top: 20,
                bottom: 20,
                data: data.name

            },
            series : [
                {
                    name: '游戏名',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '50%'],
                    data: data.source,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        });
    });
    var dayMoney = echarts.init(document.getElementById('dayMoney'));

    // 指定图表的配置项和数据
    // 使用刚指定的配置项和数据显示图表。
    dayMoney.showLoading();
    $.get('${pageContext.request.contextPath}/report/orderMoney',function (data) {
        console.log(data);
        dayMoney.hideLoading();
        dayMoney.setOption({
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    crossStyle: {
                        color: '#999'
                    }
                }
            },
            toolbox: {
                feature: {
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            legend: {
                data:['订单数','交易金额']
            },
            xAxis: [
                {
                    type: 'category',
                    data: data.common.name,
                    axisPointer: {
                        type: 'shadow'
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '订单数',
                    min: 0,
                    max: 25,
                    interval: 5,
                    axisLabel: {
                        formatter: '{value} 个'
                    }
                },
                {
                    type: 'value',
                    name: '金额',
                    min: 0,
                    max: 250,
                    interval: 50,
                    axisLabel: {
                        formatter: '{value} 元'
                    }
                }
            ],
            series: [
                {
                    name:'订单数',
                    type:'bar',
                    data:data.common.value
                },
                {
                    name:'交易金额',
                    type:'bar',
                    yAxisIndex: 1,
                    data:data.common2.value
                }
            ]
        });
    });

</script>
</body>

</html>
