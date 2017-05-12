package com.market.pc.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iokbl.www.commons.util.JsonUtils;
import com.market.pc.entity.Person;
import com.market.pc.service.UserService;
import com.market.pc.utils.CookieUtils;
import com.market.pc.utils.HttpClientResponse;
import com.market.pc.utils.PageInfoModelAndView;


@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	private static final String MT_TOKEN = "mt_token";
	//进入登录页面
	@RequestMapping("toLoginPage")
	public ModelAndView toLoginPage(HttpServletRequest req , HttpServletResponse res){
//		String header = req.getHeader("Referer");
//		System.out.println(header);
		ModelAndView mv = new ModelAndView("login/login");
		return mv;
	}
	
	//登录校验
	@RequestMapping("toCheckLogin")
	@ResponseBody
	public HttpClientResponse toCheckLogin(HttpServletRequest req , HttpServletResponse res , @RequestBody Person p){
		HttpClientResponse response = new HttpClientResponse();
		String yzm = (String) req.getSession().getAttribute("CHECK_NUMBER_KEY");
//		Person p;
		try {
//			p = JsonUtils.jsonString2Bean(userInfo, Person.class);
			if(yzm.equalsIgnoreCase(p.getYzm())){
				
				Person user =userService.findUser(p);
				if(user == null){
					response.setResultCode("0002");
					response.setResultMsg("用户名密码不正确！");
				}else{
					String token = DigestUtils.md5Hex(System.currentTimeMillis() + user.getLoginName());
					CookieUtils.setCookie(req, res, MT_TOKEN, token);
					req.getSession().setAttribute("user", user);
					response.setResultCode("0000");
					response.setResultMsg("登录成功！");
				}
			}else{
				response.setResultCode("0001");
				response.setResultMsg("验证码信息不正确！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}
	//登录去首页
	@RequestMapping("toIndex")
	public ModelAndView toIndex(HttpServletRequest req , HttpServletResponse res , String userInfo){
		Person p;
		try {
			p = JsonUtils.jsonString2Bean(userInfo, Person.class);
			Person user =userService.findUser(p);
			ModelAndView mv = new PageInfoModelAndView("MT-index", null);
			mv.addObject("user", user);
			return mv;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//退出系统
	@RequestMapping("exitSys")
	public ModelAndView exitSys(HttpServletRequest req , HttpServletResponse res){
		ModelAndView mv = new ModelAndView("login/login");
		CookieUtils.deleteCookie(req, res, MT_TOKEN);
		req.getSession().removeAttribute("user");;
		return mv;
	}
	
	
	//搜索页面
	@RequestMapping("toSearch")
	@ResponseBody
	public ModelAndView toSearch(HttpServletRequest req , HttpServletResponse res){
//		String header = req.getHeader("Referer");
//		System.out.println(header);
		Person person = (Person)req.getSession().getAttribute("user");
		ModelAndView mv = new ModelAndView("search/search");
		mv.addObject("user", person);
		return mv;
	}
	
	//搜索页面
		@RequestMapping("toCart")
		@ResponseBody
		public ModelAndView toCart(HttpServletRequest req , HttpServletResponse res){
//			String header = req.getHeader("Referer");
//			System.out.println(header);
			Person person = (Person)req.getSession().getAttribute("user");
			ModelAndView mv = new ModelAndView("cart/cart");
			mv.addObject("user", person);
			return mv;
		}
}
