package com.example.proj.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.proj.dao.scheduleDao;

@Service
public class scheduleService {
	@Autowired
	private scheduleDao dao;

	public List<Map<String, String>> tid() {
		return dao.tid();
	}

	public void insert(String trainerID, List<Date> selectedDate) {
		for (Date rest_date : selectedDate) {

			dao.addschedule(trainerID, rest_date);
		}
	}

}