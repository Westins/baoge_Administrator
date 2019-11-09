package com.cappuccino.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cappuccino.pojo.*;

public interface UserInfoMapperService {

	public UserInfo selByUserGL(@Param("userAccount") String userAccount);

	public List<UserInfo> selAllUser(@Param("userName") String userName, @Param("startDate") String startDate,
			@Param("endDate") String endDate);

	public int upUserState(@Param("userId") String userId);

	public int upUserStart(@Param("userId") String userId);

	public int upUserStop(@Param("userId") String userId);

	public UserInfo selUserById(@Param("userId") String userId);

	public int upByIdUser(@Param("userId") String userId, @Param("userName") String userName,
			@Param("userSex") String userSex, @Param("userPhone") String userPhone,
			@Param("userState") String userState);
	
	public int upUserShopStop(@Param("userId") String userId);
	
	public int upGoodsStop(@Param("shopsId") String shopsId);
	
	public int upUserShopStart(@Param("userId") String userId);

	public int upGoodsStart(@Param("shopsId") String shopsId);
	
	public List<UserInfo>selAllAdmin(@Param("userName") String userName);
	
	public int addAdmin(@Param("userName") String userName,@Param("userAccount") String userAccount, @Param("userPwd") String userPwd, 
			@Param("userSex") int userSex, @Param("userPhone") String userPhone, @Param("userEmail") String userEmail,
			@Param("userState") int userState,@Param("userPower") int userPower,@Param("userRegTime") String userRegTime);
	
	public int upByIdAdmin(@Param("userName") String userName,@Param("userSex") String userSex,@Param("userPhone") String userPhone,
			@Param("userId") String userId,@Param("userAge") String userAge,@Param("userEmail") String userEmail);
	
	
	public int upUserPwd(@Param("userId") String userId,@Param("userPwd") String userPwd);
	

}
