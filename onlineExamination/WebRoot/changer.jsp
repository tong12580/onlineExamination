<%@taglib uri="/struts-tags" prefix="s"%><%@ taglib uri="/struts-dojo-tags" prefix="sx" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    
    <title>科目选择</title>
    
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
    
  </head>
	<s:head theme="xhtml"/>
	<sx:head parseContent="true"/>
   <body class="easyui-layout"> 
    <script language="javascript">window.history.forward(-1);</script>
   <% 
   		List <String> subject =new ArrayList<String>();
   		subject.add("高等数学");
   		subject.add("大学英语");
   		request.setAttribute("subject", subject);
    %> 
   <div	 data-options="region:'north',split:false" style="height:100px;">
    	<img src="image/huq.jpg" style="height:100%;width:100%">
    </div> 
     <div id="footer" data-options="region:'south',split:false,border:false"style="height:50px;">
    	<p>◎版权所有，违者必究 ！联系电话+86 13201708840 余童<p>
    </div>  
    <div data-options="region:'center'" style="background:url('/onlineExamination/image/背景.jpg');" >
    	<s:form action="chagerAction" method="get">
    	<table align="center"  bgcolor="#D9E0FC" style="margin-top:80px">
			<tr><td>
			<sx:autocompleter name="subject" label="请选择考试科目" list="%{#request.subject}"></sx:autocompleter>
			</td></tr>
			<tr><td /></tr>
			<tr><td /></tr>
			<tr><td /></tr>
			<tr><td><s:submit value="确认"></s:submit></td></tr>
    	</table>
    	</s:form>
    </div>
  </body>
</html>
