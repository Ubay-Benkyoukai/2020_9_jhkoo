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
import kr.ac.kopo.member.vo.MemberVO;

import kr.ac.kopo.member.service.MemberServiceimpl;
import kr.ac.kopo.member.dao.MemberDAOimpl;
import kr.ac.kopo.member.vo.MemberVO;

import kr.ac.kopo.member.service.MemberService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/*.xml"})
public class MemberDaoTest {

	@Autowired
	private MemberDAO memberDAO;
	

	@Test
	public void MTest() throws Exception{
		MemberVO member = new MemberVO();
		member.setId("user1");
		member.setPassword("1234");
		
		MemberDAO memberDAO = new MemberDAOimpl();
		
		MemberVO loginVO = memberDAO.login(member); 
		System.out.println(loginVO);
		assertNotNull(loginVO);
	}
	
	
}
