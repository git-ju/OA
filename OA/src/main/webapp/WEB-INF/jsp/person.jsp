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
    
    <title>My JSP 'person.jsp' starting page</title>
    
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
  	 layui.use('form',function(){
        var form = layui.form;    
            //刷新界面 所有元素
            form.render();
	});
  	</script>

  </head>
  
  <body>
  <h1 style="position: absolute;left:40px;top:30px;">个人中心</h1>
  	<c:forEach items="${getuser }" var="g">		
  <form action="updUser.do" method="post"  class="layui-form" style="position: relative;left: 200px;">

	   <div class="layui-form-item" style="width: 800px;height: 40px; " >
		    <div class="layui-input-inline"  style="width: 300px;height: 40px;">
		    <img src="img/${g.Url }" style="width: 50px;height: 50px;" class="layui-nav-img">
		    <input type="text" name="Uname" value="${g.Uname }" autocomplete="off" class="layui-input"/>		     
		    </div>
  		</div>
  		
  		  <div class="layui-form-item"  style="width: 800px;height: 40px; position: relative;left: 150px; top:20px;">
		    <label class="layui-form-label">工号</label>
		    <div class="layui-input-inline">
		      <input type="text" name="UID" value="${g.UID }" autocomplete="off" class="layui-input" disabled="disabled">
		    </div>
		  </div>
   
	   <div class="layui-form-item"  style="width: 800px;height: 40px; position: relative;left: 150px;top:20px;">
		    <label class="layui-form-label">性别</label>
		    <div class="layui-input-inline">
		    	<c:if test="${g.Sex=='男' }">
		    		<input type="radio" name="Sex" value="0" title="男" checked>
      				<input type="radio" name="Sex" value="1" title="女" >
		    	</c:if>
		       <c:if test="${g.Sex=='女' }">
		    		<input type="radio" name="Sex" value="0" title="男" >
      				<input type="radio" name="Sex" value="1" title="女" checked>
		    	</c:if>
		    </div>
  		</div>
   
	     <div class="layui-form-item"  style="width: 800px;height: 40px; position: relative;left: 150px;top:20px;">
		    <label class="layui-form-label">出生日期</label>
		    <div class="layui-input-inline">
		      <input type="date" name="Birthday" value="${g.Birthday }" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  
		  <div class="layui-form-item"  style="width: 800px;height: 40px; position: relative;left: 150px;top:20px;">
		    <label class="layui-form-label">所属部门</label>
		    <div class="layui-input-inline">
		      <select name="DeptName" lay-filter="aihao">
		      		<c:if test="${g.DeptID==0}">
				     	 <option value="${g.DeptID}" selected=="selected">无部门</option>
				     	 <c:forEach items="${depts}" var="d">
				     	  <option value="${d.DeptID}">${d.DeptName }</option>
				     	  </c:forEach>
				  </c:if>
				   <c:if test="${g.DeptID!=0}">
			      <c:forEach items="${depts}" var="d">
				     	<c:if test="${g.DeptID==d.DeptID}">
				 			<option value="${g.DeptID}" selected=="selected">${d.DeptName }</option>
				 	    </c:if>
				 	   <c:if test="${g.DeptID!=d.DeptID}">
				 	   		 <option value="${d.DeptID}">${d.DeptName }</option>
				 	   </c:if>
			      </c:forEach>
			      </c:if>
		      </select>
		    </div>
		  </div>  
		  
		  <div class="layui-form-item"  style="width: 800px;height: 40px; position: relative;left: 150px;top:20px;">
		    <label class="layui-form-label">职位</label>
		    <div class="layui-input-inline">
		      <select name="DeptName" lay-filter="aihao">
		       <c:forEach items="${roles}" var="r">
			      <option value="${r.RoleID}"
			    		<c:if test="${g.RoleID==r.RoleID}">
			 				 selected=="selected" 
			 			</c:if>>${r.RoleName }</option>
			    </c:forEach>
		      </select>
		    </div>
		  </div>      
	    <div class="layui-form-item"  style="width: 800px;height: 40px; position: relative;left: 150px;top:20px;">
		    <label class="layui-form-label">入职日期</label>
		    <div class="layui-input-inline">
		      <input type="date" name="InDate" value="${g.InDate }" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  
		  <div class="layui-form-item"  style="width: 800px;height: 40px; position: relative;left: 150px;top:20px;">
		    <label class="layui-form-label">转正日期</label>
		    <div class="layui-input-inline">
		      <input type="date" name="RegularDate" value="${g.RegularDate }" autocomplete="off" class="layui-input">
		    </div>
		  </div>	  		    	
		    
	    <div class="layui-form-item"  style="width: 800px;height: 40px; position: relative;left: 150px;top:20px;">
		    <label class="layui-form-label">任职状态</label>
		    <div class="layui-input-inline"  style="width:600px;height: 40px;">
	      <c:if test="${g.TakeOfficeState==0 }">
	      	<input type="radio" name="TakeOfficeState" value="0" title="在职" checked>
	      	<input type="radio" name="TakeOfficeState" value="1" title="试用期">
	      	<input type="radio" name="TakeOfficeState" value="2" title="离职">	      	
	      </c:if>
	      <c:if test="${g.TakeOfficeState==1 }">
	      	<input type="radio" name="TakeOfficeState" value="0" title="在职">
	      	<input type="radio" name="TakeOfficeState" value="1" title="试用期" checked>
	      	<input type="radio" name="TakeOfficeState" value="2" title="离职">	      	
	      </c:if>
	      <c:if test="${g.TakeOfficeState==2 }">
	      	<input type="radio" name="TakeOfficeState" value="0" title="在职">
	      	<input type="radio" name="TakeOfficeState" value="1" title="试用期">
	      	<input type="radio" name="TakeOfficeState" value="2" title="离职" checked>	      	
	      </c:if>	     
	   		</div>
  		</div>	
 		    
  		 <div class="layui-form-item"  style="width: 800px;height: 40px; position: relative;left: 150px;top:20px;">
		    <label class="layui-form-label">工作状态</label>
		    <div class="layui-input-inline" style="width:600px;height: 40px;">
		      <c:if test="${g.workState==0 }">
		      	<input type="radio" name="workState" value="0" title="在岗" checked>
		      	<input type="radio" name="workState" value="1" title="请假">
		      	<input type="radio" name="workState" value="2" title="出差">	      	
		      </c:if>
		      <c:if test="${g.workState==1 }">
		      	<input type="radio" name="workState" value="0" title="在岗" checked>
		      	<input type="radio" name="workState" value="1" title="请假">
		      	<input type="radio" name="workState" value="2" title="出差">	      	
		      </c:if>
		      <c:if test="${g.workState==2 }">
		      	<input type="radio" name="workState" value="0" title="在岗" checked>
		      	<input type="radio" name="workState" value="1" title="请假">
		      	<input type="radio" name="workState" value="2" title="出差">
		      </c:if>	     
	   		</div>
  		</div>
	    
	      <div class="layui-form-item"   style="width: 800px;height: 40px; position: relative;left: 150px;top:20px;">
		    <div class="layui-input-inline">
		      <button class="layui-btn layui-btn-sm" lay-submit lay-filter="updUser">提交</button>
		      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		  </div> 
		  </form>
	  </c:forEach>
  </body>
</html>
