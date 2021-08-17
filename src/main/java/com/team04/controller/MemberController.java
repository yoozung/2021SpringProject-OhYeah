package com.team04.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team04.member.MemberDto;
import com.team04.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	@Autowired
	private MemberService memberService;

	@GetMapping("/signUpPage")
	public String callSignUpPage() {
		return "/SignIn/signUpPage";
	}

	/**
	 * <pre>
	 * 회원가입 메서드
	 * </pre>
	 * @param memberDto
	 * @param res
	 * @throws IOException
	 */
	@PostMapping("/signUpPage/SignUp")
	public void signUpMethod(@RequestParam("name") String name, @RequestParam("mobile") String mobile,
			@RequestParam("email") String email, @RequestParam("password") String password, @RequestParam("role") String role,
			HttpServletResponse res) throws IOException {
		log.debug(">>>> Called signUp Method...");
		log.debug(">>>> INFO: " + name + " ... " + role);
		
		String memberNo = "";
		if(role.equals("ROLE_CONSUMER")) {
			memberNo += "C";
			for(int i = 0; i < 4; i++) {
				memberNo += Integer.toString((int) Math.round(Math.random()*9));
			}
		} else {
			memberNo += "O";
			for(int i = 0; i < 4; i++) {
				memberNo += Integer.toString((int) Math.round(Math.random()*9));
			}
		}	
		
		LocalDateTime currentDateTime = LocalDateTime.now(ZoneId.of("Asia/Seoul"));
		DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME;
		String time = currentDateTime.format(formatter);
		int enabled = 1;

		if (memberService.signUp(memberNo, name, mobile, email, password, time, role, enabled) == 1) {
			log.debug(">>>> SignUp Complete");
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			out.append("<script>");
			out.append("alert('회원가입이 완료되었습니다.\n메인페이지로 이동합니다.');");
			out.append("</script>");
			res.sendRedirect("/main");
			out.flush();
//			return "redirect:/main";
		} else {
			log.debug(">>>> SignUp Failed");
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			out.append("<script>");
			out.append("alert('회원가입에 실패했습니다.\n다시 회원가입을 진행해주세요.');");
			out.append("</script>");
			res.sendRedirect("/signUpPage");
			out.flush();
//			return "redirect:/signUpPage";
		}
	}
	
	@GetMapping("/signInPage")
	public String callSignInPage() {
		return "/SignIn/signInPage";
	}
	/**
	 * 
	 * @param account
	 * @param password
	 * @param req
	 * @param res
	 * @param session
	 * @throws IOException
	 * @author gruzam0615
	 */
	@PostMapping("/signInPage/SignIn")
	public void singInMethod(@RequestParam("account")String account, @RequestParam("password")String password,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		MemberDto member = null;
		if(memberService.signIn(account, password) != null) {
			member = memberService.signIn(account,password);
			session.setAttribute("username", member.getName());
			session.setAttribute("member", member);
			String authorities = member.getRole();
			
			if(authorities.equals("ROLE_ADMIN")) {
					req.setAttribute("isAdmin", true);
					res.sendRedirect("/main");
					log.debug(">>>> SignIn Complete : " + session);
			} else if(authorities.equals("ROLE_CONSUMER")) {
				req.setAttribute("isConsumer", true);
				res.sendRedirect("/main");
				log.debug(">>>> SignIn Complete : " + session);
			} else if(authorities.equals("ROLE_OWNER")) {
				req.setAttribute("isOwner", true);
				res.sendRedirect("/main");
				log.debug(">>>> SignIn Complete : " + session);
			}
			
//			return "/main";
		} else {			
			log.debug(">>>> SignIn Failed");
			session.setAttribute("status", "fail");
			res.sendRedirect("/error");
//			return "/SignInPage";
		}
	}
	
	@GetMapping("/signInPageFragment")
	public String callSignInFragment() {
		return "/SignIn/signInPageFragment";
	}
	@PostMapping("/signInFragment/SignIn")
	public void singInFragmentMethod(@RequestParam("account")String account, @RequestParam("password")String password,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		log.debug(">>>> Fragment SignIn");
		MemberDto member = null;
		if(memberService.signIn(account, password) != null) {
			member = memberService.signIn(account,password);
			session.setAttribute("member", member);
			String authorities = member.getRole();
			
			if(authorities.equals("ROLE_CUSTOMER")) {
				res.setContentType("text/html; charset=utf-8");
				PrintWriter out = res.getWriter();
				out.append("<script>");
				out.append("alert('로그인에 실패했습니다.');");
				out.append("window.close();");
				out.append("</script>");
				log.debug(">>>> SignIn Complete : " + session);
			} else {
				res.setContentType("text/html; charset=utf-8");
				PrintWriter out = res.getWriter();
				out.append("<script>");
				out.append("alert('로그인에 실패했습니다.');");
				out.append("window.close();");
				out.append("</script>");
				log.debug(">>>> SignIn Complete : " + session);
			}
			
//			return "/main";
		} else {			
			log.debug(">>>> SignIn Failed");
			session.setAttribute("status", "fail");
			res.sendRedirect("/signInPage");
//			return "/SignInPage";
		}
	}
	

	@GetMapping("/signOut")
	public void callSignOut(HttpServletResponse res, HttpSession session) throws IOException {
		log.debug(">>>> " + session);
		session.invalidate();
		log.debug(">>>> After invalidate " + session);
		res.sendRedirect("/main");

	}

	@GetMapping("/myPage")
	public String callMyPage(HttpSession session) throws IOException {
		return "/SignIn/myPage";
	}
	
	@GetMapping("/myEditPage")
	public String callMyEditPage() {
		return "/SignIn/myEditPage";
	}
	
	@PostMapping("/myEditPage/EditAction")
	public String callMyEditAction() {
		return "";
	}
	
		
	/**
	 * 관리자 회원 삭제 구동
	 * @param model
	 * @return adminMemberList.jsp
	 */
	@RequestMapping("/memberDrop")
	public String memberDrop(Model model) {
		return "admin/adminMemberList";
	}


	
}
