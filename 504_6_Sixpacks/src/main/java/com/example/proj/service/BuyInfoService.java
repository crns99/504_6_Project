package com.example.proj.service;

//BuyInfoService.java
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.proj.dao.BuyInfoMapper;
import com.example.proj.dto.BuyinfoDto;

import java.util.List;
import java.util.Map;

@Service
public class BuyInfoService {

 private final BuyInfoMapper buyInfoMapper;

 @Autowired
 public BuyInfoService(BuyInfoMapper buyInfoMapper) {
     this.buyInfoMapper = buyInfoMapper;
 }

 public List<String> getNonEmptyLockerNumbers() {
     return buyInfoMapper.getNonEmptyLockerNumbers();
 }
 public Map<String, Object> getIDate(String lockernumber) {
     return buyInfoMapper.getIDate(lockernumber);
 }

}
