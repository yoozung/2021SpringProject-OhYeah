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

	/**
	 * <pre>
	 * 서비스 운영자를 위한 대기목록 전체 조회
	 * </pre>
	 * @return
	 */
	public List<WaitListDto> selectAllWaitList() {		
		return waitListDao.selectAllWaitList();
	}

	/**
	 * <pre>
	 * 페이징 적용을 위한 대기목록 조회
	 * </pre>
	 * @param startRow
	 * @param endRow
	 * @return
	 */
	@Override
	public List<WaitListDto> selectAllWaitListPart(int startRow, int endRow) {
		return waitListDao.selectAllWaitListPart(startRow, endRow);
	}

}
