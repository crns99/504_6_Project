package user.security.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.SessionAttributes;

import user.security.dto.MemDto;
import user.security.config.SecurityUser;
import user.security.domain.Users;
import user.security.service.UserService;

@Controller

public class SecurityController {

	@Autowired
	UserService service;
	
	
	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/member")
	public void forMember() {
		
	}

	@GetMapping("/manager")
	public void forManager() {
		
	}

	@GetMapping("/admin")//세션저장
	public void forAdmin(@AuthenticationPrincipal SecurityUser user) {
		System.out.println(user.getUsers().getId());
		
	}

	@GetMapping("/login")
	public void login() {
	}
	

	@GetMapping("/loginSuccess")
	public void loginSuccess() {
	}

	@GetMapping("/accessDenied")
	public void accessDenied() {
	}

	@GetMapping("/insert")
	public String selectedType() {
		return "sign_up";
	}
	
	@GetMapping("/member_sign")
	public String memberjoinform() {
		return "member_sign";
	}
	
	@GetMapping("/pt_sign")
	public String ptjoinform() {
		return "pt_sign";
	}
	
	@GetMapping("/find_idpw")
	public String findidpw() {
		return "find_idpw";
	}
	
	@PostMapping("/insert")
	public String insert(Users users) {
		service.insertUser(users);
		return "redirect:/login";
	}
	
	@GetMapping("/update")
	public String updateform() {
		return "updateform";
	}
	
	
}
