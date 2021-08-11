package com.team04.member;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MemberDao {
	@Insert("INSERT INTO member VALUES(#{name}, #{mobile}, #{email}, #{password}, #{entryDate}, #{role}, #{enabled})")
	public int signUp(String name, String mobile, String email, String password, String entryDate, String role, int enabled);
	
	@Select("SELECT * FROM member WHERE email=#{username} AND password=#{password}")
	public MemberDto signIn(String username, String password);
	
	@Select("SELECT * FROM member WHERE name=#{username}")
	public MemberDto findByName(String username);
	
	@Select("SELECT * FROM member WHERE name=#{username}")
	public MemberDto test02(String username);

	@Select("SELECT * FROM member WHERE email=#{email}")
	public MemberDto findByEmail(String email);
	
}
