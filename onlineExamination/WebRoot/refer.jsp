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
    
    <title>成绩查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"></link>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <link href="css/first.css" rel="stylesheet" type="text/css" />
	<link href="css/a.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">window.history.forward(-1);</script>
  </head>
  <body class="easyui-layout">  
   <div	 data-options="region:'north',split:false" style="height:100px;">
    	<img src="image/huq.jpg" style="height:100%;width:100%">
    </div> 
     <div id="footer" data-options="region:'south',split:false,border:false"style="height:50px;">
    	<p>◎版权所有，违者必究 ！联系电话+86 13201708840 余童<p>
    </div>  
 <div data-options="region:'center'"   style="background: url('/onlineExamination/image/背景.jpg');">
    <h3 align="right" ><a href="index.jsp">返回首页</a></h3>
    <hr>
	  	<div id="container">   
		<table class="zebra">
	    <caption>最终得分</caption>
			<thead>
	        	<tr>
					<th>学号</th>
					<th>姓名</th>
					<th>科目</th>
					<th>得分</th>
					<th>成绩水准</th>
	            </tr>
			</thead>
	        <tbody>
	        	<tr>
	            	<td>${studentid }</td>
	                <td>${username }</td>
	                <td>${subject}</td>
	                <td>${socer }</td>
	               <td align="center">
	               	<c:choose>
			    		<c:when test="${socer>90 }">
			    			<font color="green">成绩优秀</font>
			    		</c:when>
			    		<c:when test="${socer<=90 and socer>=60 }">
			    			<font color="blue">成绩合格</font>
			    		</c:when>
			    		<c:otherwise>
			    			<font color="red">需要重修</font>
			    		</c:otherwise>
			    	</c:choose>
			    </td>
	            </tr>
	            
	        </tbody>
		</table>
	</div>
    </div>
  </body>
</html>
