/*
 * @(#)DateUtils.java V2.0 2015年5月6日
 * 百联集团	版权所有
 * 日期时间处理工具类
 * @Title: PageInfoUtils.java 
 * @Package com.iokbl.www.core.util 
 * @author 张家俊
 * @date 2015年5月6日 下午12:47:07
 * @version V2.0
 * 历史版本：
 * 	1. 【2015年5月6日】 创建文件   by 张家俊
 */
package com.market.pc.utils;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;


/** 
 * 用户行为分析的pageInfo工具类
 * @ClassName: PageInfoUtils 
 * @author 张家俊
 * @date 2015年8月5日 下午12:47:07
 * @version V2.0 
 *  
 */
public class PageInfoUtils {
	
	/** 
	 * @Fields PAGEINFO_SEARCH_STRING : pageInfo中指定要替换属性值中的标识符 
	 */
	public static final String PAGEINFO_SEARCH_STRING = "?";
	
	/** 
	 * @Fields PAGEINFO_SEPARATOR : pageInfo中替换属性值中的key与位置的分隔符
	 */
	public static final String PAGEINFO_SEPARATOR = "_@";
	
	
	/**
	 *  @Fields PAGEINFO_EXPORT_ATTRIBUTES 扩展属性分隔符
	 */
	public static final String PAGEINFO_EXPORT_ATTRIBUTES = "-_-";
	
	/** 
	 * @Fields PAGEINFO_EXPORT_ATTRIBUTES : map变量固定属性 
	 */
	public static final String PAGEINFO_MAP_ATTRIBUTES = "map";
	
	
	/**
	 * 方法描述：  将需要替换的值放入map
	 * @Title: putReplacePropertityValueToMap 
	 * @date 2015年8月5日 下午2:20:30
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @param map 存放值的map
	 * @param propertity 需要替换的属性
	 * @param index 第几个问号
	 * @param replaceValue 替换的值
	 * retrun 返加map
	 */
	public static Map<String,String> putReplacePropertityValueToMap(Map<String,String> map, String propertity,int index, String replaceValue){
		if(map == null){
			map = new HashMap<String, String>();
		}
		
		if(StringUtils.isBlank(propertity)){
			return map;
		}
		
		map.put(propertity + PAGEINFO_SEPARATOR + index ,replaceValue);
		return map;
	}
	
	/**
	 * 方法描述：  将需要替换的Map中的属性值放入map
	 * @Title: putReplaceMapPropertityValueToMap 
	 * @date 2015年8月5日 下午2:20:30
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @param map 存放值的map
	 * @param propertity 需要替换的属性
	 * @param index 第几个问号
	 * @param replaceValue 替换的值
	 * @return 返加map
	 */
	public static Map<String,String> putReplaceMapPropertityValueToMap(Map<String,String> map, String propertity,int index, String replaceValue){
		if(map == null){
			map = new HashMap<String, String>();
		}
		
		if(StringUtils.isBlank(propertity)){
			return map;
		}
		
		map.put(PAGEINFO_MAP_ATTRIBUTES+ PAGEINFO_SEPARATOR + propertity + PAGEINFO_SEPARATOR + index ,replaceValue);
		return map;
	}
	
	/**
	 * 方法描述：  将需要替换的Map中的属性值放入map
	 * @Title: putExportAttributesToMap 
	 * @date 2015年8月5日 下午2:20:30
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @param map 存放值的map
	 * @param propertity 需要替换的属性
	 * @param index 第几个问号
	 * @param replaceValue 替换的值
	 */
	public static Map<String,String> putExportAttributesToMap(Map<String,String> map, int index, String ...replaceValue){
		if(map == null){
			map = new HashMap<String, String>();
		}
		
		String key = "exportAttributes" + PAGEINFO_SEPARATOR +index;
		
		if(replaceValue == null || replaceValue.length==0 ){
			return map;
		}
		
		StringBuffer sb = new StringBuffer("");
		for(int i=0;i<replaceValue.length;i++) {
			
			sb.append(replaceValue[i]);
			if(i!=replaceValue.length-1){
				
				sb.append(PAGEINFO_EXPORT_ATTRIBUTES);
			}
		}
		
		map.put(key,sb.toString());
		return map;
	}
	
}
