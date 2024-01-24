package com.login.dto;

import java.time.LocalDate;

import lombok.Data;

// ot, pt
@Data
public class OtReserveDto {
		private String memberID;
	    private String trainerID;
	    private LocalDate ptDate;
	    private String ptTime;
	    
		/*
		 * public String getMemberID() { return memberID; } public void
		 * setMemberID(String memberID) { this.memberID = memberID; } public String
		 * getTrainerID() { return trainerID; } public void setTrainerID(String
		 * trainerID) { this.trainerID = trainerID; } public LocalDate getPtDate() {
		 * return ptDate; } public void setPtDate(LocalDate ptDate) { this.ptDate =
		 * ptDate; } public String getPtTime() { return ptTime; } public void
		 * setPtTime(String ptTime) { this.ptTime = ptTime; }
		 */
		
}

