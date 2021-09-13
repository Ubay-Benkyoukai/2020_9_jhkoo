package kr.ac.kopo.mydeposit.service;
import java.util.List;

import javax.validation.Valid;

import kr.ac.kopo.account.vo.DepositAccountVO;
import kr.ac.kopo.mydeposit.vo.MyDepositVO;

public interface MyDepositService {
	
	
	/** 입금
	 * 1. 선택한 입출금 계좌에 입금 내역 남기기
	 * 2. 입금한 계좌의 잔액 조정하기
	 */
	
		public void myDeposit(MyDepositVO myDepositVO);
		
	
		// 보유 입출금 계좌 리스트
		List<DepositAccountVO> selectDepositAccountById(String id);
		
		
		// 계좌 정보 가져오기 (MyDepositDAO보고 만든것 필요한지여부 검토해야함)
		DepositAccountVO getInfo(String accountNumber);
		

		// 보유 입출금 계좌 잔액
		int balanceByAccountNumber(String accountNumber);


		// 입금(잔액 변동)
		public void updateBalance(@Valid MyDepositVO myDepositVO);


		
}
	
		
	