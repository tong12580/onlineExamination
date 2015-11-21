<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>index.html</title>
	
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
     <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"></link>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <link href="css/first.css" rel="stylesheet" type="text/css" />
	<link href="css/a.css" rel="stylesheet" type="text/css" />
	
  </head>
  
   <body class="easyui-layout">  
   <script language="javascript">window.history.forward(-1);</script>
   <div	 data-options="region:'north',split:false" style="height:100px;">
    	<img src="image/huq.jpg" style="height:100%;width:100%">
    </div> 
     <div id="footer" data-options="region:'south',split:false,border:false"style="height:50px;">
    	<p>◎版权所有，违者必究 ！联系电话+86 13201708840 余童<p>
    </div>  
    <div data-options="region:'center'" style="background: url('/onlineExamination/image/背景.jpg');">
    <h2 align="center">你好${username }欢迎进入本考试系统</h2>
    <hr>
  	<table style="margin-top:120px" border="0" cellpadding="0" cellspacing="0">
  		<tr>
  		<td style="width: 274px; height: 191px"><a href="exam.jsp"><img src="image/01.png" /></a></td>
  		<td style="width: 233px; height: 175px"><a href="referAction"><img src="image/02.png" style="width: 192px; height: 172px"/></a></td>
  		<td style="width: 277px; "><a href="updat.jsp"><img src="image/03.png" style="width: 181px; "></a></td>
  		<td style="width: 191px; "><a href="logout.jsp"><img src="image/04.png" style="width: 188px; height: 179px"/></a></td>
  		</tr>
  	</table>
    </div>
</body>  
</html>
