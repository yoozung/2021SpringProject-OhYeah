package com.team04.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.team04.member.MemberDto;

import lombok.extern.slf4j.Slf4j;

// isSignIn is True also isAdmin is true
@Component("needToAdminInterceptor")
@Slf4j
public class NeedToAdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		log.debug(">>>>> NeedToAdminInterceptor");		
		HttpSession session = request.getSession();		
		MemberDto dto = (MemberDto) session.getAttribute("member");
		
		// SignIn 여부 저장
		boolean isSignIn = false;
		// 관리자인지 여부 저장
		boolean isAdmin = false;
		
						
		if(dto != null) {
			if(dto.getRole().equals("ROLE_ADMIN")) {
				isSignIn = true;
				isAdmin = true;
			} else {
				isSignIn = true;
				isAdmin = false;
			}
		} else {
			isSignIn = false;
			isAdmin = false;
		}		
		
//		요청객체에 사용자 인증여부, 관리자 여부 정보 설정
		request.setAttribute("isSignIn", isSignIn);
		request.setAttribute("isAdmin", isAdmin);
		
		log.debug(">>>> isSignIn: "  + isSignIn);
		log.debug(">>>> isAdmin: " + isAdmin);
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
//		return preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}
