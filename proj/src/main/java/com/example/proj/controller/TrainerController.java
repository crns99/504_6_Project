package com.example.proj.controller;

//TrainerController.java

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
public class TrainerController {

 @Autowired
 private JdbcTemplate jdbcTemplate;

 @GetMapping("/dash")
 public String showTrainers(Model model) {
     List<Map<String, Object>> trainers = jdbcTemplate.queryForList("SELECT * FROM trainerinfo");
     model.addAttribute("trainers", trainers);
     return "dash";
 }
 
}
