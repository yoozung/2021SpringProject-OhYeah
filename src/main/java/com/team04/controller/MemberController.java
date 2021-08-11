package com.team04.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team04.member.MemberService;
import com.team04.member02.MemberDto02;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/signInPage")
	public String callSignInPage() {
		return "/SignIn/signInPage";
	}
	
	@GetMapping("/signUpPage")
	public String callSignUpPage() {
		return "/SignIn/signUpPage";
	}
	
	@PostMapping("/signUpPage/SignUp")
	public String signUpMethod(
			@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("name") String name, @RequestParam("mobile") String mobile) {
		
		
		String entryDate = "2021-08-01";
		String role ="ROLE_USER";
		int enabled = 1;
		
		memberService.signUp(name, mobile, email, password, entryDate, role, enabled);
	
		return "/";
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
