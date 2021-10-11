package kr.ac.kopo.card.service;

import java.util.List;

import kr.ac.kopo.card.vo.CardVO;

public interface CardService {


	// my card List 카드 리스트
	List<CardVO> selectById(String id);

	// card table > insert new card  카드 개설
	void insertNewCard(CardVO cardVO);

	// delete card 카드 삭제
	void deleteCard(String cardNumber);
	
	// new card info 새로운 카드 정보
	String getNewCardNumber();
	
	// 등록 계좌 정보 가져오기 
	CardVO getCardInfoForPayment(String accountNumber);

}
