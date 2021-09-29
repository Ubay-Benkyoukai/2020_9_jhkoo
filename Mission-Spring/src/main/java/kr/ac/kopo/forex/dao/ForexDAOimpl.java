package kr.ac.kopo.forex.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.forex.vo.ForexVO;

@Repository
public class ForexDAOimpl implements ForexDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public double ExchangeRate(String Country) {
		double ExchangeRate;
		ExchangeRate = sqlSession.selectOne("forex.dao.ForexDAO.ExchangeRate", Country);
		return ExchangeRate;
	}
	
	@Override
	public void UpdateExchangeRate(ForexVO forexVO){
		
		sqlSession.update("forex.dao.ForexDAO.UpdateExchangeRate", forexVO);
	}
		
	@Override
	public void CreateForeignCurrencySavingsAccount(ForexVO Account) {
		sqlSession.insert("forex.dao.ForexDAO.CreateForeignCurrencySavingsAccount", Account);
	}
	
	@Override
	public ForexVO getJapanAccountInfo(String accountNumber) {
		
		ForexVO depositAccount = sqlSession.selectOne("forex.dao.ForexDAO.getJapanAccountInfo", accountNumber);
		return depositAccount;
	}
	
	@Override
	public List<ForexVO> selectById(String id) {
		
		List<ForexVO> depositAccountList = sqlSession.selectList("forex.dao.ForexDAO.selectById", id);
		
		return depositAccountList;
	}
}
