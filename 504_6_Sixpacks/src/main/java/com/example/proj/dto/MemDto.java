package com.example.proj.dto;

import java.time.LocalDate;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class MemDto {
	
	@NotNull(message="id is null.")
	@NotEmpty(message="id is empty.")
	private String id;
	@NotNull(message="password is null.")
	@NotEmpty(message="password is empty.")
	private String  password;
	private String name;
	private String gender;
	private String address;
	private String tel;
	private String phoneNumber;
	private String email;
	private String type;
	private String cert;
	 private String lockernumber;
	    private String memberID;
	    private LocalDate enddate;
	    private LocalDate startdate;
	    private String uniform;
	    private int PTcount;
	
}
