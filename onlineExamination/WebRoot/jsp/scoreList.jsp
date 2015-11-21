<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>scoreList.jsp</title>
    
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
	<script type="text/javascript">
	$(function(){
		//为查询按钮添加点击事件
		$("#searchbut").click(function(){
			$("#scoreDataGrid").datagrid('reload',{
				sName:$("#username").val(),			//获取需要传入的参数
				sSubject:$("#subject").val()
			});
		});
		//数据表格控件
		$("#scoreDataGrid").datagrid({
			fit:true,
			fitColumns:true,
			url:'scoreListAction?m=findWithPage',
			pagination:true,
			pagePosition:'both',
			//表头添加属性
			toolbar:'#tb',					//获取头部id
			singleSelect:true,				//设置表格点击只选中一行
			rownumbers:true,				//显示行号
			striped:true					//交替显示
		});
		
	});
	</script>
  </head>
  
  <body>
  	<!--表格头部工具栏,搜索索引 -->
  	<div id="tb">
  		<table>
  			<tr>
  			<td><label>姓名</label></td>
  			<td><input id="username" type="text" name="username" class="easyui-validatebox" /></td>
  			<td><label>科目</label></td>
  			<td><input id="subject" type="text" name="subject" class="easyui-validatebox" />
  			<a href="javascript:void(0)" id="searchbut" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a></td>
  			</tr>
  		</table>
  	</div>
  	
    <table id="scoreDataGrid" class="easyui-datagrid">
      <thead>
      	<tr>
      	<!-- 列字段field要和实体类的属性名一致 -->
      	<th data-options="field:'studentid', width:100">学号</th>	
      	<th data-options="field:'username', width:100">姓名</th>
      	<th data-options="field:'subject', width:100">科目</th>
      	<th data-options="field:'score', width:100">得分</th>
      	</tr>
      </thead>
      <tbody>
      
      </tbody>
    </table>
  </body>
</html>
