package com.market.pc.mapper;

import com.github.abel533.mapper.Mapper;
import com.market.pc.entity.Person;

public interface UserMapper extends Mapper<Person>{
	
	public Person queryUserInfo(Person p);

}
