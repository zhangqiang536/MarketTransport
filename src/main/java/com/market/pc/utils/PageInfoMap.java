/*
 * @(#)PageInfos.java V2.0 2015年6月11日
 * 百联集团	版权所有
 * 
 * 文件描述...
 *
 * @Title: PageInfos.java 
 * @Package com.iokbl.www.commons.xml.page 
 * @author Administrator
 * @date 2015年6月11日 上午9:40:05
 * @version V2.0
 * 历史版本：
 * 	1. 【2015年6月11日】 创建文件   by 谭如余
 */
package com.market.pc.utils;

import java.util.HashMap;
import java.util.Map;

/** 
 * 存储页面信息数据
 * 
 * @ClassName: PageInfos 
 * @author Administrator
 * @date 2015年6月11日 上午9:40:05
 * @version V2.0 
 *  
 */
public class PageInfoMap {
	
	/** 
	 * @Fields pageInfosMap : 存储pageInfo信息的map
	 */
	private static Map<String, PageInfo> pageInfosMap = new HashMap<String, PageInfo>();
	
	/**
	 * 方法描述：   将pageInfo信息放入Map中
	 * @Title: setPageInfo 
	 * @date 2015年6月11日 上午10:27:15
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @param key 页码
	 * @param pageInfo 页面信息
	 */
	public static void setPageInfo(String key, PageInfo pageInfo) {
		PageInfoMap.pageInfosMap.put(key, pageInfo);
	}
	
	/**
	 * 方法描述：    将pageInfo信息从Map中取出
	 * @Title: getPageInfo 
	 * @date 2015年6月11日 上午10:27:40
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @param key
	 * @return
	 */
	public static PageInfo getPageInfo(String key) {
		return PageInfoMap.pageInfosMap.get(key);
	}
	
}
