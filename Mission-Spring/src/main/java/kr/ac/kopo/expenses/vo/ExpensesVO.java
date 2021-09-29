package kr.ac.kopo.expenses.vo;

public class ExpensesVO {
	
	private int no;
	private String id;
	private String expenses_date;
	private String expenses_category_key;
	private String expenses_content;
	private int expenses_price;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getExpenses_date() {
		return expenses_date;
	}
	public void setExpenses_date(String expenses_date) {
		this.expenses_date = expenses_date;
	}
	
	public String getExpenses_category_key() {
		return expenses_category_key;
	}
	public void setExpenses_category_key(String expenses_category_key) {
		this.expenses_category_key = expenses_category_key;
	}
	
	public String getExpenses_content() {
		return expenses_content;
	}
	public void setExpenses_content(String expenses_content) {
		this.expenses_content = expenses_content;
	}
	
	public int getExpenses_price() {
		return expenses_price;
	}
	public void setExpenses_price(int expenses_price) {
		this.expenses_price = expenses_price;
	}
	
	
	@Override
	public String toString() {
		return "ExpensesVO [no=" + no + ", id=" + id + ", expenses_date=" + expenses_date + ", expenses_category_key=" + expenses_category_key
				+ ", expenses_content=" + expenses_content + ", expenses_price=" + expenses_price + "]";
	}

}
