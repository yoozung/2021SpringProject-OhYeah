package com.team04.controller;

import java.io.IOException;
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
import com.team04.member02.MemberDto02;

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
	@PostMapping("/signUpPage/SignUp")
	public void signUpMethod(@RequestParam("name") String name, @RequestParam("mobile") String mobile,
			@RequestParam("email") String email, @RequestParam("password") String password,
			HttpServletResponse res) throws IOException {
		
		LocalDateTime currentDateTime = LocalDateTime.now(ZoneId.of("Asia/Seoul"));
		DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME;
		String time = currentDateTime.format(formatter);
		String role ="ROLE_USER";
		int enabled = 1;
		
		if(memberService.signUp(name, mobile, email, password, time, role, enabled) == 1) {
			log.debug(">>>> SignUp Complete");
			res.sendRedirect("/main");
//			return "/main";
		} else {
			log.debug(">>>> SignUp Failed");
			res.sendRedirect("/signUpPage");
//			return "/signUpPage";
		}		
	}
	
	@GetMapping("/signInPage")
	public String callSignInPage() {
		return "/SignIn/signInPage";
	}
	@PostMapping("/signInPage/SignIn")
	public void singInMethod(@RequestParam("account")String account, @RequestParam("password")String password,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		MemberDto member = null;
		if(memberService.signIn(account, password) != null) {
			member = memberService.signIn(account,password);
			session.setAttribute("member", member);
			res.sendRedirect("/main");
			log.debug(">>>> SignIn Complete : " + session);
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


	@RequestMapping("/admin/adminMemberList")
	public String adminMemberList(Model model) {
		log.debug(">>>> Called adminMemberList");
		List<MemberDto02> list = memberService.selectMemberList();
		log.debug("#### 컨트롤러테스트");
		model.addAttribute("list", list);
		log.debug("#### 컨트롤러리턴테스트");
		return "admin/adminMemberList";
	}
	
	@RequestMapping("/admin/adminShopAccept")
	public String adminShopAccept() {
		return "admin/adminShopAccept";
	}
}
