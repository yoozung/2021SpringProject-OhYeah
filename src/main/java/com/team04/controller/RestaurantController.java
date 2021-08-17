package com.team04.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
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
	public String shopList(HttpServletRequest req, Model model) {
		// 한 페이지 당 보여줄 수
				final int pageSize = 10;
				// 페이지 수
				final int pageGroupSize = 10;

				String pageNum = req.getParameter("pageNum");// 페이지 번호

				if (pageNum == null) {
					pageNum = "1";
				}

				int currentPage = Integer.parseInt(pageNum);
				int startRow = (currentPage - 1) * pageSize + 1;// 한 페이지의 시작글 번호
				int endRow = currentPage * pageSize;// 한 페이지의 마지막 글번호
				int count;

				int number = 0;

				// 테이블
				List<RestaurantDto> Table = new ArrayList();
				count = restaurantService.selectShopList().size();// 전체 글의 수

				if (count > 0) {
					if (endRow > count)
						endRow = count;
					Table = restaurantService.selectShopListPart(startRow, endRow); // 현재 페이지에 해당하는 글 목록

				} else {
					Table = null;
				}

				number = count - (currentPage - 1) * pageSize;// 글목록에 표시할 글번호
				// 페이지그룹의 갯수
				// ex) pageGroupSize가 3일 경우 '[1][2][3]'가 pageGroupCount 개 만큼 있다.
				int pageGroupCount = count / (pageSize * pageGroupSize) + (count % (pageSize * pageGroupSize) == 0 ? 0 : 1);
				// 페이지 그룹 번호
				// ex) pageGroupSize가 3일 경우 '[1][2][3]'의 페이지그룹번호는 1 이고 '[2][3][4]'의 페이지그룹번호는 2
				// 이다.
				int numPageGroup = (int) Math.ceil((double) currentPage / pageGroupSize);

				// 해당 뷰에서 사용할 속성
				req.setAttribute("currentPage", new Integer(currentPage));
				req.setAttribute("startRow", new Integer(startRow));
				req.setAttribute("endRow", new Integer(endRow));
				req.setAttribute("count", new Integer(count));
				req.setAttribute("pageSize", new Integer(pageSize));
				req.setAttribute("number", new Integer(number));
				req.setAttribute("pageGroupSize", new Integer(pageGroupSize));
				req.setAttribute("numPageGroup", new Integer(numPageGroup));
				req.setAttribute("pageGroupCount", new Integer(pageGroupCount));
				req.setAttribute("Table", Table);
				return "shop/shopList";
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
	    
//  /** 등록된식당조회 */
//  @RequestMapping("/admin/adminShopList")
//  public String adminShopList(String status, Model model) {
//      List<RestaurantDto> list = restaurantService.selectShopList(status);
//      model.addAttribute("list", list);
//      return "admin/adminShopList";
//  }
    
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
    
    /** 사업자 전체식당조회 */
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
        MemberDto member =  (MemberDto) session.getAttribute("memberNo");
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
    
//  /** 사업자 식당 변경 첫화면 */
//  @RequestMapping("/owner/ownerShopUpdate")
//  public String ownerShopUpdate(String shopNo, Model model) {
//      RestaurantDto dto = restaurantService.ownerShopUpdate(shopNo);
//      model.addAttribute("dto", dto);
//      return "owner/ownerShopUpdate";
//  }
    
    /** 사업자 식당 삭제 첫화면 */
    @RequestMapping("/owner/ownerShopDrop")
    public String ownerShopDrop(Model model, HttpSession session)  {
        MemberDto member =  (MemberDto) session.getAttribute("member");
        
        log.debug("#### 컨트롤러");
        List<RestaurantDto> list = restaurantService.ownerShopList(member.getMemberNo());
        System.out.println(list);
        model.addAttribute("list", list);
        
        log.debug("#### 컨트롤러리턴");
        return "owner/ownerShopDrop";
    }
    
    /** 사업자 식당 삭제 구동 */
    @RequestMapping("/shopDrop")
    public String shopDrop(RestaurantDto dto, Model model) {
        return "/owner/ownerShopRegister";
    }
    
    
    
	
}
