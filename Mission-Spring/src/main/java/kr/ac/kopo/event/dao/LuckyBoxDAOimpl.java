package kr.ac.kopo.event.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.event.vo.LuckyBoxVO;

@Repository
public class LuckyBoxDAOimpl implements LuckyBoxDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void insertLuckyBox(LuckyBoxVO luckyBoxVO) {
		sqlSession.insert("event.dao.LuckyBoxDAO.insertLuckyBox", luckyBoxVO);
	}
}
