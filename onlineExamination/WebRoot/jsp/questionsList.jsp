<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>questionsList.jsp</title>
    
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
		$("#searchbut").click(function(){
			$("#userDataGrid").datagrid('load',{
				qScore:$("#score").val()
			});
		});
		//添加信息
		$("#addchbut").click(function(){
			$("#addQusetionsDialogInfo").dialog({
				closed:false,	//点击后将隐藏的对话框显示出来
				closable:false,	//不显示对话框关闭按钮
				modal:true,		//窗口具有遮盖效果 背景置灰
				buttons:[{		//添加对话框按钮
					text:'保存',
					handler:function(){
						//拿到表单ID
						$("#addQusetionsFormInfo").form('submit',{
							//将表单序列化，并传递
							url:'questionsListAction?m=saveQusetionsInfo&'+$("#addQusetionsFormInfo").serialize(),
							onSubmit:function(){
							//onsubmit事件调用表单validate方法判断 输入是否合法
									$("#addQusetionsFormInfo").form('validate');
							},
							success:function(data){
							if(data=='true'){
								$.messager.alert('消息提示','添加成功','info');	//显示成功
								$("#addQusetionsFormInfo").form('clear');		//清楚表单数据
								$("#userDataGrid").datagrid('reload');		//刷新表格
								$("#addQusetionsDialogInfo").dialog({closed:true});//关闭添加面板
								}else if (data=='false') {
									$.messager.alert('消息提示','添加失败','error');	//显示失败
								}	
							}	
						});			
					}
				},{
					text:'重置',
					handler:function(){$("#addQusetionsFormInfo").form('clear');}
				},{
					text:'关闭',
					handler:function(){$("#addQusetionsDialogInfo").dialog({closed:true});}
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
				$("#updateQusetionsFormInfo").form('load',"questionsListAction?m=findQusetionsInfoById&fId="+$("#userDataGrid").datagrid('getSelected').id);				//URL加载				
				//弹出要修改的对话框
				$("#updateQusetionsDialogInfo").dialog({
				closed:false,	//将隐藏的对话框显示出来
				closable:false,	//不显示对话框关闭按钮
				modal:true,		//窗口具有遮盖效果 背景置灰
				buttons:[{		//添加对话框按钮
					text:'保存',
					handler:function(){
						//拿到表单ID
						$("#updateQusetionsFormInfo").form('submit',{
							//将表单序列化，并传递
							url:'questionsListAction?m=updateQuestionsInfo&'+$("#updateQusetionsFormInfo").serialize(),
							onSubmit:function(){
							//onsubmit事件调用表单validate方法判断 输入是否合法
									$("#updateQusetionsFormInfo").form('validate');
							},
							success:function(data){
							if(data=='true'){
								$.messager.alert('消息提示','添加成功','info');	//显示成功
								$("#updateQusetionsFormInfo").form('clear');		//清楚表单数据
								$("#userDataGrid").datagrid('reload');		//刷新表格
								$("#updateQusetionsDialogInfo").dialog({closed:true});//关闭添加面板
								}else if (data=='false') {
									$.messager.alert('消息提示','添加失败','error');	//显示失败
								}	
							}	
						});			
					}
				},{
					text:'关闭',
					handler:function(){$("#updateQusetionsDialogInfo").dialog({closed:true});}
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
				$.post("questionsListAction?m=deleteQuestionsInfoById&dId="+$("#userDataGrid").datagrid('getSelected').id,function(data){
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
			url:'questionsListAction?m=findWithPage',
			pagination:true,
			pagePosition:'both',
			//表头添加属性
			toolbar:'#tb',
			singleSelect:true,				//设置表格点击只选中一行
			rownumbers:true,				//显示行号
			striped:true					//交替显示
		});
		
	});
	</script>

  </head>
  
  <body>
  	<!-- 对话框控件 -->
  	<!-- 修改面板 -->
  	<div id="updateQusetionsDialogInfo" class="easyui-dialog" style="width: 450px;height: 200px;top: 20" title="修改试题信息" closed="true">
  		<form id="updateQusetionsFormInfo" action="" method="post">
  		<table>
  		<tr>
  			<td><label>编号</label></td>
  			<td><input id="id" type="text" name="id" class="easyui-validatebox" required="true" readonly="readonly"/></td>
  			<td><label>内容</label></td>
  			<td><input id="content" type="text" name="content" class="easyui-validatebox" required="true"/></td>
		</tr>
		
  		<tr>	
  			<td><label>选项A</label></td>
  			<td><input id="a" type="text" name="a" class="easyui-validatebox" required="true"/>
  			<td><label>选项B</label></td>
  			<td><input id="b" type="text" name="b" class="easyui-validatebox" required="true"/>
		</tr>
		<tr>	
			<td><label>选项C</label></td>
  			<td><input id="c" type="text" name="c" class="easyui-validatebox" required="true"/></td>
			<td><label>选项D</label></td>
  			<td><input id="d" type="text" name="d" class="easyui-validatebox" required="true"/></td>
  			</tr>
  			<tr>
  			<td><label>答案</label></td>
  			<td><input id="answer" type="text" name="answer" class="easyui-validatebox"  required="true"/></td>
  			<td><label>分值</label></td>
  			<td><input id="score" type="text" name="score" class="easyui-validatebox"  required="true"/></td>
  			</tr>
  			</table>
  		</form>
  	</div>
  	<!--添加面板 -->
  	<div id="addQusetionsDialogInfo" class="easyui-dialog" style="width: 450px;height: 200px;top: 20" title="添加试题信息" closed="true">
  		<form id="addQusetionsFormInfo" action="" method="post">
  		<table>
  		<tr>
  			<td><label>内容</label></td>
  			<td><input id="content" type="text" name="content" class="easyui-validatebox" required="true"/></td>
		</tr>
		
  		<tr>	
  			<td><label>选项A</label></td>
  			<td><input id="a" type="text" name="a" class="easyui-validatebox" required="true"/>
  			<td><label>选项B</label></td>
  			<td><input id="b" type="text" name="b" class="easyui-validatebox" required="true"/>
		</tr>
		<tr>	
			<td><label>选项C</label></td>
  			<td><input id="c" type="text" name="c" class="easyui-validatebox" required="true"/></td>
			<td><label>选项D</label></td>
  			<td><input id="d" type="text" name="d" class="easyui-validatebox" required="true"/></td>
  			</tr>
  			<tr>
  			<td><label>答案</label></td>
  			<td><input id="answer" type="text" name="answer" class="easyui-validatebox"  required="true"/></td>
  			<td><label>分值</label></td>
  			<td><input id="score" type="text" name="score" class="easyui-validatebox"  required="true"/></td>
  			</tr>
  			</table>
  		</form>
  	</div>
  	
  	<!--表格头部工具栏,搜索索引 -->
  	<div id="tb">
  		<table>
  			<tr>
  			<td><label>分值</label></td>
  			<td><input id="score" type="text" name="score" class="easyui-validatebox" />
  			<a href="javascript:void(0)" id="searchbut" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a></td>
  			</tr>
  		</table>
  		<a id="addchbut" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
  		<a id="removechbut" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a> 
  		<a id="editchbut" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a> 
  	</div>
  	
   <table id="userDataGrid" class="easyui-datagrid">
      <thead>
      	<tr>
      	<!-- 列字段field要和实体类的属性名一致 -->
      	<th data-options="field:'id', width:100">题号</th>	
      	<th data-options="field:'content', width:100">内容</th>
      	<th data-options="field:'a', width:100">选项A</th>
      	<th data-options="field:'b', width:100">选项B</th>
      	<th data-options="field:'c', width:100">选项C</th>
      	<th data-options="field:'d', width:100">选项D</th>
      	<th data-options="field:'answer', width:100">答案</th>
      	<th data-options="field:'score', width:100">分值</th>
      	
      	</tr>
      </thead>
      <tbody>
      
      </tbody>
    </table>
  </body>
</html>
