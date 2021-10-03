package kr.ac.kopo.event.service;

import java.util.List;

import kr.ac.kopo.event.vo.EventUserVO;
import kr.ac.kopo.event.vo.EventVO;

public interface EventService {
	// dao에 있는 것 뿐만 아니라 service에만 있는 기능이 있을 수 있다.
	// 실제로 자바로 데이터를 만지는 것은 service부분에서 이루어지는 것 같음.

	// 과거 이벤트 리스트 조회(끝난 이벤트)
	public List<EventVO> pastEventList();
	// 현재 이벤트 리스트 조회(진행중 이벤트)
	public List<EventVO> currentEventList();
	// 새로운 이벤트 생성
	public void insertNewEvent(EventVO event);
	// 이벤트 내용 수정
	public void updateEvent(EventVO event);
	// 해당 이벤트 내용 불러오기
	public EventVO getEvent(int eventNo);

}
