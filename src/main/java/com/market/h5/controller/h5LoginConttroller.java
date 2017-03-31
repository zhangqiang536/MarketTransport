package com.market.h5.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("h5")
@Controller
public class h5LoginConttroller {
	@RequestMapping("toLoginPage")
	public ModelAndView toLoginPage(HttpServletRequest req , HttpServletResponse res){
		ModelAndView mv = new ModelAndView("/login/h5Login");
		return mv;
	}
}
