package kr.ac.kopo.eda.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.account.dao.DepositAccountDAO;
import kr.ac.kopo.account.vo.DepositDetailVO;
import kr.ac.kopo.eda.dao.EdaDAO;
import kr.ac.kopo.eda.vo.EdaVO;
import kr.ac.kopo.eda.vo.EmailVO;

@Service
public class EdaServiceimpl implements EdaService {

	@Autowired
	private EdaDAO edaDAO;
	@Autowired
	private DepositAccountDAO depositAccountDAO;
	
	
	
	@Override
	public List<EdaVO> amountByType(String id) {
		/**
		 *  이번 달 카테고리별 지출 퍼센트
		 *  1. 아이디로 메인 계좌번호 가져오기
		 *  2. 가져온 계좌번호로 카테고리별 지출액 list 담기
		 *  3. 총 합 구하기
		 */
		// 1. 아이디로 메인 계좌번호 가져오기
		String accountNumber = depositAccountDAO.getMainAccountNumber(id);
		
		// 2. 가져온 계좌번호로 카테고리별 지출액 list 담기
		List<EdaVO> amountByType = edaDAO.amountByType(accountNumber);
		
		// 3. 이번 달 지출 총합 VO에 담기
		int totalThisMonth = 0;
		for(EdaVO edaVO:amountByType) {
			totalThisMonth += edaVO.getTotalAmountByType();
		}
		for(EdaVO edaVO:amountByType) {
			edaVO.setTotalThisMonth(totalThisMonth);
		}
		
		return amountByType;
	}

	
	
	@Override
	public List<DepositDetailVO> detailListByCotegory(DepositDetailVO depositDetailVO) {
		List<DepositDetailVO> detailListByCotegory = edaDAO.detailListByCotegory(depositDetailVO);
		return detailListByCotegory;
	}



	@Override
	public List<DepositDetailVO> detailListByCotegory2(DepositDetailVO depositDetailVO) {
		List<DepositDetailVO> detailListByCotegory2 = edaDAO.detailListByCotegory2(depositDetailVO);
		return detailListByCotegory2;
	}



	@Override
	public String biggestCategory(String accountNumber) {
		List<DepositDetailVO> categorySumList = edaDAO.categorySumList(accountNumber);
		String biggestCategory = categorySumList.get(0).getLogTypeKey();
		return biggestCategory;
	}



	@Override
	public void addMailService(EmailVO emailVO) {
		edaDAO.addMailService(emailVO);
	}



	@Override
	public void deleteMailService(String id) {
		edaDAO.deleteMailService(id);
	}



	@Override
	public List<EmailVO> getMailList() {
		List<EmailVO> emailList = edaDAO.getMailList();
		return emailList;
	}



	@Override
	public int mailServiceBool(String id) {
		int bool = edaDAO.mailServiceBool(id);
		return bool;
	}

	


	
}
