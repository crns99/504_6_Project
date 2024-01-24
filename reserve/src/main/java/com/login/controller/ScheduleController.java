package com.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ScheduleController {

	   @RequestMapping("/gxsch")
	    public String gxsch(HttpServletRequest request, Model model) {
	        // select 박스에서 선택한 값을 가져온다.
	        String month = request.getParameter("month");
	        model.addAttribute("month", month);

	        return "gx_schedule/gx_schedule";
	    }
}
