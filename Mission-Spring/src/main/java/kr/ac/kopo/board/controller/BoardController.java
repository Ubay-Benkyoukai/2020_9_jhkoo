package kr.ac.kopo.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.PagingVO;

@Controller
public class BoardController {

		@Autowired	//컨트롤러는 서비스 호출!
		private BoardService boardService;
	
		@RequestMapping("/board")
		public ModelAndView list() {
			List<BoardVO> boardList = boardService.selectAllBoard();
			ModelAndView mav = new ModelAndView("board/list");
			mav.addObject("boardList", boardList);	//공유영역에 올리기
			
			return mav;
		}
		
		
		// http://localhost:9999/Mission-Spring/board/12
		@RequestMapping("/board/{no}")	//받는 파라미터가 가변적일때 {}로 묶기
		public ModelAndView detail(@PathVariable("no") int boardNo) {	//
			
				BoardVO board = boardService.selectBoardByNo(boardNo);
			
				ModelAndView mav = new ModelAndView("board/detail");
				mav.addObject("board", board);
				return mav;
			}
		
		/*
		 //http://localhost:9999/Mission-=Sping/board/detail?no=12
		@RequestMapping("/board/detail")	//물음표 뒤에것들은 매핑할땐 필요x
		public ModelAndView detail(@RequestParam("no") int boardNo) {	//request 파라미터로 보내줄때 이 어노테이션 쓰면됨. 형변환도 되어서 보내줌!
			
		//	int boardNo = Integer.parseInt(request.getParameter("no"));
			System.out.println("boardNo :" + boardNo);
			ModelAndView mav = new ModelAndView("board/detail");
			return mav;
		}
		*/
		
		
		@GetMapping("/board/write")
		public String writeForm(Model model, HttpSession session) {	//model and view 할때 그 model 객체...
			
			//login되어 있을면 그 아이디를 writer로 해주는 작업
			BoardVO board = new BoardVO();
			MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
			
			if (loginVO != null)
		         board.setWriter(loginVO.getId());
			
			model.addAttribute("boardVO", board);	//request공유영역에 새로운 boardVO 객체 올림.
			
			return "board/write";
		}
		
		
		@PostMapping("/board/write")
		public String write(@Valid BoardVO boardVO, BindingResult result) { //@Valid validation체크할 얘. BindingResult는 잘 입력됐는지 알려주는 얘 
			
			//true이면 애러난 것! -> 다시 /입력받는 화면 쪽으로 가야함
			if(result.hasErrors()) {
				System.out.println("오류발생...");
				return "board/write";
			}
			boardService.insertBoard(boardVO); 
			return "redirect:/board";
		}
		

		//게시글 수정페이지로 이동
		@GetMapping("/board/updateform/{no}")
	    public ModelAndView update(@PathVariable ("no")int no, HttpSession session) {
	        ModelAndView mav = new ModelAndView("board/updateform");
	        BoardVO data = boardService.selectBoardByNo(no);
	        System.out.println(data.toString());
	        mav.addObject("data", data);
	        
	        BoardVO boardVO = new BoardVO();
	        mav.addObject("boardVO", boardVO);
	        return mav;
	    }
		
		//게시글 수정
		@PostMapping(value = "/board/updateform/{no}")
			public String update(BoardVO board, BindingResult result, HttpSession session) {
			
			boardService.updateBoard(board);
	
			return "redirect:/board"; //리스트로 리다이렉트
		}
	
		//게시글 삭제
		@RequestMapping(value= "/board/delete/{no}", method = RequestMethod.GET) //RequestMethod.POST post로 데이터를 전송해야 하는가? get으로 전송?
			public String delete (@PathVariable ("no")int no, RedirectAttributes rttr) {
					
			boardService.deleteBoard(no); //글 삭제 서비스 호출
					
				return "redirect:/board"; //삭제완료 후 , 목록으로 이동
				}
		

		
}
