package com.team04.waitlist;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface WaitListDao {
	
	@Select("SELECT * FROM waitlist WHERE waitname=#{username}")
	public List<WaitListDto> selectMyWaitList(String username);
	
	@Insert("INSERT INTO waitlist VALUES(#{waitNo}, #{waitName}, #{headCount}, #{waitMobile}, #{shopName}, #{shopNo}, #{waitDate}, #{waitState})")
	public int requestLine(String waitNo, String waitName, int headCount, String waitMobile, String shopName, String shopNo, String waitDate, String waitState);

	@Delete("DELETE FROM waitlist WHERE waitno=#{waitNo}")
	public boolean deleteLine(String waitNo);

	@Select("SELECT * FROM waitlist")
	public List<WaitListDto> selectAllWaitList();

	@Select("SELECT * FROM (SELECT ROWNUM NUM, M.* FROM member M) WHERE NUM BETWEEN #{startRow} AND #{endRow}")
	public List<WaitListDto> selectAllWaitListPart(int startRow, int endRow);
}
