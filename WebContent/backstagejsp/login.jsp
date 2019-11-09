<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link href="css/shop.css" type="text/css" rel="stylesheet" />
	<link href="skin/default/skin.css" rel="stylesheet" type="text/css"
		id="skin" />
	<link href="css/Sellerber.css" type="text/css" rel="stylesheet" />
	<link href="css/bkg_ui.css" type="text/css" rel="stylesheet" />
	<link href="font/css/font-awesome.min.css" rel="stylesheet"
		type="text/css" />
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="js/layer/layer.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/Sellerber.js" type="text/javascript"></script>
	<script src="js/shopFrame.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<title>用户登录</title>
</head>

<body class="login-layout Reg_log_style">
	<div class="logintop">
		<span>欢迎后台管理界面平台</span>
		<ul>
			<li><a href="#">返回首页</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>
	<div class="loginbody">
		<div class="login-container">
			<div class="center">
				<img src="images/logo.png" />
			</div>
			<div class="space-6"></div>
			<div class="position-relative">
				<div id="login-box" class="login-box widget-box no-border visible">
					<div class="login-main">
						<div class="clearfix">
							<div class="login_icon">
								<img src="images/login_img.png" />
							</div>
							<form class=""
								style="width: 300px; float: right; margin-right: 50px;">
								<h4 class="title_name">
									<img src="images/login_title.png" />
								</h4>
								<fieldset>
									<ul>
										<li class="frame_style form_error"><label
											class="user_icon"></label><input name="" type="text"
											data-name="用户名" id="username" /><i>用户名</i></li>
										<li class="frame_style form_error"><label
											class="password_icon"></label><input name="" type="password"
											data-name="密码" id="userpwd" /><i>密码</i></li>
										<li class="frame_style form_error"><label
											class="Codes_icon"></label><input name="verifyCode"
											type="text" data-name="验证码" id="Codes_text" /><i>验证码</i>
											<div class="Codes_region">
												<a href="javascript:reloadCode();"><img
													src="../ImageServlet" id="safecode" alt="验证码" width="100%"
													height="38px"></a>
											</div></li>
									</ul>
									<div class="space"></div>
									<div class="clearfix">
										<label class="inline"> <input type="checkbox"
											class="ace"> <span class="lbl">保存密码</span></label>

										<button type="button" class="login_btn" id="login_btn">
											登&nbsp;陆</button>
									</div>

									<div class="space-4"></div>
								</fieldset>
							</form>
						</div>
						<div class="social-or-login center">
							<span class="bigger-110">通知</span>
						</div>

						<div class="social-login ">
							为了更好的体验性，本网站系统不再对IE8（含IE8）以下浏览器支持，请见谅。</div>
					</div>
					<!-- /login-main -->


					<!-- /widget-body -->
				</div>
				<!-- /login-box -->
			</div>
			<!-- /position-relative -->
		</div>
	</div>
	<div class="loginbm">
		版权所有 2016 <a href=""></a>
	</div>
	<strong></strong>
	<script type="text/javascript">
      function reloadCode(){
          var time = new Date();
          // 给URL传递参数可以清空浏览器的缓存，让浏览器认为这是一个新的请求
          document.getElementById('safecode').src = '<%=request.getContextPath()%>/ImageServlet?d='+ time;
		}
	</script>
	
	<script type="text/javascript">
	$('#login_btn').on(
			'click',
			function() {
				var num = 0;
				var str = "";
				$("input[type$='text'],input[type$='password']").each(
						function(n) {
							if ($(this).val() == "") {

								layer.alert(str += ""
										+ $(this).attr("data-name")
										+ "を入力してください!", {
									title : '提示框',
									icon : 0,
								});
								num++;
								
								return false;
							}
						});
				if (num > 0) {
					return false;
				} else {

					$.ajax({
						url : '../ValidateImageServlet',
						type : 'post',
						data : {
							"verifyCode" : $("#Codes_text").val(),
						},
						success : function(yzm) {
							
							if (yzm == 1) {
								
								
								loginInfo();							

								/* self.setInterval(function(){  // 这个方法是说在延迟两秒后执行大括号里的方法
									layer.close(index);
									// location.reload();   // 这个方法是刷新当前页面
								      },2000) //这里2000代表两秒
								 */

							} else if (yzm == 2) {
								layer.alert('验证码不正确！', {
									title : '提示框',
									icon : 0,
								});
								reloadCode();
								$("#Codes_text").val("");

							} else {
								layer.alert('错误操作！', {
									title : '提示框',
									icon : 2,
								});
								$("#Codes_text").val("");
							}

						},
						error : function() {
							layer.alert('错误操作！', {
								title : '提示框',
								icon : 2,
							});
						}

					});

				}
			});
	
	
	function loginInfo() {
		
		$.post("../UserInfo/loginInfo.do",{
			"userAccount" : $("#username").val(),
			"userPwd":$("#userpwd").val()
		},function(data){
			
			if (data==1) {
				layer.alert('登陆成功！', {
					title : '提示框',
					icon : 1,
				});
				//所有正确跳转到主页面
				setTimeout(function() {

					//layer.close(index);
					location.href = "shops_index.jsp";

				}, 1000);
				
			} else if (data==2) {
				layer.alert('账号或密码错误！', {
					title : '提示框',
					icon : 0,
				});
				reloadCode();
				$("#Codes_text").val("");
			}
		
		});
		
		
	/* alert(1);
		$.ajax({
			url : '../UserInfo/loginInfo.do',
			data : {
				"userAccount" : $("#username").val(),
				"userPwd":$("#userpwd").val()
			},
			success : function(data) {
				
				if (data==1) {
					layer.alert('登陆成功！', {d
						title : '提示框',
						icon : 4,
					});
					//所有正确跳转到主页面
					setTimeout(function() {

						//layer.close(index);
						location.href = "shops_index.html";

					}, 1000);
					
				} else if (data==2) {
					layer.alert('账号或密码错误！', {d
						title : '提示框',
						icon : 5,
					});
				}
				
				
				
			},
			error:function(){
				layer.alert('错误操作！', {
					title : '提示框',
					icon : 6,
				});
				
			}
											
		}); */
		
	} 
	
	
	
	
	
	
	
	$(document).ready(
			function() {
				$("input[type='text'],input[type='password']").blur(
						function() {
							var $el = $(this);
							var $parent = $el.parent();
							$parent.attr('class', 'frame_style').removeClass(
									' form_error');
							if ($el.val() == '') {
								$parent.attr('class', 'frame_style').addClass(
										' form_error');
							}
						});
				$("input[type='text'],input[type='password']").focus(
						function() {
							var $el = $(this);
							var $parent = $el.parent();
							$parent.attr('class', 'frame_style').removeClass(
									' form_errors');
							if ($el.val() == '') {
								$parent.attr('class', 'frame_style').addClass(
										' form_errors');
							} else {
								$parent.attr('class', 'frame_style')
										.removeClass(' form_errors');
							}
						});
			})
</script>

</body>
</html>

