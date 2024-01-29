package com.example.proj.service;

import java.time.LocalDate;

//PurchaseService.java

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.proj.dao.PurchaseMapper;

@Service
public class PurchaseService {

 @Autowired
 private PurchaseMapper purchaseMapper;

 public void savePurchase(String userId, LocalDate startDate, LocalDate endDate, String GXtype, String lockernumber, String uniform, int PTcount) {
     purchaseMapper.insertPurchase(userId, startDate, endDate, GXtype, lockernumber, uniform, PTcount);
 }
}
