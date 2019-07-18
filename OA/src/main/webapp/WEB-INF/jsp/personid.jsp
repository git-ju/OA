<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'personid.jsp' starting page</title>
    
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
			if(confirm("确定删除？")){
				location.href="delUser.do?uid="+uid;
			}
		}
		function upd(uid){
			location.href="getUserID.do?uid="+uid;
		}
	</script>
  </head>
  
  
  <body>
  	
   	<colgroup>
	    <col width="150">
	    <col width="200">
	    <col>
	  </colgroup>
	  
	  <tbody>
	  <c:forEach items="${getMessage }" var="g">
	    
	   <img src="img/${g.Url }"><span style="font-size: 25px;">${g.Uname }</span>
	  	<input type="button"  class="layui-btn layui-btn-radius" style="width: 90px; position: relative; left:780px;" value="删除" onclick="del('${g.UID}')">
  		<input type="button"  class="layui-btn layui-btn-radius" style="width: 90px; position: relative; left:800px;" value="修改" onclick="upd('${g.UID }');">
	  <table  class="layui-table">
	    <tr>
	      <td>工号</td>
	      <td>${g.UID }</td>
	    </tr>
	   
	     <tr>
	      <td>性别</td>
	      <td>${g.Sex }</td>
	    </tr> 
	     <tr>
	      <td>出生日期</td>
	      <td>${g.Birthday }</td>
	    </tr>
	    <tr>
	      <td>所属部门</td>
	      <td>${g.DeptName }</td>
	    </tr> 
	    <tr>
	      <td>职位</td>
	      <td>${g.RoleName }</td>
	    </tr>
	    <tr>
	      <td>入职日期</td>
	      <td>${g.InDate }</td>
	    </tr> 
	    <tr>
	      <td>转正日期</td>
	      <td>${g.RegularDate }</td>
	    </tr> 
	    <tr>
	      <td>任职状态</td>
	      <c:if test="${g.TakeOfficeState==0 }">
	      	 <td>在职</td>
	      </c:if>
	      <c:if test="${g.TakeOfficeState==1 }">
	      	 <td>试用期</td>
	      </c:if>
	      <c:if test="${g.TakeOfficeState==2 }">
	      	 <td>离职</td>
	      </c:if>	     
	    </tr> 
	    <tr>
	      <td>工作状态</td>
	      <c:if test="${g.WorkState==0 }">
	      	 <td>在岗</td>
	      </c:if>	      
	      <c:if test="${g.WorkState==2 }">
	      	 <td>请假</td>
	      </c:if>
	      <c:if test="${g.WorkState==1 }">
	      	 <td>出差</td>
	      </c:if>
	    </tr>  
	  </c:forEach>
	  </table>

	  </tbody>
	  	  <input type="button" value="返回"  	class="layui-btn layui-btn-radius layui-btn-primary" style="position: relative;left: 1060px;"/>
  </body>
</html>
