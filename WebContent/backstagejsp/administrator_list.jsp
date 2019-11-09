<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link href="css/shop.css" type="text/css" rel="stylesheet" />
	<link href="css/Sellerber.css" type="text/css" rel="stylesheet" />
	<link href="css/bkg_ui.css" type="text/css" rel="stylesheet" />
	<link href="font/css/font-awesome.min.css" rel="stylesheet"
		type="text/css" />
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/Validform/Validform.min.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script src="js/shopFrame.js" type="text/javascript"></script>
	<script src="js/Sellerber.js" type="text/javascript"></script>
	<script src="js/layer/layer.js" type="text/javascript"></script>
	<title>管理员列表</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>

<script type="text/javascript">
<!--

//-->


function multDel() {
	
	  layer.confirm('确认要删除吗？',function(index){
		  
		  var MDuserState="";
    	  var mdobj=$("input[name='Multiple_selection']");
    	  mdobj.each(function(i,x) {
				if (x.checked) {
					MDuserState+=x.value+",";
				}
			  });
    	  
    	  $.post("../UserInfo/mdDelUser.do",{userIds:MDuserState},function(data){
    		  
    		if (data==1) {
				layer.msg('已删除!',{icon:6,time:1000});
			} else if(data==2) {
				layer.msg('删除失败!',{icon:5,time:1000});
			}else if(data==3){
				layer.msg('部分删除失败!',{icon:0,time:1000});
			}
    		
    		init();
    	  });
    	  		  
	  });
		
	}
</script>



	<div class="margin Competence_style" id="page_style">
		<div class="operation clearfix">
			<button class="btn button_btn btn-danger" type="button" onclick="multDel()">
				<i class="fa fa-trash-o"></i>&nbsp;删除
			</button>
			<a href="javascript:ovid()" id="administrator_add"
				class="btn button_btn bg-deep-blue"><i class="fa  fa-edit"></i>&nbsp;添加管理员</a>
			<select class="select Competence_sort" name="admin-role" size="1"
				id="Competence_sort">
				<option value="0">--选择分类--</option>
				<option value="1">超级管理员</option>
				<option value="2">普通管理员</option>
				<option value="3">栏目编辑</option>
			</select>
			<div class="search  clearfix">

				<input name="" id="userName" type="text"
					class="form-control col-xs-8" />
				<button class="btn button_btn bg-deep-blue " onclick="selLocal()"
					type="button">
					<i class="fa  fa-search"></i>&nbsp;搜索
				</button>
			</div>
		</div>
		<div class="compete_list">
			<table id="sample_table"
				class="table table_list table_striped table-bordered dataTable no-footer">
				<thead>
					<tr>
						<th class="center"><label><input type="checkbox"
								class="ace"><span class="lbl"></span></label></th>
						<th>登录名</th>
						<th>手机</th>
						<th>邮箱</th>
						<th>角色</th>
						<th class="hidden-480">加入时间</th>
						<th>状态</th>
						<th class="hidden-480">操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="center"><label><input type="checkbox"
								class="ace"><span class="lbl"></span></label></td>
						<td>admin123456</td>
						<td>13567878908</td>
						<td>3456778@qq.com</td>
						<td>超级管理员</td>
						<td>2016-9-20 10:23:23</td>
						<td class="td-status"><span
							class="label label-success label-sm">已启用</span></td>
						<td class="td-manage"><a title="停用"
							onclick="Competence_close(this,'12')" href="javascript:;"
							class="btn button_btn btn-Dark-success">停用</a> <a title="编辑"
							onclick="Competence_modify('560')" href="javascript:;"
							class="btn button_btn bg-deep-blue">编辑</a> <a title="删除"
							href="javascript:;" onclick="Competence_del(this,'1')"
							class="btn button_btn btn-danger">删除</a> <a title="查看"
							href="javascript:;" onclick="Competence_View(this,'1')"
							class="btn button_btn btn-green">查看</a></td>
					</tr>
					<tr>
						<td class="center"><label><input type="checkbox"
								class="ace"><span class="lbl"></span></label></td>
						<td>化海天堂</td>
						<td>13567878908</td>
						<td>3456778@qq.com</td>
						<td>普通管理员</td>
						<td>2016-9-20 10:23:23</td>
						<td class="td-status"><span
							class="label label-success label-sm">已启用</span></td>
						<td class="td-manage"><a title="停用"
							onclick="Competence_close(this,'12')" href="javascript:;"
							class="btn button_btn btn-Dark-success">停用</a> <a title="编辑"
							onclick="Competence_modify('560')" href="javascript:;"
							class="btn button_btn bg-deep-blue">编辑</a> <a title="删除"
							href="javascript:;" onclick="Competence_del(this,'1')"
							class="btn button_btn btn-danger">删除</a> <a title="查看"
							href="javascript:;" onclick="Competence_View(this,'1')"
							class="btn button_btn btn-green">查看</a></td>
					</tr>
					<tr>
						<td class="center"><label><input type="checkbox"
								class="ace"><span class="lbl"></span></label></td>
						<td>admin</td>
						<td>13567878908</td>
						<td>3456778@qq.com</td>
						<td>普通管理员</td>
						<td>2016-9-10 10:23:23</td>
						<td class="td-status"><span
							class="label label-success label-sm">已启用</span></td>
						<td class="td-manage"><a title="停用"
							onclick="Competence_close(this,'12')" href="javascript:;"
							class="btn button_btn btn-Dark-success">停用</a> <a title="编辑"
							onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"
							class="btn button_btn bg-deep-blue">编辑</a> <a title="删除"
							href="javascript:;" onclick="member_del(this,'1')"
							class="btn button_btn btn-danger">删除</a> <a title="查看"
							href="javascript:;" onclick="Competence_View(this,'1')"
							class="btn button_btn btn-green">查看</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!--添加管理员-->
	<div id="add_administrator" class=" add_administrator"
		style="display: none">
		<div class="add_style add_administrator_style">
			<form action="" method="post" id="form-admin-add">
				<ul>
					<li class="clearfix"><label
						class="label_name col-xs-2 col-lg-2"><i>*</i>用户名：</label>
						<div class="formControls col-xs-6">
							<input type="text" class="input-text col-xs-12" value=""
								placeholder="输入昵称" id="user-name" name="userName" datatype="*2-16">
						</div>
						<div class="col-4">
							<span class="Validform_checktip"></span>
						</div></li>
					<li class="clearfix"><label
						class="label_name col-xs-2 col-lg-2"><i>*</i>登陆账号：</label>
						<div class="formControls col-xs-6">
							<input type="text" class="input-text col-xs-12" value=""
								placeholder="输入账号" id="user-account" name="userAccount" datatype="*2-16"
								nullmsg="用户id不能为空">
								
						</div>
						<div class="col-4">
							<span class="Validform_checktip"></span>
						</div></li>
					
					<li class="clearfix"><label
						class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>初始密码：</label>
						<div class="formControls col-xs-6">
							<input type="password" placeholder="密码" name="userPwd"
								autocomplete="off" value="" class="input-text col-xs-12"
								datatype="*6-20" nullmsg="密码不能为空">
						</div>
						<div class="col-4">
							<span class="Validform_checktip"></span>
						</div></li>
					<li class="clearfix"><label
						class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>确认密码：</label>
						<div class="formControls  col-xs-6">
							<input type="password" placeholder="确认新密码" autocomplete="off"
								class="input-text Validform_error  col-xs-12"
								errormsg="您两次输入的密码不一致！" datatype="*" nullmsg="请再输入一次新密码！"
								recheck="userPwd" id="newpassword2" name="userPwd2">
						</div>
						<div class="col-4">
							<span class="Validform_checktip"></span>
						</div></li>
					<li class="clearfix"><label
						class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>性&nbsp;别：</label>
						<div class="formControls  skin-minimal col-xs-6">
							<label><input name="form-field-radio" type="radio" value="2"
								class="ace" checked="checked"><span class="lbl">保密</span></label>&nbsp;&nbsp;
							<label><input name="form-field-radio" type="radio" value="1"
								class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp; <label><input
								name="form-field-radio" type="radio" class="ace" value="0"><span
									class="lbl">女</span></label>
						</div></li>
					<li class="clearfix"><label
						class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>手&nbsp;机：</label>
						<div class="formControls col-xs-6">
							<input type="text" class="input-text col-xs-12" value=""
								placeholder="" id="user-tel" name="userPhone" datatype="m"
								nullmsg="手机不能为空">
						</div>
						<div class="col-4">
							<span class="Validform_checktip"></span>
						</div></li>
					<li class="clearfix"><label
						class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>邮&nbsp;箱：</label>
						<div class="formControls col-xs-6">
							<input type="text" class="input-text col-xs-12" placeholder="@"
								name="UserEmail" id="email" datatype="e" nullmsg="请输入邮箱！">
						</div>
						<div class="col-4">
							<span class="Validform_checktip"></span>
						</div></li>
					<li class="clearfix"><label
						class="label_name col-xs-2 col-lg-2"><i class="c-red">*</i>角&nbsp;色：</label>
						<div class="formControls col-xs-6">
							<span class="select-box" style="width: 150px;"> <select
								class="select" name="userPower" size="1">
									<!-- <option value="5">超级管理员</option> -->
									<option value="0">管理员</option>
								<!-- 	<option value="2">栏目主辑</option>
									<option value="3">栏目编辑</option> -->
							</select>
							</span>
						</div></li>
					<li class="clearfix"><label
						class="label_name col-xs-2 col-lg-2">备&nbsp;注：</label>
						<div class="formControls col-xs-6">
							<textarea name="userAge" cols="" rows="" class="textarea col-xs-12"
								placeholder="说点什么...100个字符以内" dragonfly="true"
								onkeyup="checkLength(this);"></textarea>
							<span class="wordage">剩余字数：<span id="sy"
								style="color: Red;">100</span>字
							</span>
						</div></li>
					<!-- <li class="clearfix col-xs-12 col-lg-12 align"><input
						class="btn button_btn bg-deep-blue btn_height" type="button"
						id="Add_Administrator" value="提交注册"> <input name="reset"
							type="reset" class="btn button_btn btn-infobtn-gray btn_height"
							value="取消重置" /></li> -->
				</ul>
			</form>
		</div>
	</div>
	
	<!--添加用户图层-->
	<div class="add_menber" id="add_menber_style" style="display: none">
		
		<ul class=" page-content">
			<li><label class="label_name">用&nbsp;&nbsp;户 &nbsp;名：</label><span
				class="add_name"><input value="" id="bjUserName" name="用户名" type="text"
					class="text_add" /></span>
				<div class="prompt r_f"></div></li>
			<li><label class="label_name">用&nbsp;&nbsp;户&nbsp;ID：</label><span
				class="add_name"><input type="hidden" id="bjUserId" value=""/><input id="bjUserAccount" name="用户id" type="text"
					class="text_add" readonly="readonly"/></span>
				<div class="prompt r_f"></div></li>
			<li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span
				class="add_name"> <label><input value="1"
						name="form-field-radio2" type="radio" checked="checked" class="ace"><span
							class="lbl">男</span></label>&nbsp;&nbsp;&nbsp; <label><input value="0"
						name="form-field-radio2" type="radio" class="ace"><span
							class="lbl">女</span></label>&nbsp;&nbsp;&nbsp; <label><input value="2"
						name="form-field-radio2" type="radio" class="ace"><span
							class="lbl">保密</span></label>
			
				<div class="prompt r_f"></div></li>
			<li><label class="label_name">固定电话：</label><span
				class="add_name"><input id="bjGdPhone" name="固定电话" type="text"
					class="text_add" /></span>
				<div class="prompt r_f"></div></li>
			<li><label class="label_name">移动电话：</label><span
				class="add_name"><input id="bjYdPhone" name="移动电话" type="text"
					class="text_add" /></span>
				<div class="prompt r_f"></div></li>
			<!-- <li><label class="label_name">电子邮箱：</label><span
				class="add_name"><input id="bjEamil" name="电子邮箱" type="text"
					class="text_add" /></span><c:if test="${1==1 }"></c:if>
				<div class="prompt r_f"></div></li> -->
				
			<li class="adderss"><label class="label_name">家庭住址：</label><span
				class="add_name"><input id="bjAdress" name="家庭住址" type="text"
					class="text_add" style="width: 350px" /></span>
				<div class="prompt r_f"></div></li>
			<li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label>
				<span class="add_name"> <label><input value="1"
						name="form-field-radio1" type="radio" checked="checked"
						class="ace"><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;
					<label><input value="0" name="form-field-radio1" type="radio"
						class="ace"><span class="lbl">关闭</span></label>
			</span>
				<div class="prompt r_f"></div></li>
		</ul>
	</div>
</body>
</html>
<script>
	

	/*  <tr>
	 <td class="center"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
	 <td>admin</td>
	 <td>13567878908</td>
	 <td >3456778@qq.com</td>
	 <td>普通管理员</td>
	 <td>2016-9-10 10:23:23</td>
	 <td class="td-status"><span class="label label-success label-sm">已启用</span></td>
	 <td class="td-manage">
	 <a title="停用" onclick="Competence_close(this,'12')" href="javascript:;" class="btn button_btn btn-Dark-success">停用</a> 
	 <a title="编辑" onclick="Competence_modify('560')" href="javascript:;" class="btn button_btn bg-deep-blue">编辑</a>        
	 <a title="删除" href="javascript:;" onclick="Competence_del(this,'1')" class="btn button_btn btn-danger">删除</a>
	 <a title="查看" href="javascript:;" onclick="Competence_View(this,'1')" class="btn button_btn btn-green">查看</a>
	 </td>
	 </tr>			 */

	 
	 init();
	 
	 function selLocal() {

			init();
		}
	 
	 
	function init() {

		$("#sample_table tr:gt(0)").remove();

		$.ajax({

			url : '../UserInfo/selAllAdmin.do',
			type : 'post',
			data : {

				"userName" : $("#userName").val(),
			},
			dataType : 'json',
			success : function(data) {
				var obj=eval(data);
				$.each(obj,function(i,x){

					var state="";
					var stategl="";
					var btn ="";
					var btn2 ="";
					var tds="";
					var xx=x.userPower;
					var checks = "";
					
					if (x.userPower==0) {
						stategl="普通管理员";
						if (x.userState==1) {
							state="已启用";
							tds="success";
							checks = "<td class='center'><label><input name='Multiple_selection' type='checkbox' class='ace' value='"+x.userId+"'><span class='lbl'></span></label></td>";	
							btn="<a title='停用' onclick='Competence_close(this,"+x.userId+")' href='javascript:;' class='btn button_btn btn-Dark-success'>停用</a>";
							btn2="<a title='删除' href='javascript:;' onclick="+"member_del("+x.userId+")"+" class='btn button_btn btn-danger'>删除</a>";
							
						} else if(x.userState==0){
							state="已停用";
							tds="defaunt";
							btn="<a style='text-decoration:none' class='btn button_btn btn-gray' onClick='Competence_start(this,"+x.userId+")' href='javascript:;' title='启用'>启用</a>";
							btn2="<a title='删除' href='javascript:;' onclick="+"member_del("+x.userId+")"+" class='btn button_btn btn-danger'>删除</a>";
							checks = "<td class='center'><label><input name='Multiple_selection' type='checkbox' class='ace' value='"+x.userId+"'><span class='lbl'></span></label></td>";	
						}
					
					}else if(x.userPower==5){
						stategl="超级管理员";
						if (x.userState==1) {
							state="已启用";
							tds="success";
							checks = "<td class='center'><label><input disabled='false' name='Multiple_selection1' type='checkbox' class='ace' value='"+x.userId+"'><span class='lbl'></span></label></td>";	
									
						} else if(x.userState==0){
							state="已停用";
							tds="defaunt";
							checks = "<td class='center'><label><input disabled='false' name='Multiple_selection1' type='checkbox' class='ace' value='"+x.userId+"'><span class='lbl'></span></label></td>";	
						}
					}				
					
					var $str="<tr>"+checks+""
					+"<td>"+x.userName+"</td>"
					+"<td>"+x.userPhone+"</td>"
					+"<td>"+x.userEmail+"</td>"
					+"<td>"+stategl+"</td>"
					+"<td>"+x.userRegTime+"</td>"
					+"<td class='td-status'><span class='label label-"+tds+"  label-sm'>"+state+"</span></td>"				
					+"<td class='td-manage'>"+btn+" <a title='编辑' onclick="+"member_edit("+x.userId+",'member-add.html','4','','510')"+" href='javascript:;' class='btn button_btn bg-deep-blue'>编辑</a> "+btn2+" <a title='查看' href='javascript:;' onclick='Competence_View(this,"+x.userId+")' class='btn button_btn btn-green'>查看</a></td>"
					+"</tr>";
					
					$("#sample_table").append($str);
					
				});

			},
			error : function() {
				layer.alert("错误操作!", {
					icon : 2
				});
			}

		});

	}
	
	
	/* 查看管理员信息 */
	
	function Competence_View(obj, id) {
		location.href="../UserInfo/selAdminById.do?userId="+id;
	}
	
	
	

	/*添加管理员*/
	$('#administrator_add').on('click', function() {
		layer.open({
			type : 1,
			title : '添加管理员',
			area : [ '600px', '' ],
			shadeClose : false,
			content : $('#add_administrator'),
			btn:['提交','取消'],
			yes:function(index,layero){
				
					$.ajax({
						 url:"../UserInfo/addAdmin.do",
						 type:"post",
						 data:$("#form-admin-add").serialize(),
						 success:function(data){
							 
							 if (data==1) {
									layer.msg('添加成功!',{icon: 6,time:1000});
								} else if(data==2) {
									layer.msg('添加失败!',{icon: 5,time:1000});
								}
							 	layer.close(index);
								init(); 
								
						 },
						 error:function(){
							 layer.alert("错误操作!", {
									icon : 2
								});
						 }
						 
					 });
				 
				 
				
				
				
			}
	
		});
	})
	
	/* 这是添加管理员的方法 */
	
	 
	 

	
	$(function() {
		$("#Competence_sort").click(
				function() {
					var option = $(this).find("option:selected").text();
					var value = $(this).val();
					if (value == 0) {

						$("#sample_table tbody tr").show()
					} else {
						$("#sample_table tbody tr").hide().filter(
								":contains('" + (option) + "')").show();
					}
				}).click();
	});

	/*******滚动条*******/
	$("body").niceScroll({
		cursorcolor : "#888888",
		cursoropacitymax : 1,
		touchbehavior : false,
		cursorwidth : "5px",
		cursorborder : "0",
		cursorborderradius : "5px"
	});
	/*管理员-停用*/
	function Competence_close(obj, id) {
	
		layer.confirm('确认要停用吗？',function(index) {
			$.post("../UserInfo/upAdaminStop.do",{userId:id},function(data){
				if (data==1) {
					layer.msg('已停用!',{icon: 5,time:1000});
				} else if(data==2) {
					layer.msg('停用失败!',{icon: 0,time:1000});
				}
				init();
			});
		});
	}

	/*管理员-启用*/
	function Competence_start(obj, id) {
		layer.confirm('确认要启用吗？',function(index) {
			$.post("../UserInfo/upAdaminStart.do",{userId:id},function(data){
				if (data==1) {
					layer.msg('已启用!',{icon: 6,time:1000});
				} else if(data==2) {
					layer.msg('启用失败!',{icon: 0,time:1000});
				}
				init();
			});
		});
	}
	
	
	/*用户-删除*/
	//obj,id
function member_del(id){
	layer.confirm('确认要删除吗？',function(index){

		
		$.post("../UserInfo/upAdminState.do",{userId:id},function(data){
			if (data==1) {
				layer.msg('已删除!',{icon:1,time:1000});
			} else if(data==2) {
				layer.msg('删除失败!',{icon:0,time:1000});
			}
			init();
		});
		
		
	});
	
}
	
	
	/****复选框选中******/
	$('table th input:checkbox').on(
			'click',
			function() {
				var that = this;
				$(this).closest('table').find(
						'tr > td:first-child input:checkbox').each(function() {
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});

			});
	//表单验证提交
	$("#form-admin-add").Validform({
		tiptype : 2,
		callback : function(data) {
			//form[0].submit();
			if (data.status == 1) {
				layer.msg(data.info, {
					icon : data.status,
					time : 1000
				}, function() {
					location.reload();//刷新页面 
				});
			} else {
				layer.msg(data.info, {
					icon : data.status,
					time : 3000
				});
			}
			var index = parent.$("#iframe").attr("src");
			parent.layer.close(index);
			//
		}
	});
	//字数限制
	function checkLength(which) {
		var maxChars = 100; //
		if (which.value.length > maxChars) {
			layer.open({
				icon : 2,
				title : '提示框',
				content : '您输入的字数超过限制!',
			});
			// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
			which.value = which.value.substring(0, maxChars);
			return false;
		} else {
			var curr = maxChars - which.value.length; //250 减去 当前输入的
			document.getElementById("sy").innerHTML = curr.toString();
			return true;
		}
	};
	
	/*用户-编辑*/
	function member_edit(id){

		var userId = id;
		$.post("../UserInfo/selUserById.do",{userId:id},function(data){		 
			var json = (new Function("return " + data))(); 			
		
			$("#bjUserId").val(userId);
			$("#bjUserName").val(json.userName);
			$("#bjUserAccount").val(json.userAccount);
			$("#bjGdPhone").val(json.userPhone);
			$("#bjYdPhone").val(json.userPhone);
			var sex = $("input[name='form-field-radio2']");
			var state = $("input[name='form-field-radio1']");
			
			$.each(sex,function(i,x){
				
				sex.get(i).checked=false;
				
				if (json.userSex==1) {
					sex.get(0).checked=true;
				}else if (json.userSex==0) {
					sex.get(1).checked=true;
				}else {
					sex.get(2).checked=true;
				}
				
			});
			
			$.each(state,function(i,x){
				
				state.get(i).checked=false;
				
				if (json.userState==1) {
					state.get(0).checked=true;
				}else if (json.userState==0) {
					state.get(1).checked=true;
				}
				
			});
			
		
		});
		
		
		  layer.open({
	        type: 1,
	        title: '修改用户信息',
			maxmin: true, 
			shadeClose:false, //点击遮罩关闭层
	        area : ['800px' , ''],
	        content:$('#add_menber_style'),
			btn:['提交','取消'],
			yes:function(index,layero){	
			 var num=0;
			 var str="";
	     $(".add_menber input[type$='text']").each(function(n){
	          if($(this).val()=="")
	          {
	               
				   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
	                title: '提示框',				
					icon:0,								
	          }); 
			    num++;
	            return false;            
	          } 
			 });
			  if(num>0){  return false;}	 	
	          else{
	        	  //都填好了点击确定进入修改信息环节
	        	  
	        	  //获取性别 1.男  0.女  2.保密
	        	  var userSex = "";
	        	  var obj=$("input[name='form-field-radio2']");
	        	  obj.each(function(i,x) {
					if (x.checked) {
						userSex=x.value;
					}
				  });
	        	 
	        	  
	        	  //获取用户状态 1.正常  0.封禁
	        	  var userState="";
	        	  var obj1=$("input[name='form-field-radio1']");
	        	  obj1.each(function(i,x) {
					if (x.checked) {
						userState=x.value;
					}
				  });
	       	  
	        	  
	        	  $.post("../UserInfo/upByIdUser.do",{
	        		  
	        		  userId:$("#bjUserId").val(),
	        		  userName:$("#bjUserName").val(),
	        		  userPhone:$("#bjGdPhone").val(),
	        		  userSex:userSex,
	        		  userState:userState,
	  		  
	        		   
	        	  },function(data){
	        		  
	        		if (data==1) {
	        			layer.alert('修改成功！',{
	                        title: '提示框',				
	        				icon:1,		
	        			   });
	      			} else if(data==2) {
	      				layer.alert('编辑失败！',{
	                        title: '提示框',				
	        				icon:0,		
	        			   });
	      			}
	      			
	        		  
	        	  });  
	        	  
				  /* layer.alert('添加成功！',{
	                title: '提示框',				
					icon:1,		
				   }); */
				  
				   layer.close(index);
				   init();
			  }		  		     				
			}
	    });
	}
</script>
