package com.example.proj.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface IDao {	
	
	//calendar_reservation_table - 날짜값 처리
	@Select("select trainerID from buyinfo where memberID = #{id}")
	String tid(String memberID);
	
	// ot예약
	@Select("select count(*) from ot_reserve where trainerID=#{tid} AND PTdate=#{ptdate} AND PTtime=#{pttime}")
	int otReservation(@Param("tid") String tID,@Param("ptdate") Date ptdate, @Param("pttime") String pttime);
	
	@Insert("insert into ot_reserve (memberID, trainerID, PTdate, PTtime) "
			+ "VALUES (#{memberID}, #{trainerID}, #{ptdate}, #{pttime})")
	int addotReservation(@Param("memberID")String memberID, @Param("trainerID")String trainerID, @Param("ptdate")Date ptdate, @Param("pttime") String pttime);
	
	

	//pt 예약
	@Select("select count(*) from pt_reserve where trainerID=#{tid} AND PTdate=#{ptdate} AND PTtime=#{pttime}")
	int ptReservation(@Param("tid") String tID,@Param("ptdate") Date ptdate, @Param("pttime") String pttime);
	
	@Insert("insert into pt_reserve (memberID, trainerID, PTdate, PTtime) "
			+ "VALUES (#{memberID}, #{trainerID}, #{ptdate}, #{pttime})")
	int addptReservation(@Param("memberID")String memberID, @Param("trainerID")String trainerID, @Param("ptdate")Date ptdate, @Param("pttime") String pttime);
	
	@Update("update buyinfo set PTcount =PTcount - 1 WHERE memberID =#{id}")
	int updatePTcount(String memberID);
	
	// pt 예약 - 해당날자에 구매권있는지 체크하는 용도
	@Select("select count(*) from buyinfo where startdate <= #{selectedDate} and enddate >= #{selectedDate} and PTcount > 0 and memberID = #{id}")
	int checkptReservation(@Param("id")String memberID, @Param("selectedDate") Date selectedDate);
	
	//트레이너 id
	@Select("select count(*) from trainer_schedule where rest_date = DATE_FORMAT(#{selectedDate}, '%Y-%m-%d 00:00:00') and trainerID = #{tid}")
	int checkRestday(@Param("tid") String tID, @Param("selectedDate") Date selectedDate);
	
	
//	// gx예약
//	@Insert("insert into gx_reserve (memberID, GXclassID, GXclass_name, classdate)"
//			+ "	values(#{memberID}, #{GXclassID}, #{GXclass_name}, #{classdate})")
//	int inserttime(@Param("memberID") String memberID, @Param("GXclassID") int GXclassID, @Param("GXclass_name") String GXclass_name, @Param("classdate") Date classdate);
//	
//	@Update("update buyinfo set GXcount = GXcount - 1 memberID =#{id}")
//	void updategxcnt(GxReserveDto gxcntdto);
	
	
	
	

}
