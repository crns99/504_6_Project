package com.example.fitness.controller;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.fitness.dao.IDao;
import com.example.fitness.dto.DateData;
import com.example.fitness.dto.reservationDto;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CalendarController {

	@Autowired
	IDao dao;

	@GetMapping("calendar")
	public String calendar(Model model, HttpServletRequest request, DateData dateData) {

		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		// 검색 날짜
		if (dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH)),
					String.valueOf(cal.get(Calendar.DATE)), null);
		}
		// 검색 날짜 end

		Map<String, Integer> today_info = dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<>();


		for (int i = 1; i < today_info.get("start"); i++) {
			calendarData = new DateData(null, null, null, null);
			dateList.add(calendarData);
		}

		// 날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if (i == today_info.get("today")) {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "today");
			} else {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		// 달력 빈곳 빈 데이터로 삽입
		int index = 7 - dateList.size() % 7;

		if (dateList.size() % 7 != 0) {

			for (int i = 0; i < index; i++) {
				calendarData = new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}

		ArrayList<reservationDto> reservations = dao.reservationDao();
		int addDate = 0;
		String flag = "stop";

		LocalDate now = LocalDate.now();

		String dateStr = "";
		String monthStr = "0";
		String dateStr2 = "0";
		for (DateData d : dateList) {
			if (d.getYear().equals("")) {
				continue;
				
			}

			monthStr = String.valueOf(Integer.valueOf(d.getMonth()) + 1);
			if (d.getMonth().length() == 1) {
				monthStr = "0" + String.valueOf(Integer.valueOf(d.getMonth()) + 1);
			}
			dateStr2 = d.getDate();
			if (d.getDate().length() == 1) {
				dateStr2 = "0" + d.getDate();
			}

			dateStr = d.getYear() + "-" + monthStr + "-" + dateStr2;

			LocalDate eachDate = LocalDate.parse(dateStr);

			if (now.isEqual(eachDate) || eachDate.isAfter(now)) {

				flag = "run";
			}

	
			for (reservationDto r : reservations) {
				String year = String.valueOf(r.getStartRdate().getYear());
				String month = String.valueOf(r.getStartRdate().getMonth().getValue() - 1);
				String date = String.valueOf(r.getStartRdate().getDayOfMonth() + addDate);

				if (flag.equals("run") && d.getYear().equals(year) && d.getMonth().equals(month)
						&& d.getDate().equals(date)) {
					// 날짜간격 period
					Period period = Period.between(r.getStartRdate(), r.getEndRdate());
					int dates = period.getDays();

					if (addDate == dates) {
						addDate = 0;
					}
					addDate++;
				}
			}

		}

		// 배열에 담음
		model.addAttribute("dateList", dateList); // 날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		System.out.println(dateList);
		return "calendar";
	}
}
