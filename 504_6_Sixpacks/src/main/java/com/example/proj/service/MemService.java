package com.example.proj.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.proj.dao.MemDao;
import com.example.proj.dto.MemDto;
import com.example.proj.dto.BuyinfoDto;


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
	
	public int deleteMem(String formpw, MemDto dto ) {
		String pw = dto.getPassword();
		if(pw.equals(formpw)) {
			return dao.deleteMem(dto.getId());
		}else {
			return 0;
		}
	}
	
	public List<MemDto> getAll() {
		return dao.selectAll();
	}

	public void copyByIdToMemInfo(String id) {
		dao.insertByIdToMemInfo(id);
	}

	public MemDto getTrainerInfoById(String id) {
		return dao.getTrainerInfoById(id);
	}

	public void deleteTrainerInfoById(String id) {
		dao.deleteTrainerInfoById(id);
	}

	public List<MemDto> selectAllByMemberID(String id) {
		return dao.selectAllByMemberID(id);
	}

}
