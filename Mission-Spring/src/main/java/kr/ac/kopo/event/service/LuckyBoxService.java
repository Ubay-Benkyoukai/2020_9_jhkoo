package kr.ac.kopo.event.service;

import java.util.List;

import kr.ac.kopo.event.vo.LuckyBoxVO;

public interface LuckyBoxService {

	// insert
	public void insertLuckyBox(LuckyBoxVO luckyBoxVO);
	// 해당 이벤트의 상품 내용 불러오기
	public List<LuckyBoxVO> getLuckyBox(int eventNo);
	// select goodsKey
	public List<Integer> getGoodsKey(int eventNo);
	// 해당 이벤트의 상품 내용 중, 경품으로 당첨된 상품 내용 불러오기
	public void updateLuckyBox(LuckyBoxVO luckyBoxVO);
	// 당첨된 경품명 가져오기
	public String getGoods(LuckyBoxVO luckyBoxVO);
}
