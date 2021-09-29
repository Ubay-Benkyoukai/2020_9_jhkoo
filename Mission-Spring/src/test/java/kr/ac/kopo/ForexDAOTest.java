package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;

import java.util.List;

//import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.forex.dao.ForexDAO;
import kr.ac.kopo.forex.dao.ForexDAOimpl;
import kr.ac.kopo.forex.service.ForexService;
import kr.ac.kopo.forex.service.ForexServiceimpl;
import kr.ac.kopo.forex.vo.ForexVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/*.xml"})
public class ForexDAOTest {

	@Autowired
	private ForexDAO forexDAO;
	
	@Test
	public void ExchangeRateTest() throws Exception{
		
		double ExchangeRate = forexDAO.ExchangeRate("USD");
		
		System.out.println(ExchangeRate);
		assertNotNull(ExchangeRate);
	}
	
	@Test
	public void UpdateExchangeRateTest() throws Exception{
			
		ForexVO forexVO = new ForexVO();
		forexVO.setCountryName("USD");
		forexVO.setExchangeRate(202.5);
		
		forexDAO.UpdateExchangeRate(forexVO);
		
	}
	
	@Test
	public void CreateForeignCurrencySavingsAccountTest() throws Exception{
		
		ForexVO account = new ForexVO();
		
		account.setAccountNumber("0005-031-00007");
		account.setId("user5");
		account.setAccountPassword("1234");
		account.setBalance(1000);
		account.setBankBookKey("5");
		account.setNickName("user5_USD");
		
		//forexDAO.CreateForeignCurrencySavingsAccount(account);
		
	}
	
	@Test
	public void getJapanAccountInfoTest() throws Exception{
		
		ForexVO account = new ForexVO();
		
		account = forexDAO.getJapanAccountInfo("0005-031-00007");
		
		System.out.println(account);
		assertNotNull(account);
		
	}
	

	@Test
	public void selectByIdTest() throws Exception{
			
		List<ForexVO> list = forexDAO.selectById("user1");
		
		System.out.println(list);
		assertNotNull(list);
		
	}
	

	

}
