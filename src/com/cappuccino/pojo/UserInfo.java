package com.cappuccino.pojo;

import java.util.Date;

public class UserInfo {
	private int userId, userPower, userState, userSex;
	private Date userRegTime;
	private String userName, userAccount, userPwd, userImg, userAge, userPhone, userEmail;
	private double userWallet,UserPayTreasureWallet;

	
	
	public double getUserPayTreasureWallet() {
		return UserPayTreasureWallet;
	}

	public void setUserPayTreasureWallet(double userPayTreasureWallet) {
		UserPayTreasureWallet = userPayTreasureWallet;
	}

	public Date getUserRegTime() {
		return userRegTime;
	}

	public void setUserRegTime(Date userRegTime) {
		this.userRegTime = userRegTime;
	}

	

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public double getUserWallet() {
		return userWallet;
	}

	public void setUserWallet(double userWallet) {
		this.userWallet = userWallet;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserPower() {
		return userPower;
	}

	public void setUserPower(int userPower) {
		this.userPower = userPower;
	}

	public int getUserState() {
		return userState;
	}

	public void setUserState(int userState) {
		this.userState = userState;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public int getUserSex() {
		return userSex;
	}

	public void setUserSex(int userSex) {
		this.userSex = userSex;
	}

	public String getUserAge() {
		return userAge;
	}

	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
}
