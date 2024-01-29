package com.example.proj.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.example.proj.service.scheduleService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@SessionAttributes("user")
public class ScheduleController {

	@Autowired
	scheduleService service;

	@ModelAttribute("user")
	public MemDto getDto() {
		return new MemDto();
	}

	@GetMapping("/ptschform")
	public String ptschform(Model model) {
		model.addAttribute("tlist",service.tid());
		return "pt_schedule/pt_schedule";
	}

	@GetMapping("/schcal")
		public String calendar(@RequestParam("id") String id, @RequestParam("selectedDate")List<Date> selectedDate
			,Model m	) {
		
		service.insert(id, selectedDate);
		
		m.addAttribute("selectedDate", selectedDate);
		
			return "pt_schedule/pt_scheduleresult";

		}
	
}
