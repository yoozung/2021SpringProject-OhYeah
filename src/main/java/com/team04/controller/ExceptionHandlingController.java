//package com.team04.controller;
//import java.util.Date;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.boot.web.servlet.error.ErrorController;
//import org.springframework.http.HttpStatus;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Controller
//@Slf4j
//public class ExceptionHandlingController implements ErrorController {
//	private final String ERROR_404_PAGE_PATH = "/error/404";
//	private final String ERROR_500_PAGE_PATH = "/error/500";
//	private final String ERROR_ETC_PAGE_PATH = "/error/error";
//
//	@GetMapping(value="/error")
//	public String handlerError(HttpServletRequest req, Model model) {
//		Object status = req.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
//		HttpStatus httpStatus = HttpStatus.valueOf(Integer.valueOf(status.toString()));
//		
//		if(status != null) {
//			int statusCode = Integer.valueOf(status.toString());
//			log.info("httpStatus: " + statusCode);
//			
//			// 404 ERROR
//			if(statusCode == HttpStatus.NOT_FOUND.value()) {
//				model.addAttribute("code", status.toString());
//				model.addAttribute("msg", httpStatus.getReasonPhrase());
//				model.addAttribute("timestamp", new Date());
//				return ERROR_404_PAGE_PATH;
//			}
//			
//			// 500 ERROR
//			if(statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
//				return ERROR_500_PAGE_PATH;
//			}			
//		}
//		return ERROR_ETC_PAGE_PATH;
//	}
//	
//	
//	public String getErrorPath() {
//		return "/error";
//	}
//	
//}
