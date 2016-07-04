<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.tn.domain.MonitorInfoBean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>MonitorTnfo</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<script src="./js/jquery.min.js"></script>
<script src="./js/highcharts.js"></script>
<script src="./js/bootstrap.min.js"></script>
<style>
#container {
	width: 800px;
	margin: 0 auto;
}

#cpu {
	margin: 0 auto;
	width: 400px;
	height: 300px;
}

#memory {
	margin: 0 auto;
	width: 400px;
	height: 300px;
}
</style>
</head>
<script type="text/javascript">
	var cpuRatio=0;
	var memoryRatio=0;
	var flag=0;
	var ip='<%=request.getRemoteAddr()%>';
	var url="http://" + ip + ":8080/WebReparo/MonitorTnfo";
	
	
	
	$(function() {
		$(document).ready(
				function() {
					Highcharts.setOptions({
						global : {
							useUTC : false
						}
					});

					var chart;
					$('#cpu').highcharts(
							{
								chart : {
									type : 'spline',
									animation : Highcharts.svg, // don't animate in old IE               
									marginRight : 10,
									events: {                                                           
                   						 load: function() {                                              
                						}
                					}
								},
								title : {
									text : 'CPU Utilization'
								},
								xAxis : {
									type : 'datetime',
									tickPixelInterval : 150
								},
								yAxis : {
									title : {
										text : 'Utilization'
									},
									plotLines : [ {
										value : 0,
										width : 1,
										color : '#808080'
									} ],
									max:1,
									min:0
								},
								tooltip : {
									formatter : function() {
										return '<b>'
												+ this.series.name
												+ '</b><br/>'
												+ Highcharts.dateFormat(
														'%Y-%m-%d %H:%M:%S',
														this.x)
												+ '<br/>'
												+ Highcharts.numberFormat(
														this.y, 2);
									}
								},
								legend : {
									enabled : false
								},
								exporting : {
									enabled : false
								},
								credits:{
								enabled:false
								},
								series : [ {
									name : 'CPU Utilization',
									data : (function() {
										// generate an array of random data                             
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -19; i <= 0; i++) {
											data.push({
												x : time + i * 1000,
												y : 0
											});
										}
										return data;
									})()
								} ]
							});
				});

	});

	$(function() {
		$(document).ready(
				function() {
					Highcharts.setOptions({
						global : {
							useUTC : false
						}
					});

					var chart;
					$('#memory').highcharts(
							{
								chart : {
									type : 'spline',
									animation : Highcharts.svg, // don't animate in old IE               
									marginRight : 10,
								},
								title : {
									text : 'Memory Utilization'
								},
								xAxis : {
									type : 'datetime',
									tickPixelInterval : 150
								},
								yAxis : {
									title : {
										text : 'Utilization'
									},
									plotLines : [ {
										value : 0,
										width : 1,
										color : '#808080'
									} ],
									max:1,
									min:0
								},
								tooltip : {
									formatter : function() {
										return '<b>'
												+ this.series.name
												+ '</b><br/>'
												+ Highcharts.dateFormat(
														'%Y-%m-%d %H:%M:%S',
														this.x)
												+ '<br/>'
												+ Highcharts.numberFormat(
														this.y, 2);
									}
								},
								legend : {
									enabled : false
								},
								exporting : {
									enabled : false
								},
								credits:{
								enabled:false
								},
								series : [ {
									name : 'Memory Utilization',
									data : (function() {
										// generate an array of random data                             
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -19; i <= 0; i++) {
											data.push({
												x : time + i * 1000,
												y : 0
											});
										}
										return data;
									})()
								} ]
							});
				});

	});
	
	
	

	function onStart() {
	flag = 1;
		var timer = setInterval(function() {

			$.post(url, {}, function(
					data, status) {
				
				cpuRatio = parseFloat(data.split("||")[0]);
				memoryRatio = parseFloat(data.split("||")[1]);
				var x = (new Date()).getTime();
				var cpuChart = $('#cpu').highcharts();
				var memoryChart = $('#memory').highcharts();
				
				cpuChart.series[0].addPoint([ x, cpuRatio ], true, true);
				memoryChart.series[0].addPoint([ x, memoryRatio ], true, true);
				if (0 == flag) {
					clearInterval(timer);
					cpuRatio = 0;
					memoryRatio = 0;
				}
			});

		}, 3000);
	}
	function onStop() {
		flag = 0;
		cpuRatio = 0;
		memoryRatio = 0;
		
	}
</script>
<body style="background-color: #f7f7f7">

	<div class="container" style="width: 900px;">
		<div style="text-align: center;">
			<h2><%=request.getRemoteAddr()%>  
				CPU/Memory Utilization
			</h2>
		</div>


		<div id="cpu" style="float:left;margin-top:80px"></div>
		<div id="memory" style="float:right;margin-top:80px"></div>
		<div style="clear:both"></div>
		<div style="margin-top:30px;">
			<button class="btn btn-primary" id="start" onclick="onStart()"
				style="margin-left:35%">start</button>
			<button class="btn btn-danger" id="stop" onclick="onStop()"
				style="margin-left:17% ">stop</button>
		</div>
	</div>
</body>

</html>
