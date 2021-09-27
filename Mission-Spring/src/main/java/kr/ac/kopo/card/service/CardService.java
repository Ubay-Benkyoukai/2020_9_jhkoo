package kr.ac.kopo.card.service;

import java.util.List;

import kr.ac.kopo.account.vo.DepositAccountVO;
import kr.ac.kopo.card.vo.CardVO;

public interface CardService {

	// Card List
	List<CardVO> selectCardById(String id);
	
	// account List
	List<DepositAccountVO> selectDepositAccountById(String id);
	
	// account number List
	List<String> depositAccountNumListById(String id);
	
	// register new card
	void insertNewCard(CardVO cardVO);
	
	// delete card
	void deleteCard(String cardNumber);
	
}
