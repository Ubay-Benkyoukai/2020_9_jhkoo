package kr.ac.kopo.card.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.account.dao.DepositAccountDAO;
import kr.ac.kopo.account.vo.DepositAccountVO;
import kr.ac.kopo.card.dao.CardDAO;
import kr.ac.kopo.card.vo.CardVO;

@Service
public class CardServiceimpl implements CardService{

	@Autowired
	private CardDAO cardDAO;
	@Autowired
	private DepositAccountDAO depositAccountDAO;
	
	
	@Override
	public List<CardVO> selectCardById(String id) {
		List<CardVO> cardList = cardDAO.selectCardById(id);
		return cardList;
	}


	@Override
	public List<DepositAccountVO> selectDepositAccountById(String id) {
		List<DepositAccountVO> depositAccountList = depositAccountDAO.selectById(id);
		return depositAccountList;
	}


	@Override
	public List<String> depositAccountNumListById(String id) {
		List<String> depositAccountNumListById = depositAccountDAO.accountNumListById(id);
		return depositAccountNumListById;
	}


	@Override
	public void insertNewCard(CardVO cardVO) {
		cardDAO.insertNewCard(cardVO);
		
	}


	@Override
	public void deleteCard(String cardNumber) {
		cardDAO.deleteCard(cardNumber);
		
	}

	
	
	
}
