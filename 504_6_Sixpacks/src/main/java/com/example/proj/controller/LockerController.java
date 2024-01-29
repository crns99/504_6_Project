package com.example.proj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.proj.service.BuyInfoService;
import com.example.proj.dto.MemDto;
import com.example.proj.dto.BuyinfoDto;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

@Controller
public class LockerController {

    private final BuyInfoService buyInfoService;

    @Autowired
    public LockerController(BuyInfoService buyInfoService) {
        this.buyInfoService = buyInfoService;
    }

    @GetMapping("/locker")
    public String getLockerTable(Model model) {
        // 가상의 4x9 테이블 데이터 생성
    	
        List<List<Cell>> rows = new ArrayList<>();
        for (int i = 0; i < 4; i++) {
            List<Cell> row = new ArrayList<>();
            for (int j = 0; j < 9; j++) {
                row.add(new Cell(i * 9 + j + 1));
            }
            rows.add(row);
        }

        // buyinfo 테이블에서 lockernumber 가져오기
        List<String> nonEmptyLockerNumbers = buyInfoService.getNonEmptyLockerNumbers();

        model.addAttribute("rows", rows);
        model.addAttribute("nonEmptyLockerNumbers", nonEmptyLockerNumbers);

        return "thymeleaf/locker";
    }

    private static class Cell {
        private final int number;

        public Cell(int number) {
            this.number = number;
        }

        public int getNumber() {
            return number;
        }
    }
  

}

