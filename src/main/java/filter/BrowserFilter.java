package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BrowserFilter implements Filter {
	/**
	 * 获取浏览器版本信息
	 * @Title: getBrowserName
	 * @data:2015-1-12下午05:08:49
	 * @param agent
	 * @return
	 */
	public String getBrowserName(String agent) {
		if (agent.indexOf("msie 7") > 0) {
			return "ie7";
		} else if (agent.indexOf("msie 8") > 0) {
			return "ie8";
		} else if (agent.indexOf("msie 9") > 0) {
			return "ie9";
		} else if (agent.indexOf("msie 10") > 0) {
			return "ie10";
		} else if (agent.indexOf("msie") > 0) {
			return "ie";
		} else if (agent.indexOf("opera") > 0) {
			return "opera";
		} else if (agent.indexOf("opera") > 0) {
			return "opera";
		} else if (agent.indexOf("firefox") > 0) {
			return "firefox";
		} else if (agent.indexOf("webkit") > 0) {
			return "webkit";
		} else if (agent.indexOf("gecko") > 0 && agent.indexOf("rv:11") > 0) {
			return "ie11";
		} else {
			return "Others";
		}
	}

	@Override
	public void destroy() {
		
	}

	@Override
  public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException { 
      HttpServletRequest r = (HttpServletRequest) servletRequest; 
      HttpServletResponse p = (HttpServletResponse) servletResponse;
		String agent = r.getHeader("User-Agent").toLowerCase();
		System.out.println(agent);
		System.out.println("浏览器版本：" + getBrowserName(agent));		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
