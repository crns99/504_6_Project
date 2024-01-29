package com.example.proj.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BuyinfoDto {
    private String lockernumber;
    private String memberID;
    private LocalDate enddate;
    private LocalDate startdate;
    private String uniform;
    private int PTcount;
}


