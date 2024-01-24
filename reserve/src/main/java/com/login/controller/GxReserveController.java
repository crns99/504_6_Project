
package com.login.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.login.dto.MemDto;
import com.login.service.GxReserveService;
import com.login.service.PtReserveService;

@Controller
@SessionAttributes("user")
public class GxReserveController {

//	@ModelAttribute("user")
//	public MemDto getDto() {
//		return new MemDto();
//	}
//
//	@GetMapping("/gxcalform")
//	public String gxcalform() {
//		return "gx_reserve/gx_reserve";
//
//	}
//
//	@Autowired
//	GxReserveService service;
//
//	@GetMapping("/gxcal")
//	public String calendar(Model model, @RequestParam("gxselectedDate") Date selectedDate,
//			@RequestParam("time") String time, @ModelAttribute("user") MemDto dto) {
//	}

}