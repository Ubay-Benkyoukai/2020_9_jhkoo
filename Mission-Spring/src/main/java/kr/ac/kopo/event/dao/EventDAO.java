package kr.ac.kopo.event.dao;

import java.util.List;

import kr.ac.kopo.event.vo.EventUserVO;
import kr.ac.kopo.event.vo.EventVO;

public interface EventDAO {

	// 과거 이벤트 리스트 조회(끝난 이벤트)
	public List<EventVO> pastEventList();
	// 현재 이벤트 리스트 조회(진행중 이벤트)
	public List<EventVO> currentEventList();
	// 새로운 이벤트 생성
	public void insertNewEvent(EventVO event);
	// 진행중 이벤트 -> 끝내기
	public void endEvent(int eventNo);
	// 이벤트 내용 수정
	public void updateEvent(EventVO event);
	
	
}
