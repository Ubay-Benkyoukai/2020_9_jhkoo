package kr.ac.kopo.event.vo;

import java.util.List;

public class LuckyBoxVO {

	private int goodsKey;
	private int eventNo;
	private String goods;
	private int amount;
	
	private List<LuckyBoxVO> boxList;
	
	public List<LuckyBoxVO> getBoxList() {
		return boxList;
	}
	public void setBoxList(List<LuckyBoxVO> boxList) {
		this.boxList = boxList;
	}
	///////////////////////////////////////////////////////
	
	public int getGoodsKey() {
		return goodsKey;
	}
	public void setGoodsKey(int goodsKey) {
		this.goodsKey = goodsKey;
	}
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	public String getGoods() {
		return goods;
	}
	public void setGoods(String goods) {
		this.goods = goods;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "LuckyBoxVO [goodsKey=" + goodsKey + ", eventNo=" + eventNo + ", goods=" + goods + ", amount=" + amount
				+ "]";
	}
	
}
