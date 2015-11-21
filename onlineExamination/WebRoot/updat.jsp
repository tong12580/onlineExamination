<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改个人信息</title>
    
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
	 <link href="css/login.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	$(function(){
		 	$.extend($.fn.validatebox.defaults.rules, {   
		    	minLength: {   
		        validator: function(value, param){   
		            return value.length >= param[0];   
       		 },   
        	message: '请保证输入长度 真确 {0} .'  
   	 		}   
		}); 
		$.extend($.fn.validatebox.defaults.rules, {   
		    equals: {   
		        validator: function(value,param){   
		            return value == $(param[0]).val();   
		        },   
		        message: '两次输入的内容不相同'  
		    }   
		});  
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
    <div data-options="region:'center'" style="background:  url('/onlineExamination/image/背景.jpg');" >
		<s:form action="updatAction" method="post">
		<table  bgcolor="#D9E0FC" style="margin-top:20px" width="208"border="0" align="center" cellpadding="5" cellspacing="0">
		  <tr>
		    <td bgcolor="#BBC7FB" class="title">+ 修改用户信息</td>
		  </tr>
		  <tr>
		    <td class="grey" bgcolor= "#D3DCFD"><img src="/onlineExamination/image/warning.gif" width="16" height="16" align="absmiddle">请根据提示修改用户信息</td>
		  </tr>
		   <tr>
		    <td class="title" bgcolor=#C9D2F9>您好${username }同学</td>
		  </tr>
		  <tr>
		    <td class="title">请输入密码</td>
		  </tr>
		  <tr>
		    <td><a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-lock',plain:true"><input id="pwd" name="pwd" type="password" class="easyui-validatebox" data-options="required:true,validType:'minLength[5]'" size="30"/></td>
		  </tr>
		   <tr>
		  <td class="title" bgcolor=#C9D2F9>请确认密码</td>
		  </tr>
		  <tr>
		    <td><a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-lock',plain:true"><input id="rpwd" size="30" name="rpwd" type="password" class="easyui-validatebox"  required="required" validType="equals['#pwd']" /></td>
		  </tr>
		  <tr>
		  <td class="title" bgcolor=#C9D2F9>
		  	宿舍号 <input name="adds" type="text" size="6" data-options="required:true,validType:'length[0,100]:'" >&nbsp;&nbsp;&nbsp;&nbsp;
		  	邮 箱 <input name="email" class="easyui-validatebox" data-options="required:true,validType:'email'" size="6"/>  
		  	</td>
		  </tr>
		  <tr>
		  <td class="title"  bgcolor=#C9D2F9>联系电话 +86 <input name="tel" class="easyui-validatebox" data-options="required:true,validType:'length[0,100]:'" />  
			</td>
		  </tr>
		  <tr>
		    <td align="right"><input type="image" src="/onlineExamination/image/tijiao.gif" width="70" height="21"></td>
		  </tr>
		</table>
		<p>&nbsp;</p>
		<br />  
		</s:form>
	</div>
  
  </body>
</html>
