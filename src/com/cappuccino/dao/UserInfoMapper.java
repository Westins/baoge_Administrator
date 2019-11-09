package com.cappuccino.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.cappuccino.pojo.*;

@Repository("userMapper")
public interface UserInfoMapper {

	// 管理员登陆查询对应数据
	public UserInfo selByUserGL(@Param("userAccount") String userAccount);

	// 查询所有的会员
	public List<UserInfo> selAllUser(@Param("userName") String userName, @Param("startDate") String startDate,
			@Param("endDate") String endDate);

	// 删除用户以及联动
	public int upUserState(@Param("userId") String userId);
	public int upUserShopStop(@Param("userId") String userId);
	public int upGoodsStop(@Param("shopsId") String shopsId);
	

	// 恢复用户以及连动
	public int upUserStart(@Param("userId") String userId);
	public int upUserShopStart(@Param("userId") String userId);
	public int upGoodsStart(@Param("shopsId") String shopsId);
	

	// 停用用户
	public int upUserStop(@Param("userId") String userId);

	// 根据userId查询用户信息
	public UserInfo selUserById(@Param("userId") String userId);

	// 修改用户相关信息
	public int upByIdUser(@Param("userId") String userId, @Param("userName") String userName,
			@Param("userSex") String userSex, @Param("userPhone") String userPhone, @Param("userState") String userState);
	
	//查询所有的管理员账号
	public List<UserInfo>selAllAdmin(@Param("userName") String userName);
	
	//添加管理员账号
	public int addAdmin(@Param("userName") String userName,@Param("userAccount") String userAccount, @Param("userPwd") String userPwd, 
			@Param("userSex") int userSex, @Param("userPhone") String userPhone, @Param("userEmail") String userEmail,
			@Param("userState") int userState,@Param("userPower") int userPower,@Param("userRegTime") String userRegTime);
	

	//修改管理员的相关信息
	public int upByIdAdmin(@Param("userName") String userName,@Param("userSex") String userSex,@Param("userPhone") String userPhone,
			@Param("userId") String userId,@Param("userAge") String userAge,@Param("userEmail") String userEmail);
	
	
	//用户修改密码
	public int upUserPwd(@Param("userId") String userId,@Param("userPwd") String userPwd);
	
	
}
