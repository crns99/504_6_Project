package com.example.proj.controller;

import java.util.Map;

//AuthenticationController.java

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@Controller
@RequestMapping("/authenticate")
public class AuthenticationController {

 @Autowired
 private JdbcTemplate jdbcTemplate;
 private static final Logger logger = LoggerFactory.getLogger(AuthenticationController.class);
 @PostMapping("/{id}")
 public String authenticateTrainer(@RequestParam String id) {
	 logger.info("Received trainerId: {}", id);
     // 특정 트레이너의 정보를 가져오기
     String selectQuery = "SELECT * FROM trainerinfo WHERE id = ?";
     Map<String, Object> trainer = jdbcTemplate.queryForMap(selectQuery, id);

     if (trainer != null) {
         // MemInfo에 데이터 복사하여 인증 처리
         String insertQuery = "INSERT INTO meminfo (id, password, name, gender, address, tel, email,  type, cert) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'O')";
         jdbcTemplate.update(insertQuery, trainer.get("id"), trainer.get("password"), trainer.get("name"), trainer.get("gender"), trainer.get("address"), 
        		 trainer.get("tel"), trainer.get("email"), trainer.get("type"), trainer.get("cert")
        		 
        		, "O");

         // 트레이너 정보 삭제
         String deleteQuery = "DELETE FROM trainerinfo WHERE id = ?";
         jdbcTemplate.update(deleteQuery, id);
     }

     return "redirect:/dash";
 }
}
