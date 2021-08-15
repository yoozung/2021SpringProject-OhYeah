package com.team04.waitlist;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface WaitListDao {
	
	@Select("SELECT * FROM waitlist WHERE waitname=#{username}")
	public List<WaitListDto> selectMyWaitList(String username);
	
	@Insert("INSERT INTO waitlist VALUES(#{waitNo}, #{waitName}, #{headCount}, #{waitMobile}, #{shopName}, #{shopNo}, #{waitDate}, #{waitState})")
	public int requestLine(String waitNo, String waitName, int headCount, String waitMobile, String shopName, String shopNo, String waitDate, String waitState);

	
}
