/*
 * @(#)PageInfoPageInfoModelAndView.java V2.0 2015年6月12日
 * 百联集团	版权所有
 * 
 * 文件描述...
 *
 * @Title: PageInfoPageInfoModelAndView.java 
 * @Package com.iokbl.www.core.component 
 * @author Administrator
 * @date 2015年6月12日 上午9:38:03
 * @version V2.0
 * 历史版本：
 * 	1. 【2015年6月12日】 创建文件   by 谭如余
 */
package com.market.pc.utils;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.iokbl.www.commons.util.JsonUtils;

/**
 * 处理返回页面信息的视图模型类
 * 
 * @ClassName: PageInfoPageInfoModelAndView
 * @author Administrator
 * @date 2015年6月12日 上午9:38:03
 * @version V2.0
 * 
 */
public class PageInfoModelAndView extends ModelAndView {

	/**
	 * @Fields log : 日志对象
	 */
	private Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * @Fields pageInfo : pageInfo对象
	 */
	private PageInfo pageInfo;

	public PageInfoModelAndView() {

	}

	/**
	 * <p>
	 * Title: 扩展了父类的构造方法，增加了一个Map替换值
	 * </p>
	 * <p>
	 * Description:
	 * </p>
	 * 
	 * @param viewName 每个页面id，这个id是唯一的
	 * @param replaceValue 需要在pageInfo中的属性值替换
	 */
	public PageInfoModelAndView(String pid, Map<String, String> replaceValueMap) {
		// 调用父类的构造方法(通过pid获得pageInfo对象，从而 获取请求url)
		super(getUrl(pid));

		// 处理pageInfo信息
		doPageInfoValue(pid, replaceValueMap);
	}
	public PageInfoModelAndView(String url, Map<String, String> replaceValueMap , String a) {
		// 处理pageInfo信息
		doPageInfoValue(url, replaceValueMap);
	}
	
	/**
	 * <p>
	 * Title:
	 * </p>
	 * <p>
	 * Description:
	 * </p>
	 * 
	 * @param viewName 每个页面id，这个id是唯一的
	 * @param model
	 * @param replaceValueMap 需要在pageInfo中的属性值替换的Map
	 */
	public PageInfoModelAndView(String pid, Map<String, ?> model, Map<String, String> replaceValueMap) {
		// 调用父类的构造方法(通过pid获得pageInfo对象，从而 获取请求url)
		super(getUrl(pid), model);

		// 处理pageInfo信息
		doPageInfoValue(pid, replaceValueMap);
	}

	/**
	 * <p>
	 * Title:
	 * </p>
	 * <p>
	 * Description:
	 * </p>
	 * 
	 * @param pid 每个页面id，这个id是唯一的
	 * @param modelName
	 * @param modelObject
	 * @param replaceValueMap 需要在pageInfo中的属性值替换的Map
	 */
	public PageInfoModelAndView(String pid, String modelName, Object modelObject, Map<String, String> replaceValueMap) {
		// 调用父类的构造方法(通过pid获得pageInfo对象，从而 获取请求url)
		super(getUrl(pid), modelName, modelObject);

		// 处理pageInfo信息
		doPageInfoValue(pid, replaceValueMap);
	}

	/**
	 * 方法描述： 重新将pageInfo信息重设 处理调用者更换页面路径
	 * 
	 * @Title: setViewName
	 * @date 2015年6月17日 下午2:29:50
	 * @author 谭如余
	 * @modifier
	 * @modifydate
	 * @param pid 页面唯一标识id
	 * @param replaceValueMap 替换补充pageInfo中属性值，如果不需要可以为空
	 */
	public void setViewName(String pid, Map<String, String> replaceValueMap) {
		// 设置url
		super.setViewName(getUrl(pid));
		// 处理pageInfo信息
		doPageInfoValue(pid, replaceValueMap);
	}

	/**
	 * 方法描述： 获取请求url路径
	 * 
	 * @Title: getUrl
	 * @date 2015年6月17日 下午4:59:08
	 * @author 谭如余
	 * @modifier
	 * @modifydate
	 * @param pid 页面唯一标识id
	 * @return
	 */
	private static String getUrl(String pid) {
		return PageInfoMap.getPageInfo(pid).getUrl();
	}

	/**
	 * 方法描述： 处理pageInfo信息 业务逻辑说明 ： 1、初始化pageInfo 2、执行替换补充pageInfo中的属性值
	 * 
	 * @Title: doPageInfoValue
	 * @date 2015年6月17日 下午4:53:48
	 * @author 谭如余
	 * @modifier
	 * @modifydate
	 * @param pid
	 * @param replaceValueMap
	 */
	private void doPageInfoValue(String pid, Map<String, String> replaceValueMap) {
		// 1、初始化pageInfo对象
		try {
			pageInfo = (PageInfo) BeanUtils.deepCopy(PageInfoMap.getPageInfo(pid));
			// 2、执行pageInfo中的属性值替换与补充
			this.getModelMap().addAttribute("pageInfoJson", packagePageInfo(replaceValueMap));
		} catch (Exception e) {
			log.error("深clone 失败");
		}
	}

	/**
	 * 方法描述： 将pageInfo中的值进行填充封装并且转换为json字符串 业务逻辑： 将pageInfo中的属性值中有"?"的值进行替换
	 * 
	 * @Title: packagePageInfo
	 * @date 2015年6月15日 下午10:00:22
	 * @author 谭如余
	 * @modifier
	 * @modifydate
	 * @param replaceValueMap 需要补充值的map
	 * @return
	 */
	private String packagePageInfo(Map<String, String> replaceValueMap) {

		// 查看pageInfo中是否有需要补充的信息：
		if (replaceValueMap != null) {

			try {
				pageInfo.dynamicFillFieldValue(replaceValueMap);
			} catch (Exception e) {
				log.error("将pageInfo中的值进行填充封装并且转换为json字符串异常{}", e);
			}
		}
		// 将pageInfo转换为json字符串
		return JsonUtils.object2JsonString(pageInfo);
	}

	/**
	 * 方法描述： pageInfo 中一个设置扩展属性值的方法
	 * 
	 * @Title: setExportAttributes
	 * @date 2015年6月18日 上午10:50:28
	 * @author 谭如余
	 * @modifier
	 * @modifydate
	 * @param exportAttributes
	 */
	public void setExportAttributes(String exportAttributes) {
		this.pageInfo.setExportAttributes(exportAttributes);
	}

	public PageInfoModelAndView(View view) {
		super(view);
	}

	public PageInfoModelAndView(View view, Map<String, ?> model) {
		super(view, model);
	}

	public PageInfoModelAndView(View view, String modelName, Object modelObject) {
		super(view, modelName, modelObject);
	}

}
