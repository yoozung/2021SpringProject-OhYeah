package com.team04.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team04.member.MemberDto;
import com.team04.restaurant.RestaurantDto;
import com.team04.restaurant.RestaurantService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class RestaurantController {

	@Autowired
	public RestaurantService restaurantService;
	
	@RequestMapping("/restaurant/registerForm")
	public String callResigterForm() {
		return "/Restaurant/registerForm";
	}
	
	@RequestMapping("/restaurant/shopList")
	public String shopList(Model model, HttpSession session) {
		// 요청에 대한 사용자 인증 및 권한 체킹 부분이 누락
		// 인증여부 체크
		if(session.getAttribute("shopNo") == null || session.getAttribute("dto") == null) {
			model.addAttribute("message", "로그인 인증 후 이용하시기 바랍니다.");
			return "/Restaurant/shopList";
		}		
		List<RestaurantDto> list = restaurantService.selectRestaurantList();
		log.info("RestaurantList: " + list.size());
		model.addAttribute("list", list);
		return "shopList";
	}
	
	@RequestMapping("/map/mapFormList")
	public String restaurantList(Model model, ServletRequest req) {
		log.debug(">>>> Called restaurantList");
		List<RestaurantDto> list = restaurantService.selectRestaurantList();
		log.debug("#### 컨트롤러테스트");
		model.addAttribute("list", list);
		log.debug("#### 컨트롤러리턴테스트");
		return "/maptest";
	}
	
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
	
	@RequestMapping("/admin/adminShopAccept")
	public String adminShopAccept() {
		return "admin/adminShopAccept";
	}
	
	@RequestMapping("/admin/adminShopUpdate")
	public String adminShopUpdate() {
		return "admin/adminShopAccept";
	}
	
	@RequestMapping("/admin/adminShopDrop")
	public String adminShopDrop() {
		return "admin/adminShopDrop";
	}
	
	/** 사업자 전체식당조회*/
	@RequestMapping("/owner/ownerShopList")
	public String ownerShopList(Model model, HttpSession session)  {
		MemberDto member =  (MemberDto) session.getAttribute("member");
		
		log.debug("#### 컨트롤러");
		List<RestaurantDto> list = restaurantService.ownerShopList(member.getMemberNo());
		System.out.println(list);
		model.addAttribute("list", list);
		
		log.debug("#### 컨트롤러리턴");
		return "owner/ownerShopList";
	}

	/** 사업자 식당 등록 */
	@RequestMapping("/result")
	public String join(RestaurantDto dto, Model model, HttpSession session) {
		log.debug("### dto : " + dto);
		MemberDto member =  (MemberDto) session.getAttribute("memberNo");		
		
		log.debug("###" + member.toString());
		int result = restaurantService.insertShop(dto);
		if (result == 1) {
			model.addAttribute("message", "[등록성공]");
			return "main";
		} else {
			model.addAttribute("message", "[등록실패] 등록 정보를 다시 확인하시기 바랍니다.");
			return "result";
		}
	}
	
	/** 사업자 식당 등록 */
	@RequestMapping("/owner/ownerShopRegister")
	public String join() {
		return "/owner/ownerShopRegister";
	}
	
//	/** 사업자 식당 변경 첫화면 */
//	@RequestMapping("/owner/ownerShopUpdate")
//	public String ownerShopUpdate(String shopNo, Model model) {
//		RestaurantDto dto = restaurantService.ownerShopUpdate(shopNo);
//		model.addAttribute("dto", dto);
//		return "owner/ownerShopUpdate";
//	}
	
}
