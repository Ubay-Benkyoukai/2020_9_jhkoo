package kr.ac.kopo.card.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.card.vo.CardVO;

@Repository
public class CardDAOimpl implements CardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<CardVO> selectCardById(String id) {

		List<CardVO> cardList = sqlSession.selectList("card.dao.CardDAO.selectCardById", id);
			
		return cardList;
	}

	@Override
	public void insertNewCard(CardVO cardVO) {
		sqlSession.insert("card.dao.CardDAO.insertNewCard", cardVO);
		
	}

	@Override
	public void deleteCard(String cardNumber) {
		sqlSession.delete("card.dao.CardDAO.deleteCard", cardNumber);
		
	}

}
