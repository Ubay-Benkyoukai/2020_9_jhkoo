package kr.ac.kopo.event.vo;

public class LuckyBoxVO {

	private String key;
	private int eventNo;
	private String value;
	private int amount;
	
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "LuckyBoxVO [key=" + key + ", eventNo=" + eventNo + ", value=" + value + ", amount=" + amount + "]";
	}
	
	
}
