package kr.ac.kopo.mydeposit.dao;

import java.util.List;

import kr.ac.kopo.account.vo.DepositAccountVO;
import kr.ac.kopo.mydeposit.vo.MyDepositVO;
import kr.ac.kopo.transfer.vo.TransferVO;

public interface MyDepositDAO {
	

	/**
	 * 사용자의 입출금 계좌 번호 조회
	 */
	public List<String> accountNumListById(String id);
	
	/**
	 *  계좌에 입금 내역 남기기
	 */
	public void addMyDepositLog(MyDepositVO myDepositVO);
	
	
	/**
	 * 계좌 정보 가져오기 
	 * Q. 이걸로 입출금 계좌잔액 따로 안만들어도 되는지?
	 * ex) MyDepositServiceimpl보면 보유입출금 계좌 잔액이라는
	 * int balanceByAccountNumber가 있음
	 */
	public DepositAccountVO getInfo(String accountNumber);
	
	
	/**
	 * 계좌 입금
	 */
	public void updateBalance(MyDepositVO myDepositVO);

	/*
	 * 해당 계좌의 잔액 
	 * (MyDepositServiceoimpl 의 31라인때문에 작성)
	 */
	public int BalanceByAccountNumber(String accountNumber);
	
	
}
