<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>login.html</title>
	
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
     <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"></link>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <link href="css/first.css" rel="stylesheet" type="text/css" />
	 <link href="css/login.css" rel="stylesheet" type="text/css" />
  </head>
  <% session.invalidate();%>
   <body class="easyui-layout"> 
   <div	 data-options="region:'north',split:false" style="height:100px;">
    	<img src="image/huq.jpg" style="height:100%;width:100%">
    </div> 
     <div id="footer" data-options="region:'south',split:false,border:false"style="height:50px;">
    	<p>◎版权所有，违者必究 ！联系电话+86 13201708840 余童<p>
    </div>  
    <div data-options="region:'center'" style="background: url('/onlineExamination/image/背景.jpg');" >
    	<form action="loginAction" method="post">
    	<table  bgcolor="#D9E0FC" style="margin-top:40px" width="208"border="0" align="center" cellpadding="5" cellspacing="0">
		  <tr>
		    <td bgcolor="#BBC7FB" class="title">+登录</td>
		  </tr>
		  <tr>
		    <td class="grey"bgcolor= "#D3DCFD"><img src="/onlineExamination/image/warning.gif" width="16" height="16" align="absmiddle">根据提示输入</td>
		  </tr>
		  <tr>
		    <td class="title" bgcolor=#C9D2F9>请输入学号或教师编号</td>
		  </tr>
		  <tr>
		    <td><input name="studentid" type="text" class="username" size="30"></td>
		  </tr>
		  <tr>
		    <td class="title"  bgcolor=#C9D2F9>请输入密码</td>
		  </tr>
		  <tr>
		    <td><input name="password" type="password" class="password" size="30"></td>
		  </tr>
		   <tr>
		  <td class="title"  bgcolor=#C9D2F9>
			  <input type="radio" name="power" value="1">学生 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="radio" name="power" value="2">教师
		  </td>
		  </tr>
		  <tr>
		    <td class="orange"><input type="checkbox"  name="keep" value="2" checked="checked">To remember Password ?&nbsp;&nbsp;&nbsp;&nbsp;<a href="register.jsp">注册</a></td>
		  </tr>
		  <tr>
		    <td align="right"><input type="image" src="/onlineExamination/image/loginin.gif" width="70" height="21"></td>
		  </tr>
		</table>
		<p>&nbsp;</p>
		<br />
		</form>
	</div>   
</body>  
</html>
