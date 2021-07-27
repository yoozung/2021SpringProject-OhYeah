package com.team04.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/")
	public String callMain() {
		System.out.println("Called main.jsp page...");
		return "/main";
	}	
	
}
