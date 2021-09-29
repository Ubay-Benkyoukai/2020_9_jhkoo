package kr.ac.kopo.forex.dao;

import java.util.List;

import kr.ac.kopo.account.vo.DepositAccountVO;
import kr.ac.kopo.forex.vo.ForexVO;

public interface ForexDAO {

	//外貨レート
	double ExchangeRate(String Country);
	
	//外貨レート更新
	public void UpdateExchangeRate(ForexVO forexVO);
	
	//外貨口座開設
	void CreateForeignCurrencySavingsAccount(ForexVO Account);
	
	//口座情報取得
	ForexVO getJapanAccountInfo(String accountNumber);
	
	//口座リスト取得
	public List<ForexVO> selectById(String id);
	
}
