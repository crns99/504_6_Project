package com.example.fitness.controller;

import java.util.Calendar;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.fitness.dto.DateData;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class Cal {
	//selectedDate=2024%2F1%2F22&time=17%3A00
	@GetMapping("/cal")
	public String calendar(Model model, @RequestParam("selectedDate") String selectedDate, @RequestParam("time")String time) {
		
		System.out.println("selectedDate"+selectedDate);
		System.out.println("time"+time);
		
		return "pt_reserve/ot_reserve";
}
	
}