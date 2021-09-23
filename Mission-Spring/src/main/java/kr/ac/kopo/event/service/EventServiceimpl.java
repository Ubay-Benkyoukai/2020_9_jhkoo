package kr.ac.kopo.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.event.dao.EventDAO;
import kr.ac.kopo.event.vo.EventUserVO;
import kr.ac.kopo.event.vo.EventVO;

@Service
public class EventServiceimpl implements EventService {
	
	@Autowired
	private EventDAO eventDAO;
	
	@Override
	public List<EventVO> pastEventList(){
		return eventDAO.pastEventList();
	}
	
	@Override
	public List<EventVO> currentEventList(){
		return eventDAO.currentEventList();
	}

	@Override
	public void insertNewEvent(EventVO event) {
		eventDAO.insertNewEvent(event);
	}

	@Override
	public void updateEvent(EventVO event) {
		eventDAO.updateEvent(event);
	}

}
