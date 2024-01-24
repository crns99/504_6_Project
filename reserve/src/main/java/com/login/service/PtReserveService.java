package com.login.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.login.dao.IDao;

@Service
public class PtReserveService {

	@Autowired
	private IDao dao;

	public String tid(String memberID) {
		return dao.tid(memberID);
	}

//		int otReservation(@Param("tid") String tID,@Param("ptdate") LocalDate ptdate, @Param("pttime") String pttime)
	public int ptReservation(String tID, Date selectedDate, String pttime) {
		return dao.ptReservation(tID, selectedDate, pttime);
	}

	public int insert(String memberID, String trainerID, Date ptdate, String pttime) {
		return dao.addptReservation(memberID, trainerID, ptdate, pttime);

	}
	
	// update
	public int updatePTcount(String memberID) {
		return dao.updatePTcount(memberID);
		
	}
	
	// pt 예약 - 해당날자에 구매권있는지 체크하는 용도
	public int checkptReservation(String memberID, Date selectedDate) {
		return dao.checkptReservation(memberID, selectedDate);
	}
}
