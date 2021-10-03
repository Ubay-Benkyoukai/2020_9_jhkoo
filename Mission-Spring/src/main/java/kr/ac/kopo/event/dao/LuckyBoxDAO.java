package kr.ac.kopo.event.dao;

import java.util.List;

import kr.ac.kopo.event.vo.LuckyBoxVO;

public interface LuckyBoxDAO {

	// insert
	public void insertLuckyBox(LuckyBoxVO luckyBoxVO);
	// 해당 이벤트의 상품 내용 불러오기
	public List<LuckyBoxVO> getLuckyBox(int eventNo);
	// get goodsKey List
	public List<Integer> getGoodsKey(int eventNo);
	// 경품으로 당첨된 경품의 개수 amount 수정하기
	public void updateLuckyBox(LuckyBoxVO luckyBoxVO);
	// 당첨된 경품명 가져오기
	public String getGoods(LuckyBoxVO luckyBoxVO);

}
