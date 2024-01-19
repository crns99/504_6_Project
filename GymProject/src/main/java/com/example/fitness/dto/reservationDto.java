package com.example.fitness.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

public class reservationDto {
	private Integer rnum;
	private String name;
	private String roomName;
	private LocalDate startRdate;
	private Integer rgeust;
	private LocalDate wdate;
	private String bbqYn;
	private String campfireYn;
	private LocalDate endRdate;

	public reservationDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public reservationDto(Integer rnum, String name, String room_name, LocalDate startRdate, Integer rgeust,
			LocalDate wdate, String bbq_yn, String campfire_yn, LocalDate endRdate) {
		super();
		// TODO Auto-generated constructor stub
		this.rnum = rnum;
		this.name = name;
		this.roomName = room_name;
		this.rgeust = rgeust;
		this.startRdate = startRdate;
		this.wdate = wdate;
		this.bbqYn = bbq_yn;
		this.campfireYn = campfire_yn;
		this.endRdate = endRdate;
	}

	public Integer getRnum() {
		return rnum;
	}

	public void setRnum(Integer rnum) {
		this.rnum = rnum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public LocalDate getStartRdate() {
		return startRdate;
	}

	public void setStartRdate(LocalDate startRdate) {
		this.startRdate = startRdate;
	}

	public Integer getRgeust() {
		return rgeust;
	}

	public void setRgeust(Integer rgeust) {
		this.rgeust = rgeust;
	}

	public LocalDate getWdate() {
		return wdate;
	}

	public void setWdate(LocalDate wdate) {
		this.wdate = wdate;
	}

	public String getBbqYn() {
		return bbqYn;
	}

	public void setBbqYn(String bbqYn) {
		this.bbqYn = bbqYn;
	}

	public String getCampfireYn() {
		return campfireYn;
	}

	public void setCampfireYn(String campfireYn) {
		this.campfireYn = campfireYn;
	}

	public LocalDate getEndRdate() {
		return endRdate;
	}

	public void setEndRdate(LocalDate endRdate) {
		this.endRdate = endRdate;
	}

	
}
