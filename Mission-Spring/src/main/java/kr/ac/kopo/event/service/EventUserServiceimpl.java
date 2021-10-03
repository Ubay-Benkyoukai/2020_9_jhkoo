package kr.ac.kopo.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.event.dao.EventUserDAO;
import kr.ac.kopo.event.vo.EventUserVO;

@Service
public class EventUserServiceimpl implements EventUserService {

	@Autowired
	private EventUserDAO eventUserDAO;
	
	@Override
	public List<EventUserVO> eventUserList(){
		return eventUserDAO.eventUserList();
	}
	
	@Override
	public void insertLuckyUser(EventUserVO eventUser) {
		eventUserDAO.insertLuckyUser(eventUser);
	}
	
	@Override
	public int checkUserDid(EventUserVO eventUser) {
		return eventUserDAO.checkUserDid(eventUser);
	}
}
