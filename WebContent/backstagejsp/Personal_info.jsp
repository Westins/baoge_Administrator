<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link
		href="${pageContext.request.contextPath }/backstagejsp/css/shop.css"
		type="text/css" rel="stylesheet" />
	<link
		href="${pageContext.request.contextPath }/backstagejsp/css/Sellerber.css"
		type="text/css" rel="stylesheet" />
	<link
		href="${pageContext.request.contextPath }/backstagejsp/css/bkg_ui.css"
		type="text/css" rel="stylesheet" />
	<link
		href="${pageContext.request.contextPath }/backstagejsp/font/css/font-awesome.min.css"
		rel="stylesheet" type="text/css" />
	<script
		src="${pageContext.request.contextPath }/backstagejsp/js/jquery-1.9.1.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/backstagejsp/js/jquery.cookie.js"></script>
	<script
		src="${pageContext.request.contextPath }/backstagejsp/js/shopFrame.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath }/backstagejsp/js/Sellerber.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath }/backstagejsp/js/layer/layer.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath }/backstagejsp/js/laydate/laydate.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/backstagejsp/js/json2.js"></script>
	<script
		src="${pageContext.request.contextPath }/backstagejsp/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/backstagejsp/js/jquery.dataTables.bootstrap.js"></script>
	<title>个人信息</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body style="padding: 30px; padding-top: 50px">


	<div class="margin" id="page_style">
		<div class="personal_info mb15 same_module">
			<div class="add_style clearfix border_style relative">
				<form id="user_info" action="json/test_user.json" method="post">
					<div class="user_left_info">
						<div class="clearfix" id="xinxi">
							<div class="form-group clearfix col-xs-3">
								<label class="col-xs-3 label_name col-md-5" for="form-field-1">用户名：</label>
								<div class="col-xs-9 line_height1 col-md-6">
									<input type="text" name="username" data-name="用户名"
										id="username" value="admin123" class="col-xs-12 text_info"
										disabled="disabled">
								</div>
							</div>

							<!-- <div class="form-group clearfix col-xs-3">
        <label class="col-xs-3 label_name col-md-5" for="form-field-1">真实姓名：</label>
         <div class="col-xs-9 line_height1 col-md-6"><input type="text" name="surname" data-name="真实姓名" id="surname" value="张小泉" class="col-xs-12 text_info" disabled="disabled"></div>         
          </div> -->
							<div class="form-group clearfix col-xs-3">
								<label class="col-xs-3 label_name col-md-5" for="form-field-1">性别：
								</label>
								<div class="col-xs-9 line_height1 col-md-6">
									<span class="sex" id="userSexs">男</span>
									<div class="add_sex">
										<label><input name="form-field-radio" type="radio"
											id="" class="ace" value="2" checked="checked"><span
												class="lbl">保密</span></label>&nbsp;&nbsp; <label><input
											name="form-field-radio" type="radio" id="" class="ace"
											value="1"><span class="lbl">男</span></label>&nbsp;&nbsp; <label><input
											name="form-field-radio" type="radio" id="" class="ace"
											value="0"><span class="lbl">女</span></label>
									</div>
								</div>
							</div>
							<div class="form-group clearfix col-xs-3">
								<label class="col-xs-3 col-md-6 label_name col-md-5"
									for="form-field-1">年龄： </label>
								<div class="col-xs-9 line_height1 col-md-6">
									<input type="text" name="age" data-name="年龄" id="age"
										value="24" class="col-xs-12 text_info" disabled="disabled">
								</div>
							</div>
							<div class="form-group clearfix col-xs-3">
								<label class="col-xs-3 col-md-6 label_name col-md-5"
									for="form-field-1">移动电话： </label>
								<div class="col-xs-9 line_height1 col-md-6">
									<input type="text" name="phone" data-name="移动电话" id="phone"
										value="13567878908" class="col-xs-12 text_info"
										disabled="disabled">
								</div>
							</div>
							<div class="form-group clearfix col-xs-3">
								<label class="col-xs-3 col-md-6 label_name col-md-5"
									for="form-field-1">电子邮箱： </label>
								<div class="col-xs-9 line_height1 col-md-6">
									<input type="text" name="mailbox" data-name="电子邮箱" id="mailbox"
										value="567890@qq.com" class="col-xs-12 text_info"
										disabled="disabled">
								</div>
							</div>
							<!-- <div class="form-group clearfix col-xs-3">
								<label class="col-xs-3 label_name col-md-5" for="form-field-1">QQ：
								</label>
								<div class="col-xs-9 line_height1 col-md-6">
									<input type="text" name="QQ" id="QQ" data-name="QQ"
										value="456789787" class="col-xs-12 text_info"
										disabled="disabled">
								</div>
							</div> -->
							<div class="form-group clearfix col-xs-3">
								<label class="col-xs-3 label_name col-md-5" for="form-field-1">用户
									ID： </label>
								<div class="col-xs-9 line_height1 col-md-6">
									<span id="s1">普通管理员</span>
								</div>
							</div>
							<div class="form-group clearfix col-xs-3">
								<label class="col-xs-3 label_name col-md-5" for="form-field-1">权限：
								</label>
								<div class="col-xs-9 line_height1 col-md-6">
									<span id="s2">普通管理员</span>
								</div>
							</div>

							<div class="form-group clearfix col-xs-3">
								<label class="col-xs-3 label_name col-md-5" for="form-field-1">注册时间：
								</label>
								<div class="col-xs-9 line_height1 col-md-6">
									<span id="s3">2016-7-5</span>
								</div>
							</div>

						</div>
						<div class="Button_operation clearfix">
							<input type="button" onclick="modify();"
								class="btn btn-danger operation_btn" value="修改信息" /> <input
								type="button" onclick="change_Password();"
								class="btn bg-green operation_btn" value="修改密码" /> <input
								type="button" id="save_info"
								class="btn bg-deep-blue operation_btn save " value="保存修改" />
						</div>
					</div>
					<div class="user_avatar">
						<img src="${pageContext.request.contextPath }/backstagejsp/images/avatar.png" width="120px" height="120px">
							<p class="name" id="imgUserName">玉兰油OLAY</p>
					</div>
				</form>
			</div>
			<div id="text_name"></div>
		</div>

		<!--操作记录-->
		<div class="h_products_list clearfix same_module" id="Sellerber"
			style="display: none">
			<div class="Sellerber_left menu" id="menuBar">
				<div class="show_btn" id="rightArrow">
					<span></span>
				</div>
				<div class="side_title">
					<a title="隐藏" class="close_btn"><span></span></a>
				</div>
				<div class="menu_style" id="menu_style">
					<div class="list_content">
						<div class="side_list"></div>
					</div>
				</div>
			</div>
			<div class="list_Exhibition list_show padding15">
				<div class="searchs_style clearfix operation mb15">
					<label class="label_name l_f">记录搜索：</label> <input
						class="inline laydate-icon " id="start" type="text"
						style="margin-right: 10px; height: auto; float: left; width: 150px;" />
					<input name="" type="text" class="form-control col-xs-1"
						style="width: 250px" />
					<button class="btn button_btn bg-deep-blue " onclick=""
						type="button">
						<i class="fa  fa-search"></i>&nbsp;搜索
					</button>
				</div>
				<div class="datalist_show ">
					<div class="datatable_height confirm">
						<table id="sample_table"
							class="table table_list table_striped table-bordered dataTable no-footer">
							<thead>
								<tr>
									<th width="80px">排序</th>
									<th>内容</th>
									<th width="150px">操作时间</th>
									<th width="300px">备注</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-29 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>2</td>
									<td>添加了20个商品信息</td>
									<td>2016-9-29 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>3</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-28 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>4</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-27 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>5</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-26 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>6</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-24 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>7</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-19 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>1</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-29 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>2</td>
									<td>添加了20个商品信息</td>
									<td>2016-9-29 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>3</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-28 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>4</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-27 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>5</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-26 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>6</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-24 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>7</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-19 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>1</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-29 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>2</td>
									<td>添加了20个商品信息</td>
									<td>2016-9-29 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>3</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-28 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>4</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-27 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>5</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-26 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>6</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-24 12:23</td>
									<td>一个未保存成功</td>
								</tr>
								<tr>
									<td>7</td>
									<td>添加了10个商品信息</td>
									<td>2016-9-19 12:23</td>
									<td>一个未保存成功</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--修改密码样式-->
	<div class="change_Pass_style display" id="change_Pass">
		<ul class="change_Password clearfix">
			<li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><span
				class="change_text"><input name="password" data-name="原密码"
					type="password" class="" id="password"></span></li>
			<li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><span
				class="change_text"><input name="Nes_pas" data-name="新密码"
					type="password" class="" id="Nes_pas"></span></li>
			<li><label class="label_name">确认密码</label><span
				class="change_text"><input name="c_mew_pas" type="password"
					data-name="再次确认密码" class="" id="c_mew_pas"></span></li>
		</ul>
	</div>
</body>
</html>
<script>
	//设置内页框架布局
$(function() { 
	$("#Sellerber").frame({
		float : 'left',
		color_btn:'.skin_select',
		Sellerber_menu:'.list_content',
		page_content:'.list_show',//内容
		datalist:".datatable_height",//数据列表高度取值
		header:65,//顶部高度
		mwidth:300,//菜单栏宽度
		
	});
});
/****修改密码****/
function change_Password(){
	layer.open({
    type: 1,
	title:'修改密码',
	area: ['300px','300px'],
	shadeClose: true,
	content: $('#change_Pass'),
	btn:['确认修改'],
	yes:function(index, layero){		
	 var num=0;
     var str="";
	 var $paddword=/^[a-z0-9_-]{5,18}$/;
	
     $("input[type$='password']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("data-name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
	       if(num>0){  return false;}	
	      if(!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val() )
        {
            layer.alert('密码不一致!',{
              title: '提示框',				
				icon:0,
			    
			 });
			 return false;
        }   
		 else{	
			 
			 alert($("#s1").html());
			 $.post("../UserInfo/selUserById.do",{
				 userId:$("#s1").html()
			 },function(data){
				 alert(data);
				 var obj = JSON.parse(data);
				 var upPwd = "";
				 alert(obj);
				 upPwd = obj.userPwd;
				 alert(upPwd);
				 
				 var ymPwd = $("#password").val();
				 
				 if (ymPwd==upPwd) {
					 
					 $.post("../UserInfo/upUserPwd.do",{
						 userId:$("#s1").html(),
						 "userPwd":$("#Nes_pas").val()
						 
					 },function(data){
						 
						 if (data==1) {
							 layer.alert('修改成功！',{
					               title: '提示框',				
									icon:1,		
								  }); 
								  layer.close(index);
							 
						} else if(data==2){
							layer.alert('修改失败！',{
					               title: '提示框',				
									icon:1,		
								  }); 
								  layer.close(index);
						}
						 
					 });
					 
					 
				 }else{
					 layer.alert('密码错误！',{
			               title: '提示框',				
							icon:1,		
						  }); 
				 }
				 
				 
				 
				 
			 });
			 
			 
		     		  
			 /*  layer.alert('修改成功！',{
               title: '提示框',				
				icon:1,		
			  }); 
			  layer.close(index);   */    
		  }	 
	}
    });
}
/*时间*/
	laydate({
    elem: '#start',
    event: 'focus' 
});
/********个人信息操作*******/
function modify(){
	 $('.text_info').attr("disabled", false);
	 $('.text_info').addClass("add");
	  $('#page_style').find('.add_style').addClass("hover");
	  $('#page_style').find('.save').css({'display':'block'});
	};
$("#save_info").click(function(){
	    var num=0;
		 var str="";
		 
     $("#xinxi input[type$='text']").each(function(n){
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
			  var sex = $("input[name='form-field-radio']:checked").serialize();
		      var params=$('#user_info input').serialize(); //序列化表单的值
			  alert(params);
			  $.post(
			      "../UserInfo/upByIdAdmin.do",
				  {
				   username:$("#username").val(),
				   userId:$("#s1").html(),
				   sex:$("input[name='form-field-radio']:checked").val(),
				   age:$("#age").val(),
				   mailbox:$("#mailbox").val(),
				   phone:$("#phone").val()
				   },
					function(data){
				     // $("#text_name").html(data)
                    //   console.log(data.time);
						if (data==1) {
							
							layer.alert('修改成功！',{
					               title: '提示框',				
								   icon:1,			   		
								  });
								  $('#page_style').find('.add_style').removeClass("hover");
								  $('#page_style').find('.text_info').removeClass("add").attr("disabled", true);
								  $('#page_style').find('.save').css({'display':'none'});
								  layer.close();
						} else if(data==2) {
							layer.msg('修改失败!',{icon: 5,time:1000});
						}
					 	layer.close(index);
						init(); 
				     
				  });
				  
			  	  /*  $.ajax({
				   type:"post",
				   url:"json/test_user.json",
				   dataType:"json",
				   data:params,
				   success:User_Info  		  
				  });
				  function User_Info(json){
					  var str="姓名:"+json.username+"<br />";
						  str+="年龄:"+json.age+"<br />";
						  str+="性别:"+json.sex+"<br />";
						  str+="工作:"+json.mailbox+"<br />";
						  str+="追加测试:"+json.phone;						  
						  $("#text_name").html(str);				  					  				  
					 } */
			   /* layer.alert('修改成功！',{
               title: '提示框',				
			   icon:1,			   		
			  });
			  $('#page_style').find('.add_style').removeClass("hover");
			  $('#page_style').find('.text_info').removeClass("add").attr("disabled", true);
			  $('#page_style').find('.save').css({'display':'none'});
			   layer.close();	 */	
		  }
});
/********************/
$(function(){
	$("#sample_table tbody>tr:odd").addClass("odd");
	$("#sample_table tbody>tr:even").addClass("even");
	$("#sample_table tbody>tr").click(function(){	
	$(this).addClass("selected").siblings().removeClass("selected").end()
	})
	});
</script>
<script>
	
		
		var userId = (<%=request.getParameter("userId")%>);
		
		
		if (null!=userId) {
			
			$.post("../UserInfo/selUserById.do",{userId:userId},function(data){
				
				var json = (new Function("return " + data))();//转化json
				$("#username").val("");
				$("#userSexs").html("");
				$("#age").val("");
				$("#phone").val("");
				$("#mailbox").val("");
				$("#s1").html("");
				$("#s2").html("");
				$("#s3").html("");
				$("#userAccount").val("");
				$("#imgUserName").html("");
				
				//设置信息
				var sex="";
				if (json.userSex==1) {
					sex="男";
				} else if(json.userSex==2){
					sex="保密";
				}else{
					sex="女";
				}
				
				
				var power="";	
				if (json.userPower==0) {
					power="普通管理员";
				}else if (json.userPower==5) {
					power="超级管理员";
				}		
				
				
				$("#username").val(json.userName);
				$("#userSexs").html(sex);
				$("#age").val(json.userAge);
				$("#phone").val(json.userPhone);
				$("#mailbox").val(json.userEmail);
				$("#s1").html(json.userId);
				$("#s2").html(power);
				$("#s3").html(json.userRegTime);
				$("#imgUserName").html(json.userName);
				
			});
		}
		
	
	
</script>
