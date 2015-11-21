<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
    <div data-options="region:'center'" style="background: url('/onlineExamination/image/背景.jpg');" >
		<s:form action="registerAction" method="post">
		<table  bgcolor="#D9E0FC" style="margin-top:20px" width="208"border="0" align="center" cellpadding="5" cellspacing="0">
		  <tr>
		    <td bgcolor="#BBC7FB" class="title">+ 注册信息</td>
		  </tr>
		  <tr>
		    <td class="grey" bgcolor= "#D3DCFD"><img src="/onlineExamination/image/warning.gif" width="16" height="16" align="absmiddle">请根据提示注册用户信息</td>
		  </tr>
		   <tr>
		    <td class="title" bgcolor=#C9D2F9>请输入学号</td>
		  </tr>
		  <tr>
		    <td><a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-man',plain:true"><input type="text" name="studentid" size="30" id="username" class="easyui-validatebox" data-options="required:true,validType:'minLength[5]' " /></td>
		  </tr>
		  <tr>
		    <td class="title" bgcolor=#C9D2F9>
		    	请输入姓名 <input  name="username" type="text"  class="easyui-validatebox" data-options="required:true"size="6"> &nbsp;
		    	性 别 <input type="radio" name="sex" value="男">男 
			  		<input type="radio" name="sex" value="女">女
		    </td>
		  </tr>
		  <tr>
		    <td class="title" bgcolor=#C9D2F9>请输入密码</td>
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
		  	宿舍号 <input name="adds" type="text" size="8" class="easyui-validatebox" data-options="required:true,validType:'length[0,100]:'" >&nbsp;&nbsp;&nbsp;&nbsp;
		  	邮 箱 <input name="email" class="easyui-validatebox" data-options="required:true,validType:'email'" size="8"/>  
		  	</td>
		  </tr>
		  <tr>
		  <td class="title" bgcolor=#C9D2F9>联系电话 +86 <input name="tel" class="easyui-validatebox" data-options="required:true,validType:'length[0,100]:'" />  
</td>
		  </tr>
		  <tr>
		    <td align="right"><input type="image" src="/onlineExamination/image/zhuce.gif" width="70" height="21"></td>
		  </tr>
		</table>
		<p>&nbsp;</p>
		<br />  
		</s:form>
	</div>
</body>
</html>
