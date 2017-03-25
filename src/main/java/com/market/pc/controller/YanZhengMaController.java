package com.market.pc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.market.pc.utils.HttpClientResponse;

@Controller
public class YanZhengMaController {
	//验证码
	@RequestMapping(value="yanZhengMa")
	public String yanZhengMa(){
		return "/common/image";
	}
	
	//校验验证码
	@RequestMapping(value = "testYZM")
	@ResponseBody
	public Object testYZM(HttpServletRequest req,
			HttpServletResponse rep , String input_code) {
//		HttpClientResponse message = new HttpClientResponse();
		String message = "";
		String yzm = (String) req.getSession().getAttribute("CHECK_NUMBER_KEY");
//		logger.info("输入验证码：{}, 缓存验证码：{}", input_code,yzm);
		if(StringUtils.isNotBlank(yzm)){
			if(input_code.equalsIgnoreCase(yzm)){
				message = "000000";
			}else{
				message = "110111";
			}
		}else{
			message = "110110";
		}
		return message;
	}
}
