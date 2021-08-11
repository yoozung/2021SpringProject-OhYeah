package com.team04.controller;

import java.util.List;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.team04.member.MemberDto;
import com.team04.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	
	@Autowired
	public MemberService memberService;
	
//	@RequestMapping("/admin/adminMemberList")
//	public String memberList(Model model, HttpSession session) {
//		List<MemberDto> list = MemberService.selectMemberList();
//		model.addAttribute("list", list);
//		
//		return "admin/adminMemberList";
//	}
//	
	
	
}
