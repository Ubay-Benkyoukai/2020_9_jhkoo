package kr.ac.kopo.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;

@Service
public class BoardServiceimpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;	//서비스가 DAO 호출함
	
	
	@Override
	public List<BoardVO> selectAllBoard() {
		
		List<BoardVO> boardList = boardDAO.selectAll(); //boardDAO.selectAll(start,  end);
		
		return boardList;
	}
	// 게시물 총 갯수(추가코드)
//	@Override
//	public int count(){
//	 return boardDAO.count();
//	 
//	}
//	
//	// 게시물 목록 + 페이징(추가코드)
//	@Override
//	public List<BoardVO> listPage(PagingVO vo) {
//		return boardDAO.listPage(vo);
//	}

	@Override
	public BoardVO selectBoardByNo(int no) {
		BoardVO board = boardDAO.selectByNo(no);
		return board;
	}


	@Override
	public void insertBoard(BoardVO board) {
		boardDAO.insert(board);
		
	}
	

	
	//게시글 수정
	@Override
	public void updateBoard(BoardVO board) {
		boardDAO.update(board);
		
	}
	
	//게시글 삭제
	@Override
	public void deleteBoard(int no) {
		 boardDAO.delete(no);
		
	}
	
	
	
	
}
