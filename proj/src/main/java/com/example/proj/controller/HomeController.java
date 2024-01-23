package com.example.proj.controller;

import com.example.proj.service.DatabaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
public class HomeController {

    @Autowired
    private DatabaseService databaseService;

    @GetMapping("/charts")
    public String home(Model model) {
        String query = "SELECT * FROM mem_attendance";
        List<Map<String, Object>> result = databaseService.executeQuery(query);
        model.addAttribute("data", result);
        return "charts";
    }
    @GetMapping("/")
    public String indexPage() {
    	return "index";
    }
    @GetMapping("/buy_membership")
    public String membershipPage() {
    	return "buy_membership";
    }
    
	/*
	 * @GetMapping("/dash") public String dashPage() { return "dash"; }
	 */
   
}