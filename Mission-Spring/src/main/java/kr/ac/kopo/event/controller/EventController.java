package kr.ac.kopo.event.controller;

import java.util.List;

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

import kr.ac.kopo.account.service.DepositAccountService;
import kr.ac.kopo.account.vo.DepositAccountVO;
import kr.ac.kopo.event.service.EventService;
import kr.ac.kopo.event.service.EventUserService;
import kr.ac.kopo.event.service.LuckyBoxService;
import kr.ac.kopo.event.vo.EventUserVO;
import kr.ac.kopo.event.vo.EventVO;
import kr.ac.kopo.event.vo.LuckyBoxVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.transfer.service.TransferService;
import kr.ac.kopo.transfer.vo.TransferVO;

@Controller
public class EventController {

	@Autowired
	private EventService eventService;
	@Autowired
	private EventUserService eventUserService;
	@Autowired
	private LuckyBoxService luckyBoxService;
	@Autowired
	private TransferService transferService;
	@Autowired
	private DepositAccountService depositAccountService;
	
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
	
	@PostMapping("/modifyEvent")
	public ModelAndView modifyEvent(@Valid EventVO eventVO, BindingResult result, HttpSession session) {
		
		int eventNo = eventVO.getEventNo();
		ModelAndView mav = new ModelAndView("redirect:event/contents/" + eventNo);
		if(result.hasErrors()) {
			System.out.println("Event Modify Error...");
			return mav;
		}
		
		eventService.updateEvent(eventVO);
		return mav;
	}

	// 기존
	@PostMapping("/insertGoods")
	public ModelAndView insertGoods(LuckyBoxVO luckyBoxVO, BindingResult result, HttpSession session) {
		int eventNo = luckyBoxVO.getBoxList().get(0).getEventNo();
		//System.out.println(eventNo);
		
		if(result.hasErrors()) {
			System.out.println("Goods Create Error...");
			ModelAndView mav = new ModelAndView("redirect:/createEvent");
			return mav;
		}
		ModelAndView mav = new ModelAndView("redirect:/event/contents/" + eventNo);
		//System.out.println(luckyBoxVO.getBoxList().get(0).toString());
		//System.out.println(luckyBoxVO.getBoxList());
		luckyBoxService.insertLuckyBox(luckyBoxVO);
		
		return mav;
	}


	
//	@PostMapping("/updateGoods")
//	public ModelAndView modifyGoods(LuckyBoxVO luckyBoxVO, BindingResult result, HttpSession session) {
//		int eventNo = luckyBoxVO.getEventNo();
//		
//		if(result.hasErrors()) {
//			System.out.println("Goods Modify Error...");
//			ModelAndView mav = new ModelAndView("redirect:/createEvent");
//			return mav;
//		}
//		ModelAndView mav = new ModelAndView("redirect:event/contents/" + eventNo);
//		//System.out.println(luckyBoxVO.getBoxList().get(0).toString());
//		System.out.println(luckyBoxVO.getBoxList());
//		luckyBoxService.insertLuckyBox(luckyBoxVO);
//		
//		return mav;
//	}
	
	@PostMapping("/updateGoods")
	public ModelAndView modifyGoods(LuckyBoxVO luckyBoxVO, BindingResult result, HttpSession session) {
		int eventNo = luckyBoxVO.getBoxList().get(0).getEventNo();
		
		if(result.hasErrors()) {
			System.out.println("Goods Modify Error...");
			ModelAndView mav = new ModelAndView("redirect:/createEvent");
			return mav;
		}
		ModelAndView mav = new ModelAndView("redirect:/event/contents/" + eventNo);
		luckyBoxService.updateGoods(luckyBoxVO);
		
		return mav;
	}
	
	@PostMapping("/deleteGoods/{num}")
	public ModelAndView deleteGoods(@PathVariable("num") int num, LuckyBoxVO luckyBoxVO, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			System.out.println("Goods Delete Error...");
			ModelAndView mav = new ModelAndView("redirect:/createEvent");
			return mav;
		}
		
		int eventNo = luckyBoxVO.getBoxList().get(num).getEventNo();
		int goodsKey = luckyBoxVO.getBoxList().get(num).getGoodsKey();
		
		LuckyBoxVO delGoods = new LuckyBoxVO();
		delGoods.setEventNo(eventNo);
		delGoods.setGoodsKey(goodsKey);
		
		ModelAndView mav = new ModelAndView("redirect:/event/contents/" + eventNo);
		
		luckyBoxService.deleteLuckyBox(delGoods);

		return mav;
	}
	
	
	@ResponseBody
	@RequestMapping("/event/contents/{eventNo}")
	public ModelAndView eventContents(@PathVariable("eventNo") int eventNo, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("event/modifyEventNGoods");
		
		EventVO getEvent = eventService.getEvent(eventNo);
		if(getEvent == null) {
			System.out.println("Event is null");
			String msg = "newEvent";
			mav.addObject("msg", msg);
		}
		String reg = getEvent.getRegDate().substring(0, 16);
		getEvent.setRegDate(reg.replace(" ", "T"));
		String end = getEvent.getEndDate().substring(0, 16);
		getEvent.setEndDate(end.replace(" ", "T"));
		List<LuckyBoxVO> getLuckyBox = luckyBoxService.getLuckyBox(eventNo);
//		update를 동시에 하려고 했으나 변경함. 따라서 주석으로 남김.
//		if( getLuckyBox.isEmpty() ) {
//			System.out.println("LuckyBox is null");
//			String msg2 = "newLuckyBox";
//			mav.addObject("msg2", msg2);
//		}
		mav.addObject("getEvent", getEvent);
		mav.addObject("getLuckyBox", getLuckyBox);
		
		LuckyBoxVO luckyBoxVO = new LuckyBoxVO();
		luckyBoxVO.setEventNo(eventNo);
		mav.addObject("luckyBoxVO", luckyBoxVO);
		
		EventVO eventVO = new EventVO();
		mav.addObject("eventVO", eventVO);
		
		return mav;
	}
	
	// User Page
	@RequestMapping("/eventTemp")
	public ModelAndView eventTemporary(HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView("event/temporaryEventMain");
		
		return mav;
	}
	
	
	// User Page
	@RequestMapping("/event")
	public ModelAndView event(HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView("event/eventListUser");
		
		List<EventVO> userEventList = eventService.userEventList();
		
		mav.addObject("userEventList", userEventList);
		
		return mav;
	}
	
	@GetMapping("/event/{eventNo}")
	public ModelAndView goDetailEvent(@PathVariable("eventNo") int eventNo, HttpSession session) {
		ModelAndView mav = new ModelAndView("event/eventDetail");

		EventVO getEvent = eventService.getEvent(eventNo);
		List<LuckyBoxVO> getLuckyBox = luckyBoxService.getLuckyBox(eventNo);
		if( getLuckyBox.isEmpty() ) {
			String msg = "すみません。このイベントはまだ準備中です。";
			mav.addObject("msg", msg);
		}
		mav.addObject("getEvent", getEvent);
		mav.addObject("getLuckyBox", getLuckyBox);

		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/random/{eventNo}")
	public String randomGoods(@PathVariable("eventNo") int eventNo, HttpSession session) {

		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
		// 주 거래계좌 (메인계좌) 선택하는 기능이 없으므로 제일 처음에 만든 계좌를 선택한다.
		List<DepositAccountVO> now = depositAccountService.selectDepositAccountById(id);
		String toAccountNum;
		if( now.isEmpty() ) {
			toAccountNum = null;
		}else {
			toAccountNum = now.get(0).getAccountNumber();
		}
		System.out.println("AccountNumber is : " + toAccountNum);
		if( toAccountNum == null ) {
			// 계좌생성부터 해주세요!
			String msg = "<script>alert('本銀行の口座を生成してから使用可能な機能です。\n口座生成ページに移ります。');" +
					 "location.href='/spring-mvc/product'"+ "</script>";
			return msg;
		}
		String eventTitle = eventService.getEvent(eventNo).getEventTitle();
		
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
		
		// 당첨된 경품명 불러오기
		LuckyBoxVO lucky = new LuckyBoxVO();
		lucky.setEventNo(eventNo);
		lucky.setGoodsKey(theKey);
		String name = luckyBoxService.getGoods(lucky);
		
		// 경품 추첨 내역 DB에 insert 하기
		EventUserVO receipt = new EventUserVO();
		receipt.setEventNo(eventNo);
		receipt.setId(id);
		receipt.setLuckyBoxKey(theKey);
		if(!name.contains("￥")) {
			receipt.setReceiptStatus("2");
		}
		eventUserService.insertLuckyUser(receipt);
		
		
		// 당첨된 경품명 불러와서(위에서) alert하기
		String msg;
		if(name.contains("￥")) {
			msg = "<script>alert('" + name + "を引きました。おめでとうございます！');" +
					 "location.href='/spring-mvc/event/" + eventNo + "'" + "</script>";
			// 실제 user 계좌에 admin 계좌로부터 출금
			// admin, user 계좌의 내역에 남기기
			
			TransferVO transferVO = new TransferVO();
			transferVO.setAccountNumber("0005-031-00011"); // admin accountNumber : must be change (local admin)
			transferVO.setToAmount(Integer.parseInt(name.replace("￥", "")));
			transferVO.setToType("2");
			transferVO.setToAccountNumber(toAccountNum); // login accountNumber
			transferVO.setMyName(eventTitle + "景品");
			transferVO.setToName(id);
			System.out.println(transferVO.toString());
			transferService.transfer(transferVO);
		}else {
			msg = "<script>alert('" + name + "を引きました。おめでとうございます！\n個人情報確認ページに移ります。');" +
					 "location.href='/spring-mvc/event/user'" + "</script>";
		}
		return msg;
	}
	
}
