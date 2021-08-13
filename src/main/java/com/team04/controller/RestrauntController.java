package com.team04.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team04.member.MemberDto;
import com.team04.restaurant.RestaurantDto;
import com.team04.restaurant.RestaurantService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class RestrauntController {
	@Autowired
	private RestaurantService restaurantService;
	
//	/** 전체식당조회 */
//	@RequestMapping("/admin/adminShopList")
//	public String adminShopList(Model model) {
//		List<RestaurantDto> list = restaurantService.selectShopList();
//		model.addAttribute("list", list);
//		return "admin/adminShopList";
//	}

	
//	/** 등록된식당조회 */
//	@RequestMapping("/admin/adminShopList")
//	public String adminShopList(String status, Model model) {
//		List<RestaurantDto> list = restaurantService.selectShopList(status);
//		model.addAttribute("list", list);
//		return "admin/adminShopList";
//	}
	
//	@RequestMapping("/restaurant/registerForm")
//	public String esigterForm() {
//		return "/Restaurant/registerForm";
//	}
//	
//	@RequestMapping("/restaurant/shopList")
//	public String shopList(Model model, HttpSession session) {
//		// 요청에 대한 사용자 인증 및 권한 체킹 부분이 누락
//		// 인증여부 체크
//		if(session.getAttribute("shopNo") == null || session.getAttribute("dto") == null) {
//			model.addAttribute("message", "로그인 인증 후 이용하시기 바랍니다.");
//			return "/Restaurant/shopList";
//		}
//		
//		List<RestaurantDto> list = restaurantService.selectRestaurantList();
//		log.info("RestaurantList: " + list.size());
//		model.addAttribute("list", list);
//		return "shopList";
//	}
//	
//	@RequestMapping("/test1115")
//	public String restaurantList(Model model) {
//		log.debug(">>>> Called restaurantList");
//		List<RestaurantDto> list = restaurantService.selectRestaurantList();
//		log.debug("#### 컨트롤러테스트");
//		model.addAttribute("list", list);
//		log.debug("#### 컨트롤러리턴테스트");
//		return "/maptest";
//	}
	
	
}
