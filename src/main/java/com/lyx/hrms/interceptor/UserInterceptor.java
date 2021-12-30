package com.lyx.hrms.interceptor;

import com.lyx.hrms.constant.HintConstant;
import com.lyx.hrms.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

/**
 *
 * 拦截路径：
 * user/doLogout
 * user/toInformation
 * user/reservation/showByUser
 */
public class UserInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        User user = (User) httpServletRequest.getSession().getAttribute("user");
        if (user != null) {
            return true;
        } else {
            String hint = URLEncoder.encode(HintConstant.OUT_LOGIN, "utf-8");
            httpServletResponse.sendRedirect("/user/toLogin?hint=" + hint);
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
