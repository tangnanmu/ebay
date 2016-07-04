<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<link rel="stylesheet" href="./css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>input IP</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
	body{ text-align:center} 
	
	</style>
</head>
<script language="javascript">
	function f_check_IP() {
		var ip = document.getElementById('ip').value;
		var re = /^(\d+)\.(\d+)\.(\d+)\.(\d+)$/;//正则表达式     
		if (re.test(ip)) {
			if (RegExp.$1 < 256 && RegExp.$2 < 256 && RegExp.$3 < 256
					&& RegExp.$4 < 256)
				return true;
		}
		alert("IP有误！");
		return false;
	}
</script>
<body style="background-color: #f7f7f7">
	<div class="container">
		<div style="margin-right: auto; margin-left: auto; margin-top: 140px">
			<div ng-show="abtest['HP_NewCopy']" class="">
				<h1>Server CPU/Memory utilization trend</h1>
			</div>
			<div class="row" style="margin-top: 40px">
			<div class="col-lg-6 col-lg-offset-3" >
				<div class="input-group">
					<input type="text" name="ip" id="ip" class="form-control"
						placeholder="Please input the server name/ip""> <span
						class="input-group-btn"> <input type="button" id="ipSub"
						class="btn btn-default" value="提交" /> </span>
				</div>
			</div>
			</div>
		</div>


	</div>

</body>


<script type="text/javascript">
	$(function() {
		$("#ipSub").click(function() {
			var ip = $("#ip").val();
			var url = "http://" + ip + ":8080/WebReparo/MonitorTnfo";
			location.href = url;
		});
	});
</script>
</html>
