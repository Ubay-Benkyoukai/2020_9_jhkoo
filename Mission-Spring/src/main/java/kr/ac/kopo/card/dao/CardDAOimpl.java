package kr.ac.kopo.card.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.card.vo.CardVO;

@Repository
public class CardDAOimpl implements CardDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<CardVO> selectById(String id) {
		sqlSession.selectList("card.dao.CardDAO.selectCard", id);
		return selectById(id);
	}

	@Override
	public void insertNewCard(CardVO cardVO) {
		sqlSession.insert("card.dao.CardDAO.insertNewCard", cardVO);	
		
	}

	@Override
	public void deleteCard(String cardNumber) {
		sqlSession.delete("card.dao.CardDAO.deleteCard", cardNumber);
		
	}

	@Override
	public String getNewCardNumber() {
		String newCardNumber = sqlSession.selectOne("card.dao.CardDAO.getNewCardNumber");
		return newCardNumber;
	}

	@Override
	public CardVO getCardInfoForPayment(String accountNumber) {
		CardVO cardNewInfoForPayment = sqlSession.selectOne("card.dao.CardDAO.getInfo", accountNumber);
		return cardNewInfoForPayment;
	}

}
