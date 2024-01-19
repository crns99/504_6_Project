package com.example.fitness.service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.fitness.dao.IDao;
import com.example.fitness.dto.OtReserveDto;


@Service
public class OtReserveService {
	
	@Autowired
	private IDao dao;


	public String tid (String memberID){
	 return dao.tid(memberID);
	}
//	int otReservation(@Param("tid") String tID,@Param("ptdate") LocalDate ptdate, @Param("pttime") String pttime)
    public int otReservation(String tID, Date ptdate , String pttime) {
        return dao.otReservation(tID, ptdate, pttime);
    }
	
	
	public int insert(String memberID, String trainerID, Date ptdate, String pttime) {
		return dao.addotReservation( memberID,trainerID, ptdate, pttime);
	}


	
}
