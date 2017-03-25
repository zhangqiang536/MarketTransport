/*
 * @(#)PageInfo.java V2.0 2015年6月11日
 * 百联集团	版权所有
 * 
 * 文件描述...
 *
 * @Title: PageInfo.java 
 * @Package com.iokbl.www.commons.xml.page 
 * @author Administrator
 * @date 2015年6月11日 下午6:11:13
 * @version V2.0
 * 历史版本：
 * 	1. 【2015年6月11日】 创建文件   by 谭如余
 */
package com.market.pc.utils;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;

/** 
 * 所有描述页面信息父类
 * 
 * @ClassName: PageInfo 
 * @author Administrator
 * @date 2015年6月11日 下午6:11:13
 * @version V2.0 
 *  
 */
public abstract class PageInfo implements Serializable{
	
	/** 
	 * @Fields serialVersionUID : 版本号
	 */
	private static final long serialVersionUID = -8464642128990661848L;

	/** 
	 * @Fields id : 每个页面唯一的id 
	 */
	protected String id;
	
	/** 
	 * @Fields url : 页面跳转路径
	 */
	protected String url;
	
	/** 
	 * @Fields pageId : 页面id
	 */
	protected String pageId;
	
	/** 
	 * @Fields categoryId : 分类id
	 */
	protected String categoryId;
	
	/** 
	 * @Fields searchTerm : 搜索项
	 */
	protected String searchTerm;
	
	/** 
	 * @Fields searchResult : 搜索结果
	 */
	protected String searchResult;
	
	/** 
	 * @fields exportattributes : 扩展属性 ,自己拼接，每个位置有固定的属性内容，内容之间用-_-隔开
	 */
	protected String exportAttributes;
	
	/** 
	 * @Fields map : 扩展map，可以无限扩展属性 
	 */
	protected Map<String,String> map;

	/**
	 * 方法描述：   动态的填充pageInfo中的属性值
	 * @Title: dynamicFillFieldValue 
	 * @date 2015年6月16日 下午3:24:42
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @param replaceValueMap
	 * @return
	 * @throws Exception 
	 */
	public void dynamicFillFieldValue(Map<String,String> replaceValueMap) throws Exception {
		
		//替换父类中的属性
		this.replaceFieldValue("0", PageInfoUtils.PAGEINFO_SEARCH_STRING, replaceValueMap);
		//替换自身的属性
		this.replaceFieldValue("1", PageInfoUtils.PAGEINFO_SEARCH_STRING, replaceValueMap);
		
	}
	
	
	/**
	 * 方法描述：   将pageInfo属性值中含有替换标识的，进行替换操作
	 * @Title: replaceFieldValue 
	 * @date 2015年6月16日 下午3:16:22
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @param pageInfo 替换的对象
	 * @param flag 
	 * @param replaceFlage 替换标识(?)
	 * @param replaceValueMap 替换的内容map
	 * @throws Exception 
	 */
	private void replaceFieldValue(String flag, String replaceFlag, Map<String,String> replaceValueMap) throws Exception {
		//处理父类还是自身的属性
		Field [] fields = null;
		if("0".equals(flag)) {
			fields = this.getClass().getSuperclass().getDeclaredFields();
		}else {
			fields = this.getClass().getDeclaredFields();
		}
		Field.setAccessible(fields, true);
		
		//对属性进行遍历，将属性值中存在替换标识的进行替换
		for (Field f : fields) {
			try {
				
				if(f.get(this) instanceof String) {
					String fieldValue = (String) f.get(this);
					
					//如果属性值不为空  或者 属性值中不包含替换标识 ,则跳过
					if(StringUtils.isBlank(fieldValue) || (fieldValue.indexOf(replaceFlag) == -1)){
						continue;
					}
					
					String value = this.replaceValue(f.getName(), fieldValue, replaceFlag, replaceValueMap, "0");
					
					//将替换好的值重新设置到pageInfo的属性中去
					f.set(this, value);
				}else if (f.get(this) instanceof Map) {
					//替换map属性中的值
					@SuppressWarnings("unchecked")
					Map<String,String> map = (Map<String,String>) f.get(this);
					
					if(map == null || map.isEmpty()){
						continue;
					}
					
					Set<Entry<String, String>> set = map.entrySet();
					
					for(Entry<String, String> e : set) {
						String value = e.getValue();
						
						if(StringUtils.isBlank(value) || value.indexOf(replaceFlag)== -1) {
							continue;
						}
						
						String value1 = this.replaceValue(e.getKey(), value, replaceFlag, replaceValueMap, "1");
						map.put(e.getKey(), value1);
					}
					f.set(this, map);
				} 
				
			} catch (Exception e) {
				throw new Exception("获取pageInfo属性值发生异常",e);
			} 
		}
	}
	
	/**
	 * 方法描述：    替换字符串中需要替换的值
	 * @Title: replaceValue 
	 * @date 2015年8月4日 上午11:44:25
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @param fieldName 属性名
	 * @param srcValue 需要被替换的属性值
	 * @param replaceFlag 替换标识符
	 * @param replaceValueMap 替换内容map
	 * @param flag 标识，如果是直接替换属性，则该值为0，如果是替换map中的属性，则该值为1
	 * @return 替换之后的值
	 */
	private String replaceValue(String fieldName, String srcValue, String replaceFlag, Map<String,String> replaceValueMap,String flag) {
		
		String [] textArr = srcValue.split("\\"+replaceFlag);
		//查看替换标识内容的长度：
		int searchValueLength = replaceFlag.length();
		
		//用于控制到Map中取值的次数的临时变量
		int count = 0;
		//如果 替换标识(这里是针对"?") 在末尾
		if(replaceFlag.equals(srcValue.substring(srcValue.length()-searchValueLength))) {
			count = textArr.length;
		} else {
			count = textArr.length-1;
		}
		//用于拼接替换后的属性值
		StringBuffer sb = new StringBuffer();
		for(int i = 0;i < count; i++) {
			String replaceValue = null;
			if ("0".equals(flag)) {
				replaceValue = replaceValueMap.get(fieldName + PageInfoUtils.PAGEINFO_SEPARATOR + (i+1));
			} else {
				replaceValue = replaceValueMap.get("map" + PageInfoUtils.PAGEINFO_SEPARATOR + fieldName + PageInfoUtils.PAGEINFO_SEPARATOR + (i+1));
			}
			
			if (replaceValue != null) {
				textArr[i] = textArr[i] + replaceValue;
			} else {
				textArr[i] = textArr[i] + replaceFlag;
			}
			sb.append(textArr[i]);
		}
		
		return sb.toString();
	}
	
	
	/**
	 * 方法描述 :  获取每个页面唯一的id
	 * @Title: getId 
	 * @date 2015年6月15日 下午12:05:33
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @return id id
	 */
	public String getId() {
		return id;
	}

	/**
	 * 方法描述 :  设置每个页面唯一的id，同时将对象的引用放入PageInfoMap这个对象缓存中去
	 * @Title: setId 
	 * @date 2015年6月15日 下午12:05:33
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @param id id
	 */
	public void setId(String id) {
		PageInfoMap.setPageInfo(id, this);
		this.id = id;
	}

	/**
	 * 方法描述 :  获取页面跳转路径
	 * @Title: getUrl 
	 * @date 2015年6月15日 上午11:49:05
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @return url 请求跳转页面的url
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * 方法描述 :  设置页面跳转路径
	 * @Title: setUrl 
	 * @date 2015年6月15日 上午11:49:05
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @param url url
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	
	/**
	 * 方法描述 :  获取页面id
	 * @Title: getPageId 
	 * @date 2015年6月15日 上午10:44:15
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @return pageId pageId
	 */
	public String getPageId() {
		return pageId;
	}

	/**
	 * 方法描述 :  设置页面id
	 * @Title: setPageId 
	 * @date 2015年6月15日 上午10:44:15
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @param pageId pageId
	 */
	public void setPageId(String pageId) {
		this.pageId = pageId;
	}

	/**
	 * 方法描述 :  获取分类id
	 * @Title: getCategoryId 
	 * @date 2015年6月15日 上午10:44:15
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @return categoryId categoryId
	 */
	public String getCategoryId() {
		return categoryId;
	}

	/**
	 * 方法描述 :  设置分类id
	 * @Title: setCategoryId 
	 * @date 2015年6月15日 上午10:44:15
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @param categoryId categoryId
	 */
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	/**
	 * 方法描述 :  获取搜索项
	 * @Title: getSearchTerm 
	 * @date 2015年6月15日 上午10:44:15
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @return searchTerm searchTerm
	 */
	public String getSearchTerm() {
		return searchTerm;
	}

	/**
	 * 方法描述 :  设置搜索项
	 * @Title: setSearchTerm 
	 * @date 2015年6月15日 上午10:44:15
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @param searchTerm searchTerm
	 */
	public void setSearchTerm(String searchTerm) {
		this.searchTerm = searchTerm;
	}

	/**
	 * 方法描述 :  获取搜索结果
	 * @Title: getSearchResult 
	 * @date 2015年6月15日 上午10:44:15
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @return searchResult 搜索结果
	 */
	public String getSearchResult() {
		return searchResult;
	}

	/**
	 * 方法描述 :  设置搜索结果
	 * @Title: setSearchResult 
	 * @date 2015年6月15日 上午10:44:15
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @param searchResult 搜索结果
	 */
	public void setSearchResult(String searchResult) {
		this.searchResult = searchResult;
	}

	/**
	 * 方法描述 :  获取扩展属性
	 * @Title: getExportAttributes 
	 * @date 2015年6月15日 上午10:44:15
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @return exportAttributes 扩展属性
	 */
	public String getExportAttributes() {
		return exportAttributes;
	}

	/**
	 * 方法描述 :  设置扩展属性
	 * @Title: setExportAttributes 
	 * @date 2015年6月15日 上午10:44:15
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @param exportAttributes 扩展属性
	 */
	public void setExportAttributes(String exportAttributes) {
		this.exportAttributes = exportAttributes;
	}

	/**
	 * 方法描述 :  获取map
	 * @Title: getMap 
	 * @date 2015年8月4日 上午10:44:53
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @return map 
	 */
	public Map<String, String> getMap() {
		return map;
	}


	/**
	 * 方法描述 :  设置map
	 * @Title: setMap 
	 * @date 2015年8月4日 上午10:44:53
	 * @author 谭如余
	 * @modifier 
	 * @modifydate 
	 * @param map 
	 */
	public void setMap(Map<String, String> map) {
		this.map = map;
	}
	
}
