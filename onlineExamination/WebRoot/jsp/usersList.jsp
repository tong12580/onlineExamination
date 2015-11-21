<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>usersList.jsp</title>
    
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
			//调用表格控件的重载页面方法
			$("#userDataGrid").datagrid('reload',{
				 uName:$("#username").val(),	//获取id为username的值
				uSex:$("#sex").val(),
				uPower:$("#power").val()
			});
		});
		
		//添加信息
		$("#addchbut").click(function(){
			$("#addUserDialogInfo").dialog({
				closed:false,	//点击后将隐藏的对话框显示出来
				closable:false,	//不显示对话框关闭按钮
				modal:true,		//窗口具有遮盖效果 背景置灰
				buttons:[{		//添加对话框按钮
					text:'保存',
					handler:function(){
						//拿到表单ID
						$("#addUserFormInfo").form('submit',{
							//将表单序列化，并传递
							url:'usersListAction?m=saveUsersInfo&'+$("#addUserFormInfo").serialize(),
							onSubmit:function(){
							//onsubmit事件调用表单validate方法判断 输入是否合法
									$("#addUserFormInfo").form('validate');
							},
							success:function(data){
							if(data=='true'){
								$.messager.alert('消息提示','添加成功','info');	//显示成功
								$("#addUserFormInfo").form('clear');		//清楚表单数据
								$("#userDataGrid").datagrid('reload');		//刷新表格
								$("#addUserDialogInfo").dialog({closed:true});//关闭添加面板
								}else if (data=='false') {
									$.messager.alert('消息提示','添加失败','error');	//显示失败
								}	
							}	
						});			
					}
				},{
					text:'重置',
					handler:function(){$("#addUserFormInfo").form('clear');}
				},{
					text:'关闭',
					handler:function(){$("#addUserDialogInfo").dialog({closed:true});}
				}]
			});
		});
		//修改信息
		$("#editchbut").click(function(){
		//返回一条选中记录，并判断是否非空
			if($("#userDataGrid").datagrid('getSelected')==null){
				$.messager.alert('消息提示','请选择要修改的信息','warning');	//选择提示
			}else{
				//拿到要修改的表单
				$("#updateUserFormInfo").form('load',"usersListAction?m=findUserInfoById&fId="+$("#userDataGrid").datagrid('getSelected').studentid);				//URL加载				
				//弹出要修改的对话框
				$("#updateUserDialogInfo").dialog({
				closed:false,	//将隐藏的对话框显示出来
				closable:false,	//不显示对话框关闭按钮
				modal:true,		//窗口具有遮盖效果 背景置灰
				buttons:[{		//添加对话框按钮
					text:'保存',
					handler:function(){
						//拿到表单ID
						$("#updateUserFormInfo").form('submit',{
							//将表单序列化，并传递
							url:'usersListAction?m=updateUserInfo&'+$("#updateUserFormInfo").serialize(),
							onSubmit:function(){
							//onsubmit事件调用表单validate方法判断 输入是否合法
									$("#updateUserFormInfo").form('validate');
							},
							success:function(data){
							if(data=='true'){
								$.messager.alert('消息提示','添加成功','info');	//显示成功
								$("#updateUserFormInfo").form('clear');		//清楚表单数据
								$("#userDataGrid").datagrid('reload');		//刷新表格
								$("#updateUserDialogInfo").dialog({closed:true});//关闭添加面板
								}else if (data=='false') {
									$.messager.alert('消息提示','添加失败','error');	//显示失败
								}	
							}	
						});			
					}
				},{
					text:'关闭',
					handler:function(){$("#updateUserDialogInfo").dialog({closed:true});}
				}]
				});
			}
		});
		//删除信息
		$("#removechbut").click(function(){
			//返回一条选中记录，并判断是否非空
			if($("#userDataGrid").datagrid('getSelected')==null){
				$.messager.alert('消息提示','请选择要删除的信息','warning');	//选择提示
			}else{
				//调用jp.ajax方法  获取删除的ID和回调参数
				$.post("usersListAction?m=deleteUserInfoById&dId="+$("#userDataGrid").datagrid('getSelected').studentid,function(data){
					if(data=='true'){
								$.messager.show({
											title:'消息提示',
											msg:'删除成功',
											timeout:3000,
											showType:'slide'
											});								//显示成功
								$("#userDataGrid").datagrid('reload');		//刷新表格
								}else if (data=='false') {
									$.messager.show({
											title:'消息提示',
											msg:'删除失败',
											timeout:3000,
											showType:'slide'
											});		//显示失败
								}	
				});			
			}
		});
		//数据表格控件
		$("#userDataGrid").datagrid({
			fit:true,
			fitColumns:true,
			url:'usersListAction?m=findWithPage',
			pagination:true,				//防止左右滑动
			pagePosition:'both',			//显示在上下两端
			//在表格头部添加工具栏属性
			toolbar:'#tb',					//获取头部id
			singleSelect:true,				//设置表格点击只选中一行
			rownumbers:true,				//显示行号
			striped:true					//交替显示
		});
		
	});
	</script>
  </head>
  
  <body >
  
  	<!-- 对话框控件 -->
  	<!-- 修改面板 -->
  	<div id="updateUserDialogInfo" class="easyui-dialog" style="width: 450px;height: 200px;top: 20" title="修改用户信息" closed="true">
  		<form id="updateUserFormInfo" action="" method="post">
  		<table>
  		<tr>
  			<td><label>编号</label></td>
  			<td><input id="studentid" type="text" name="studentid" class="easyui-validatebox" required="true" readonly="readonly"/></td>
  			<td><label>姓名</label></td>
  			<td><input id="username" type="text" name="username" class="easyui-validatebox" required="true"/></td>
		</tr>
		
  		<tr>	
  			<td><label>密码</label></td>
  			<td><input id="password" type="text" name="password" class="easyui-validatebox" required="true"/>
  			<td><label>性别</label></td>
  			<td><select id="sex" class="easyui-combobox" name="sex" style="width:150px;">  
   		 		<option value="男">男</option>  
    			<option value="女">女</option>  
				</select></td>
		</tr>
		<tr>	
			<td><label>权限</label></td>
  			<td><select id="power" class="easyui-combobox" name="power" style="width:150px;" required="true">  
   		 		<option value="2">教师</option>  
    			<option value="1">学生</option>  
				</select></td>
			<td><label>地址</label></td>
  			<td><input id="adds" type="text" name="adds" class="easyui-validatebox" /></td>
  			</tr>
  			<tr>
  			<td><label>电话</label></td>
  			<td><input id="tel" type="text" name="tel" class="easyui-validatebox" /></td>
  			<td><label>邮箱</label></td>
  			<td><input id="mail" type="text" name="mail" class="easyui-validatebox" /></td>
  			</tr>
  			</table>
  		</form>
  	</div>
  	<!-- 添加面板 -->
  	<div id="addUserDialogInfo" class="easyui-dialog" style="width: 450px;height: 200px;top: 20" title="添加用户信息" closed="true">
  		<form id="addUserFormInfo" action="" method="post">
  		<table>
  		<tr>
  			<td><label>编号</label></td>
  			<td><input id="studentid" type="text" name="studentid" class="easyui-validatebox" required="true"/></td>
  			<td><label>姓名</label></td>
  			<td><input id="username" type="text" name="username" class="easyui-validatebox" required="true"/></td>
		</tr>
		
  		<tr>	
  			<td><label>密码</label></td>
  			<td><input id="password" type="text" name="password" class="easyui-validatebox" required="true"/>
  			<td><label>性别</label></td>
  			<td><select id="sex" class="easyui-combobox" name="sex" style="width:150px;">  
   		 		<option value="男">男</option>  
    			<option value="女">女</option>  
				</select></td>
		</tr>
		<tr>	
			<td><label>权限</label></td>
  			<td><select id="power" class="easyui-combobox" name="power" style="width:150px;" required="true">  
   		 		<option value="2">教师</option>  
    			<option value="1">学生</option>  
				</select></td>
			<td><label>地址</label></td>
  			<td><input id="adds" type="text" name="adds" class="easyui-validatebox" /></td>
  			</tr>
  			<tr>
  			<td><label>电话</label></td>
  			<td><input id="tel" type="text" name="tel" class="easyui-validatebox" /></td>
  			<td><label>邮箱</label></td>
  			<td><input id="mail" type="text" name="mail" class="easyui-validatebox" /></td>
  			</tr>
  			</table>
  		</form>
  	</div>
  	
  	
  	<!--表格头部工具栏,搜索索引 -->
  	<div id="tb">
  		<table>
  			<tr>
  			<td><label>姓名</label></td>
  			<td><input id="username" type="text" name="username" class="easyui-validatebox" /></td>
  			<td><label>性别</label></td>
  			<td><input id="sex" type="text" name="sex" class="easyui-validatebox" />
  			<td><label>权限</label></td>
  			<td><input id="power" type="text" name="power" class="easyui-validatebox" />
  			<a href="javascript:void(0)" id="searchbut" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
  			</td>
  			</tr>
  		</table>
  		<a id="addchbut" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
  		<a id="removechbut" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a> 
  		<a id="editchbut" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a> 
  	</div>
  	
  	<!--数据表格控件 -->
    <table id="userDataGrid" class="easyui-datagrid">
      <thead>
      	<tr>
      	<!-- 列字段field要和实体类的属性名一致 -->
      	<th data-options="field:'studentid', width:100">学号或教师编号</th>	
      	<th data-options="field:'username', width:100">姓名</th>
      	<th data-options="field:'password', width:100">密码</th>
      	<th data-options="field:'sex', width:100">性别</th>
      	<th data-options="field:'adds', width:100">地址</th>
      	<th data-options="field:'tel', width:100">电话</th>
      	<th data-options="field:'mail', width:100">邮箱</th>
      	<th data-options="field:'power', width:100">权限(1为学生2为教师)</th>
      	</tr>
      </thead>
      <tbody>
      
      </tbody>
    </table>
  </body>
</html>
