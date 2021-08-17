package com.team04.waitlist;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface WaitListDao {
	
	

	@Select("SELECT * FROM waitlist WHERE waitname=#{username}")
	public List<WaitListDto> selectMyWaitList(String username);
	
	@Insert("INSERT INTO waitlist VALUES(#{waitNo}, #{waitName}, #{headCount}, #{waitMobile}, #{shopName}, #{shopNo}, #{waitDate}, #{waitState})")
	public int requestLine(String waitNo, String waitName, int headCount, String waitMobile, String shopName, String shopNo, String waitDate, String waitState);

	@Delete("DELETE FROM waitlist WHERE waitno=#{waitNo}")
	public boolean deleteLine(String waitNo);
	
	@Select("SELECT * FROM waitlist WHERE shopNo=#{shopNo}")
	public List<WaitListDto> ownerWaitList(String shopNo);

	@Update("UPDATE waitlist SET waitState = 'accept' WHERE waitNo = #{waitNo}")
	public void call(String waitNo);
	
}
