
package kr.ac.kopo.mydeposit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.service.DepositAccountService;
import kr.ac.kopo.account.vo.DepositAccountVO;
import kr.ac.kopo.favorite.vo.FavoriteVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.mydeposit.service.MyDepositService;
import kr.ac.kopo.mydeposit.vo.MyDepositVO;
import kr.ac.kopo.transfer.vo.TransferVO;



@Controller
public class MyDepositController {
	
	@Autowired
	private MyDepositService myDepositService;

	@Autowired
	private DepositAccountService depositAccountService;	

	
	/**
	 *  나의 입출금 계좌 중에서 입급을 시행할 계좌 선택하는 페이지. 
	 */
	@RequestMapping("/myDepositChoose")
	public ModelAndView goDepositAccountList(HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView("myDeposit/myChoose");

		// session에 등록된 id 
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();

		// 입출금자유 계좌 테이블
		List<DepositAccountVO> depositAccountList = myDepositService.selectDepositAccountById(id);
		mav.addObject("depositAccountList", depositAccountList);
		
		session.setAttribute("depositAccountList", depositAccountList);
		
		
		return mav;

	}
	
	/**
	 *  입금 FORM 페이지. (入金page)
	 *  선택된 입출금 계좌 번호를 받아 입금에 필요한 내용들을 표시
	 *  選択された入出金口座の口座番号>入金に必要な内容を表示
	 *  
	 *  Spring Form태그 방식, 사용자의 입력값을 담아올 myDepositVO를 생성하여 올려줌
	 *  Spring Form tag方式、　ユーザの入力を運んでくるmyDepositVOを生成して上げる
	 */
	@GetMapping("/myDeposit/{accountNumber}")
	public ModelAndView myDepositForm(@PathVariable String accountNumber,
			HttpSession session) {
		
		ModelAndView mav = new ModelAndView("myDeposit/myDeposit");
		
		MyDepositVO myDepositVO = new MyDepositVO();
		mav.addObject("myDepositVO", myDepositVO);
		
		// 해당 계좌의 정보
		DepositAccountVO depositAccount = depositAccountService.getDepositAccountInfo(accountNumber);
		mav.addObject("depositAccount",depositAccount);
		
		return mav;
	}

		// 입금하기

		@PostMapping("/myDeposit/{accountNumber}")	
		public String updateBalance(@Valid MyDepositVO myDepositVO, BindingResult result, HttpSession session) {
			
			if(result.hasErrors()) {
				System.out.println("入金ERROR発生...");
				return "myDeposit/myDepositFail";
			}
			
			String accountNumber = myDepositVO.getAccountNumber();
			int balance = myDepositVO.getBalance();
			String content = myDepositVO.getContent();
			int depositMoney = myDepositVO.getDepositMoney();
				
			// 입금, depositMoney 넣어서 vo 보냄
			MyDepositVO depositVO = new MyDepositVO();
			
			depositVO.setAccountNumber(accountNumber);
			depositVO.setBalance(balance);
			depositVO.setContent(content);
			depositVO.setDepositMoney(depositMoney);
			
//			int depositMoney = depositVO.getDepositMoney();
//			myDepositVO.setDepositMoney(depositMoney);
			myDepositService.myDeposit(myDepositVO);
//			myDepositService.updateBalance(myDepositVO);
		
			return "myDeposit/myDepositSuccess";
		}
		
	

}













