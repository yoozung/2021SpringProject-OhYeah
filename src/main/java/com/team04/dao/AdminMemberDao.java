package com.team04.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.team04.dto.AdminMemberDto;

@Mapper
public interface AdminMemberDao {
//	@Select("SELECT name FROM member WHERE userid=#{signAccount} AND userpw=#{signPassword}")
	@Select("SELECT name FROM adminMember WHERE email=#{signAccount} AND password=#{signPassword}")
	public String test01(String signAccount, String signPassword);
	
	@Select("SELECT name FROM adminmember WHERE email=#{signAccount} AND password=#{signPassword}")
	public String signInValdiate(String signAccount, String signPassword);
}
