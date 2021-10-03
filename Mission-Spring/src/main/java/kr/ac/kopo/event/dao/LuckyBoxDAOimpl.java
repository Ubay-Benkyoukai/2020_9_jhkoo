package kr.ac.kopo.event.dao;

import java.util.List;

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
	
	@Override
	public List<LuckyBoxVO> getLuckyBox(int eventNo) {
		List<LuckyBoxVO> getLuckyBox = sqlSession.selectList("event.dao.LuckyBoxDAO.getLuckyBox", eventNo);
		return getLuckyBox;
	}
	
	@Override
	public int getMaxGoodsKey(int eventNo) {
		int goodsKey;
		try {
			goodsKey = sqlSession.selectOne("event.dao.LuckyBoxDAO.getMaxGoodsKey", eventNo);
		}catch (NullPointerException e) {
			goodsKey = 0;
		}
		return goodsKey;
	}
	
	@Override
	public void updateluckyBox(LuckyBoxVO luckyBoxVO) {
		sqlSession.update("event.dao.LuckyBoxDAO.updateluckyBox", luckyBoxVO);
	}
	
}
