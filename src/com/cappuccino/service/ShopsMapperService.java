package com.cappuccino.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cappuccino.pojo.Shops;

public interface ShopsMapperService {

	public List<Shops>getAllShops(@Param("shopsName")String shopsName,@Param("chooseUD")String shopSV);

	public int selGoodsCount(@Param("shopId") String shopId);

	public int upShopsStop(@Param("shopId") String shopId);

	public int upShopsStart(@Param("shopId") String shopId);

	public int upFJshopGoods(@Param("shopsId") String shopId);

	public int upHFshopGoods(@Param("shopsId") String shopId);
	
	public int upDlshopsState(@Param("shopsId")String shopId);
	
	public int upShopsAdopt(@Param("shopsId")String shopId);
	
	public int selAllShopsCount();
	
	public List<Shops> selShopsById(@Param("shopsId")String shopId);

	public List<Shops> selConditionSF(@Param("clickGb")String clickGb,@Param("clickSh")String clickSh);
	
	public int selShopsSalesVolume();
	
	public int selAllPlcount();
	
	public int selyi(@Param("time")String time);
	
	public int seler(@Param("time")String time);
	
	public int selsan(@Param("time")String time);
	
	
}
