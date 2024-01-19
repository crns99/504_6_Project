package com.example.fitness.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.fitness.dto.reservationDto;


@Mapper
public interface IDao {	
	
	//calendar_reservation_table
	@Select("select trainerID from purchase where memberID = #{id}")
	String tid(String memberid);

	@Select("select count(*) from ot_reservation where trainerID=#{tid} AND ptdate=#{ptdate} AND pttime=#{pttime}")
	int otReservation(@Param("tid") String tID,@Param("ptdate") Date ptdate, @Param("pttime") String pttime);
	
	@Insert("insert into ot_reservation memberID, trainerID, pt_date, pt_time) "
			+ "VALUES (#{memberID}, #{trainerID}, #{ptdate}, #{pttime});")
	int addotReservation(String memberID, String trainerID, Date ptdate, String pttime);
	
}
