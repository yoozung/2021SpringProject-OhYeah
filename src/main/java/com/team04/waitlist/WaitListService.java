package com.team04.waitlist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Repository
public class WaitListService implements WaitListDao {

	@Autowired
	private WaitListDao waitListDao;
	
	// 신청한 대기목록 조회
	@Override
	public List<WaitListDto> selectMyWaitList(String username) {
		return waitListDao.selectMyWaitList(username);
	}

	// 대기 신청
	@Override
	public int requestLine(String waitNo, String username, int headCount, String waitMobile, String shopName, String shopNo, String waitDate, String waitState) {
		return waitListDao.requestLine(waitNo, username, headCount, waitMobile, shopName, shopNo, waitDate, waitState);
		
	}
	
	// 대기 취소
	@Override
	public boolean deleteLine(String waitNo) {
		return waitListDao.deleteLine(waitNo);
	}

	// 가게별 대기목록 
	@Override
	public List<WaitListDto> ownerWaitList(String shopNo) {
		return waitListDao.ownerWaitList(shopNo);
	}

	@Override
	public void call(String waitNo) {
		waitListDao.call(waitNo);
		
	}

}
