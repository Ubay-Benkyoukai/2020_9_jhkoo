package kr.ac.kopo.mydeposit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.account.vo.DepositAccountVO;
import kr.ac.kopo.mydeposit.vo.MyDepositVO;

@Repository
public class MyDepositDAOimpl implements MyDepositDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	// 사용자의 입출금 계좌 번호 조회
	@Override
	public List<String> accountNumListById(String id) {
		List<String> accountNumList = sqlSession.selectList("mydeposit.dao.MyDepositDAO.accountNumListById", id);
		return accountNumList;
	}

	// 계좌 정보 가져오기
	@Override
	public DepositAccountVO getInfo(String accountNumber) {
		DepositAccountVO depositAccount = sqlSession.selectOne("account.dao.DepositAccountDAO.getInfo", accountNumber);
		return depositAccount;
	}
	
	// 계좌 입금
	@Override
	public void updateBalance(MyDepositVO myDepositVO) {
		sqlSession.update("mydeposit.dao.MyDepositDAO.updateBalance", myDepositVO);
		
	}

	// 계좌 입금 내역 남기기
	@Override
	public void addMyDepositLog(MyDepositVO myDepositVO) {
		sqlSession.insert("mydeposit.dao.MyDepositDAO.addMyDepositLog", myDepositVO);
		
	}

	@Override
	public int BalanceByAccountNumber(String accountNumber) {
		return 0;
	}


}
