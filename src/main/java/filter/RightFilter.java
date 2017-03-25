package filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wanDa.common.MessageUtils;
import com.wanDa.dto.ResourceWithRoleIdsDto;
/** 
 * 用于检测用户是否登陆的过滤器，如果未登录，则重定向到指的登录页面 配置参数 checkSessionKey 需检查的在 Session 中保存的关键字 
 * redirectURL 如果用户未登录，则重定向到指定的页面，URL不包括 ContextPath notCheckURLList 
 * 不做检查的URL列表，以分号分开，并且 URL 中不包括 ContextPath 
 */  
public class RightFilter implements Filter {  
	
  protected FilterConfig filterConfig = null;  
  private ServletContext application = null;
  private List<ResourceWithRoleIdsDto> resourceWithRoleIdsDtos = null;
  private String noLoginToRedirectURL = null;  
  private String noRightToRedirectURL = null;
  private Set<String> notCheckURLList = new HashSet<String>();  
  
  @Override  
  public void destroy() {  
     notCheckURLList.clear();  
  }
    
  @Override  
  public void init(FilterConfig filterConfig) throws ServletException {  
    this.filterConfig = filterConfig;  
    this.application =  filterConfig.getServletContext();
    //获得重定向url
    noLoginToRedirectURL = filterConfig.getInitParameter("noLoginToRedirectURL"); 
    noRightToRedirectURL = filterConfig.getInitParameter("noRightToRedirectURL"); 
    
    filterConfig.getInitParameter("checkSessionKey");  
    //获得不检查的url
    String notCheckURLListStr = filterConfig.getInitParameter("notCheckURLList");  
    if (notCheckURLListStr != null) {  
      System.out.println(notCheckURLListStr);  
      String[] params = notCheckURLListStr.split(",");  
      for (int i = 0; i < params.length; i++) {  
        notCheckURLList.add(params[i].trim());  
      }  
    }  
  }  
  
  private boolean checkRequestURIInNotCheckURLList(HttpServletRequest request) {  
	    String uri = request.getServletPath()  
	        + (request.getPathInfo() == null ? "" : request.getPathInfo());  
	    String temp = request.getRequestURI();  
	    temp = temp.substring(request.getContextPath().length() + 1);  
	    // System.out.println("是否包括："+uri+";"+notCheckURLList+"=="+notCheckURLList.contains(uri));  
	    return notCheckURLList.contains(uri);  
  }  
	  
  @Override  
  public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException { 
	  HttpServletRequest r = (HttpServletRequest) servletRequest; 
	  HttpServletResponse p = (HttpServletResponse) servletResponse;
	  //非检查的url一律放行
      if(checkRequestURIInNotCheckURLList(r)){
    	  filterChain.doFilter(r, p);
    	  return;
      }	  
	  if (resourceWithRoleIdsDtos == null){
		  resourceWithRoleIdsDtos = (List<ResourceWithRoleIdsDto>)application.getAttribute("resourceWithRoleIdsDtos");
	  }
      SessionUserInfo sessionUserInfo = (SessionUserInfo) r.getSession().getAttribute("sessionUserInfo");  
      
      //如果未登陆，则客户端和管理端都不能浏览
      if (sessionUserInfo == null) {  
         if(p instanceof HttpServletResponse)  
	          p.sendRedirect(r.getContextPath() + noLoginToRedirectURL); 
         return;
      }  
      //sessionUserInfo.notifyActive();  
      //获得url
      String query = r.getQueryString();  
      String url =r.getRequestURI().replace(r.getContextPath(), "")  
              + ((query != null && query.length() > 0) ? ("?" + query) : "");  
  	  
      Long roleId = sessionUserInfo.getwUser().getRoleId();
      if(roleId.equals(3L) ||  //超级管理员不检查权限 
		 checkRight(url,roleId,resourceWithRoleIdsDtos)){  
    	  //如果符合则放行
    	  filterChain.doFilter(r, p);  
          if(p instanceof HttpServletResponse)  
              p.setHeader("PowerBy", "WZZ.EvolutionUnit.JavaKit");  
      }else{  
    	  //如果不符合则重定向 	 
/*	    	  if(p instanceof HttpServletResponse)  
	              p.setStatus(500);//(404);  
*/
    	  String requestType =(String)r.getHeader("X-Requested-With");   
    	  if (requestType != null && requestType.equals("XMLHttpRequest")) {  
    	    	String rtnStr = MessageUtils.fail("您无此权限"); 	
    	        PrintWriter pw = p.getWriter();    
    	        pw.print(rtnStr);    
    	        pw.close();    
    	  }else{  
    	      //p.sendRedirect(r.getContextPath() + noRightToRedirectURL);  
    		  p.setContentType("text/html; charset=utf-8");
    		  PrintWriter out = p.getWriter(); 
		      out.println("<script language=\"javaScript\"> alert('您无此权限');"  
        	      + " window.history.back(-1);"
        		//+ " parent.location.href='" +ctxPath + logon_page + "'"  
        	      + "</script>");   
	    	  return;   
    	  }  
      }  
      
  }  
   
  //权限检查
  public boolean checkRight(String url,Long roleId,List<ResourceWithRoleIdsDto> resourceWithRoleIdsDtos){
		for(ResourceWithRoleIdsDto resourceWithRoleIdsDto:resourceWithRoleIdsDtos){
			if (resourceWithRoleIdsDto.getUrl().equalsIgnoreCase(url)){
				String roleIds = resourceWithRoleIdsDto.getRoleIds();
				if (roleIds.contains(","+String.valueOf(roleId)+",")){ 
					return true;
				}else{
					return false;
				}
				
			}
		}	
		//对于未出现在资源列表中的资源不做控制songjt
		return true;
  }
}  	

