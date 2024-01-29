package com.example.proj.dao;

import java.util.List;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.annotations.Mapper;
import com.example.proj.dto.MemDto;
import com.example.proj.dto.BuyinfoDto;

@Mapper
public interface MemDao {

	String idCheck(String id);
	int insertMem(MemDto dto);
	int insertTrainer(MemDto dto);
	MemDto login(MemDto dto);
	int fix_info(MemDto dto);
	String findId(MemDto dto);
	String findPw(MemDto dto);
	int deleteMem(String id);
	List<MemDto> selectAll();
	MemDto getTrainerInfoById(String id);
    void deleteTrainerInfoById(String id);
	MemDto copyMember(MemDto dto);
	@Insert("INSERT INTO meminfo (id, name, password, gender, email, address, tel, type, cert) " +
	        "SELECT id, name, password, gender, email, address, tel, type, 'O' FROM trainerinfo WHERE id = #{id}")
	void insertByIdToMemInfo(String id);
	BuyinfoDto getDataByLockernumber(String lockernumber);

    List<BuyinfoDto> getDataListByLockernumbers(List<String> lockernumbers);
   List<MemDto> selectAllByMemberID(String id);
	

}


	