package kr.ac.kopo.forex.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.ac.kopo.forex.vo.ForexVO;
import kr.ac.kopo.forex.dao.ForexDAO;
import kr.ac.kopo.forex.dao.ForexDAOimpl;


@Repository
public class ForexServiceimpl implements ForexService{

	
	@Autowired
	private ForexDAO forexDAO;
	
	
	
	@Override
	public double ExchangeRate(String Country) {
		
		return forexDAO.ExchangeRate(Country);
		
	}
	
	@Override
	public void UpdateExchangeRate(ForexVO forexVO){
		
		forexDAO.UpdateExchangeRate(forexVO);
	}
	
	@Override
	public void CreateForeignCurrencySavingsAccount(ForexVO Account) {
		forexDAO.CreateForeignCurrencySavingsAccount(Account);
	}
	
	@Override
	public ForexVO getJapanAccountInfo(String accountNumber) {
		
		return forexDAO.getJapanAccountInfo(accountNumber);
	}
	
	@Override
	public List<ForexVO> selectDepositAccountById(String id) {
		
		List<ForexVO> depositAccountList = forexDAO.selectById(id);
		
		return depositAccountList;
	}
	
}
