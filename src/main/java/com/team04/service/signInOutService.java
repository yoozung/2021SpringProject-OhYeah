package com.team04.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.team04.dao.AdminMemberDao;
import com.team04.dto.AdminMemberDto;

@Service
@Repository
public class signInOutService implements AdminMemberDao {
	
	@Autowired
	private AdminMemberDao adminMemberDao;
	
	@Override
	public String test01(String signAccount, String signPassword) {
		return adminMemberDao.test01(signAccount, signPassword);
	}

	@Override
	public String signInValdiate(String signAccount, String signPassword) {
		System.out.println(">>> signInOutService.signInValdiate : " + signAccount + ", " + signPassword);
		String answer = adminMemberDao.signInValdiate(signAccount, signPassword);
		return answer;
	}

	
	
}
