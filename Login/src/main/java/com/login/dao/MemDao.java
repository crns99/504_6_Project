package com.login.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.login.dto.MemDto;

@Mapper
public interface MemDao {

	String idCheck(String userid);
	int insertMem(MemDto dto);
	MemDto login(MemDto dto);
	int updateMem(MemDto dto);
	int deleteMem(String id);
	@Select("select id,name, address from meminfo")
	List<MemDto> memsInfo();
	
	String findId(MemDto dto);
   
	String findPw(MemDto dto);
}
