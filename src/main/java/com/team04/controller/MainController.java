package com.team04.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team04.member.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {
	
//	@GetMapping({"/"})
//	public String main(HttpSession session) {
//		log.info(">>> " +  session.getId() + " " + "Called main()...");
//		return "main";
//	}
	
	@GetMapping({"/", "/main"})
	public String main2(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		log.info(">>> " +  session.getId() + " " + "Called main()...");
//		session.setAttribute("userName", req.getRemoteUser());
//		return "main";
		return "/template/all";
	}
//	@GetMapping("/maptest")
//	public String testpage2() {
//		return "/maptest";
//	}	
	
	/** 템플릿통합 */
	@RequestMapping("/all")
	public String all() {
		return "/template/all";
	}
}
