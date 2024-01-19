package com.login.service;

import java.util.List;


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
	public int insertMem(MemDto dto) {
		return dao.insertMem(dto);
	}
	public MemDto login(MemDto dto) {
		return dao.login(dto);
	}
	public int updateMem(MemDto dto) {
		return dao.updateMem(dto);
	}
	public int deleteMem(String formpw, MemDto dto ) {
		String pw = dto.getPassword();
		if(pw.equals(formpw)) {
			return dao.deleteMem(dto.getId());
		}else {
			return 0;
		}
	}
	
	public String findId(MemDto dto) { 
		return dao.findId(dto); 
	}
	  
	public String findPw(MemDto dto) { 
		return dao.findPw(dto); 
	}
	 
}





