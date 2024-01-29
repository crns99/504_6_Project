package com.example.proj.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class GxReserveDto {
	private String memberID;
	private int GXclassID;
	private String GXclass_name;
	private LocalDate classdate;

}
