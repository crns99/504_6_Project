package com.example.proj.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface scheduleDao {
	
	@Select("select id , name from trainerinfo")
	List<Map<String,String>> tid();
	
	@Insert("insert into trainer_schedule(trainerID, rest_date) "
			+ "VALUES(#{trainerID}, #{rest_date})")
	int addschedule(@Param("trainerID") String trainerID, @Param("rest_date") Date rest_date);
	
	

}
