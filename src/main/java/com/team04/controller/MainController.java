package com.team04.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {
	
	@GetMapping("/")
	@ResponseBody
	public String callMainTest() {
		return "자 이제시작이야 내 꿈을(?)";
	}
	
	@GetMapping("/test01")
	public String callTest01() {
		return "/test";
	}
	
}
