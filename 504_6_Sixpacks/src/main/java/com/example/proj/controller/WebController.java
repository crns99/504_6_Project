
package com.example.proj.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.proj.dao.IDao;


@Controller
public class WebController {

	@RequestMapping(value = "/java")
	public String java() {

		return "java";
	}
	
	@RequestMapping(value = "/test")
	public String test() {

		return "test";
	}

	private IDao getMapper(Class<IDao> class1) {
		// TODO Auto-generated method stub
		return null;
	}

	@RequestMapping(value = "/css")
	public String css() {

		return "css";
	}

	@RequestMapping(value = "/pt_reserve")
	public String pt() {

		return "pt_reserve/pt_reserve";
	}
	
	
	@RequestMapping(value = "/ot_reserve")
	public String ot() {

		return "pt_reserve/ot_reserve";
	}

	@RequestMapping(value = "/gx_reserve")
	public String gx() {

		return "gx_reserve/gx_reserve";
	}
	
	
	@GetMapping("/gxschform")
	public String schform() {
		return "gx_schedule/gx_schedule";
	}
	
	@RequestMapping(value = "/location")
	public String location() {

		return "location";
	}

}
