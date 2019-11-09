package com.cappuccino.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cappuccino.dao.GoodsMapper;
import com.cappuccino.pojo.Goods;
import com.cappuccino.service.GoodsMapperService;

@Service("goodsMapperService")
public class GoodsMapperServiceImpl implements GoodsMapperService {
	@Autowired
	private GoodsMapper gm;

	@Override
	public List<Goods> selAllGoods(String goodsName, String startDate, String endDate, String chooseUD,
			String chooseUDp) {
		// TODO Auto-generated method stub
		return gm.selAllGoods(goodsName, startDate, endDate, chooseUD, chooseUDp);
	}

	@Override
	public int upGoodsState(String goodsId) {
		// TODO Auto-generated method stub
		return gm.upGoodsState(goodsId);
	}

	@Override
	public int upGoodsStop(String goodsId) {
		// TODO Auto-generated method stub
		return gm.upGoodsStop(goodsId);		
	}

	@Override
	public int upGoodsStart(String goodsId) {
		// TODO Auto-generated method stub
		return gm.upGoodsStart(goodsId);
	}

	@Override
	public int selCount() {
		// TODO Auto-generated method stub
		return gm.selCount();
	}

	@Override
	public List<Goods> selTenGoods() {
		// TODO Auto-generated method stub
		return gm.selTenGoods();
	}

	@Override
	public int selAllMoney() {
		// TODO Auto-generated method stub
		return gm.selAllMoney();
	}

	@Override
	public int selAllNotInformationShops() {
		// TODO Auto-generated method stub
		return gm.selAllNotInformationShops();
	}

	@Override
	public int selAllNotInformationGoods() {
		// TODO Auto-generated method stub
		return gm.selAllNotInformationGoods();
	}

	@Override
	public int selNotOrders() {
		// TODO Auto-generated method stub
		return gm.selNotOrders();
	}

	@Override
	public int selWcOrders() {
		// TODO Auto-generated method stub
		return gm.selWcOrders();
	}

	@Override
	public int selNoOrders() {
		// TODO Auto-generated method stub
		return gm.selNoOrders();
	}

	@Override
	public int selPromotedGoods() {
		// TODO Auto-generated method stub
		return gm.selPromotedGoods();
	}

	@Override
	public int selPromotGoods() {
		// TODO Auto-generated method stub
		return gm.selPromotGoods();
	}

	

	
}
