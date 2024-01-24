package com.login.controller;

import java.sql.Time;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.login.dto.MemDto;
import com.login.service.OtReserveService;

@Controller
@SessionAttributes("user")
public class Cal {
	// selectedDate=2024%2F1%2F22&time=17%3A00

	@ModelAttribute("user")
	public MemDto getDto() {
		return new MemDto();
	}

	// ot 예약
	@GetMapping("/calform")
	public String calform() {
		return "pt_reserve/ot_reserve";
	}


//	1. 세션에서 로그인 한 사람 아이디
//	2. 트레이너 아이디
//	3. 트아이디 / 날짜 / 시간 count
//	4 0 > insert
//	5. view msg

	@Autowired
	OtReserveService service;

	@GetMapping("/cal")
	public String calendar(Model model, @RequestParam("selectedDate")Date selectedDate,
			@RequestParam("time") String time, @ModelAttribute("user") MemDto dto) {

		String tid = service.tid(dto.getId());// ot예약 트레이너 아이디 받아오기

		int otReservation = service.otReservation(tid, selectedDate, time);

		if(otReservation == 0 ) {
			//insert
			int result = service.insert(dto.getId(), tid, selectedDate, time);
			model.addAttribute("msg", "예약완료");
		} else {
				 model.addAttribute("msg", "예약실패");
			    }
		return "pt_reserve/ot_result";
	}
}