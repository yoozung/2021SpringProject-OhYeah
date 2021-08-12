package com.team04.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class WaitListController {
	
	@GetMapping("/waitList/getLineForm")
	public String getLineFormPage() {
		return "/WaitList/WaitListForm";
	}
	
}
