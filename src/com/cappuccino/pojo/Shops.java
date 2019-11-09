package com.cappuccino.pojo;

import java.util.Date;

public class Shops {
	
	private int shopsId,shopssalesVolume;
	private UserInfo user;
	private double shopssales;
	private Date shopsTime;
	private String shopsName,shopsLogo,shopsImgIntroduce,shopsVideoIntroduce,shopstate,ShopsTextIntroduce;
	
	
	public String getShopsTextIntroduce() {
		return ShopsTextIntroduce;
	}
	public void setShopsTextIntroduce(String shopsTextIntroduce) {
		ShopsTextIntroduce = shopsTextIntroduce;
	}
	public Date getShopsTime() {
		return shopsTime;
	}
	public void setShopsTime(Date shopsTime) {
		this.shopsTime = shopsTime;
	}
	public int getShopsId() {
		return shopsId;
	}
	public void setShopsId(int shopsId) {
		this.shopsId = shopsId;
	}
	public int getShopssalesVolume() {
		return shopssalesVolume;
	}
	public void setShopssalesVolume(int shopssalesVolume) {
		this.shopssalesVolume = shopssalesVolume;
	}
	public UserInfo getUser() {
		return user;
	}
	public void setUser(UserInfo user) {
		this.user = user;
	}
	public double getShopssales() {
		return shopssales;
	}
	public void setShopssales(double shopssales) {
		this.shopssales = shopssales;
	}
	public String getShopsName() {
		return shopsName;
	}
	public void setShopsName(String shopsName) {
		this.shopsName = shopsName;
	}
	public String getShopsLogo() {
		return shopsLogo;
	}
	public void setShopsLogo(String shopsLogo) {
		this.shopsLogo = shopsLogo;
	}
	public String getShopsImgIntroduce() {
		return shopsImgIntroduce;
	}
	public void setShopsImgIntroduce(String shopsImgIntroduce) {
		this.shopsImgIntroduce = shopsImgIntroduce;
	}
	public String getShopsVideoIntroduce() {
		return shopsVideoIntroduce;
	}
	public void setShopsVideoIntroduce(String shopsVideoIntroduce) {
		this.shopsVideoIntroduce = shopsVideoIntroduce;
	}
	public String getShopstate() {
		return shopstate;
	}
	public void setShopstate(String shopstate) {
		this.shopstate = shopstate;
	}
	
	

}
