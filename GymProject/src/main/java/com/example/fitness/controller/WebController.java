package com.example.fitness.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.fitness.dao.IDao;
import com.example.fitness.dto.reservationDto;

@Controller
public class WebController {


	@RequestMapping(value = "/")
	public String home() {

		return "index";

	}

	@RequestMapping(value = "/main")
	public String main() {

		return "main";
	}

	@RequestMapping(value = "/index")
	public String index() {

		return "index";
	}

	@RequestMapping(value = "/java")
	public String java() {

		return "java";
	}

	@RequestMapping(value = "/calendar")
	public String calendar() {

		return "calendar";
	}

	@RequestMapping(value = "/doReservation", method = RequestMethod.POST)
	public String reservation(@RequestParam String name, @RequestParam Integer rguest, @RequestParam String room_name,
			@RequestParam String startRdate, @RequestParam String endRdate,
			@RequestParam(required = false) String special) {
		LocalDate startDate = LocalDate.parse(startRdate);
		LocalDate endDate = LocalDate.parse(endRdate);
		String bbq_yn = "N";
		String campfire_yn = "N";
		if (special.equals("bbq")) {
			bbq_yn = "Y";
		} else if (special.equals("campfire")) {
			campfire_yn = "Y";
		}

		IDao dao = getMapper(IDao.class);
		dao.reservationInputDao(name, startDate, endDate, rguest, bbq_yn, campfire_yn);

		return "redirect:/calendar";
	}

	private IDao getMapper(Class<IDao> class1) {
		// TODO Auto-generated method stub
		return null;
	}

	@RequestMapping(value = "/css")
	public String css() {

		return "css";
	}

	@RequestMapping(value = "/oracle")
	public String oracle() {

		return "oracle";
	}


	@RequestMapping(value = "/register_ok")
	public String register_ok() {

		return "register_ok";
	}

	@RequestMapping(value = "/location")
	public String location() {

		return "location";
	}

	
	@RequestMapping(value = "/reservationList")
	public String reservationList(Model model, @RequestParam String year, @RequestParam String month,
			@RequestParam String date) {
		int intMonth = Integer.valueOf(month) + 1;

		String strMonth = String.valueOf(intMonth);

		if (month.length() <= 1) {
			month = "0" + strMonth;
		}

		if (date.length() <= 1) {
			date = "0" + date;
		}

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("date", date);

		return "reservationList";
	}

}
