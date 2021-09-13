package kr.ac.kopo.mydeposit.vo;

public class MyDepositVO {

	private String accountNumber;
	private int balance;
	private String content;
	private int depositMoney;
	private String accountPassword;
	
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getDepositMoney() {
		return depositMoney;
	}
	public void setDepositMoney(int depositMoney) {
		this.depositMoney = depositMoney;
	}
	public String getAccountPassword() {
		return accountPassword;
	}
	public void setAccountPassword(String accountPassword) {
		this.accountPassword = accountPassword;
	}
	
	@Override
	public String toString() {
		return "MyDepositVO [accountNumber=" + accountNumber + ", balance=" + balance + ", content=" + content
				+ ", depositMoney=" + depositMoney + ", accountPassword=" + accountPassword + "]";
	}

	
	
	
}

