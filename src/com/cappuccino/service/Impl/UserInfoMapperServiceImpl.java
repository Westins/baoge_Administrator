package com.cappuccino.service.Impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cappuccino.dao.UserInfoMapper;
import com.cappuccino.pojo.UserInfo;
import com.cappuccino.service.UserInfoMapperService;


@Service("userImpl")
public class UserInfoMapperServiceImpl implements UserInfoMapperService{

	@Autowired
	private UserInfoMapper userMapper;

	@Override
	public UserInfo selByUserGL(String userAccount) {
		// TODO Auto-generated method stub
		return userMapper.selByUserGL(userAccount);
	}

	@Override
	public List<UserInfo> selAllUser(String userName, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return userMapper.selAllUser(userName, startDate, endDate);
	}

	@Override
	public int upUserState(String userId) {
		// TODO Auto-generated method stub
		return userMapper.upUserState(userId);
	}

	@Override
	public int upUserStart(String userId) {
		// TODO Auto-generated method stub
		return userMapper.upUserStart(userId);
	}

	@Override
	public int upUserStop(String userId) {
		// TODO Auto-generated method stub
		return userMapper.upUserStop(userId);
	}

	@Override
	public UserInfo selUserById(String userId) {
		// TODO Auto-generated method stub
		return userMapper.selUserById(userId);
	}

	@Override
	public int upByIdUser(String userId, String userName, String userSex, String userPhone, String userState) {
		// TODO Auto-generated method stub
		return userMapper.upByIdUser(userId, userName, userSex, userPhone, userState);
	}

	@Override
	public int upUserShopStop(String userId) {
		// TODO Auto-generated method stub
		return userMapper.upUserShopStop(userId);
	}

	@Override
	public int upGoodsStop(String shopsId) {
		// TODO Auto-generated method stub
		return userMapper.upGoodsStop(shopsId);
	}

	@Override
	public int upUserShopStart(String userId) {
		// TODO Auto-generated method stub
		return userMapper.upUserShopStart(userId);
	}

	@Override
	public int upGoodsStart(String shopsId) {
		// TODO Auto-generated method stub
		return userMapper.upGoodsStart(shopsId);
	}

	@Override
	public List<UserInfo> selAllAdmin(String userName) {
		// TODO Auto-generated method stub
		return userMapper.selAllAdmin(userName);
	}

	@Override
	public int addAdmin(String userName, String userAccount, String userPwd, int userSex, String userPhone,
			String userEmail, int userState, int userPower, String userRegTime) {
		// TODO Auto-generated method stub
		return userMapper.addAdmin(userName, userAccount, userPwd, userSex, userPhone, userEmail, userState, userPower, userRegTime);
	}

	@Override
	public int upByIdAdmin(String userName, String userSex, String userPhone, String userId, String userAge,
			String userEmail) {
		// TODO Auto-generated method stub
		return userMapper.upByIdAdmin(userName, userSex, userPhone, userId, userAge, userEmail);
	}

	@Override
	public int upUserPwd(String userId, String userPwd) {
		// TODO Auto-generated method stub
		return userMapper.upUserPwd(userId, userPwd);
	}

	

	


	
}
