package kr.ac.kopo.card.vo;

public class CardVO {

	private String cardNumber;
	private String accountNumber;
	private int balance;
	private String cardPassword;
	private String cardLog;
	private int point;
	private String bankCardKey;
	private String id;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getCardPassword() {
		return cardPassword;
	}
	public void setCardPassword(String cardPassword) {
		this.cardPassword = cardPassword;
	}
	public String getCardLog() {
		return cardLog;
	}
	public void setCardLog(String cardLog) {
		this.cardLog = cardLog;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getBankCardKey() {
		return bankCardKey;
	}
	public void setBankCardKey(String bankCardKey) {
		this.bankCardKey = bankCardKey;
	}
	
	
	@Override
	public String toString() {
		return "CardVO [cardNumber=" + cardNumber + ", accountNumber=" + accountNumber + ", balance=" + balance
				+ ", cardPassword=" + cardPassword + ", cardLog=" + cardLog + ", point=" + point + ", bankCardKey="
				+ bankCardKey + ", id=" + id + "]";
	}
	

	
	
	
}