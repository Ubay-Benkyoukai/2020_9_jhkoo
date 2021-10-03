package kr.ac.kopo.event.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.event.service.EventService;
import kr.ac.kopo.event.service.EventUserService;
import kr.ac.kopo.event.service.LuckyBoxService;
import kr.ac.kopo.event.vo.EventUserVO;
import kr.ac.kopo.event.vo.EventVO;
import kr.ac.kopo.event.vo.LuckyBoxVO;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class EventController {

	@Autowired
	private EventService eventService;
	@Autowired
	private EventUserService eventUserService;
	@Autowired
	private LuckyBoxService luckyBoxService;
	
	@RequestMapping("/eventMap")
	public ModelAndView eventMap(HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView("event/eventList");
		
		List<EventVO> pastEventList = eventService.pastEventList();
		List<EventVO> currentEventList = eventService.currentEventList();
		List<EventUserVO> eventUserList = eventUserService.eventUserList();
		
		mav.addObject("pastEventList", pastEventList);
		mav.addObject("currentEventList", currentEventList);
		mav.addObject("eventUserList", eventUserList);
		
		return mav;
	}
	
	@GetMapping("/createEvent")
	public ModelAndView goInsertEvent(HttpSession session) {
		ModelAndView mav = new ModelAndView("event/createEvent");
		
		EventVO eventVO = new EventVO();
		mav.addObject("eventVO", eventVO);

		return mav;
	}
	
	@PostMapping("/createEvent")
	public String insertEvent(@Valid EventVO eventVO, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			System.out.println("Event Create Error...");
			return "redirect:/createEvent";
		}
		
		eventService.insertNewEvent(eventVO);

		return "redirect:/eventMap";
	}

	@GetMapping("/createGoods/{eventNo}")
	public ModelAndView goInsertGoods(@PathVariable("eventNo") int eventNo, HttpSession session) {
		ModelAndView mav = new ModelAndView("event/createGoods");
		
		LuckyBoxVO luckyBoxVO = new LuckyBoxVO();
		luckyBoxVO.setEventNo(eventNo);
		
		// eventNo에 맞는 luckyBox가 있는지 확인 후 반환해서 table로 보여주도록 한다.
		List<LuckyBoxVO> getLuckyBox = luckyBoxService.getLuckyBox(eventNo);
		mav.addObject("getLuckyBox", getLuckyBox);
		mav.addObject("luckyBoxVO", luckyBoxVO);

		return mav;
	}
	
	@ResponseBody
	@PostMapping("/createGoods")
	public String insertGoods(LuckyBoxVO luckyBoxVO, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			System.out.println("Event Create Error...");
			return "redirect:/createEvent";
		}
		
		//System.out.println(luckyBoxVO.getBoxList().get(0).toString());
		System.out.println(luckyBoxVO.getBoxList());
		luckyBoxService.insertLuckyBox(luckyBoxVO);

		return "Success";
	}
	
	@RequestMapping("/event")
	public ModelAndView event(HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView("event/eventListUser");
		
		List<EventVO> currentEventList = eventService.currentEventList();
		
		mav.addObject("currentEventList", currentEventList);
		
		return mav;
	}
	
	@GetMapping("/event/{eventNo}")
	public ModelAndView goDetailEvent(@PathVariable("eventNo") int eventNo, HttpSession session) {
		ModelAndView mav = new ModelAndView("event/eventDetail");

		EventVO getEvent = eventService.getEvent(eventNo);
		List<LuckyBoxVO> getLuckyBox = luckyBoxService.getLuckyBox(eventNo);
		mav.addObject("getEvent", getEvent);
		mav.addObject("getLuckyBox", getLuckyBox);

		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/random/{eventNo}")
	public String randomGoods(@PathVariable("eventNo") int eventNo, HttpSession session) {

		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
		
		// 이미 이벤트에 참가했는지 여부를 판단한다.
		EventUserVO checking = new EventUserVO();
		checking.setEventNo(eventNo);
		checking.setId(id);
		int one = eventUserService.checkUserDid(checking);
		if( one == 1 ) {
			// 해당 이벤트에 이미 참가하였습니다. 문구!
			String msg = "<script>alert('既に該当イベントに参加しました。目録に戻ります。');" +
					 "location.href='/spring-mvc/event'"+ "</script>";
			return msg;
		}
		
		// 경품 번호의 최대값, 즉 경품의 갯수를 가져온다.
		List<Integer> numbering = luckyBoxService.getGoodsKey(eventNo);
		int num = numbering.size();
		if(num == 0) {
			// 모든 경품이 소진되었습니다. 문구!
			String msg = "<script>alert('全ての景品が消尽されました。次の機会に参加してください。');" +
						 "location.href='/spring-mvc/event'"+ "</script>";
			return msg;
		}
		

		double randomValue = Math.random();
		int raffle = (int)(randomValue * num);
		int theKey = numbering.get(raffle);
		// theKey : 경품고유번호

		// lucky_box 갯수amount_Remainder 하나 감소
		List<LuckyBoxVO> getLuckyBox = luckyBoxService.getLuckyBox(eventNo);
		for(int i=0; i<getLuckyBox.size(); i++) {
			if(getLuckyBox.get(i).getGoodsKey() == theKey) {
				int base = getLuckyBox.get(i).getAmountRemainder();
				getLuckyBox.get(i).setAmountRemainder(base - 1);
				luckyBoxService.updateLuckyBox(getLuckyBox.get(i));	
			}
		}
		
		// 경품 추첨 내역 DB에 insert 하기
		EventUserVO receipt = new EventUserVO();
		receipt.setEventNo(eventNo);
		receipt.setId(id);
		receipt.setLuckyBoxKey(theKey);
		eventUserService.insertLuckyUser(receipt);
		
		
		// 당첨된 경품명 불러와서 alert하기
		LuckyBoxVO lucky = new LuckyBoxVO();
		lucky.setEventNo(eventNo);
		lucky.setGoodsKey(theKey);
		String name = luckyBoxService.getGoods(lucky);
		System.out.println("Goods name is : " + name);
		String msg = "<script>alert('" + name + "を引きました。おめでとうございます！');" +
				 "location.href='/spring-mvc/event/" + eventNo + "'" + "</script>";
		return msg;
	}
	
}
