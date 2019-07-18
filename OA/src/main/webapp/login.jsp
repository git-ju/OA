<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
	 <link rel="stylesheet" type="text/css" href="css/index.css"/>
	 <link rel="stylesheet" type="text/css" href="layuiadmin/layui/css/layui.css">
	 <script type="text/javascript" src="js/jquery.js"></script>
	 <script type="text/javascript" src="layuiadmin/layui/lay/modules/layer.js"></script>
	 <script type="text/javascript" src="layuiadmin/layui/layui.js"></script>
	 <script type="text/javascript" src="layuiadmin/lib/xadmin.js"></script>

	 
<style>
	.btn:hover{
	cursor: pointer;
	}
	/* span{
	display: none;
	
	} */
</style>
<script type="text/javascript">
		javascript:window.history.forward(1);
		function banBackSpace(e){
			var ev=e||window.event;//获取even对象
			var obj=ev.target||ev.srcElement;//获取事件源
			var t=obj.type||obj.getAttribute('type');//获取事件源类型
			//获取作为判断条件的事件类型
			var vReadOnly=obj.getAttribute('readonly');
			var vEnabled=obj.getAttribute('enabled');
			
			var flag2=(ev.keyCode==8&&t!="password"&&t!="text"&&t!="textarea")?true:false;
			//判断
			if(flag2){
				return false;
			}
			document.onkeypress=banBackSpace;
			document.onkeydown=banBackSpace;
		}
		
		function onSubmit(){
			var name=$("#uname").val();
			var pwd=$("#upwd").val();
			if(name==null||name==""){
				layer.msg("用户名不能为空",{icon:5});
			}
			if(pwd==null||pwd==""){
				alert("密码不能为空！");
			}
			
		}; 
	</script>
<body>

<img class="bgone" src="img/1.jpg" />
<img class="pic" src="img/a.png" />
<form action="login.do" method="post" onsubmit="onSubmit();">
<div class="table">
	<div class="wel">OA办公系统登录</div>
	<div class="wel1"><h3 style="color: white;">OA BAN GONG XI TONG DENG LU</h3></div>
	<div class="user">
		<div id="yonghu" style=""><img src="img/yhm.png" /></div>
		<input type="text" id="uname" name="uname" placeholder="用户名" required />
		<!-- <span id="sn">用户名不能为空！</span> -->
	</div>			
	<div class="password">
		<div id="yonghu"><img src="img/mm.png" /></div>
		<input type="password" id="upwd" name="upwd" placeholder="●●●●●●" required />
		<!-- <span id="sp">密码不能为空！</span> -->
	</div>
	<input class="btn" type="submit" name="登录" value="登录" />
</div>
</form>

  </body>
</html>
