package kr.ac.kopo.card.dao;

import java.util.List;

import kr.ac.kopo.card.vo.CardVO;

public interface CardDAO {

	
		// Card List
		public List<CardVO> selectCardById(String id);

		// new card register
		public void insertNewCard(CardVO cardVO);

		// delete card
		public void deleteCard(String cardNumber);
	
}
