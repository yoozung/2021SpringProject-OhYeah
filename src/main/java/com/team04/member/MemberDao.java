package com.team04.member;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MemberDao {
	@Insert("INSERT INTO member VALUES(#{memberNo}, #{name}, #{mobile}, #{email}, #{password}, #{entryDate}, #{role}, #{enabled})")
	public int signUp(String memberNo, String name, String mobile, String email, String password, String entryDate, String role, int enabled);
//	@Insert("INSERT INTO member VALUES(#{memberNo}, #{name}, #{mobile}, #{email}, #{password}, #{entryDate}, #{role}, #{enabled})")
//	public int signUp(MemberDto memberDto);
	
	@Select("SELECT * FROM member WHERE email=#{username} AND password=#{password}")
	public MemberDto signIn(String username, String password);
	
	@Select("SELECT * FROM member WHERE name=#{username}")
	public MemberDto findByName(String username);	

	@Select("SELECT * FROM member WHERE email=#{email}")
	public MemberDto findByEmail(String email);
	
	/** 전체회원조회 */
	public List<MemberDto> selectMemberList();
	
}
