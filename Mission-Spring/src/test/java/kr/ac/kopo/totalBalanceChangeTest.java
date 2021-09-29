package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.dao.MemberDAOimpl;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;


public class totalBalanceChangeTest {

	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MemberService memberService;
	

	@Test
	public void ResultJoinTest() throws Exception{
		MemberVO member = new MemberVO();
		//MemberDAO memberDAO = new MemberDAO();
		member.setId("user5");
		member.setName("user5_Name");
		member.setPassword("1234");
		member.setPhone("010-1234-1234");
		member.setEmail("user5@gmail.com");
		member.setAddress("JAPAN");
		member.setAgeGroup("20代");
		member.setGender("F");
		member.setPropertyStatus("五百万円未満");
		member.setJobKey("2");
		
		//memberDAO.setDepositBalanceThisMonth("100000");
		//memberDAO.setSavingsBalanceThisMonth("200000");
		//memberDAO.setWithdralBalanceThisMonth("80000");		
	}
	
	
	@Test
	public void tBCTest() throws Exception{
		int total = memberService.totalBalanceChange("user5");
		System.out.println(total);
	}
	
	
		
}

