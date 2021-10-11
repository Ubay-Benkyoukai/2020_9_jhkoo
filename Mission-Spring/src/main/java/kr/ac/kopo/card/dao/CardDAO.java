package kr.ac.kopo.card.dao;

import java.util.List;

import kr.ac.kopo.card.vo.CardVO;

public interface CardDAO {

		/* new card register 
		 *(일단은 insert로 new card register라고 1개 만든후 
		 * 버튼에 값을 지정해서 버튼0은 card0 등록, 버튼1은 card1 되게끔)
		 */
		public void insertNewCard(CardVO cardVO);
		
		// delete card
		public void deleteCard(String cardNumber);

		// hav card List  
		public List<CardVO> myCard(String id);

		// bring new cardNumber
		public String getNewCardNumber();

		// 결제 위해 등록 정보 가져옴
		public CardVO getNewCardInfoForPayment(String accountNumber);

	
		
		/*
		 * stop card 
		 * 카드의 결제기능 막는것과 동시에 stop되어있는 상태에서는 
		 * 경고 알림가게끔 > db에 새로운 컬럼 만들거나 그냥 accountnumber와의
		 * 연결을 끊어두고 이때 메세지 뜨게끔 하는등... 
		 */ 
	
	
	
}
