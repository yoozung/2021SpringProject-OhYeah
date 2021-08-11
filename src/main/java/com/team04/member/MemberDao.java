package com.team04.member;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


@Mapper
public interface MemberDao {
	
	@Select("SELECT * FROM member WHERE email=#{username} AND password=#{password}")
	public MemberDto signIn(String username, String password);
	
	@Select("SELECT * FROM member WHERE name=#{username}")
	public MemberDto findByName(String username);
	
	@Select("SELECT * FROM member WHERE name=#{username}")
	public MemberDto test02(String username);

	@Select("SELECT * FROM member WHERE email=#{email}")
	public MemberDto findByEmail(String email);

	/** 전체회원조회 */
	public List<MemberDto> selectMemberList();


	
	
}
