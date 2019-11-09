package com.cappuccino.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cappuccino.pojo.UserInfo;

public class loginFil implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {

		HttpServletRequest request=(HttpServletRequest) arg0;//获取request对象
		HttpServletResponse response=(HttpServletResponse) arg1;//获取response对象
		HttpSession session=request.getSession();//获取session对象

		//过滤操作代码......
		request.setCharacterEncoding("UTF-8");  
		response.setCharacterEncoding("UTF-8"); 
		//arg2.doFilter(request, response);//放行，通过了当前过滤器，递交给下一个filter进行过滤
		String path=request.getRequestURI();
        
        UserInfo userInfo=(UserInfo) session.getAttribute("user");
        
        if(path.indexOf("/login.jsp")>-1){//登录页面不过滤
            arg2.doFilter(arg0, arg1);//递交给下一个过滤器
            return;
        }
        if(path.indexOf("/register.jsp")>-1){//注册页面不过滤
            arg2.doFilter(request, response);
            return;
        }
        
        if(userInfo!=null){//已经登录
            arg2.doFilter(request, response);//放行，递交给下一个过滤器
            
        }else{
            response.sendRedirect("login.jsp");
        }
		
		
		
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
