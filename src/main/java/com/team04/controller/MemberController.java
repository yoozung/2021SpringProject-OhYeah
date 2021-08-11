package com.team04.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team04.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
//	@Autowired
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
	
		
//	@GetMapping("/findByName")
//	@ResponseBody
//	public String test01() throws Exception {
//		Member answer = ms.findByName("admin01");
//		log.debug(answer.toString());
//		return answer.toString();
//	}
//	
//	@GetMapping("/test02")
//	@ResponseBody
//	public String test02() throws Exception {
//		Member answer = ms.test02("admin01");
//		log.debug(answer.toString());
//		return answer.toString();
//	}
	
}
