package com.market.pc.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.market.pc.entity.Person;
import com.market.pc.service.UserService;
import com.market.pc.utils.CookieUtils;
import com.market.pc.utils.UserThreadLocal;




public class UserLoginHandlerInterceptor implements HandlerInterceptor {

    public static final String MT_TOKEN = "mt_token";

    @Autowired
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // 先获取cookie中的token
        String token = CookieUtils.getCookieValue(request, MT_TOKEN);
        if (StringUtils.isEmpty(token)) {
            // 未登录,跳转到登陆页面
            String path = request.getRequestURI();
//            String returnURL = "www.mytaotao.com"+path;
            String returnURL = path;
           // request.getSession().setAttribute("path", path);
            response.sendRedirect("/toLoginPage.html?url="+returnURL);
            return false;
        }

        // 已经登陆
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
            Exception ex) throws Exception {

    }

}
