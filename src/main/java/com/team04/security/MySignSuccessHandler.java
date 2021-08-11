package com.team04.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class MySignSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		HttpSession session = request.getSession();
		session.setAttribute("userName", authentication.getName());
		session.setAttribute("authorities", authentication.getAuthorities());
//		session.setAttribute("password", authentication.getDetails()); // 사용자의 RemoteIpAddress와 SessionId를 제공
//		session.setAttribute("password", authentication.getPrincipal()); // Username, password, Enabled, AccountNonExpired, credentialsNonExpired, AccountNonLocked, Granted Authorities 값을 제공
		response.sendRedirect("/main");

	}

}
