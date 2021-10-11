package kr.ac.kopo.card.dao;

import java.util.List;

import kr.ac.kopo.card.vo.CardVO;

public interface CardDAO {


	// my card List 카드 리스트
	public List<CardVO> selectById(String id);

	//  card table > insert new card  카드 개설
	public void insertNewCard(CardVO cardVO);
	
	// delete card 카드 삭제
	public void deleteCard(String cardNumber);
	
	// new card info 새로운 카드 정보
	public String getNewCardNumber();
	
	// 등록 계좌 정보 가져오기 
	public CardVO getCardInfoForPayment(String accountNumber);
	
	
	
}
