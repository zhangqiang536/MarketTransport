package com.market.pc.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="user")
public class Person {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)//自增字段
	private Long id;
	
	/**
	 * 姓名：name
	 */
	private String name;
	
	/**
	 * 登录名：loginName
	 */
	private String loginName;
	
	/**
	 * 密码：password
	 */
	private String password;
	
	/**
	 * 手机号：phoneNum
	 */
	private String phoneNum;
	
	/**
	 * 身份证号：cardNum
	 */
	private String cardNum;
	
	/**
	 * 用户类型：0 管理员 1卖家 2买家 
	 */
	private String personType;
	
	/**
	 * 访问渠道：0 pc 1 手机
	 */
	private String dataFrom;
	
	/**
	 * 验证码：yzm
	 */
	private String yzm;

	/**
	 * token:token
	 */
	private String token;
	
	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	public String getPersonType() {
		return personType;
	}

	public void setPersonType(String personType) {
		this.personType = personType;
	}

	public String getDataFrom() {
		return dataFrom;
	}

	public void setDataFrom(String dataFrom) {
		this.dataFrom = dataFrom;
	}

	public String getYzm() {
		return yzm;
	}

	public void setYzm(String yzm) {
		this.yzm = yzm;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	
}
