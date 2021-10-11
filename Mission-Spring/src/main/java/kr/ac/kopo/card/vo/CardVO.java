package kr.ac.kopo.card.vo;

public class CardVO {

	private String cardNumber;
	private String accountNumber;
	private String id;
	private int balance;
	private String cardPassword;
	private int point;
	private String bankCardKey;
	
	
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
		return "cardVO [cardNumber=" + cardNumber + ", accountNumber=" + accountNumber + ", id=" + id + ", balance="
				+ balance + ", cardPassword=" + cardPassword + ", point=" + point + ", bankCardKey=" + bankCardKey
				+ "]";
	}
	
	
	
}
