package com.team04.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Repository
@Slf4j
public class MemberService implements MemberDao {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int signUp(String memberNo, String name, String mobile, String email, String password, String entryDate, String role, int enabled) {
		return memberDao.signUp(memberNo, name, mobile, email, password, entryDate, role, enabled);
	}
	
		
	@Override
	public MemberDto signIn(String username, String password) {
		return memberDao.signIn(username, password);
	}
	
	@Override
	public MemberDto findByEmail(String email) {
		return memberDao.findByEmail(email);
	}	

	@Override
	public List<MemberDto> selectMemberList() {
		log.debug("#### 서비스테스트");
		return memberDao.selectMemberList();
	}

	@Override
	public MemberDto findByName(String username) {
		return null;
	}

}
