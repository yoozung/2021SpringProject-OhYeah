package com.team04.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.team04.member.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Component("beforeActionInterceptor")
@Slf4j
/**
 * 
 * @author mj
 *
 *         다중의 HandlerInterceptor 로그인 인증 확인, 권한 확인, 로그아웃 여부 확인
 */
public class BeforeActionInterceptor implements HandlerInterceptor {

	/**
	 * preHandle() 컨트롤러의 메서드에 매핑된 특정경로를 호출했을 떄 컨트롤러에 접근하기 전에 실행되는 메서드
	 */
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		log.debug(">>> preHandle");
		log.debug(">>> Request URI: " + req.getRequestURI());

		HttpSession session = req.getSession();
		MemberDto dto = (MemberDto) session.getAttribute("member");

		boolean isLogin = false;
		boolean isAdmin = false;
		boolean isConsumer = false;
		boolean isOwner = false;

		// 로그인 여부
		if (dto != null) {
			isLogin = true;
			// 권한 확인
			if (dto.getRole().equals("ROLE_ADMIN")) {
				isAdmin = true;
			} else {
				isAdmin = false;
			}

			// 권한 확인
			if (dto.getRole().equals("ROLE_CONSUMER")) {
				isConsumer = true;
			} else {
				isConsumer = false;
			}

			// 권한 확인
			if (dto.getRole().equals("ROLE_OWNER")) {
				isOwner = true;
			} else {
				isOwner = false;
			}
		} else {
			isLogin = false;
		}

		req.setAttribute("isLogin", isLogin);
		req.setAttribute("isAdmin", isAdmin);
		req.setAttribute("isConsumer", isConsumer);
		req.setAttribute("isOwner", isOwner);

		return HandlerInterceptor.super.preHandle(req, res, handler);
	}

	/**
	 * 컨트롤러를 경유한 후, View로 결과 전달을 하기 전 실행되는 메서드
	 */
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mv)
			throws Exception {
		log.debug(">>> postHandle");
		HandlerInterceptor.super.postHandle(req, res, handler, mv);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		log.debug(">>> afterCompletion ");
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}
