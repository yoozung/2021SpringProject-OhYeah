package com.team04.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team04.member02.MemberDto02;
import com.team04.restaurant.RestaurantDto;
import com.team04.restaurant.RestaurantService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class RestaurantController {
	@Autowired
	private RestaurantService restaurantService;
	
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
