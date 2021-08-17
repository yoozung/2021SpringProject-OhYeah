package com.team04.admin;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team04.member.MemberDao;
import com.team04.member.MemberDto;


import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminService {
	@Autowired
	private MemberDao memberDao;
	
//	/** 회원 전체조회 */
//	public List<MemberDto> memberList() {
//		return memberDao.selectMemberList();
//	}

	
}
