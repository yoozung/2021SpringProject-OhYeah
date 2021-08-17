package com.team04.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team04.member.MemberDto;
import com.team04.member.MemberService;
import com.team04.restaurant.RestaurantDto;
import com.team04.restaurant.RestaurantService;
import com.team04.waitlist.WaitListDto;
import com.team04.waitlist.WaitListService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {

	@Autowired
	public MemberService memberService;

	@Autowired
	public WaitListService waitListService;

	@Autowired
	public RestaurantService restaurantService;

	/**
	 * 관리자 회원 목록 조회
	 * 
	 * @param model
	 * @return adminMemberList.jsp
	 */
//	@RequestMapping("/admin/adminMemberList")
//	public String adminMemberList(Model model, HttpServletRequest req) {
//		log.debug(">>>> Called adminMemberList()");
//		List<MemberDto> list = memberService.adminSelectMemberList();
//		model.addAttribute("list", list);
//		req.setAttribute("listSize", list.size());
//		return "admin/adminMemberList";
//	}
	@RequestMapping("/admin/adminMemberList")
	public String adminMemberList(Model model, HttpServletRequest req) {
		log.debug(">>>> Called adminMemberList()");
		// 한 페이지 당 보여줄 수
		final int pageSize = 3;
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
		List<MemberDto> Table = new ArrayList();
		count = memberService.adminSelectMemberList().size();// 전체 글의 수

		if (count > 0) {
			if (endRow > count)
				endRow = count;
			Table = memberService.adminSelectMemberListPart(startRow, endRow); // 현재 페이지에 해당하는 글 목록

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
		return "admin/adminMemberList";
	}

	/** 전체식당조회 */
	@RequestMapping("/admin/adminShopList")
	public String adminShopList(HttpServletRequest req, Model model) {
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
		return "admin/adminShopList";
	}

	@RequestMapping("/admin/adminWaitList")
	public String adminWaitList(Model model, HttpServletRequest req) {
		log.debug(">>>> Called adminWaitList()");

		// 한 페이지 당 보여줄 수
		final int pageSize = 3;
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
		List<WaitListDto> Table = new ArrayList();
		count = waitListService.selectAllWaitList().size();// 전체 글의 수

		if (count > 0) {
			if (endRow > count)
				endRow = count;
			Table = waitListService.selectAllWaitListPart(startRow, endRow); // 현재 페이지에 해당하는 글 목록

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

		return "admin/adminWaitList";
	}

}
