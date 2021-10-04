package kr.ac.kopo.card.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CardController {

	/*
	 * 구좌관리 페이지(list.jsp)에서 Card부분 에서 cardList로 넘어오는부분 
	 */
	@GetMapping("/cardList")
	public ModelAndView goCardList(HttpSession session) {
		ModelAndView mav = new ModelAndView("myCard/cardList");
		
		return mav;
	}
	
	
	
	
	
}
