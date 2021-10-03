package kr.ac.kopo.event.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.event.service.EventService;
import kr.ac.kopo.event.service.EventUserService;
import kr.ac.kopo.event.service.LuckyBoxService;
import kr.ac.kopo.event.vo.EventUserVO;
import kr.ac.kopo.event.vo.EventVO;
import kr.ac.kopo.event.vo.LuckyBoxVO;

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
	
	@RequestMapping("/random/{eventNo}")
	public String randomGoods(@PathVariable("eventNo") int eventNo, HttpSession session) {
		ModelAndView mav = new ModelAndView("event/eventDetail");
		
		// 경품 번호의 최대값, 즉 경품의 갯수를 가져온다.
		int num = luckyBoxService.getMaxGoodsKey(eventNo);
		System.out.println(num);
//		if(num == 0) {
//			// 모든 경품이 소진되었습니다. 문구!
//			
//			return "redirect:/event/" + eventNo;
//		}
		
		double randomValue = Math.random();
		//System.out.println(randomValue);
		
		// raffle : select 1 ~ num random value
		int raffle = (int)(randomValue * num) + 1;
		//System.out.println(raffle);
		//System.out.println("random goods number is " + raffle);
		
		mav.addObject("raffle", raffle); // raffle : 경품고유번호

		// lucky_box 갯수amount 하나 감소
		List<LuckyBoxVO> getLuckyBox = luckyBoxService.getLuckyBox(eventNo);
		for(int i=0; i<getLuckyBox.size(); i++) {
			if(getLuckyBox.get(i).getGoodsKey() == raffle) {
				int base = getLuckyBox.get(i).getAmount();
				getLuckyBox.get(i).setAmount(base - 1);
				luckyBoxService.updateluckyBox(getLuckyBox.get(i));
				//System.out.println(getLuckyBox.get(i));
			}
		}
		
		
		
		// db에 경품추첨내역도 넣고
		

		return "redirect:/event/" + eventNo;
	}
	
}
