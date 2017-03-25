package com.market.pc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.market.pc.utils.PageInfoModelAndView;


@Controller
public class LoginController {
	
	//进入登录页面
	@RequestMapping("toLoginPage")
	public ModelAndView toLoginPage(HttpServletRequest req , HttpServletResponse res){
//		String header = req.getHeader("Referer");
//		System.out.println(header);
		ModelAndView mv = new ModelAndView("login/login");
		return mv;
	}
	
	//登录去首页
	@RequestMapping("toIndex")
	public ModelAndView toIndex(HttpServletRequest req , HttpServletResponse res){
//		ModelAndView mv = new ModelAndView("redirect:index/mtIndex");
		ModelAndView mv = new PageInfoModelAndView("MT-index", null);
		return mv;
	} 
}
