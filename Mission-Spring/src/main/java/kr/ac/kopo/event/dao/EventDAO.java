package kr.ac.kopo.event.dao;

import java.util.List;

import kr.ac.kopo.event.vo.EventVO;

public interface EventDAO {

	// 과거 이벤트 리스트 조회(끝난 이벤트)
	public List<EventVO> pastEventList();
	// 현재 이벤트 리스트 조회(진행중 이벤트)
	public List<EventVO> currentEventList();
	// 현재 이벤트 리스트 조회(진행중 이벤트) - user
	// 현재로부터 2주 뒤 예정까지만 조회 가능
	public List<EventVO> userEventList();
	// 새로운 이벤트 생성
	public void insertNewEvent(EventVO event);
	// 이벤트 내용 수정
	public void updateEvent(EventVO event);
	// 해당 이벤트 내용 불러오기
	public EventVO getEvent(int eventNo);
	
}
