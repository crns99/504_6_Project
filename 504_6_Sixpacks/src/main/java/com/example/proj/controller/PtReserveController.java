package com.example.proj.controller;

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

import com.example.proj.dto.MemDto;
import com.example.proj.service.OtReserveService;
import com.example.proj.service.PtReserveService;

@Controller
@SessionAttributes("user")
public class PtReserveController {

	@Autowired
	PtReserveService service;
	
	@ModelAttribute("user")
	public MemDto getDto() {
		return new MemDto();
	}

	// pt예약
	@GetMapping("/ptcalform")
	public String ptcalform() {
		return "pt_reserve/pt_reserve";
	}

	@GetMapping("/ptcal")
	public String calendar(Model model, @RequestParam("selectedDate") Date selectedDate,
			@RequestParam("time") String time, @ModelAttribute("user") MemDto dto) {

		int result2 = service.checkptReservation(dto.getId(), selectedDate);//
		if (result2 > 0) {
			String tid = service.tid(dto.getId());// ot예약 트레이너 아이디 받아오기
			
			int rest = service.checkRestday(tid, selectedDate);
			
			int ptReservation = service.ptReservation(tid, selectedDate, time);

			if (ptReservation == 0 && rest == 0) {
				// insert
				int result = service.insert(dto.getId(), tid, selectedDate, time);
				model.addAttribute("msg", "예약이 완료되었습니다.");

				// update
				service.updatePTcount(dto.getId());

				model.addAttribute("date", selectedDate);
				model.addAttribute("time", time);

			} else {
				 
				if(rest != 0) {
					model.addAttribute("msg","트레이너가 휴가인 날짜입니다.");
				}else {
					model.addAttribute("msg", "이미 예약된 시간입니다. 다시 선택하세요");
				}
			}
		}else {
			return "redirect:/buy_membership";
		}
		return "pt_reserve/pt_result";

	}
}