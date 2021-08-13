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
	
	/** 전체식당조회 */
	@RequestMapping("/admin/adminShopList")
	public String adminShopList(Model model) {
		List<RestaurantDto> list = restaurantService.selectShopList();
		model.addAttribute("list", list);
		return "admin/adminShopList";
	}

	
//	/** 등록된식당조회 */
//	@RequestMapping("/admin/adminShopList")
//	public String adminShopList(String status, Model model) {
//		List<RestaurantDto> list = restaurantService.selectShopList(status);
//		model.addAttribute("list", list);
//		return "admin/adminShopList";
//	}
	
	
}
