<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" href="layuiadmin/layui/css/layui.css" media="all">
	<script type="text/javascript" src="layuiadmin/layui/layui.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
  	<style type="text/css">
  		  #old{
  		 	display: none;
  		 	font-style: red;
  		 	color: red;
  		 }
  		 #old1{
  		 	display: none;
  		 	font-style: red;
  		 	color: red;
  		 } 
  		 #new1{
  		 	display: none;
  		 	font-style: red;
  		 }
  		  #new{
  		 	display: none;
  		 	font-style: red;
  		 }
  		 #rep{
  		 	display: none;
  		 	font-style: red;
  		 }
  		  #rep1{
  		 	display: none;
  		 	font-style: red;
  		 }
  		 #div{
  		 position: relative;
  		 left: 400px;
  		 top:50px;
  		 }
  	</style>
  	<script type="text/javascript">
  		//旧密码判断
  		function oldbl(){
  			//获取登录时存的登录密码
  			var pwd=${user[0].Upwd};
  			//获取文本框中输入的密码			
  			var oldpwd=$("#oldpwd").val();
 			
  			if(oldpwd==null||oldpwd==""){
  				$("#old1").css("display","inline");
  			}else{
  				if(oldpwd!=pwd){		
  					$("#old").css("display","inline");
  				}else{
  					$("#old").css("display","none");
  				}
  				$("#old1").css("display","none");
  			}
  			
  		}
  		
  		//新密码判断
  		function newblur(){
  			var pwd=${user[0].Upwd};
	  		var newpwd=$("#newpwd").val();
  			if(newpwd==null||newpwd==""){
  				$("#new").css("display","inline");
  			}else{
  				if(newpwd==pwd){		
  					$("#new1").css("display","inline");
  				}else{
  					$("#new1").css("display","none");
  				}
  				$("#new").css("display","none");
  			}
  		};
  		function reblur(){
	  		var repwd=$("#repwd").val();
	  		var newpwd=$("#newpwd").val();
	  		if(repwd==null||repwd==""){
  				$("#rep").css("display","inline");
  			}else{
  				if(newpwd!=repwd){		
  					$("#rep1").css("display","inline");
  				}else{
  					$("#rep1").css("display","none");
  				}
  				$("#rep").css("display","none");
  			}
  		};
  	</script>
  </head>
  
  <body>
   <div id="div">
    <br/>
    <form class="layui-form" action="updPwd.do">
	    <div class="layui-form-item">
		    <label class="layui-form-label">旧密码框</label>
		    <div class="layui-input-inline">
		      <input type="password" id="oldpwd" onblur="oldbl();" name="password" autocomplete="new-password" required lay-verify="required" placeholder="请输入旧密码" autocomplete="off" class="layui-input">
		    </div>
		    <div id="old1" class="layui-form-mid layui-word-aux">旧密码不能为空!</div>
		    <div id="old" class="layui-form-mid layui-word-aux">旧密码与原密码不一致!</div>
  		</div>
	  
	     <div class="layui-form-item">
		    <label class="layui-form-label">新密码框</label>
		    <div class="layui-input-inline">
		      <input type="password" id="newpwd" onblur="newblur();" name="Upwd" required lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
		    </div>
		    <div id="new" class="layui-form-mid layui-word-aux">新密码不能为空!</div>
		    <div id="new1" class="layui-form-mid layui-word-aux">新密码与旧密码一致!</div>
		 </div>
		 
		 <div class="layui-form-item">
		    <label class="layui-form-label">确认密码框</label>
		    <div class="layui-input-inline">
		      <input type="password" id="repwd" onblur="reblur();" name="password" required lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
		    </div>
		    <div id="rep" class="layui-form-mid layui-word-aux">确认密码不能为空!</div>
		    <div id="rep1" class="layui-form-mid layui-word-aux">确认密码与新密码不一致!</div>
		 </div>
		 
		  <div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
		      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
	 	 </div>
	</form>
	</div>
  </body>
</html>
