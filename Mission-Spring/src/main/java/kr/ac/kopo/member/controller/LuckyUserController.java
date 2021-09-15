package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class LuckyUserController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("event/user")
 	public ModelAndView eventUserList(HttpSession session,  Model model) throws Exception{
		ModelAndView mav = new ModelAndView("event/checkUser");
		// session 에서 자동으로 물고 있는 loginVO 
		//MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");

		model.addAttribute("memberVO", new MemberVO());
		
		return mav;
	}
 	
	@PostMapping("event/user")
 	public String eventUserModify(@Valid MemberVO member, BindingResult result, HttpSession session) {
 		
 		if(result.hasErrors()) {
 			System.out.println(result.toString());
 			return "redirect:/event/user";
 		}

		String myName = member.getName();
		String myPhone = member.getPhone();
		String myEmail = member.getEmail();
		String myAddress = member.getAddress();

 		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		
		loginVO.setName(myName);
		loginVO.setPhone(myPhone);
		loginVO.setEmail(myEmail);
		loginVO.setAddress(myAddress);
		
		memberService.luckyUserUpdate(member);
		
		return "redirect:/event/user";
 	}
 		

}
