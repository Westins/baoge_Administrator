package com.cappuccino.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cappuccino.pojo.Goods;

public interface GoodsMapperService{

	public List<Goods>selAllGoods(@Param("goodsName")String goodsName,@Param("startDate")String startDate,
			@Param("endDate")String endDate,@Param("chooseUD")String chooseUD,@Param("chooseUDp")String chooseUDp); 
	
	public int upGoodsState(@Param("goodsId")String goodsId);
	
	public int upGoodsStop(@Param("goodsId")String goodsId);
	
	public int upGoodsStart(@Param("goodsId")String goodsId);
	
	public int selCount();
	
	public List<Goods> selTenGoods();
	
	public int selAllMoney();
	
	public int selAllNotInformationShops();
	public int selAllNotInformationGoods();
	
	public int selNotOrders();
	
	public int selWcOrders();
	
	public int selNoOrders();
	
	public int selPromotedGoods();
	
	public int selPromotGoods();
	
}
