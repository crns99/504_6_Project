package com.example.proj.controller;

import com.example.proj.dto.MemDto;
import com.example.proj.dao.MemDao;
import com.example.proj.dto.BuyinfoDto;

import com.example.proj.service.MemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class TrainerInfoController {

    @Autowired
    private MemService memService;
    @GetMapping("/dash")
    public String viewDashboard(Model model) {
        List<MemDto> memberList = memService.getAll();
        model.addAttribute("memberList", memberList);
        return "thymeleaf/dash";
    }

	/*
	 * @GetMapping("/pt_reserve") public String getAllBuyInfo(Model model) {
	 * List<BuyinfoDto> buyInfoList = memService.getAllBuyInfo();
	 * model.addAttribute("buyInfoList", buyInfoList); return "thymeleaf/buyinfo"; }
	 */
  
    @PostMapping("/authenticate")
    public String authenticateTrainer(@RequestParam("id") String id) {
        // 1. trainerId를 기반으로 trainerinfo 테이블에서 데이터 가져오기
        MemDto trainerInfo = memService.getTrainerInfoById(id);

        // 2. meminfo 테이블에 데이터 삽입 (cert에 'O' 추가)
        memService.copyByIdToMemInfo(id); // 해당 메서드를 MemberService에 추가해야 함

        // 3. trainerinfo 테이블에서 해당 데이터 삭제
        memService.deleteTrainerInfoById(id);

        return "redirect:/dash";
    }
}
