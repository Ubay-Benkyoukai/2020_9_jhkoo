package kr.ac.kopo.event.service;

import java.util.List;

import kr.ac.kopo.event.vo.EventUserVO;

public interface EventUserService {

	
	// 전체 당첨자 확인 및 관리 (select)
	public List<EventUserVO> eventUserList();
}
