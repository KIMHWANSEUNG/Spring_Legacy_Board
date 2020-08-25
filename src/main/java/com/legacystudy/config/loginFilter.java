package com.legacystudy.config;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.legacystudy.dto.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class loginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		//url 가져오는 코드

		String uri = req.getRequestURI();
		// 회원가입, 로그인 , 홈, 로그인.ajax 은 대상에서 제외 하는 코드
		if("/register".equals(uri)|| "/login".equals(uri)|| "/".equals(uri)
		 ||"/login.do".equals(uri)||"/register.ajax".equals(uri)||"/board".equals(uri)
		 ||"/showboard".equals(uri)) {
			chain.doFilter(request, response);
		} else {
			UserVO vo=(UserVO)req.getSession().getAttribute("loginInfo");
			

			
			
			if(vo==null){
				//로그인페이지로 반환
				resp.sendRedirect("/login");
				
				//에러페이지 반환
				//resp.sendError(HttpServletResponse.SC_UNAUTHORIZED);	
				
			} else {
				chain.doFilter(request, response);
			}
			
		}
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
