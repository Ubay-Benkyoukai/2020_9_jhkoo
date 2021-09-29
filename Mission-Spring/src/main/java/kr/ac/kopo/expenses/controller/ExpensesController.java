package kr.ac.kopo.expenses.controller;


import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.service.DepositAccountService;
import kr.ac.kopo.account.service.DepositDetailService;
import kr.ac.kopo.cash.service.CashService;
import kr.ac.kopo.challenge.service.ChallengeService;
import kr.ac.kopo.challenge.vo.ChallengeVO;
import kr.ac.kopo.member.vo.MemberVO;


@Controller
public class ExpensesController {
	
	//@Autowired
	//private CashService cashService;
	
	@RequestMapping("/expenses")
	public ModelAndView goExpenses(HttpSession session) {

		
		ModelAndView mav = new ModelAndView("expenses/expenses");
		
		/*
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
		*/
		
		return mav;
	}
	
	
	@RequestMapping("/expenses/inputExpenses")
	public ModelAndView goInputExpenses(HttpSession session) {

		
		ModelAndView mav = new ModelAndView("expenses/inputExpenses");
		
		/*
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
		*/
		
		return mav;
	}
	
	
	@RequestMapping("/expenses/searchExpenses")
	public ModelAndView goSearchExpenses(HttpSession session) {

		
		ModelAndView mav = new ModelAndView("expenses/searchExpenses");
		
		/*
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
		*/
		
		return mav;
	}

}
