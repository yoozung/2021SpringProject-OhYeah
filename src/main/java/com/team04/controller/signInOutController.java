package com.team04.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class signInOutController {
	@GetMapping("/signInPage")
	public String signInPage() {
		System.out.println("Called signInPage.jsp page...");
		return "/SignIn/signInPage";
	}
	
	@PostMapping(value="/signInMethod")
	public String signInMethod(@RequestParam("signAccount") String signInAccount, @RequestParam("signPassword") String signInPassword) {
		System.out.println("Called signInMethod()... ");
		
		return "/main";
	}
	
	@GetMapping("/signOutReq")
	public String signOutReq() {
		return "/main";
	}

}
