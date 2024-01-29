package com.example.proj.dao;

//BuyInfoMapper.java
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.example.proj.dto.BuyinfoDto;
@Mapper
public interface BuyInfoMapper {
 List<String> getNonEmptyLockerNumbers();

Map<String, Object> getIDate(String lockernumber);
List<BuyinfoDto> getBuyInfoByMemberId(String memberId);
}
