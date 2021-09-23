package kr.ac.kopo.event.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
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

	@GetMapping("/createGoods")
	public ModelAndView goInsertGoods(HttpSession session) {
		ModelAndView mav = new ModelAndView("event/createGoods");
		
		LuckyBoxVO luckyBoxVO = new LuckyBoxVO();

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
	
	
	
	
}
