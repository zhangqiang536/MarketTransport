/*package com.market.h5.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.wanDa.common.ConfigProperties;
import com.wanDa.util.CheckUtils;

@Controller
@RequestMapping(value="/weChat")
public class WeChatController {
	*//**
	 * 验证token
	 *//*
	@RequestMapping(value="/token")
	public  void getToken(HttpServletRequest req,HttpServletResponse resp){
		String signature = req.getParameter("signature");
		String timestamp = req.getParameter("timestamp");
		String nonce = req.getParameter("nonce");
		String echostr = req.getParameter("echostr");
		String token = "wanda";
		PrintWriter out = null;
		try {
			out = resp.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(CheckUtils.checkSignature(token, signature, timestamp, nonce)){
			out.print(echostr);
		}
	}
	
	*//**
	 * httpPost 请求方式
	 * @param url         url地址
     * @param jsonParam     参数
     * @param noNeedResponse    不需要返回结果
	 * @return
	 *//*
	public static String httpPost(String url,String code){
		String urls = "http://10.199.18.132:8080/transmits/transmit/transmit.do?url="+url;
		//创建一个httpClient实例
		HttpClient httpClient = new DefaultHttpClient();
		//根据url创建post实例
		HttpPost post = new HttpPost(urls);
		String result = "";
		//发送请求并获取反馈
		try {
			HttpResponse response = httpClient.execute(post);
			// 判断请求是否成功处理
			if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				// 解析返回的内容
				result = EntityUtils.toString(response.getEntity());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject json = JSONObject.fromObject(result);
		String openid = (String) json.get("openid");
		return openid;
	}
	*//**
	 * 根据code获取用户的openid
	 * @param code
	 * @return
	 *//*
	public static String openid(String code){
		String url = ConfigProperties.getValue("url")
				+ "appid="+ConfigProperties.getValue("appid")
				+ "&secret="+ConfigProperties.getValue("secret")
				+ "&code="+code
				+ "&grant_type="+ConfigProperties.getValue("grant_type");
		return WeChatController.httpPost(url,code);
	}
}
*/