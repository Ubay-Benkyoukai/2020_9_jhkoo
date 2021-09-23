package kr.ac.kopo.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.event.dao.LuckyBoxDAO;
import kr.ac.kopo.event.vo.LuckyBoxVO;

@Service
public class LuckyBoxServiceimpl implements LuckyBoxService {

	@Autowired
	private LuckyBoxDAO luckyBoxDAO;
	
//	@Override
//	public void insertLuckyBox(LuckyBoxVO luckyBoxVO) {
//
//			luckyBoxDAO.insertLuckyBox(luckyBoxVO);
//
//	}
	
//	public void insertLuckyBox(List<LuckyBoxVO> boxList) {
//			
//			for(int i=0; i < boxList.size(); i++) {
//				luckyBoxDAO.insertLuckyBox(boxList.get(i));
//			}
//	
//		}
	
	@Override
	public void insertLuckyBox(LuckyBoxVO luckyBoxVO) {

		List<LuckyBoxVO> boxList = luckyBoxVO.getBoxList();
		
		for(int i=0; i < boxList.size(); i++) {
			luckyBoxDAO.insertLuckyBox(boxList.get(i));
		}

	}
	
	
	
	
	
}
