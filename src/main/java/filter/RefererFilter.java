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

import org.apache.log4j.Logger;
/**
 * songjt20151031
 * 检查http之referer
 */ 
public class RefererFilter implements Filter {
	private String refererPrefix = "";
    private String errorRefererToRedirectURL = ""; 
    public void init(FilterConfig conf) throws ServletException { 
    	refererPrefix = conf.getInitParameter("refererPrefix"); 
    	errorRefererToRedirectURL = conf.getInitParameter("errorRefererToRedirectURL"); 
    } 

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain) throws IOException, ServletException { 
        HttpServletRequest request = (HttpServletRequest)req; 
        HttpServletResponse response = (HttpServletResponse)res; 	    	
		
		String referer = request.getHeader("referer");
		referer = referer==null?"":referer;
		String url = request.getServletPath();

		if(((!url.equalsIgnoreCase(""))&&
			(!url.equalsIgnoreCase("/"))&&
			(!url.equalsIgnoreCase("\\"))&&
			(!url.contains("/index.html"))&&
			(!url.contains("/index.jsp"))&&
			(!url.contains("loginMobileCustomer/login"))&&
			(!url.contains("userController/toLogin"))&&
			(!url.contains("webCustomer/login")))&&(!referer.contains(refererPrefix))){
            response.sendRedirect(request.getContextPath()+errorRefererToRedirectURL); 	
            return;
		}
        filterChain.doFilter(req, res); 
    } 
     
    public void destroy() { 
         
    } 

}
