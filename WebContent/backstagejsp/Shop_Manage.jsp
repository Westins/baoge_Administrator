<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script src="js/shopFrame.js" type="text/javascript"></script>
	<script src="js/Sellerber.js" type="text/javascript"></script>
	<script src="js/layer/layer.js" type="text/javascript"></script>
	<script src="js/laydate/laydate.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/proTree.js"></script>
	<script src="js/dist/echarts.js" type="text/javascript"></script>
	<!--[if lt IE 9]>
<script src="js/html5shiv.js" type="text/javascript"></script>
<script src="js/respond.min.js"></script>
<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
	<title>品牌管理</title>
</head>

<body>
	<script type="text/javascript">
<!--

//-->

/*
这是一个统计本网站注册的有效店铺数量的方法
*/
	function shopCounts() {
		$.post("../Shops/StatisticsShops.do",function(data){
		
			//把查询的数量放置好
			$("#shopCount b").html(data);
		
		});
	
	}
shopCounts();
</script>

	<div class="margin" id="page_style">
		<div class="operation clearfix mb15 same_module">
			<ul class="choice_search">
				<li class="clearfix col-xs-2 col-lg-3 col-ms-3 "><label
					class="label_name ">品牌名称：</label> <input placeholder="输入品牌名称"
					id="shopName" name="" type="text"
					class="form-control col-xs-8 col-lg-8 col-ms-8"></li>
				<!-- <li class="clearfix col-xs-2 col-lg-3 col-ms-3"><label class="label_name ">添加时间：</label>
      <input class="inline laydate-icon form-control Select_Date" id="start">
      </li> -->
				<li class="clearfix col-xs-2 col-lg-3 col-ms-3 "><select onchange="shooes();"
					id="shopSV" name="" class="margin-right l_f select_style"><option
							value="0">按销量排序</option>
						<option value="1">销量&nbsp;&nbsp;&nbsp;↑</option>
						<option value="2">销量&nbsp;&nbsp;&nbsp;↓</option></select>
					<button onclick="selLocal();" type="button"
						class="btn button_btn bg-deep-blue ">
						<i class="icon-search"></i>查询
					</button></li>
			</ul>
		</div>
		<div class="h_products_list clearfix mb15" id="Sellerber">
			<!--品牌展示-->
			<div class="Sellerber_left menu" id="menuBar">
				<div class="show_btn" id="rightArrow">
					<span></span>
				</div>
				<div class="side_title">
					<a title="隐藏" class="close_btn"><span></span></a>
				</div>
				<div class="menu_style" id="menu_style">
					<div class="list_content">
						<div class="side_list">
							<!-- <div id="main" style="height: 250px;" class="side_list"></div> -->
						</div>
					</div>
				</div>
			</div>
			<!--品牌列表-->
			<div class="list_Exhibition list_show padding15">
				<div class="operation clearfix mb15  same_module">
					<span class="l_f"> <!-- <a href="Add_Brand.html"  title="添加品牌" class="btn button_btn bg-deep-blue"><i class="fa fa-plus"></i>添加品牌</a> -->
						<a href="javascript:ovid()" onclick="batchdeletion();"
						class="btn  button_btn btn-danger"><i class="fa fa-trash"></i>批量删除</a>
						<a href="javascript:ovid()" class="btn  button_btn btn-info" onclick="onSh()">查看审核中的店铺</a>
						<a href="javascript:ovid()"
						class="btn button_btn btn-Dark-success" onclick="onFj()">查看封禁的店铺</a>
					</span> <span id="shopCount" class="r_f">共：<b>234</b>个店铺
					</span>
				</div>
				<div class=" datalist_show">
					<div class="datatable_height confirm">
						<table class="table table_list table_striped table-bordered"
							id="sample-table">
							<thead>
								<tr>
									<th width="25px"><label><input id="All_election"
											type="checkbox" class="ace"><span class="lbl"></span></label></th>
									<th width="60px">ID</th>
									<th width="140px">入店时间</th>
									<th width="120px">店铺LOGO</th>
									<th width="140px">店铺名称</th>
									<th width="110px">店铺销量</th>
									<th width="120px">店内商品数量</th>
									<th width="140px">销售额/元</th>
									<th width="70px">状态</th>
									<th width="200px">操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td width="25px"><label><input type="checkbox"
											class="ace"><span class="lbl"></span></label></td>
									<td width="80px">45631</td>
									<td width="50px"><input type="text"
										class="input-text text-c" value="1" style="width: 60px"></td>
									<td><img src="product_img/logo/156.jpg" width="130" /></td>
									<td><a href="javascript:ovid()" name="Brand_detailed.html"
										style="cursor: pointer" class="text-primary brond_name"
										onclick="generateOrders('561');" title="玉兰油OLAY">玉兰油OLAY</a></td>
									<td>法国</td>

									<td>123</td>
									<td>2014-6-11 11:11:42</td>
									<td class="td-status"><span
										class="label label-success radius">已启用</span></td>
									<td class="td-manage"><a
										onClick="member_stop(this,'10001')" href="javascript:;"
										title="下架" class="btn btn-xs btn-status">下架</a> <a title="编辑"
										onclick="member_edit('编辑','member-add.html','4','','510')"
										href="javascript:;" class="btn btn-xs btn-info">编辑</a> <a
										title="删除" href="javascript:;" onclick="member_del(this,'1')"
										class="btn btn-xs btn-delete">删除</a></td>
								</tr>
								<tr>
									<td><label><input type="checkbox" class="ace"><span
												class="lbl"></span></label></td>
									<td>2045</td>
									<td><input type="text" class="input-text text-c" value="2"
										style="width: 60px"></td>
									<td><img src="product_img/logo/34.jpg" width="130" /></td>
									<td><u style="cursor: pointer"
										class="text-primary brond_name"
										onclick="generateOrders('5621');" title="玉兰油OLAY">玉兰油OLAY</u></td>
									<td>法国</td>

									<td>123</td>
									<td>2014-6-11 11:11:42</td>
									<td class="td-status"><span
										class="label label-success radius">已启用</span></td>
									<td class="td-manage"><a
										onClick="member_stop(this,'10001')" href="javascript:;"
										title="下架" class="btn btn-xs btn-status">下架</a> <a title="编辑"
										onclick="member_edit('编辑','member-add.html','4','','510')"
										href="javascript:;" class="btn btn-xs btn-info">编辑</a> <a
										title="删除" href="javascript:;" onclick="member_del(this,'1')"
										class="btn btn-xs btn-delete">删除</a></td>
								</tr>
								<tr>
									<td><label><input type="checkbox" class="ace"><span
												class="lbl"></span></label></td>
									<td>2045</td>
									<td><input type="text" class="input-text text-c" value="2"
										style="width: 60px"></td>
									<td><img src="product_img/logo/245.jpg" width="130" /></td>
									<td><u style="cursor: pointer"
										class="text-primary brond_name"
										onclick="generateOrders('461');" title="御泥坊">御泥坊</u></td>
									<td>法国</td>

									<td>123</td>
									<td>2014-6-11 11:11:42</td>
									<td class="td-status"><span
										class="label label-success radius">已启用</span></td>
									<td class="td-manage"><a
										onClick="member_stop(this,'10001')" href="javascript:;"
										title="下架" class="btn btn-xs btn-status">下架</a> <a title="编辑"
										onclick="member_edit('编辑','member-add.html','4','','510')"
										href="javascript:;" class="btn btn-xs btn-info">编辑</a> <a
										title="删除" href="javascript:;" onclick="member_del(this,'1')"
										class="btn btn-xs btn-delete">删除</a></td>
								</tr>
								<tr>
									<td><label><input type="checkbox" class="ace"><span
												class="lbl"></span></label></td>
									<td>2045</td>
									<td><input type="text" class="input-text text-c" value="2"
										style="width: 60px"></td>
									<td><img src="product_img/logo/199.jpg" width="130" /></td>
									<td><u style="cursor: pointer"
										class="text-primary brond_name"
										onclick="member_show('张三','member-show.html','10001','360','400')">薇姿</u></td>
									<td>法国</td>

									<td>123</td>
									<td>2014-6-11 11:11:42</td>
									<td class="td-status"><span
										class="label label-success radius">已启用</span></td>
									<td class="td-manage"><a
										onClick="member_stop(this,'10001')" href="javascript:;"
										title="下架" class="btn btn-xs btn-status">下架</a> <a title="编辑"
										onclick="member_edit('编辑','member-add.html','4','','510')"
										href="javascript:;" class="btn btn-xs btn-info">编辑</a> <a
										title="删除" href="javascript:;" onclick="member_del(this,'1')"
										class="btn btn-xs btn-delete">删除</a></td>
								</tr>
								<tr>
									<td><label><input type="checkbox" class="ace"><span
												class="lbl"></span></label></td>
									<td>2045</td>
									<td><input type="text" class="input-text text-c" value="2"
										style="width: 60px"></td>
									<td><img src="product_img/logo/152.jpg" width="130" /></td>
									<td><u style="cursor: pointer"
										class="text-primary brond_name"
										onclick="member_show('张三','member-show.html','10001','360','400')">丝塔芙</u></td>
									<td>法国</td>

									<td>123</td>
									<td>2014-6-11 11:11:42</td>
									<td class="td-status"><span
										class="label label-success radius">已启用</span></td>
									<td class="td-manage"><a
										onClick="member_stop(this,'10001')" href="javascript:;"
										title="下架" class="btn btn-xs btn-status">下架</a> <a title="编辑"
										onclick="member_edit('编辑','member-add.html','4','','510')"
										href="javascript:;" class="btn btn-xs btn-info">编辑</a> <a
										title="删除" href="javascript:;" onclick="member_del(this,'1')"
										class="btn btn-xs btn-delete">删除</a></td>
								</tr>
								<tr>
									<td><label><input type="checkbox" class="ace"><span
												class="lbl"></span></label></td>
									<td>2045</td>
									<td><input type="text" class="input-text text-c" value="2"
										style="width: 60px"></td>
									<td><img src="product_img/logo/42.jpg" width="130" /></td>
									<td><u style="cursor: pointer"
										class="text-primary brond_name"
										onclick="member_show('张三','member-show.html','10001','360','400')">比克度</u></td>
									<td>法国</td>

									<td>123</td>
									<td>2014-6-11 11:11:42</td>
									<td class="td-status"><span
										class="label label-success radius">已启用</span></td>
									<td class="td-manage"><a
										onClick="member_stop(this,'10001')" href="javascript:;"
										title="下架" class="btn btn-xs btn-status">下架</a> <a title="编辑"
										onclick="member_edit('编辑','member-add.html','4','','510')"
										href="javascript:;" class="btn btn-xs btn-info">编辑</a> <a
										title="删除" href="javascript:;" onclick="member_del(this,'1')"
										class="btn btn-xs btn-delete">删除</a></td>
								</tr>
								<tr>
									<td><label><input type="checkbox" class="ace"><span
												class="lbl"></span></label></td>
									<td>2045</td>
									<td><input type="text" class="input-text text-c" value="2"
										style="width: 60px"></td>
									<td><img src="product_img/logo/42.jpg" width="130" /></td>
									<td><u style="cursor: pointer"
										class="text-primary brond_name"
										onclick="member_show('张三','member-show.html','10001','360','400')">比克度</u></td>
									<td>法国</td>

									<td>123</td>
									<td>2014-6-11 11:11:42</td>
									<td class="td-status"><span
										class="label label-success radius">已启用</span></td>
									<td class="td-manage"><a
										onClick="member_stop(this,'10001')" href="javascript:;"
										title="下架" class="btn btn-xs btn-status">下架</a> <a title="编辑"
										onclick="member_edit('编辑','member-add.html','4','','510')"
										href="javascript:;" class="btn btn-xs btn-info">编辑</a> <a
										title="删除" href="javascript:;" onclick="member_del(this,'1')"
										class="btn btn-xs btn-delete">删除</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script>
	/* <tr>
	<td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td>
	<td width="80px">45631</td>
	<td width="50px"><input type="text" class="input-text text-c" value="1" style="width:60px"></td>
	<td><img src="product_img/logo/156.jpg"  width="130"/></td>
	<td><a href="javascript:ovid()" name="Brand_detailed.html" style="cursor:pointer" class="text-primary brond_name" onclick="generateOrders('561');" title="玉兰油OLAY">玉兰油OLAY</a></td>
	<td>法国</td>
	
	<td>123</td>
	<td>2014-6-11 11:11:42</td>
	<td class="td-status"><span class="label label-success radius">已启用</span></td>
	<td class="td-manage">
	  <a onClick="member_stop(this,'10001')"  href="javascript:;" title="下架"  class="btn btn-xs btn-status">下架</a> 
	  <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" >编辑</a> 
	  <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-delete" >删除</a>
	</td>
	</tr> */
	

	init();
	
	//查询
	function selLocal() {
		init();
	}
	
	function shooes() {
		init();
	}
	
	
	function init() {
		
		$("#sample-table tr:gt(0)").remove();
		shopCounts();
		$.ajax({
			
			url:'../Shops/selAllShops.do',
			type:'post',
			data:{
				"shopName":$("#shopName").val(),
				"shopSV":$("#shopSV").val(),
				
			},
			dataType:'json',
			success:function(data){
				
				var obj=eval(data);
				$.each(obj,function(i,x){
					
					var state="";
					var btn ="";
					var tds="";
					if (x.shopstate==1) {
						state="正常";
						tds="success";
						btn="<a onClick='member_stop(this,"+x.shopsId+")'  href='javascript:;' title='下架'  class='btn btn-xs btn-status'>下架</a>";
					} else if(x.shopstate==0){
						state="封禁";
						tds="defaunt";
						btn="<a style='text-decoration:none' class='btn btn-xs ' onClick='member_start(this,"+x.shopsId+")' href='javascript:;' title='上架'>上架</a>";
					}else if (x.shopstate==4) {
						state="审核中";
						tds="success";
						btn="<a onClick='member_startShop(this,"+x.shopsId+")'  href='javascript:;' title='通过'  class='btn btn-xs btn-status'>通过</a>";
					}					
					
					var $str="<tr><td width='25px'><label><input name='MultipleSelection' type='checkbox' class='ace' ><span class='lbl'></span></label></td>"
					+"<td>"+x.shopsId+"</td>"
					+"<td width='50px'>"+x.shopsTime+"</td>"
					+"<td><img src='product_img/logo/156.jpg'  width='130'/></td>"
					+"<td><a href='javascript:ovid()' name='Brand_detailed.html' style='cursor:pointer' class='text-primary brond_name' onclick='generateOrders("+x.shopsId+");' title='玉兰油OLAY'>"+x.shopsName+"</a></td>"
					+"<td>"+x.shopssalesVolume+"</td>"
					+"<td></td>"
					+"<td>"+x.shopssales+"</td>"
					+"<td class='td-status'><span class='label label-"+tds+" radius'>"+state+"</span></td>"
					+"<td class='td-manage'>"+btn+" <a title='编辑' onclick='member_edit('编辑','member-add.html','4','','510')' href='javascript:;'  class='btn btn-xs btn-info' >编辑</a> <a title='删除' href='javascript:;'  onclick='member_del(this,"+x.shopsId+")' class='btn btn-xs btn-delete' >删除</a></td>"
					+"</tr>";
					
					$("#sample-table").append($str);
					
				});
				
				
				//alert($("#sample-table tr:gt(0)").length);
				var shopsTRcount = $("#sample-table tr:gt(0)").length;
				var shopid="";
				for (var i = 0; i < shopsTRcount; i++) {
					shopid+=$("#sample-table tr:gt("+i+") td:eq(1)").html()+",";
				
				}
				$.post("../Shops/selGoodsCount.do",{shopIds:shopid},function(count) {
						
					var obj = eval(count);
					for (var i = 0; i < obj.length; i++) {
						$("#sample-table tr:gt("+i+") td:eq(6)").html(obj[i]);
					}

				});	
				
	        	  //var obj=$("#sample-table tr:gt(0) td:eq(1)");
	        	  
				
				
			},
			error:function(){
				layer.alert("错误操作!",{icon:2});
			}
			
		});
		
	}
	
	
//点击查看审核
function onSh() {
	init3();
}


//点击查看关闭封禁
function onFj() {
	init2();
}

function init2() {
	
	$("#sample-table tr:gt(0)").remove();
	shopCounts();
	$.ajax({
		
		url:'../Shops/selConditionSF.do',
		type:'post',
		data:{
			"shopName":$("#shopName").val(),
			"shopSV":$("#shopSV").val(),
			"clickGb":"1",							
			
		},
		dataType:'json',
		success:function(data){
			
			var obj=eval(data);
			$.each(obj,function(i,x){
				
				var state="";
				var btn ="";
				var tds="";
				if (x.shopstate==1) {
					state="正常";
					tds="success";
					btn="<a onClick='member_stop(this,"+x.shopsId+")'  href='javascript:;' title='下架'  class='btn btn-xs btn-status'>下架</a>";
				} else if(x.shopstate==0){
					state="封禁";
					tds="defaunt";
					btn="<a style='text-decoration:none' class='btn btn-xs ' onClick='member_start(this,"+x.shopsId+")' href='javascript:;' title='上架'>上架</a>";
				}else if (x.shopstate==4) {
					state="审核中";
					tds="success";
					btn="<a onClick='member_startShop(this,"+x.shopsId+")'  href='javascript:;' title='通过'  class='btn btn-xs btn-status'>通过</a>";
				}					
				
				var $str="<tr><td width='25px'><label><input name='MultipleSelection' type='checkbox' class='ace' ><span class='lbl'></span></label></td>"
				+"<td>"+x.shopsId+"</td>"
				+"<td width='50px'>"+x.shopsTime+"</td>"
				+"<td><img src='product_img/logo/156.jpg'  width='130'/></td>"
				+"<td><a href='javascript:ovid()' name='Brand_detailed.html' style='cursor:pointer' class='text-primary brond_name' onclick='generateOrders("+x.shopsId+");' title='玉兰油OLAY'>"+x.shopsName+"</a></td>"
				+"<td>"+x.shopssalesVolume+"</td>"
				+"<td></td>"
				+"<td>"+x.shopssales+"</td>"
				+"<td class='td-status'><span class='label label-"+tds+" radius'>"+state+"</span></td>"
				+"<td class='td-manage'>"+btn+" <a title='编辑' onclick='member_edit('编辑','member-add.html','4','','510')' href='javascript:;'  class='btn btn-xs btn-info' >编辑</a> <a title='删除' href='javascript:;'  onclick='member_del(this,"+x.shopsId+")' class='btn btn-xs btn-delete' >删除</a></td>"
				+"</tr>";
				
				$("#sample-table").append($str);
				
			});
			
			
			//alert($("#sample-table tr:gt(0)").length);
			var shopsTRcount = $("#sample-table tr:gt(0)").length;
			var shopid="";
			for (var i = 0; i < shopsTRcount; i++) {
				shopid+=$("#sample-table tr:gt("+i+") td:eq(1)").html()+",";
			
			}
			$.post("../Shops/selGoodsCount.do",{shopIds:shopid},function(count) {
					
				var obj = eval(count);
				for (var i = 0; i < obj.length; i++) {
					$("#sample-table tr:gt("+i+") td:eq(6)").html(obj[i]);
				}

			});	
			
        	  //var obj=$("#sample-table tr:gt(0) td:eq(1)");
        	  
			
			
		},
		error:function(){
			layer.alert("错误操作!",{icon:2});
		}
		
	});
	
}
	
function init3() {
	
	$("#sample-table tr:gt(0)").remove();
	shopCounts();
	$.ajax({
		
		url:'../Shops/selConditionSF.do',
		type:'post',
		data:{
			"shopName":$("#shopName").val(),
			"shopSV":$("#shopSV").val(),
			"clickSh":"2",							
			
		},
		dataType:'json',
		success:function(data){
			
			var obj=eval(data);
			$.each(obj,function(i,x){
				
				var state="";
				var btn ="";
				var tds="";
				if (x.shopstate==1) {
					state="正常";
					tds="success";
					btn="<a onClick='member_stop(this,"+x.shopsId+")'  href='javascript:;' title='下架'  class='btn btn-xs btn-status'>下架</a>";
				} else if(x.shopstate==0){
					state="封禁";
					tds="defaunt";
					btn="<a style='text-decoration:none' class='btn btn-xs ' onClick='member_start(this,"+x.shopsId+")' href='javascript:;' title='上架'>上架</a>";
				}else if (x.shopstate==4) {
					state="审核中";
					tds="success";
					btn="<a onClick='member_startShop(this,"+x.shopsId+")'  href='javascript:;' title='通过'  class='btn btn-xs btn-status'>通过</a>";
				}					
				
				var $str="<tr><td width='25px'><label><input name='MultipleSelection' type='checkbox' class='ace' ><span class='lbl'></span></label></td>"
				+"<td>"+x.shopsId+"</td>"
				+"<td width='50px'>"+x.shopsTime+"</td>"
				+"<td><img src='product_img/logo/156.jpg'  width='130'/></td>"
				+"<td><a href='javascript:ovid()' name='Brand_detailed.html' style='cursor:pointer' class='text-primary brond_name' onclick='generateOrders("+x.shopsId+");' title='玉兰油OLAY'>"+x.shopsName+"</a></td>"
				+"<td>"+x.shopssalesVolume+"</td>"
				+"<td></td>"
				+"<td>"+x.shopssales+"</td>"
				+"<td class='td-status'><span class='label label-"+tds+" radius'>"+state+"</span></td>"
				+"<td class='td-manage'>"+btn+" <a title='编辑' onclick='member_edit('编辑','member-add.html','4','','510')' href='javascript:;'  class='btn btn-xs btn-info' >编辑</a> <a title='删除' href='javascript:;'  onclick='member_del(this,"+x.shopsId+")' class='btn btn-xs btn-delete' >删除</a></td>"
				+"</tr>";
				
				$("#sample-table").append($str);
				
			});
			
			
			//alert($("#sample-table tr:gt(0)").length);
			var shopsTRcount = $("#sample-table tr:gt(0)").length;
			var shopid="";
			for (var i = 0; i < shopsTRcount; i++) {
				shopid+=$("#sample-table tr:gt("+i+") td:eq(1)").html()+",";
			
			}
			$.post("../Shops/selGoodsCount.do",{shopIds:shopid},function(count) {
					
				var obj = eval(count);
				for (var i = 0; i < obj.length; i++) {
					$("#sample-table tr:gt("+i+") td:eq(6)").html(obj[i]);
				}

			});	
			
        	  //var obj=$("#sample-table tr:gt(0) td:eq(1)");
        	  
			
			
		},
		error:function(){
			layer.alert("错误操作!",{icon:2});
		}
		
	});
	
}
	
	
	
	
	
	

	var flag = $("#All_election");
	var checks = document.getElementsByName("MultipleSelection");
	
	flag.click(function() {
		
		$.each(checks,function(i,x){
		
			if (flag.get(0).checked) {
				x.checked=true;
			}else{
				x.checked=false;
			}
		});
	});

	
	
	function batchdeletion() {	
		
		layer.confirm('确认要删除该店铺吗？该商铺下的所有商品将全部下架。',function(index){
			var str="";
			var strs="";
			$.each(checks,function(i,x){
				
				if (x.checked) {
					str=$("#sample-table tr:gt("+i+") td:eq(1)").html();
					strs+=str+",";				
					
				}	
				
			});
			
			
			$.post("../Shops/upDlshopsStateDs.do",{shopId:strs},function(data){
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
	
	
	
	
	
	
	//设置内页框架布局
/* $(function() { 
	$("#Sellerber").frame({
		float : 'left',
		color_btn:'.skin_select',
		Sellerber_menu:'.list_content',
		page_content:'.list_show',//内容
		datalist:".datatable_height",//数据列表高度取值
		header:65,//顶部高度
		mwidth:350,//宽度自定义
		minStatue:true,
		
	});
}); */
function generateOrders(id){
	window.location.href = "Brand_detailed.jsp?shopsId="+id;
};
/*品牌-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*品牌-停用*/
/*产品-停用*/
function member_stop(obj,id){
	layer.confirm('确认要下架该品牌吗？该商铺下的所有商品将全部下架。',function(index){
		$.post("../Shops/upShopsStop.do",{shopId:id},function(data){
			if (data==1) {
				layer.msg('已停用!',{icon: 5,time:1000});
			} else if(data==2) {
				layer.msg('停用失败!',{icon: 0,time:1000});
			}
			init();
		});
		
		
		/* $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="上架">上架</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).remove();
		layer.msg('已下架!',{icon: 5,time:1000}); */
	});
}

/*店铺 通过审核*/
function member_startShop(obj,id) {
	
	layer.confirm('确认要通过该商铺的审核吗？',function(index){
		
		//修改商铺的状态为1
		$.post("../Shops/upShopsAdopt.do",{shopsId:id},function(data){
			if (data==1) {
				layer.msg('已通过!',{icon: 1,time:1000});
			} else if(data==2) {
				layer.msg('启用失败!',{icon: 0,time:1000});
			}
			init();
		});
	});
	
}
 


/*产品-启用*/
function member_start(obj,id){
	layer.confirm('确认要上架改该品牌吗？',function(index){
		$.post("../Shops/upShopsStart.do",{shopId:id},function(data){
			if (data==1) {
				layer.msg('已启用!',{icon: 6,time:1000});
			} else if(data==2) {
				layer.msg('启用失败!',{icon: 0,time:1000});
			}
			init();
		});
		
		/* $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-status" onClick="member_stop(this,id)" href="javascript:;" title="下架">下架</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">正常</span>');
		$(obj).remove();
		layer.msg('已上架!',{icon: 6,time:1000}); */
	});
}
/*产品-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*产品-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.post("../Shops/upDlshopsStateDs.do",{shopId:id},function(data){
			if (data==1) {
				layer.msg('已删除!',{icon:1,time:1000});
			} else if(data==2) {
				layer.msg('删除失败!',{icon:0,time:1000});
			}
			init();
		});
		
		/* $(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000}); */
	});
}
	//设置时间
laydate({
    elem: '#start',
    event: 'focus' 
});
</script>
<script type="text/javascript">
        /* require.config({
            paths: {
                echarts: './js/dist'
            }
        });
        require(
            [
                'echarts',
                'echarts/chart/pie',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                'echarts/chart/funnel'
            ],
            function (ec) {
                var myChart = ec.init(document.getElementById('main'));
			
			option = {
    title : {
        text: '国内国外品牌比例',
        subtext: '',
        x:'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        y : 'bottom',
		x:'center',
		bottom:30,
        data:['国内品牌','国外品牌']
    },
    toolbox: {
        show : false,
        feature : {
            mark : {show: false},
            dataView : {show: false, readOnly: false},
            magicType : {
                show: true, 
                type: ['pie', 'funnel'],
                option: {
                    funnel: {
                        x: '25%',
                        width: '50%',
                        funnelAlign: 'left',
                        max: 545
                    }
                }
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    //饼状图
    series : [
        {
            name:'品牌数量',
            type:'pie',
            radius : '45%',
            center: ['50%', '50%'],
            data:[
                {value:335, name:'国内品牌'},
                {value:310, name:'国外品牌'},

            ]
        }
    ]
};
   myChart.setOption(option);
}
); */
        
     
        
</script>