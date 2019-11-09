package com.cappuccino.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.cappuccino.pojo.Shops;

@Repository("ShopsMapper")
public interface ShopsMapper {

	//查询所有的店铺，并且提供查询功能
	public List<Shops>getAllShops(@Param("shopsName")String shopsName,@Param("chooseUD")String shopSV);
	
	//查询该商铺里所有的商品数量
	public int selGoodsCount(@Param("shopId")String shopId);
	
	//下架停用该商铺&&和所有商品
	public int upShopsStop(@Param("shopsId")String shopId);
	
	//对下架停用的商铺&&和所有商品进行恢复处理
	public int upShopsStart(@Param("shopsId")String shopId);
	
	//对下架的商铺里所有的商品进行下架操作
	public int upFJshopGoods(@Param("shopsId")String shopId);
	
	//对恢复上架状态的商铺里的所有商品进行上架操作
	public int upHFshopGoods(@Param("shopsId")String shopId);
	
	//对店铺进行删除操作
	public int upDlshopsState(@Param("shopsId")String shopId);
	
	//对审核店铺执行通过
	public int upShopsAdopt(@Param("shopsId")String shopId);
	
	//用户统计本网站注册的有效店铺数量
	public int selAllShopsCount();
	
	//根据id 店铺的信息
	public List<Shops> selShopsById(@Param("shopsId")String shopId);
	
	//根据审核和关闭状态 局部查询
	public List<Shops> selConditionSF(@Param("clickGb")String clickGb,@Param("clickSh")String clickSh);
	
	//查询网站所有成交订单数
	public int selShopsSalesVolume();
	
	//查询出所有的用户评论
	public int selAllPlcount();
	
	//查询一周的订单数
	public int selyi(@Param("time")String time);
	//查询一周的完成订单数
	public int seler(@Param("time")String time);
	//查询一周的完成订单数
	public int selsan(@Param("time")String time);
	
	
	
}
