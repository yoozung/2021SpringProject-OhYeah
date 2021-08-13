package com.team04.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {
	
	@GetMapping({"/"})
	public String main(HttpSession session) {
		log.info(">>> " +  session.getId() + " " + "Called main()...");
		return "main";
	}
	
	@GetMapping({"/main"})
	public String main2(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		log.info(">>> " +  session.getId() + " " + "Called main()...");
//		session.setAttribute("userName", req.getRemoteUser());
		return "main";
	}
	
	@GetMapping("/maptest")
	public String testpage2() {
		return "/maptest";
	}
	
	@GetMapping("/adminTemplate")
	public String adminTemplate() {
		return "/template/admin";
	}
	
	@GetMapping("/consumerTemplate")
	public String consumerTemplate() {
		return "/template/consumer";
	}
	
	@GetMapping("/ownerTemplate")
	public String ownerTemplate() {
		return "/template/owner";
	}
	
}
