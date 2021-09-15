package kr.ac.kopo.event.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.event.dao.LuckyBoxDAO;
import kr.ac.kopo.event.vo.LuckyBoxVO;

@Service
public class LuckyBoxServiceimpl implements LuckyBoxService {

	@Autowired
	private LuckyBoxDAO luckyBoxDAO;
	
	@Override
	public void insertLuckyBox(LuckyBoxVO luckyBoxVO) {
		luckyBoxDAO.insertLuckyBox(luckyBoxVO);
	}
}
