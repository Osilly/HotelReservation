package com.lyx.hrms.interceptor;

import com.lyx.hrms.constant.HintConstant;
import com.lyx.hrms.domain.Admin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

/**
 *
 * 拦截所有超级管理员的url
 */
public class SuperInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        Admin admin = (Admin) httpServletRequest.getSession().getAttribute("admin");
        if (admin == null) {
            String hint = URLEncoder.encode(HintConstant.OUT_LOGIN, "utf-8");
            httpServletResponse.sendRedirect("/admin/toLogin?hint=" + hint);
            return false;
        } else if (admin != null && !admin.getSuperAdmin()) {
            String hint = URLEncoder.encode(HintConstant.SUPER_ADMIN, "utf-8");
            httpServletResponse.sendRedirect("/admin/toOperate?hint=" + hint);
            return false;
        } else {
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
