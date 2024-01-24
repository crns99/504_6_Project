package com.login.dao;

import org.apache.ibatis.annotations.Mapper;
import com.login.dto.MemDto;

@Mapper
public interface MemDao {

	String idCheck(String id);
	int insertMem(MemDto dto);
	int insertTrainer(MemDto dto);
	MemDto login(MemDto dto);
	int fix_info(MemDto dto);
	String findId(MemDto dto);
	String findPw(MemDto dto);
}
