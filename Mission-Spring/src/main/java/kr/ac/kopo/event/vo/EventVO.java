package kr.ac.kopo.event.vo;

public class EventVO {
	
	
	private int eventNo;
	private String eventTitle;
	private String regDate;
	private String endDate;
	private String status;
	
	
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	@Override
	public String toString() {
		return "EventVO [eventNo=" + eventNo + ", eventTitle=" + eventTitle + ", regDate=" + regDate + ", endDate=" + endDate
				+ ", status=" + status + "]";
	}


}