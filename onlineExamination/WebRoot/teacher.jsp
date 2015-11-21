<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>教师管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="easyui/themes/bootstrap/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"></link>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <link href="css/first.css" rel="stylesheet" type="text/css" />
	 <link href="css/login.css" rel="stylesheet" type="text/css" />
	 <script type="text/javascript">
	 window.history.forward(-1);
	$(function(){
		$('#cc').calendar({   
   			 current:new Date(),
   			 border:false,
			});  
		//定义data内所含属性
		var dataTree=[{
			text:'系统管理',
			iconCls:'icon-zoom',
			children:[{
				text:'用户信息管理',
				iconCls:'icon-zoomout',
				attributes:{
					url:'jsp/usersList.jsp'
					}
				},{
				text : '考生成绩查询',
				iconCls : 'icon-zoomout',
				attributes : {
					url : 'jsp/scoreList.jsp'
				}
			}]
			
		},{
			text:'题库套题管理',
			iconCls:'icon-zoom',
			children:[{
				text:'套题<1>管理',
				iconCls:'icon-zoomout',
				attributes:{
					url:'jsp/questionsList.jsp'
					}
				},{
				text : '套题<2>管理',
				iconCls : 'icon-zoomout',
				attributes : {
					url : 'jsp/questions2List.jsp'
				}
			},{
				text : '套题<3>管理',
				iconCls : 'icon-zoomout',
				attributes : {
					url : 'jsp/questions3List.jsp'
				}
			}]
			
		},{
			text:'退出教师管理',
			iconCls:'icon-zoom',
			children:[{
				text:'退出',
				iconCls:'icon-no',
				attributes:{
				
					}
				}]
			
		}];
		$("#tree").tree({   
      		data:dataTree,
      		onClick : function(node){
      		//打开一个选项卡布局面板.
      		//传递一个函数，该函数还没定义
      		if(node.text=='退出'){
      			alert(node.text);  
      			window.location.href="login.jsp";
      		}else{
      			openTabs(node.text, node.attributes.url, node.iconCls);
      		}
      		}
		}); 
		//定义函数，目标：打开选项卡。
		 function openTabs(text,url,icon){
		 	//打开选项卡面板,判断是否存在该选项卡
		 if($("#tabs").tabs('exists',text)){
		 	$("#tabs").tabs('select',text);
		 }else{
		 	//定义一个变量，该变量用于获得另一个页面内容，传入面板；
		 	var myContext="<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%' src="+url+"></iframe>";
		 	$("#tabs").tabs('add',{
		 		title:text,
		 		content:myContext,
		 		closable:true,
		 		iconCls:icon
		 	});
		 }
		}	
	});
	</script>
  </head>
  
   <body class="easyui-layout">  
   <div	 data-options="region:'north',split:false" style="height:100px;">
    	<img src="image/huq.jpg" style="height:100%;width:100%">
    </div> 
     <div id="footer" data-options="region:'south',split:false,border:false"style="height:50px;">
    	<p>◎版权所有，违者必究 ！联系电话+86 13201708840 余童<p>
    </div> 
     <div data-options="region:'west',title:'教师导航',split:true" style="width:160px;">
     <ul id="tree">
     </ul>
     <div  id="cc" style="width:100%;height:180px;"></div>
     </div>  
    <div data-options="region:'center'" >
     <div id="tabs"  class="easyui-tabs" fit="true"  > <!--创建选项卡 fit充满整个父容器 -->
     	<div title="首页" style="background: url('/onlineExamination/image/背景.jpg');">
     		<h2 align="center"><font color="green">欢迎${username }老师进入在线考试系统</font></h2>
     		<table  align="center" bgcolor="#D9E0FC" >
    	 		<tr><td>
    	 		<ol>
    	 			<li>欢迎来到本系统；本考试系统可以按照教师的需求管理学生信</li>
    	 			<li>息；添加考试题目；管理管理员信息；为人员提供权限管理的</li>
    	 			<li>需求；请严格按照考试管理系统办法，自觉遵守学校规章制度</li>
    	 			<li>为维护公平，公正，公开的教务管理尽到教师应有的责任。</li>
    	 		</ol>
    	 		</td></tr>
    	 	</table>
     	</div>
     </div>
    </div>
  </body>
</html>
