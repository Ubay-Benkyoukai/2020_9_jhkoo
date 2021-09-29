package kr.ac.kopo.expenses.service;

import java.util.List;

import kr.ac.kopo.expenses.vo.ExpensesVO;

public interface ExpensesService {
	
	void insertExpensesDetail(ExpensesVO expensesVO);
	
	List<ExpensesVO> selectAllExpenses();

}
