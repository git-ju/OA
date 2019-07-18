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
    
    <title>My JSP 'alluser.jsp' starting page</title>
    
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
  
  	<script type="text/javascript">
  	function del(uid){
  		//alert("1");
  			//alert(uid);
  			if(confirm("确定要删除吗？")){
  				location.href="delUser.do?uid="+uid;
  			}
  		}
  	</script>
  </head>
  
  <body>
   <table class="layui-table">
   	<br/>
	   	<div class="demoTable">
		  搜索 ：
		  <div class="layui-inline">
		    <input class="layui-input" name="id" id="demoReload" autocomplete="off">
		  </div>
		  <button class="layui-btn" data-type="reload">搜索</button>
		</div>
	  <colgroup>
	    <col width="150">
	    <col width="200">
	    <col>
	  </colgroup>
	  <thead>
	    <tr>
	      <th>工号</th>
	      <th>姓名</th>
	      <th>性别</th>
	      <th>从属于</th>
	      <th>职务</th>
	      <th>入职日期</th>
	      <th>操作</th>
	    </tr> 
	  </thead>
	  <tbody>
	  <c:forEach items="${alluser }" var="a">
	    <tr>
	      <td>${a.UID }</td>
	      <td><a style="color: blue;"  href="getMessage.do?uid=${a.UID}">${a.Uname }</a></td>
	      <td>${a.Sex }</td>
	      <td>${a.DeptName }</td>
	      <td>${a.RoleName }</td>
	      <td>${a.InDate }</td>
	      <td>
	      	<a class="layui-icon layui-icon-edit" href="getUserID.do?uid=${a.UID }" ></a>
	      	<a class="layui-icon layui-icon-delete" href="javascript:del('${a.UID}')">删除</a>
	      </td>
	    </tr>
	  </c:forEach>
	  </tbody>
	</table>
  </body>
</html>
