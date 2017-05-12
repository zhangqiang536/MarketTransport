package com.market.pc.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.pc.entity.Person;
import com.market.pc.mapper.UserMapper;
import com.market.pc.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	@Override
	public Person findUser(Person p) {
		return userMapper.queryUserInfo(p);
	}
	
	
	
}
