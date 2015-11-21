<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'exam.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/first.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"></link>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript">
	window.history.forward(-1);
	$(function(){
		$("#searchbut").click(function() {
			if(document.getElementById("1").checked==true){  
				window.location.href="changer.jsp"; 
	 	 }else{     
	 	 	alert("请在仔细阅读后勾选进入");
	 	 }
				});
	});
	</script>
  </head>
    <body class="easyui-layout"> 
    <div data-options="region:'north',split:false" style="height:100px;">
    	<img src="image/huq.jpg" style="height:100%;width:100%">
    </div>  
    <div id="footer" data-options="region:'south',split:false,border:false"style="height:50px;">
    	<p>◎版权所有，违者必究 ！联系电话+86 13201708840 余童<p>
    </div>  
    <div data-options="region:'center'" style="background: url('/onlineExamination/image/背景.jpg');">
    	 
    	 	<h1 align="center"><jsp:declaration></jsp:declaration>欢迎考生${username}进入本在线考试系统</h1><hr style="color:#dfdfdf ">
    	 	<h3 align="center">考试前请仔细阅读如下说明</h3>
    	 		<table  align="center" bgcolor="#D9E0FC" >
    	 		<tr><td>
    	 		<ol>
    	 			<li>考试期间，遵守考试纪律,遵守校纪校规自觉维护考场秩序；</li>
    	 			<li>严格按照监考老师要求，不携带易燃易爆等危险品进入考场；</li>
    	 			<li>不携带夹带，考试期间不交头接耳，不互相传递试卷；</li>
    	 			<li>一经发现，有违反校纪校规行为，严肃处理，情节特别严重者，交由公安机关处理。</li>
    	 			<p align="right"><input id="1" type="checkbox" />已阅读该说明</p>
    	 			<p align="right">	
    	 			<a  id="searchbut" class="easyui-linkbutton"
					data-options="iconCls:'icon-tip',plain:true">答题</a></p>	
    	 		</ol>
    	 		</td></tr>
    	 		</table>
    	 </div>  
      
</body>  
</html>
