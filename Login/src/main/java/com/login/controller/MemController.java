package com.login.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.login.dto.MemDto;
import com.login.service.MemService;

@Controller
@SessionAttributes("user")
public class MemController {
	@Autowired
	MemService service;
	
	@ModelAttribute("user")
	public MemDto getDto() {
		return new MemDto();
	}
	 
	@GetMapping("/insert")
	public String selectedType() {
		return "mem/sign_up";
	}
	
	@GetMapping("/find_idpw")
	public String findidpw() {
		return "mem/find_idpw";
	}
	
	@PostMapping("/findid")
	@ResponseBody public String findId(MemDto dto) { 
		return service.findId(dto); 
	}
		  
	@PostMapping("/findpw")
	@ResponseBody public String findPw(MemDto dto) { 
		return service.findPw(dto); 
	}
	
	@GetMapping("/member_sign")
	public String member_sign(@RequestParam("type")String type, Model m ) {
		m.addAttribute("type", type); 
		return "mem/member_sign";
	}
	
	
	@GetMapping("/pt_sign") 
	public String pt_sign(@RequestParam("type")String type, Model m ) { 
		m.addAttribute("type", type); 
		return "mem/pt_sign"; 
	}
	 
    
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(String id) {
		String checkid = service.idCheck(id);
		return checkid;//text
	}
	
	@PostMapping("/insertTrainer") 
	public String insertTrainer(MemDto dto){
		service.insertTrainer(dto); 
		return "redirect:login"; 
	}
	
	@PostMapping("/insert")
	public String insert(MemDto dto) {
		service.insert(dto);
		return "redirect:login";
	}
	
	@GetMapping("/login")
	public String login() {
		return "mem/login";
	}
	@PostMapping("/login")
	public String login(@ModelAttribute("command") @Validated MemDto dto, BindingResult error, Model m) {

		if(error.hasErrors()) {
			return "mem/login";
		}
		MemDto resultDto = service.login(dto);
		if(resultDto == null) {
			error.reject("nocode", "로그인 실패: 아이디나 비밀번호가 틀림");	
			return "mem/login";
		}else {//로그인 성공
			m.addAttribute("user", resultDto);
		}
		return "redirect:/main";
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	@GetMapping("/fix_info")
	public String fix_info() {
		return "mem/fix_info";
	}
	
	@PutMapping("/fix_info")
	public String fix_info(@ModelAttribute("user") MemDto dto) {
		service.fix_info(dto);
		return "redirect:/main";
	}
	
	@RequestMapping("/main")
	public String main(@ModelAttribute("user") MemDto dto) {
		if(dto.getId() != null) {
			return "mem/main";
		}else {
			return "mem/login";
		}
	}
}
