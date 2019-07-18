<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addressbook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" href="layuiadmin/layui/css/layui.css" media="all">
  <style type="text/css">
  	#divs div{
  		width:300px;
  		position: relative;
  		margin-left: 30px;
  		padding-top: 5px;
  	}
  	#search{
  		position: relative;
  		left: 800px;
  	}
  </style>
  </head>
  
  <body>
  &nbsp;&nbsp;&nbsp;<h1>员工通讯录</h1>
  
  	<div class="demoTable" id="search">
		  搜索 ：
		  <div class="layui-inline">
		    <input class="layui-input" name="id" id="demoReload" autocomplete="off">
		  </div>
		  <button class="layui-btn" data-type="reload">搜索</button>
	</div>
	
  <c:forEach  items="${addressbook }" var="a">
	  <div id="divs" style="width:380px; height:180px; float:left; background-color: white; margin-left: 160px;margin-top: 20px;">
		  	<div class="layui-col-md6">
		  		<img src="img/${a.Url }" class="layui-nav-img" style="width: 50px;height: 50px;">
		  		<span style="font-size: 20px;">${a.Uname }</span>
		  	</div>
		  	<div class="layui-col-md6">
		  		性别：${a.Sex }	      
		  	</div>
		  	<div class="layui-col-md6">
		  		从属部门：${a.DeptName }	    
		  	</div>
		  	<div class="layui-col-md6">
		  		入职日期：${a.InDate }
		  	</div>
		  	<div class="layui-col-md6">
		  		联系电话：${a.Phone }
		  	</div>
	  </div>
  </c:forEach>	
	 <%--  <div style="padding: 20px; background-color: #F2F2F2;">
	  <div class="layui-row layui-col-space15">
	    <div class="layui-col-md6">
	      <div class="layui-card">
	        <div class="layui-card-header">通讯录</div>
	      </div>
	    </div>
	  </div>
	</div> 
	<c:forEach  items="${addressbook }" var="a">
	<div style="padding: 20px; background-color: #F2F2F2;">
	  
	    <div class="layui-col-md6">
	      <div class="layui-card">
	        <div class="layui-card-header">通讯录</div>
	        <div class="layui-card-body">
	        <img src="img/${a.Url }" style="width: 50px;height: 50px;">
		       	
	        </div>
	      </div>
	    </div>
	  </div>
	</div> 
	</c:forEach> --%>
  </body>
</html>
