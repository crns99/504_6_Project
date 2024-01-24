package com.login.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface GxDao {
	
//	//calendar_reservation_table - 날짜값 처리
//	@Select("select GXclassID from buyinfo where memberID = #{id}")
//	String tid(String memberID);
}