<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="layuiadmin/style/admin.css" media="all">
  	<link rel="stylesheet" href="dist/bootstrap.min.css">
    <link rel="stylesheet" href="dist/sidebar-menu.css">
    <link href="font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" media="screen">
	<script type="text/javascript" src="layuiadmin/layui/layui.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script src="dist/sidebar-menu.js"></script>
	
  </head>
  
   	<body class="layui-layout-body">
  
  <div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
      <div class="layui-header">
        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-left">
          <li class="layui-nav-item layadmin-flexible" lay-unselect>
            <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
              <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
            </a>
          </li>
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;" layadmin-event="refresh" title="刷新">
              <i class="layui-icon layui-icon-refresh-3"></i>
            </a>
          </li>
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <input style="position:relative;top:9px;color:black;" type="text" placeholder="搜索..." autocomplete="off" class="layui-input layui-input-search" layadmin-event="serach" lay-action="template/search.jsp?keywords="> 
          </li>
        </ul>
        
        <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">         
          <li class="layui-nav-item" lay-unselect>
            <a lay-href="app/message/index.jsp" layadmin-event="message" lay-text="消息中心">
              <i class="layui-icon layui-icon-notice"></i>  
              
              <!-- 如果有新消息，则显示小圆点 -->
              <span class="layui-badge-dot"></span>
            </a>
          </li>
          <!--主题 换色 标签 -->
          <li class="layui-nav-item layui-hide-xs" lay-unselect >
            <a href="javascript:;" layadmin-event="theme">
              <!-- 主题 换色 图标 -->	
              <i class="layui-icon layui-icon-theme"></i>
            </a>
          </li>

          <!-- 全屏 -->
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="fullscreen">
              <i class="layui-icon layui-icon-screen-full"></i>
            </a>
          </li>
          <!-- 个人信息 -->
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;">
              <!-- 返回类型是List<Map<String, Object>>:则如下 -->
              <!-- 返回类型是实体或Map<String, Object>：则user.uname -->
              <img src="img/${user[0].Url }" style="width: 35px;height: 35px;" class="layui-nav-img">
              <cite>${user[0].Uname }</cite>
            </a>
            <dl class="layui-nav-child">
              <dd><a lay-href="getuser.do">个人中心</a></dd>

              <dd><a lay-href="upd.do">修改密码</a></dd>

              <dd style="text-align: center;"><a href="logout.do">注销</a></dd>
            </dl>
          </li>
          
          <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
            <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
          </li>
        </ul>
      </div>
      
      <!-- 侧边菜单 -->  
      <div class="layui-side layui-side-menu">  
	      <div class="layui-side-scroll">
	          <div class="layui-logo">
	            <span>OA协同办公系统</span>
	          </div>
	          <!-- 显示左侧页信息 -->
	        <ul class='layui-nav layui-nav-tree' lay-shrink='all' id='LAY-system-side-menu' lay-filter='layadmin-system-side-menu'>
	        </ul>              
	      </div>
      </div>
      
      <!-- 页面标签 -->
      <div class="layadmin-pagetabs" id="LAY_app_tabs">
        <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-down">
          <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
            <li class="layui-nav-item" lay-unselect>
              <a href="javascript:;"></a>
              <dl class="layui-nav-child layui-anim-fadein">
                <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
              </dl>
            </li>
          </ul>
        </div>
        <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
          <ul class="layui-tab-title" id="LAY_app_tabsheader">
            <li lay-id="home/console.jsp" lay-attr="home/console.jsp" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
          </ul>
        </div>
      </div>
          
      <!-- 主体内容 -->
      <div class="layui-body" id="LAY_app_body">
        <div class="layadmin-tabsbody-item layui-show">
          <iframe src="home/console.jsp" frameborder="0" class="layadmin-iframe"></iframe>
        </div>
      </div>
      
      <!-- 辅助元素，一般用于移动设备下遮罩 -->
      <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
  </div>

  <script src="layuiadmin/layui/layui.js"></script>
 <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript">
	  layui.config({
	    base: 'layuiadmin/' //静态资源所在路径
	  }).extend({
	    index: 'lib/index' //主入口模块
	  }).use('index');
		   
		var menu="";
		$(function(){
			var alldata=getDataMenu();
			getMenu(0,alldata);
			$("#LAY-system-side-menu").html(menu);
		
		});	
		
		function getDataMenu(){
			var d="";
			$.ajax({
				url:"show1.do",
				type:"post",
				async:false,
				dataType:"json",
				success:function(data){
					d=data;
					
				}
			});
			return d;
		}
/* 	      <li data-name="home" class="layui-nav-item layui-nav-itemed">
          <a lay-href="home/homepage1.jsp" lay-tips="组件" lay-direction="2">
            <i class="layui-icon layui-icon-home"></i>
            <cite>我的桌面</cite>
          </a>
        </li> */
		//拼接菜单
		function getMenu(pid,allData){
			var firstMenu=getsonData(pid,allData);
			if(firstMenu.length>0){
			
				for(var j=0;j<firstMenu.length;j++){
					var sonMenu=getsonData(firstMenu[j].PermID,allData);
					/* layui-nav-itemed:默认展开，如果添加即展开所有子菜单，不添加，则展开 */
					menu+="<li data-name='home' class='layui-nav-item'>";	
					//alert(firstMenu[j].micon);
					if(sonMenu.length>0){		
						menu+="<a href='javascript:;' lay-tips='组件' lay-direction='2'>";
						menu+="<i class='"+firstMenu[j].Icon+"' style='font-size:20px;'></i>";
						menu+="<cite>"+firstMenu[j].PermName+"</cite></a>";	
						menu+="<dl class='layui-nav-child'>";
						for(var k=0;k<sonMenu.length;k++){		
								menu+="<dd>";
								//getMenu(sonMenu[k].PermID,allData);
								var soonMenu=getsonData(sonMenu[k].PermID,allData);
								if(soonMenu.length>0){
									menu+="<a href='javascript:;'>"+sonMenu[k].PermName+"</a>";
									menu+="<dl class='layui-nav-child'>";
									for(var l=0;l<soonMenu.length;l++){
										if(soonMenu.length>0){
											menu+="<dd><a lay-href='"+soonMenu[l].Url+"'>"+soonMenu[l].PermName+"</a>";
											
											menu+="</dd>";
										}
									}
									menu+="</dl>"; 
								}else{
									menu+="<a lay-href='"+sonMenu[k].Url+"' lay-tips='组件' lay-direction='2'>"+sonMenu[k].PermName+"</a>";
								}
								menu+="</dd>";
						}		
						menu+="</dl>"; 
					}else{
						menu+="<a lay-href='"+firstMenu[j].Url+"' lay-tips='组件' lay-direction='2'>";
						menu+="<i class='"+firstMenu[j].Icon+"' style='font-size:20px;'></i>";
						menu+="<cite>"+firstMenu[j].PermName+"</cite></a>";	
					}
					menu+="</li>";
				}
				
			}
		}
	
        
		function getsonData(parentid,allData){
		//alert(parentid);
		
			var firstMenu=[];
			for(var i=0;i<allData.length;i++){
				if(allData[i].TopPermID==parentid){
					firstMenu.push(allData[i]);
				//	alert(firstMenu.length);
				}
			}
			return firstMenu;
		}
	</script>
  </body>
</html>
