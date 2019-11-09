package com.cappuccino.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.cappuccino.pojo.Goods;

@Repository("GoodsMapper")
public interface GoodsMapper{
	
	
	//查询所有的商品，&&根据名称时间。。来部分查询
	public List<Goods>selAllGoods(@Param("goodsName")String goodsName,@Param("startDate")String startDate,
			@Param("endDate")String endDate,@Param("chooseUD")String chooseUD,@Param("chooseUDp")String chooseUDp); 

	////多删操作,单删除商品操作，修改商品状态为4
	public int upGoodsState(@Param("goodsId")String goodsId);
	
	//对违规商品进行封禁处理 改状态为0
	public int upGoodsStop(@Param("goodsId")String goodsId);
	
	//对违规商品进行封禁处理 改状态为1
	public int upGoodsStart(@Param("goodsId")String goodsId);
	
	//查询商品的总数
	public int selCount();
	
	//查询了商品销量前十
	public List<Goods> selTenGoods();
	
	//查询本网站的所有成交金额
	public int selAllMoney();
	
	//这是一个统计待处理的信息的Shops+Goods
	public int selAllNotInformationShops();
	public int selAllNotInformationGoods();
	
	//查询本网站的所有的待发货订单数
	public int selNotOrders();
	
	//查询出已完成的订单数
	public int selWcOrders();
	
	//查询未完成的订单数
	public int selNoOrders();
	
	//查询出待审核的促销商品个数
	public int selPromotedGoods();
	
	//查询已发布的促销商品个数
	public int selPromotGoods();
	
	
}
