package com.team04.waitlist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
@Repository
public class WaitListService implements WaitListDao {

	@Autowired
	private WaitListDao waitListDao;
	
	@Override
	public List<WaitListDto> selectMyWaitList(String username) {
		return waitListDao.selectMyWaitList(username);
	}

	@Override
	public int requestLine(int waitNo, String username, int headCount, String waitMobile, String shopName, String shopNo, String waitDate, String waitState) {
		return waitListDao.requestLine(waitNo, username, headCount, waitMobile, shopName, shopNo, waitDate, waitState);
		
	}

}
