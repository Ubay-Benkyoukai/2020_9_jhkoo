package kr.ac.kopo.mydeposit.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.account.dao.DepositAccountDAO;
import kr.ac.kopo.account.vo.DepositAccountVO;
import kr.ac.kopo.mydeposit.dao.MyDepositDAO;
import kr.ac.kopo.mydeposit.vo.MyDepositVO;

@Service
public class MyDepositServiceimpl implements MyDepositService {

	
	@Autowired
	private DepositAccountDAO depositAccountDAO;	
	@Autowired
	private MyDepositDAO myDepositDAO;
	
	
	@Override
	public List<DepositAccountVO> selectDepositAccountById(String id) {
		
		List<DepositAccountVO> depositAccountList = depositAccountDAO.selectById(id);

		return depositAccountList;
	}

	// 입금
	@Override
	public void myDeposit(MyDepositVO myDepositVO) {

		// 1. 내 계좌에 입금내역 남기기
		myDepositDAO.addMyDepositLog(myDepositVO);
		
		// 2. 내 계좌 잔액 조정
//		myDepositDAO.updateBalance(myDepositVO);
		
	}

	// 계좌 정보 가져오기 (MyDepositService 22라인에 따라 오버라이드함)
	@Override
	public DepositAccountVO getInfo(String accountNumber) {
		
		return null;
	}

	// 보유 입출금 계좌 잔액
	@Override
	public int balanceByAccountNumber(String accountNumber) {
		int balanceByAccountNumber = myDepositDAO.BalanceByAccountNumber(accountNumber);
		return balanceByAccountNumber;
	}

	@Override
	public void updateBalance(@Valid MyDepositVO myDepositVO) {
		// TODO Auto-generated method stub
		
	}


}
