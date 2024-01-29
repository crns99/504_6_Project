package com.example.proj.dao;

//PurchaseMapper.java

//PurchaseMapper.java

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;

@Mapper
public interface PurchaseMapper {

 @Insert("INSERT INTO buyinfo (memberID, startdate, enddate, GXtype, lockernumber, uniform, PTcount, paymentStatus) " +
         "VALUES (#{userId}, #{startDate}, #{endDate}, #{GXtype}, #{lockernumber}, #{uniform}, #{PTcount}, 'y')")
 void insertPurchase(
		 @Param("userId") String userId,
		 @Param("startDate") LocalDate startDate,
		 @Param("endDate") LocalDate endDate,
         @Param("GXtype") String GXtype,
         @Param("lockernumber") String lockernumber,
         @Param("uniform") String uniform,
         @Param("PTcount") int PTcount);
}

