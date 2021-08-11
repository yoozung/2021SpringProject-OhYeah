package com.team04.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("/admin/adminMemberList")
	public String adminMemberList(Model model) {
		List<MemberDto> list = ms.selectMemberList();
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
