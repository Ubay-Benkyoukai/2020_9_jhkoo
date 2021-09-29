package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;

import java.util.List;
import org.junit.Assert;
//import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.forex.service.ForexService;
import kr.ac.kopo.forex.service.ForexServiceimpl;
import kr.ac.kopo.forex.vo.ForexVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/*.xml"})
public class ForexTest {

	@Autowired
	private ForexService forexService;
	

	@Test
	public void forexServiceExchangeRateTest() throws Exception{
		
		double rate = forexService.ExchangeRate("EUR");
		
		System.out.println (rate);
		assertNotNull(rate);
		
	}	
	
	@Test
	public void UpdateExchangeRateTest() throws Exception{
		
		ForexVO forexVO = new ForexVO();
		forexVO.setCountryName("USD");
		forexVO.setExchangeRate(110.25);
		
		forexService.UpdateExchangeRate(forexVO);
		
	}
	
	@Test
	public void getJapanAccountInfoTest() throws Exception{
		
		ForexVO account = new ForexVO();
		
		account = forexService.getJapanAccountInfo("0005-031-00008");
		
		System.out.println(account);
		assertNotNull(account);
		
	}
	
	
	@Test
	public void selectDepositAccountByIdTest() throws Exception{
		/*	
		List<ForexVO> list = forexService.selectDepositAccountById("user1");
		
		System.out.println(list);
		assertNotNull(list);
		*/
	}
	
	@Test
	public void CreateForeignCurrencySavingsAccountTest() throws Exception{
			
		ForexVO account = new ForexVO();
		
		account.setAccountNumber("0005-031-00009");
		account.setId("user5");
		account.setAccountPassword("1234");
		account.setBalance(10000);
		account.setBankBookKey("4");
		account.setNickName("user5_USD");
		
		//forexService.CreateForeignCurrencySavingsAccount(account);
		
	}
	
}
