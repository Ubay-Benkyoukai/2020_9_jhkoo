package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;

import org.junit.Assert;
//import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//import kr.ac.kopo.member.dao.MemberDAO;
//import kr.ac.kopo.member.dao.MemberDAOimpl;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.member.service.MemberServiceimpl;
import kr.ac.kopo.member.service.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/*.xml"})
public class MemberTest {

	@Autowired
	private MemberService memberService;
	//private MemberDAO memberDAO;
	
	@Test
	public void 로그인테스트() throws Exception{
		MemberVO member = new MemberVO();
		member.setId("user1");
		member.setPassword("1234");
		
		//MemberDAO memberDAO = new MemberDAOimpl();
		
		MemberVO loginVO = memberService.login(member); 
		System.out.println(loginVO);
		assertNotNull(loginVO);

	}

	@Test
	public void joinTest() throws Exception{
		
		
		MemberVO member = new MemberVO();
		member.setId("user5");
		member.setName("田中");
		member.setPassword("1234");
		member.setPhone("012-1234-1234");
		member.setEmail("123@gmail.com");
		member.setAddress("japan");
		member.setAgeGroup("20代");
		member.setGender("F");
		member.setPropertyStatus("一億円以上");
		member.setJobKey("3");
		
		//memberService.join(member);
	
	}
	
	@Test
	public void totalBalanceChangeTest() throws Exception{
		
		int total = memberService.totalBalanceChange("user5");
		
		System.out.println(total);
		//depositBalanceThisMonth + savingsBalanceThisMonth - withdralBalanceThisMonth
		//210+100-50=260
		int yen = 260;
		Assert.assertEquals(yen,total);

	}
}
