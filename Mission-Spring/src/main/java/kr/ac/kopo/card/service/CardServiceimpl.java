package kr.ac.kopo.card.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.ac.kopo.card.dao.CardDAO;
import kr.ac.kopo.card.vo.CardVO;

public class CardServiceimpl implements CardService {

	@Autowired 
	private CardDAO cardDAO;
	
		
	@Override
	public List<CardVO> selectById(String id) {
		List<CardVO> myCardList = cardDAO.selectById(id); 
		return myCardList;
	}

	@Override
	public void insertNewCard(CardVO cardVO) {
		cardDAO.insertNewCard(cardVO);
	}

	@Override
	public void deleteCard(String cardNumber) {
		cardDAO.deleteCard(cardNumber);
	}

	@Override
	public String getNewCardNumber() {
		String newCardNumber = cardDAO.getNewCardNumber();
		return newCardNumber;
	}

	// 결제 위해 등록 정보 가져옴
	@Override
	public CardVO getCardInfoForPayment(String accountNumber) {
		CardVO cardInfoForPayment = cardDAO.getCardInfoForPayment(accountNumber);
		return cardInfoForPayment;
	}

	
	

}
