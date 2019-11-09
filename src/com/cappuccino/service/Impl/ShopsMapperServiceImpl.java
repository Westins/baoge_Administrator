package com.cappuccino.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cappuccino.dao.ShopsMapper;
import com.cappuccino.pojo.Shops;
import com.cappuccino.service.ShopsMapperService;

@Service("shopsImpl")
public class ShopsMapperServiceImpl implements ShopsMapperService{

	@Autowired
	private ShopsMapper sm; 

	@Override
	public List<Shops> getAllShops(String shopsName,String shopSV) {
		// TODO Auto-generated method stub
		return sm.getAllShops(shopsName, shopSV);
	}

	@Override
	public int selGoodsCount(String shopId) {
		// TODO Auto-generated method stub
		return sm.selGoodsCount(shopId);
	}

	@Override
	public int upShopsStop(String shopId) {
		// TODO Auto-generated method stub
		return sm.upShopsStop(shopId);
	}

	@Override
	public int upShopsStart(String shopId) {
		// TODO Auto-generated method stub
		return sm.upShopsStart(shopId);
	}

	@Override
	public int upFJshopGoods(String shopId) {
		// TODO Auto-generated method stub
		return sm.upFJshopGoods(shopId);
	}

	@Override
	public int upHFshopGoods(String shopId) {
		// TODO Auto-generated method stub
		return sm.upHFshopGoods(shopId);
	}

	@Override
	public int upDlshopsState(String shopId) {
		// TODO Auto-generated method stub
		return sm.upDlshopsState(shopId);
	}

	@Override
	public int upShopsAdopt(String shopId) {
		// TODO Auto-generated method stub
		return sm.upShopsAdopt(shopId);
	}

	@Override
	public int selAllShopsCount() {
		// TODO Auto-generated method stub
		return sm.selAllShopsCount();
	}

	@Override
	public List<Shops> selShopsById(String shopsId) {
		// TODO Auto-generated method stub
		return sm.selShopsById(shopsId);
	}

	@Override
	public List<Shops> selConditionSF(String clickGb, String clickSh) {
		// TODO Auto-generated method stub
		return sm.selConditionSF(clickGb, clickSh);
	}

	@Override
	public int selShopsSalesVolume() {
		// TODO Auto-generated method stub
		return sm.selShopsSalesVolume();
	}

	@Override
	public int selAllPlcount() {
		// TODO Auto-generated method stub
		return sm.selAllPlcount();
	}

	@Override
	public int selyi(String time) {
		// TODO Auto-generated method stub
		return sm.selyi(time);
	}

	@Override
	public int seler(String time) {
		// TODO Auto-generated method stub
		return sm.seler(time);
	}

	@Override
	public int selsan(String time) {
		// TODO Auto-generated method stub
		return sm.selsan(time);
	}

	
	

	
}
