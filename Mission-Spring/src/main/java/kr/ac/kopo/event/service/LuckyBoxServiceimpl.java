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

	@Override
	public void insertLuckyBox(LuckyBoxVO luckyBoxVO) {

		List<LuckyBoxVO> boxList = luckyBoxVO.getBoxList();
		
		for(int i=0; i < boxList.size(); i++) {
			luckyBoxDAO.insertLuckyBox(boxList.get(i));
		}

	}
	
	@Override
	public List<LuckyBoxVO> getLuckyBox(int eventNo) {
		return luckyBoxDAO.getLuckyBox(eventNo);
	}
	
	
	@Override
	public int getMaxGoodsKey(int eventNo) {
		return luckyBoxDAO.getMaxGoodsKey(eventNo);
	}
	
	// 해당 이벤트의 상품 내용 중, 경품으로 당첨된 상품 내용 불러오기
	@Override
	public void updateluckyBox(LuckyBoxVO luckyBoxVO) {
		luckyBoxDAO.updateluckyBox(luckyBoxVO);
	}
	
}
