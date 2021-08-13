package com.team04.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team04.member.MemberDto;
import com.team04.waitlist.WaitListDto;
import com.team04.waitlist.WaitListService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class WaitListController {
	
	@Autowired
	private WaitListService waitListService;
	
	@GetMapping("/waitList/getLineForm")
	public String getLineForm(HttpServletRequest req, HttpServletResponse res) throws IOException {
		return ("/WaitList/WaitListForm");
		
	}
	
	@PostMapping("/waitList/getLineAction")
	public void getLineAction(
			HttpServletRequest req, HttpServletResponse res,
			@RequestParam("count") int headCount) throws Exception {
		String username = (String) req.getAttribute("username"); // can't load VALUE IS NULL
//		MemberDto dto =  (MemberDto) req.getAttribute("member"); // can't load VALUE IS NULL
//		String waitMobile = dto.getMobile();
		String waitMobile = "01012340001";
		
		LocalDateTime currentDateTime = LocalDateTime.now(ZoneId.of("Asia/Seoul"));
		DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME;
		String time = currentDateTime.format(formatter);
		
		int waitNo = waitListService.selectMyWaitList(username).size()+1;
		String restaurantName = "ToKkijung";
		String restaurantNum = "5028610105";
//		int waitNo = 2;
		String waitDate = time;
		String waitState = "REQUEST";
		
		if(waitListService.requestLine(4, "user02", headCount, waitMobile, restaurantName, restaurantNum, waitDate, waitState) == 1) {
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			out.append("<script>");
			out.append("alert('회원가입이 완료되었습니다.\n메인페이지로 이동합니다.');");
			out.append("</script>");
			res.sendRedirect("/main");
		} else {
			
		}
		
	}
	
	
	@GetMapping("/waitList/WaitListMySelect")
	public String selectWaitList(HttpServletRequest req, HttpServletResponse res, Model model) {
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("username");
		log.debug(">>> WaitListMySelect : " + username);
		List<WaitListDto> list = waitListService.selectMyWaitList(username);
		model.addAttribute("list", list);
		return "/WaitList/WaitListMySelect";
	}
	
	
}
