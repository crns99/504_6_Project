package com.example.proj.controller;
//UserController.java

//TableController.java

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
public class TableController {

 @Autowired
 private JdbcTemplate jdbcTemplate;
 
@GetMapping("/tables")
 public String showTable(Model model) {
     List<Map<String, Object>> tempInfoList = jdbcTemplate.queryForList("SELECT * FROM meminfo");

     // Null check and initialization
     if (tempInfoList == null) {
         tempInfoList = List.of();
     }

     model.addAttribute("tempInfoList", tempInfoList);
     return "thymeleaf/tables";
 }

}
