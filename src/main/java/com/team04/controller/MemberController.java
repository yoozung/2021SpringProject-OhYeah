package com.team04.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team04.member.MemberDto;
import com.team04.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	
	@Autowired
	MemberService ms = new MemberService();
	
	@GetMapping("/signInPage")
	public String callSignInPage() {
		return "/SignIn/signInPage";	}
	
		
	@GetMapping("/findByName")
	@ResponseBody
	public String test01() throws Exception {
		MemberDto answer = ms.findByName("admin01");
		log.debug(answer.toString());
		return answer.toString();
	}
	
	@GetMapping("/test02")
	@ResponseBody
	public String test02() throws Exception {
		MemberDto answer = ms.test02("admin01");
		log.debug(answer.toString());
		return answer.toString();
	}
	
}
