<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="${pageContext.request.contextPath }/backstagejsp/css/shop.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/backstagejsp/css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="${pageContext.request.contextPath }/backstagejsp/css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="${pageContext.request.contextPath }/backstagejsp/font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/backstagejsp/js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/backstagejsp/js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath }/backstagejsp/js/shopFrame.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/backstagejsp/js/Sellerber.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/backstagejsp/js/layer/layer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/backstagejsp/js/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/backstagejsp/js/proTree.js" ></script>
<script src="${pageContext.request.contextPath }/backstagejsp/js/dist/echarts.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/backstagejsp/js/proTree.js" ></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js" type="text/javascript"></script>
<script src="js/respond.min.js"></script>
<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<title>品牌详细</title>
</head>

<script type="text/javascript">
<!--	

//-->

var shopsId=(<%=request.getParameter("shopsId") %>);
alert(shopsId);
$.post("../Shops/selShopsById.do",{shopsId:shopsId},function(data){
	var obj = eval(data);
	alert(obj);
	$.each(obj,function(i,x) {
		$("#s1").html("");
		$("#s2").html("");
		$("#s3").html("");
		$("#s4").html("");
		$("#s5").html("");
		$("#s6").html("");
		$("#s7").html("");
		$("#s8").html("");
		
		$("#s1").html(x.shopsName);		
		$("#s3").html("中国");
		$("#s4").html(x.shopsId);
		
		$.post("../Shops/selByIdshopGoods.do",{shopsId:shopsId},function(data){
			var goodsCount = data;
			if (goodsCount==null||goodsCount=="") {
				goodsCount=0;
			}
			$("#s5").html("共&nbsp;"+goodsCount+"&nbsp;件");
		});
		
		
		
		$("#s6").html("&nbsp;"+x.shopsTime);
		var state="";
		if (x.shopstate==1) {
			state="启用";
		} else if(x.shopstate==4) {
			state="审核中。。";
		}else if(x.shopstate==0){
			state="封禁中。。";
		}
		$("#s7").html(state);
		$("#context").text(x.ShopsTextIntroduce);
		
		$("#shopsNames").html("");
		$("#shopsNames").html(x.shopsName);
		
				
	  });
	
	
});

</script>
<body>
<div class="margin clearfix" id="page_style">
 <div class="brand_detailed same_module  mb15">
  <div class="brand_info clearfix" style="height: 600px">
   <div class="title_brand">品牌信息</div>
   <form>
    <ul class="Info_style clearfix">
     <li><label class="label_name">品牌名称：</label> <span class="name" id="s1">玉兰油OLAY</span></li>
      <!-- <li><label class="label_name">品牌类型：</label><span class="name" id="s2">国外品牌</span></li> -->
      <li><label class="label_name">所属国家：</label><span class="name" id="s3">法国</span></li>
      <li><label class="label_name">品牌编号：</label><span class="name" id="s4">HG3452</span></li>
      <li><label class="label_name">品牌商品：</label><span class="name" id="s5">共3456件</span></li>
      <li><label class="label_name">添加时间：</label><span class="name" id="s6">2016-6-21 34：23</span></li>
      <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="name" id="s7">启用</span></li>
      <li class="b_Introduce"><label class="label_name">品牌介绍：</label><span class="name"><!-- 玉兰油OLAY，是宝洁公司全球著名的护肤品牌，是中国区最大护肤品牌，在大陆已持续十年呈两位数增长。OLAY以全球高科技护肤研发技术为后盾，在深入了解中国女性对护肤和美的需要的基础上，不断扩大产品范围，目前已经涵盖了护肤和沐浴系列，真正帮助女性全面周到地呵护自己的肌肤。玉兰油全球销售额近十亿美金，成为世界上最大、最著名的护肤品牌之一。卓越的护肤功效获得世界爱美女性肯定，迅速畅销150多个国家。玉兰油OLAY，是宝洁公司全球著名的护肤品牌，是中国区最大护肤品牌，在大陆已持续十年呈两位数增长。OLAY以全球高科技护肤研发技术为后盾，在深入了解中国女性对护肤和美的需要的基础上，不断扩大产品范围，目前已经涵盖了护肤和沐浴系列，真正帮助女性全面周到地呵护自己的肌肤。玉兰油全球销售额近十亿美金，成为世界上最大、最著名的护肤品牌之一。卓越的护肤功效获得世界爱美女性肯定，迅速畅销150多个国家。 --></span></li>
      <li class="b_Introduce" style="width: 87%"><span class="name" id="context"></span></li>
    
    </ul>
    <div class="brand_logo">
      <img id="imgshoplog" src="products/logo/156.jpg"  width="120px" height="60px"/>
      <p class="name" id="shopsNames">玉兰油OLAY</p>
    </div>
   </form>
   </div>
	</div>
     <!--产品列表-->
  <div class="h_products_list clearfix" id="Sellerber">
    <!--产品分类展示-->
  <!-- <div class="Sellerber_left menu" id="menuBar">
    <div class="show_btn" id="rightArrow"><span></span></div>
    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
   
    <div class="menu_style" id="menu_style">
    <div class="list_content">
     <div class="side_list">
        <div class="column_title"><h4 class="lighter smaller">产品类型列表</h4></div>
       <div class="st_tree_style tree">
      </div>
    </div>
  </div>
 </div>
</div> -->
     <!--列表展示-->
    <div class="list_Exhibition list_show padding15 same_module">
         <!--品牌商品-->
<!--  <div class="operation clearfix mb15  searchs_style">
       <span class="l_f">
        <a href="add_product.html"  title="添加商品" class="btn bg-deep-blue button_btn"><i class="fa fa-plus"></i>添加商品</a>
        <a href="javascript:ovid()" class="btn button_btn btn-danger"><i class="fa fa-trash"></i>批量删除</a>
       </span>
       <span class="r_f">该品牌下共：<b>234</b>件商品</span>
  </div> -->
      <div class="datalist_show">
       <div class="datatable_height">
       <table class="table table_list table_striped table-bordered" id="sample-table">
		<thead>
		 <tr>
				<th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="80px">产品编号</th>
				<th width="250px">产品名称</th>
				<th width="100px">原价格</th>
				<th width="100px">现价</th>
                <th width="100px">所属地区/国家</th>				
				<th width="180px">加入时间</th>
                <th width="80px">审核状态</th>
				<th width="70px">状态</th>                
				<th width="200px">操作</th>
			</tr>
		</thead>
	<tbody>
     <tr>
        <td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td>
        <td width="80px">45631</td>               
        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">Olay玉兰油 新生塑颜金纯面霜50g（大红瓶） </u></td>
        <td width="100px">5467</td>
        <td width="100px">4525</td> 
        <td width="100px">法国</td>         
        <td width="180px">2014-6-11 11:11:42</td>
        <td class="text-l">通过</td>
        <td class="td-status"><span class="label label-success radius">已启用</span></td>
        <td class="td-manage">
       <a onClick="member_stop(this,'10001')"  href="javascript:;" title="下架"  class="btn btn-xs btn-status">下架</a> 
        <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" >编辑</a> 
        <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-delete" >删除</a>
       </td>
	  </tr>
       <tr>
        <td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td>
        <td width="80px">45631</td>               
        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">玉兰油 Olay 新生塑颜金纯面霜轻盈无香精型50g (大红瓶抗皱紧致 补水保湿) </u></td>
        <td width="100px">5467</td>
        <td width="100px">4525</td> 
        <td width="100px">法国</td>         
        <td width="180px">2014-6-11 11:11:42</td>
        <td class="text-l">通过</td>
        <td class="td-status"><span class="label label-success radius">已启用</span></td>
        <td class="td-manage">
        <a onClick="member_stop(this,'10001')"  href="javascript:;" title="下架"  class="btn btn-xs btn-status">下架</a> 
        <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" >编辑</a> 
        <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-delete" >删除</a>
       </td>
	  </tr>
       <tr>
        <td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td>
        <td width="80px">45631</td>               
        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">玉兰油 Olay 多效修护霜50g(乳液面霜 补水保湿 提拉紧致) </u></td>
        <td width="100px">5467</td>
        <td width="100px">4525</td> 
        <td width="100px">法国</td>         
        <td width="180px">2014-6-11 11:11:42</td>
        <td class="text-l">通过</td>
        <td class="td-status"><span class="label label-success radius">已启用</span></td>
        <td class="td-manage">
       <a onClick="member_stop(this,'10001')"  href="javascript:;" title="下架"  class="btn btn-xs btn-status">下架</a> 
        <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" >编辑</a> 
        <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-delete" >删除</a>
       </td>
	  </tr>
       <tr>
        <td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td>
        <td width="80px">543346</td>               
        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">Olay玉兰油 多效修护粉嫩气色霜50g（保养级BB霜 裸妆） 4G手机Y</u></td>
        <td width="100px">5467</td>
        <td width="100px">4525</td> 
        <td width="100px">法国</td>         
        <td width="180px">2014-6-11 11:11:42</td>
        <td class="text-l">通过</td>
        <td class="td-status"><span class="label label-success radius">已启用</span></td>
        <td class="td-manage">
        <a onClick="member_stop(this,'10001')"  href="javascript:;" title="下架"  class="btn btn-xs btn-status">下架</a> 
        <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" >编辑</a> 
        <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-delete" >删除</a>
       </td>
	  </tr>
       <tr>
        <td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td>
        <td width="80px">987767</td>               
        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">Olay玉兰油 多效修护润舒霜50g（补水保湿、细腻肌肤） </u></td>
        <td width="100px">5467</td>
        <td width="100px">4525</td> 
        <td width="100px">法国</td>         
        <td width="180px">2014-6-11 11:11:42</td>
        <td class="text-l">通过</td>
        <td class="td-status"><span class="label label-success radius">已启用</span></td>
        <td class="td-manage">
       <a onClick="member_stop(this,'10001')"  href="javascript:;" title="下架"  class="btn btn-xs btn-status">下架</a> 
        <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" >编辑</a> 
        <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-delete" >删除</a>
       </td>
	  </tr>
       <tr>
        <td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td>
        <td width="80px">54343</td>               
        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">Olay玉兰油 水感透皙莹肌亮肤液 150ml 4G手机Y</u></td>
        <td width="100px">5467</td>
        <td width="100px">4525</td> 
        <td width="100px">法国</td>         
        <td width="180px">2014-6-11 11:11:42</td>
        <td class="text-l">通过</td>
        <td class="td-status"><span class="label label-success radius">已启用</span></td>
        <td class="td-manage">
        <a onClick="member_stop(this,'10001')"  href="javascript:;" title="下架"  class="btn btn-xs btn-status">下架</a> 
        <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" >编辑</a> 
        <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-delete" >删除</a>
       </td>
	  </tr>
       <tr>
        <td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td>
        <td width="80px">786554</td>               
        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">Olay玉兰油 水感透白亮肤凝乳75ml（提亮肤色） </u></td>
        <td width="100px">5467</td>
        <td width="100px">4525</td> 
        <td width="100px">法国</td>         
        <td width="180px">2014-6-11 11:11:42</td>
        <td class="text-l">通过</td>
        <td class="td-status"><span class="label label-success radius">已启用</span></td>
        <td class="td-manage">
       <a onClick="member_stop(this,'10001')"  href="javascript:;" title="下架"  class="btn btn-xs btn-status">下架</a> 
        <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" >编辑</a> 
        <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-delete" >删除</a>
       </td>
	  </tr>
             <tr>
        <td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td>
        <td width="80px">32122</td>               
        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">Olay玉兰油 活肤菁华霜50g（补水 保湿 ） </u></td>
        <td width="100px">5467</td>
        <td width="100px">4525</td> 
        <td width="100px">法国</td>         
        <td width="180px">2014-6-11 11:11:42</td>
        <td class="text-l">通过</td>
        <td class="td-status"><span class="label label-success radius">已启用</span></td>
        <td class="td-manage">
       <a onClick="member_stop(this,'10001')"  href="javascript:;" title="下架"  class="btn btn-xs btn-status">下架</a> 
        <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" >编辑</a> 
        <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-delete" >删除</a>
       </td>
	  </tr>

       <tr>
        <td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td>
        <td width="80px">767544</td>               
        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">Olay玉兰油 白里透红嫩白乳液75ml（保湿 滋润) 4G手机Y</u></td>
        <td width="100px">5467</td>
        <td width="100px">4525</td> 
        <td width="100px">法国</td>         
        <td width="180px">2014-6-11 11:11:42</td>
        <td class="text-l">通过</td>
        <td class="td-status"><span class="label label-success radius">已启用</span></td>
        <td class="td-manage">
       <a onClick="member_stop(this,'10001')"  href="javascript:;" title="下架"  class="btn btn-xs btn-status">下架</a> 
        <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" >编辑</a> 
        <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-delete" >删除</a>
       </td>
	  </tr>

       <tr>
        <td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td>
        <td width="80px">23466</td>               
        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">小米 Max 全网通 高配版 3GB内存 64GB ROM 金色 移动联通电信4G手机Y</u></td>
        <td width="100px">5467</td>
        <td width="100px">4525</td> 
        <td width="100px">法国</td>         
        <td width="180px">2014-6-11 11:11:42</td>
        <td class="text-l">通过</td>
        <td class="td-status"><span class="label label-success radius">已启用</span></td>
        <td class="td-manage">
        <a onClick="member_stop(this,'10001')"  href="javascript:;" title="下架"  class="btn btn-xs btn-status">下架</a> 
        <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" >编辑</a> 
        <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-delete" >删除</a>
       </td>
	  </tr>

       <tr>
        <td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td>
        <td width="80px">54533</td>               
        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">小米 Max 全网通 高配版 3GB内存 64GB ROM 金色 移动联通电信4G手机Y</u></td>
        <td width="100px">5467</td>
        <td width="100px">4525</td> 
        <td width="100px">法国</td>         
        <td width="180px">2014-6-11 11:11:42</td>
        <td class="text-l">通过</td>
        <td class="td-status"><span class="label label-success radius">已启用</span></td>
        <td class="td-manage">
        <a onClick="member_stop(this,'10001')"  href="javascript:;" title="下架"  class="btn btn-xs btn-status">下架</a> 
        <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" >编辑</a> 
        <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-delete" >删除</a>
       </td>
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
<script type="text/javascript">
		//设置内页框架布局
$(function() { 
	$("#Sellerber").frame({
		float : 'left',
		color_btn:'.skin_select',
		Sellerber_menu:'.list_content',
		page_content:'.list_show',//内容
		datalist:".datatable_height",//数据列表高度取值
		header:65,//顶部高度
		mwidth:200,//菜单栏宽度
		mode:true,//切换模式
		
	});
});
/* var arr=[
	  {id: 1,name: "化妆品",amount:234,pid: 0,},
	  {id: 2,name: "面膜",amount:234,pid: 0,},
	  {id: 3,name: "定妆",amount:234,pid: 0,},
	
];
	//树状图插件
$(".tree").ProTree({
	arr: arr,//数据
	simIcon: "fa fa-file-text-o",//单个标题字体图标 不传默认glyphicon-file
	mouIconOpen: "fa fa-folder-open",//含多个标题的打开字体图标  不传默认glyphicon-folder-open
	mouIconClose:"fa fa-folder",//含多个标题的关闭的字体图标  不传默认glyphicon-folder-close

}) */
/*品牌-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
	});
}

/*品牌-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
</script>
