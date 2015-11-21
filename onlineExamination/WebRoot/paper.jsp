<%@taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="currDate" class="java.util.Date"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>开始考试</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"></link>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <link href="css/first.css" rel="stylesheet" type="text/css" />
    <link href="css/css2.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
	<!--
	.STYLE3 {font-size: 18px; }
	.STYLE4 {font-size: 18px; font-weight: bold; }
	.STYLE5 {color: #FF0000}
	.STYLE6 {font-size: 15px; }
	-->
	</style>
    <script type="text/javascript">
    window.history.forward(-1);
   var ksTime; //定义考试时间以分钟计算
	 ksTime = 120;//设置时间 这里设置为0.1代表是6秒,测试用
	 if(readCookie("ss")==""){
	  setCookie("ss",new Date(),ksTime/60);
	 }
	 function sT(){
	  var tti = new Date();
	  var lt  = parseInt((tti-new Date(readCookie("ss")))/1000);
	  if((ksTime*60-lt)<0){
	   setCookie("ss",new Date(),0);
	   alert("考试时间到!\n即将提交试卷!");
	   document.forms[0].submit();
	  }else{
	  	lm = Math.floor(lt / 60);
		ls = lt % 60;
		allY = ksTime*60-lt;
		ym = Math.floor(allY / 60);
		ys = allY % 60;
	   document.getElementById("tTime").innerHTML = "考试已经开始了" + lm + "分" + ls + "秒" + ",剩余"  + ym + "分" + ys + "秒";
	   var ttt = setTimeout("sT()",1000);
	  }
	 }
	 function readCookie(name) { 
	  var cookieValue = ""; 
	  var search = name + "="; 
	  if(document.cookie.length > 0) { 
	   offset = document.cookie.indexOf(search); 
	   if (offset != -1) { 
	    offset += search.length; 
	    end = document.cookie.indexOf(";", offset); 
	    if (end == -1) 
	     end = document.cookie.length; 
	    cookieValue = document.cookie.substring(offset, end); 
	   } 
	  } 
	  return cookieValue; 
	 }  
	 function setCookie(name, value, hours) { 
	  var expire = ""; 
	  if(hours != null) { 
	   expire = new Date((new Date()).getTime() + hours * 3600000); 
	   expire = "; expires=" + expire.toGMTString(); 
	  } 
	  document.cookie = name + "=" + value + expire; 
	 }
    </script>
  </head>
  
   <body class="easyui-layout" onload="sT()">  
   <div	 data-options="region:'north',split:false" style="height:100px;">
    	<img src="image/huq.jpg" style="height:100%;width:100%">
    </div> 
     <div id="footer" data-options="region:'south',split:false,border:false"style="height:50px;">
    	<p>◎版权所有，违者必究 ！联系电话+86 13201708840 余童<p>
    </div>  
    <div data-options="region:'center'"  style="background: url('/onlineExamination/image/背景.jpg');" >
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="centerbg"  #C1CCFA>
    <tr>
    <td width="149" height="485">&nbsp;</td>
    <td width="840" valign="top" class="rightbian"  ">
    	<form action="paperAction" method="post">
    	<table  width="98%" border="0" align="center" cellpadding="0" cellspacing="10" >
    	<tr>
        <td><div align="center" class="STYLE3">进入${subject }考试</div></td>
        <td><div align="center" class="STYLE3">考生：${username }</div></td>
        <td><div align="center" class="STYLE3">试卷类型:${paper }卷</div></td>
      	</tr>
    	 <tr>
        <td><div align="center" class="STYLE3">考试时间：120 分钟</div></td>
        <td><div id="tTime" align="center"></div></td>
        <td ><div align="center" class="STYLE3">总分 ：100 分</td>
      	</tr>
    	 <tr>
       	 <td colspan="3" bgcolor="#999999" class="STYLE4">选择题(根据题目含义，选项正确的选项！)</td>
     	</tr>
     	<tr><td colspan="3" >
    	<table>
    	 <c:forEach items="${list }" var="list" >
    	 <tr>
    	 <td colspan="4" class="STYLE6">${list.id} ${list.content}</td>
    	 </tr>
    	 <tr>
    	 	<td width="400px" class="STYLE6"><input type="radio" name="${list.id}" id="${list.id}" value="A" >A. ${list.a}</td>
    	  	<td width="400px" class="STYLE6"><input type="radio" name="${list.id}" id="${list.id}" value="B" >B. ${list.b}</td> 
    	  	<td width="400px" class="STYLE6"><input type="radio" name="${list.id}" id="${list.id}" value="C" >C. ${list.c}</td> 
    	  	<td width="400px" class="STYLE6"><input type="radio" name="${list.id}" id="${list.id}" value="D" >D. ${list.d}</td>
    	  	<tr>
		</c:forEach>
			<tr><td colspan="4" align="right"><input type="image" src="/onlineExamination/image/tijiao.gif" onclick="javascript:alert('本次考试成绩即将记录！')"></td></tr>
		</table>
		</td>
		</tr>
    	</table>
    	</form>
    	</table>
    	</div>
  </body>
</html>
