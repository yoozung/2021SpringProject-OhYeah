package com.team04.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.team04.service.signInOutService;

@Controller
public class signInOutController {
	
	@Autowired
	public signInOutService sIOS = new signInOutService();
	
	@GetMapping("/signInPage")
	public String signInPage() {
		System.out.println("Called signInPage.jsp page...");
		return "/SignIn/signInPage";
	}
	
	@PostMapping(value="/signInMethod")
	public String signInMethod(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String signInAccount = req.getParameter("signAccount");
		String signInPassword = req.getParameter("signPassword");
		System.out.println(">>> Called signInMethod()... ");
		String answer = sIOS.test01(signInAccount, signInPassword);
		System.out.println("admin: " + answer);
		HttpSession session = req.getSession();
		session.setAttribute("userName", answer);
		return "redirect:/";
		
//		if(signInAccount.equals(admin.getEmail())) {
//			System.out.println("admin: " + admin.getEmail());
//			res.sendRedirect("/");
//			return "/main";
//		} else {
//			System.out.println(">>> SignIn Failed...");
//			return signInPage();
//		}
	}
	
	@PostMapping(value="/signInError")
	public String signInError(Model model) {
		model.addAttribute("signInError", true);
		return signInPage();
	}
	
	@GetMapping("/signOutReq")
	public String signOutReq(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/";
	}

}
