package kr.ac.kopo.event.dao;

import java.util.List;

import kr.ac.kopo.event.vo.LuckyBoxVO;

public interface LuckyBoxDAO {

	// insert
	public void insertLuckyBox(LuckyBoxVO luckyBoxVO);
	// 해당 이벤트의 상품 내용 불러오기
	public List<LuckyBoxVO> getLuckyBox(int eventNo);
	// select max number of goodsKey
	public int getMaxGoodsKey(int eventNo);
	// 경품으로 당첨된 경품의 개수 amount 수정하기
	public void updateluckyBox(LuckyBoxVO luckyBoxVO);
}
