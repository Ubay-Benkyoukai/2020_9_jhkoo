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
	public List<Integer> getGoodsKey(int eventNo) {
		List<Integer> goodsKey;
		try {
			goodsKey = sqlSession.selectList("event.dao.LuckyBoxDAO.getGoodsKey", eventNo);
		}catch (NullPointerException e) {
			goodsKey = null;
			System.out.println("NullPointerEx");
		}
		return goodsKey;
	}
	
	@Override
	public void updateLuckyBox(LuckyBoxVO luckyBoxVO) {
		sqlSession.update("event.dao.LuckyBoxDAO.updateLuckyBox", luckyBoxVO);
	}
	
	@Override
	public String getGoods(LuckyBoxVO luckyBoxVO) {
		String getGoods = sqlSession.selectOne("event.dao.LuckyBoxDAO.getGoods", luckyBoxVO);
		return getGoods;
	}
}
