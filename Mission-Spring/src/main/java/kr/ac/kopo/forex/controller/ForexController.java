package kr.ac.kopo.forex.controller;

import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.forex.vo.ForexVO;
import kr.ac.kopo.friend.vo.FriendVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.account.service.DepositDetailService;
import kr.ac.kopo.account.vo.DepositAccountVO;
import kr.ac.kopo.forex.dao.ForexDAO;
import kr.ac.kopo.forex.service.ForexService;


 
@Controller
public class ForexController {
   
	@Autowired
	private ForexService forexService;
	//private ForexVO forexVO;
	
	@RequestMapping("/forExchange")
	public ModelAndView forExchange(HttpSession session){
		
		ModelAndView mav = new ModelAndView("forExchange/forExchange");
		
		double rate = forexService.ExchangeRate("USD");
		
		mav.addObject("forEx", rate);
		
		return mav;
	}
	
	
	@RequestMapping("/forExchange/selectAccount")
	  public ModelAndView selectAccount(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("forExchange/selectAccount");
		/*
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
		*/
		//List<ForexVO> depositAccountList = forexService.selectDepositAccountById(id);
		String depositAccountList = "";
		
		mav.addObject("Test", depositAccountList);
		
		return mav;
	}
	
	@RequestMapping("/forExchange/enterAmount")
	  public ModelAndView enterAmount() {
		
		ModelAndView mav = new ModelAndView("forExchange/enterAmount");
		
		mav.addObject("Test", "enterAmount");
		
		return mav;
		      
	}
	
	@RequestMapping("/forExchange/confirmInfo")
	  public ModelAndView confirmInfo(HttpSession session) {

		
		ModelAndView mav = new ModelAndView("forExchange/confirmInfo");
		
		mav.addObject("Test", "confirmInfo");
		
		
		return mav;
		
	}
	

}
