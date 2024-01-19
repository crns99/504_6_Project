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
	
	@GetMapping("/joinform")
	public String joinform() {
		return "mem/joinform";
	}
    
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(String id) {
		String checkid = service.idCheck(id);
		return checkid;//text
	}
	
	@PostMapping("/insert")
	public String insert(MemDto dto) {
		service.insertMem(dto);
		return "redirect:loginform";
	}
	
	@GetMapping("/loginform")
	public String loginform() {
		return "mem/loginform";
	}
	@PostMapping("/login")
	public String login(@ModelAttribute("command") @Validated MemDto dto, BindingResult error, Model m) {

		if(error.hasErrors()) {
			return "mem/loginform";
		}
		MemDto resultDto = service.login(dto);
		if(resultDto == null) {
			error.reject("nocode", "로그인 실패: 아이디나 비밀번호가 틀림");	
			return "mem/loginform";
		}else {//로그인 성공
			m.addAttribute("user", resultDto);
		}
		return "redirect:/main";
	 }
	
		
	@PostMapping("/findId")
	@ResponseBody public String findId(@RequestParam String name, @RequestParam	String email) { 
		return service.findId(name, email); 
	}
		  
	@PostMapping("/findPw")
	@ResponseBody public String findPw(@RequestParam String name, @RequestParam String id, @RequestParam String email) { 
		return service.findPw(name, id, email); 
	}
		 
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	@GetMapping("/update")
	public String updateform() {
		return "mem/updateform";
	}
	
	@PutMapping("/update")
	public String update(@ModelAttribute("user") MemDto dto) {
		service.updateMem(dto);
		return "redirect:/main";
	}
	
	@GetMapping("/delete")
	public String deleteform(String result, Model m) {
		m.addAttribute("result",result);
		return "mem/deleteform";
	}
	@DeleteMapping("/delete")
	public String delete(String formpw, @ModelAttribute("user") MemDto dto, SessionStatus status) {
	
		int i = service.deleteMem(formpw, dto);
		if(i == 0) {
			return "redirect:/delete?result=false";
		}else {
			status.setComplete();
			return "redirect:/main";
		}
	}
	@RequestMapping("/main")
	public String main(@ModelAttribute("user") MemDto dto) {
		if(dto.getId() != null) {
			return "mem/main";
		}else {
			return "mem/loginform";
		}
	}
}
