package com.team04.controller;

import org.springframework.boot.autoconfigure.web.servlet.error.AbstractErrorController;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("${server.error.path:${error.path:/error}}")
public class ErrorController extends AbstractErrorController {

	public ErrorController(ErrorAttributes errorAttributes) {
		super(errorAttributes);
	}

	@GetMapping
	public String defaultError() {
		return "error";
	}
	
	@GetMapping("/no-resource")
	@ResponseBody
	public String noResource() {
//		return "error/noResource";
		return "잘못된 접근입니다.\n(해당페이지가없습니다.)";
	}

	@GetMapping("/server-error")
	@ResponseBody
	public String serverError() {
//		return "error/serverError";
		return "잘못된 접근입니다.\n(해당요청은모르는요청입니다.)";
	}
	
}
