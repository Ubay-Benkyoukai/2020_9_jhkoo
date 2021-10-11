package kr.ac.kopo.card.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import kr.ac.kopo.card.vo.CardVO;

public class CardDAOimpl implements CardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public void insertNewCard(CardVO cardVO) {
		sqlSession.insert("card.dao.CardDAO.insertNewCard", cardVO);		
	}

	@Override
	public void deleteCard(String cardNumber) {
		sqlSession.delete("card.dao.CardDAO.deleteCard", cardNumber);
	}

	@Override
	public List<CardVO> myCard(String id) {
		sqlSession.selectList("card.dao.CardDAO.selectCard", id);
		return myCard(id);
	}

	@Override
	public String getNewCardNumber() {
		String newCardNumber = sqlSession.selectOne("card.dao.CardDAO.getNewCardNumber");
		return newCardNumber;
	}

	@Override
	public CardVO getNewCardInfoForPayment(String accountNumber) {
		CardVO cardNewInfoForPayment = sqlSession.selectOne("card.dao.CardDAO.getInfo", accountNumber);
		return cardNewInfoForPayment;
	}

}
