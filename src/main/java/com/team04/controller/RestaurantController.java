package com.team04.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team04.restaurant.RestaurantDto;
import com.team04.restaurant.RestaurantService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class RestaurantController {

	@Autowired
	public RestaurantService restaurantService;
	
	@RequestMapping("/registerForm")
	public String esigterForm() {
		return "registerForm";
	}
	
	@RequestMapping("/shopList")
	public String shopList(Model model, HttpSession session) {
		// 요청에 대한 사용자 인증 및 권한 체킹 부분이 누락
		// 인증여부 체크
		if(session.getAttribute("shopNo") == null || session.getAttribute("dto") == null) {
			model.addAttribute("message", "로그인 인증 후 이용하시기 바랍니다.");
			return "shopList";
		}
		
		List<RestaurantDto> list = restaurantService.selectRestaurantList();
		log.info("RestaurantList: " + list.size());
		model.addAttribute("list", list);
		return "shopList";
	}
	
	@RequestMapping("/test1115")
	public String restaurantList(Model model) {
		log.debug(">>>> Called restaurantList");
		List<RestaurantDto> list = restaurantService.selectRestaurantList();
		log.debug("#### 컨트롤러테스트");
		model.addAttribute("list", list);
		log.debug("#### 컨트롤러리턴테스트");
		return "/maptest";
	}
}

