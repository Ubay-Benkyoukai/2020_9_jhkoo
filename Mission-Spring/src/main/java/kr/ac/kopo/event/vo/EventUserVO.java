package kr.ac.kopo.event.vo;

public class EventUserVO {

	private int no;
	private int eventNo;
	private String id;
	private int luckyBoxKey;
	private String receiveStatus;
	private String receiveDate;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLuckyBoxKey() {
		return luckyBoxKey;
	}
	public void setLuckyBoxKey(int luckyBoxKey) {
		this.luckyBoxKey = luckyBoxKey;
	}
	public String getReceiptStatus() {
		return receiveStatus;
	}
	public void setReceiptStatus(String receiptStatus) {
		this.receiveStatus = receiptStatus;
	}
	public String getReceiptDate() {
		return receiveDate;
	}
	public void setReceiptDate(String receiptDate) {
		this.receiveDate = receiptDate;
	}
	@Override
	public String toString() {
		return "EventUserVO [no=" + no + ", eventNo=" + eventNo + ", id=" + id + ", luckyBoxKey=" + luckyBoxKey
				+ ", receiveStatus=" + receiveStatus + ", receiveDate=" + receiveDate + "]";
	}
	
	
}
