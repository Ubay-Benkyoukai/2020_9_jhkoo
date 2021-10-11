package kr.ac.kopo.card.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.service.DepositAccountService;
import kr.ac.kopo.account.vo.DepositAccountVO;
import kr.ac.kopo.card.service.CardService;
import kr.ac.kopo.card.vo.CardVO;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class CardController {
	
	@Autowired
	private CardService cardService;
	@Autowired
	private DepositAccountService depositAccountService;
	
	

	/*
	 * 구좌관리 페이지(list.jsp)의 Card부분에서 cardList로 넘어오는부분 
	 */
	@GetMapping("/cardList")
	public ModelAndView goCardList(HttpSession session) {
		ModelAndView mav = new ModelAndView("myCard/cardList");
		
		return mav;
	}
	
	// new card join
	@GetMapping("myCard/cardJoin/{num}") 
	public ModelAndView newCardJoinForm(@PathVariable String num,HttpSession session) { 
		
		ModelAndView mav = new ModelAndView("myCard/cardJoin" + num);

		// 개설할 적금 계좌의 id를 사용자의 아이디로 설정
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
		
		CardVO cardVO = new CardVO();
		cardVO.setId(id);
		
		// 사용중인 카드 정보
		//List<String> myCard = cardService.myCard(accountNumber);
	
		// 사용자의 입출금자유예금 계좌 가져와서 공유영역에 올리기
		// 카드 개설 시, 출금 계좌 선택 위해서
		List<String> depositAccountNumList = depositAccountService.depositAccountNumListById(id);
		mav.addObject("depositAccountNumList", depositAccountNumList);
		
		// 공유영역에 올려 이걸 매개로 spring form태그에서 값 받아옴
		mav.addObject("cardVO", cardVO);
		
		return mav;

	}
	
	// new card join(insert)
	@PostMapping("myCard/cardJoin/{num}")
	public String newCardJoin(@PathVariable String num, @Valid CardVO cardVO, BindingResult result, HttpSession session) {
		
		if(result.hasErrors()) {
			System.out.println("card register Error...");
			return "redirect:/myCard/cardJoin/" + num;
		}
		
		System.out.println("===================");
		System.out.println(cardVO);
		
		
		// 새로운 카드번호 가져오기 위해 가장 최근 seq가져옴 
		String cardNumber = cardService.getNewCardNumber();
		cardVO.setCardNumber(cardNumber);
		
		// register new card
		cardService.insertNewCard(cardVO);
		
		return "myCard/cardJoinFinish";
		
	}
	
	
	/*   payment >> TransferController.java 273Line 
	 *   カード決済　(1. cardNumber로 accountNumber가져오기 2.결제하기(이체))
	 */
	
	
}













