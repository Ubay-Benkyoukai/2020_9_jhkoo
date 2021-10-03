package kr.ac.kopo.event.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.event.vo.EventUserVO;
import kr.ac.kopo.event.vo.EventVO;
import kr.ac.kopo.event.vo.LuckyBoxVO;

@Repository
public class EventDAOimpl implements EventDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<EventVO> pastEventList(){
		List<EventVO> pastEventList = sqlSession.selectList("event.dao.EventDAO.pastEventList");
		return pastEventList;
	}

	@Override
	public List<EventVO> currentEventList(){
		List<EventVO> currentEventList = sqlSession.selectList("event.dao.EventDAO.currentEventList");
		return currentEventList;
	}
	
	@Override
	public void insertNewEvent(EventVO event) {
		System.out.println(event);
		sqlSession.insert("event.dao.EventDAO.insertNewEvent", event);
	}

	@Override
	public void updateEvent(EventVO event) {
		sqlSession.update("event.dao.EventDAO.updateEvent", event);
	}
	
	@Override
	public EventVO getEvent(int eventNo) {
		EventVO getEvent = sqlSession.selectOne("event.dao.EventDAO.getEvent", eventNo);
		return getEvent;
	}
	
}
