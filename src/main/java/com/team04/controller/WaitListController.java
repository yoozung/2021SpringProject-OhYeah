package com.team04.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		return "/WaitList/WaitListForm";
		
	}
	
//	@GetMapping("/waitListRequestTest")
//	public String test() {
//		 waitListService.requestLine("000252127", "박민재", 1, "01050435150", "식당1", "shop05", "2021-08-15T06:7:30", "Request");
//		 return "/";
//	}
	
	@PostMapping("/waitList/getLineAction")
	public void getLineAction(
			@RequestParam("waitNo") String waitNo,@RequestParam("shopName") String shopName, @RequestParam("shopNo") String shopNo,
			@RequestParam("waitName") String waitName, @RequestParam("waitMobile") String waitMobile,
			@RequestParam("headCount") int headCount,
			HttpServletRequest req, HttpServletResponse res) throws Exception {
				
		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter f = DateTimeFormatter.ISO_DATE_TIME;
		String waitDate = currentDateTime.format(f);
		
		String waitState = "Request";
		log.debug( waitNo + ", " +
				shopName + ", "  + shopNo + ", "  +  waitName + ", " +
				waitMobile + ", "  + headCount
		);
		
		if(waitListService.requestLine(waitNo, waitName, headCount, waitMobile, shopName, shopNo, waitDate, waitState) == 1) {
			res.setContentType("text/html");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script> alert('신청이 완료되었습니다.'); </script>");
			out.println("<script> window.close(); </script>");
			out.flush();
			
		} else {
			res.setContentType("text/html");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script> alert('신청에 실패했습니다.'); </script>");
			out.println("<script> window.close(); </script>");
			out.flush();			
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
	
	@GetMapping(value="/waitList/RequestCancle/{waitNo}")
	public String requestCancle(@PathVariable String waitNo) {
		String AfterWaitNo = waitNo.trim();
		log.debug(">>>> DELTE: " +  waitNo);
		if(waitListService.deleteLine(AfterWaitNo)) {
			return "redirect:/waitList/WaitListMySelect";
		} else {
			return "redirect:/";
		}			
	}
	
	@GetMapping("/test03")
	public void callTest03() {
		log.debug(">>>> " + "test03");
	}
	
	
}
