package com.example.proj.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.proj.dao.IDao;
import com.example.proj.dto.OtReserveDto;


@Service
public class OtReserveService {
	
	@Autowired
	private IDao dao;


	public String tid (String memberID){
	 return dao.tid(memberID);
	}
//	int otReservation(@Param("tid") String tID,@Param("ptdate") LocalDate ptdate, @Param("pttime") String pttime)
    public int otReservation(String tID, Date selectedDate , String pttime) {
        return dao.otReservation(tID, selectedDate, pttime);
    }
	
	
	public int insert(String memberID, String trainerID, Date ptdate, String pttime) {
		return dao.addotReservation( memberID,trainerID, ptdate, pttime);
	}
	


	
}
