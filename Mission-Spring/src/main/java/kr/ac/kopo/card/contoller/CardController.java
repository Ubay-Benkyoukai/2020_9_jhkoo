package kr.ac.kopo.card.contoller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.card.service.CardService;
import kr.ac.kopo.card.vo.CardVO;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class CardController {

	@Autowired
	private CardService cardService;
	
	
	@RequestMapping("/cardList")
	public ModelAndView cardList(HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView("/myCard/cardList");
		// session에 등록된 id 
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
		
		List<CardVO> cardList = cardService.selectCardById(id);
		
		mav.addObject("cardList", cardList);
		session.setAttribute("cardList", cardList);
		
		return mav;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
