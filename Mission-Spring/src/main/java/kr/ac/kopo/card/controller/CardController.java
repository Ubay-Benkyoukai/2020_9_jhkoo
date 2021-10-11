package kr.ac.kopo.card.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.card.service.CardService;
import kr.ac.kopo.card.vo.CardVO;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class CardController {
	
	@Autowired
	private CardService cardService;

	// card List view
	@GetMapping("/cardList")
	public ModelAndView goCardList(HttpSession session) {
		ModelAndView mav = new ModelAndView("card/cardList");
		
		return mav;
	}
	
	@GetMapping("/card/joinCard/{num}")
	public ModelAndView joinCardForm(@PathVariable String num, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("card/joinCard" + num);
		
		// 개설할 입출금 자유 계좌의 id를 사용자의 아이디로 설정
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
		
		CardVO cardVO = new CardVO();
		cardVO.setId(id);

		// 공유영역에 올려 이것을 매개로 spring form태그에서 값 받아옴 
		mav.addObject("cardVO",cardVO);
		
		return mav;
	}
	
	
	@PostMapping("/card/joinCard/{num}")
	public String joinCard(@Valid CardVO cardVO, BindingResult result) {
		
		if(result.hasErrors()) {
			System.out.println("join card error...");
			return "card/joinCard";
		}
		
		// insert
		cardService.insertNewCard(cardVO);
		
		return "card/joinCardFinish";
	}
	
	@GetMapping("/deleteCard/{cardNumber}")
	public ModelAndView deleteDepositAccount(@PathVariable String cardNumber, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/myCardList");
		
		// card 삭제
		cardService.deleteCard(cardNumber);
		
		return mav;
	}
	
	
	
	
}
