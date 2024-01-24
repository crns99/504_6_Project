package com.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.login.dao.MemDao;
import com.login.dto.MemDto;

@Service
public class MemService {
	@Autowired
	MemDao dao;
	
	public String idCheck(String id) {
		return dao.idCheck(id);
	}
	public int insert(MemDto dto) {
		return dao.insertMem(dto);
	}
	public int insertTrainer(MemDto dto) { 
		return dao.insertTrainer(dto); 
	}
	public MemDto login(MemDto dto) {
		return dao.login(dto);
	}
	public int fix_info(MemDto dto) {
		return dao.fix_info(dto);
	}
	public String findId(MemDto dto) { 
		return dao.findId(dto); 
	}
	public String findPw(MemDto dto) { 
		return dao.findPw(dto); 
	}
	 
}





