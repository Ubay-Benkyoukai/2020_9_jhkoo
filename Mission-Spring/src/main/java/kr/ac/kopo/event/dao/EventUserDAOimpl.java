package kr.ac.kopo.event.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.event.vo.EventUserVO;

@Repository
public class EventUserDAOimpl implements EventUserDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<EventUserVO> eventUserList(){
		List<EventUserVO> eventUserList = sqlSession.selectList("event.dao.EventUserDAO.eventUserList");
		return eventUserList;
	}
	
	@Override
	public void insertLuckyUser(EventUserVO eventUser) {
		sqlSession.insert("event.dao.EventUserDAO.insertLuckyUser", eventUser);
	}
	
	@Override
	public int checkUserDid(EventUserVO eventUser) {
		int check;
		try {
			check = sqlSession.selectOne("event.dao.EventUserDAO.checkUserDid", eventUser);
		}catch (NullPointerException e) {
			check = 0;
		}
		return check;
	}
}
