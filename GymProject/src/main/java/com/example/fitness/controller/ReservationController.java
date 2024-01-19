package com.example.fitness.controller;

/*
import java.time.LocalDate;
import java.time.LocalTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/pt_reserve")
public class ReservationController {

    private ReservationRepository reservationRepository;

    @Autowired
    public ReservationController(ReservationRepository reservationRepository) {
        this.reservationRepository = reservationRepository;
    }

    @PostMapping("/pt_reserve")
    public ResponseEntity<String> reserve(
        @RequestBody ReservationRequest reservationRequest) {

      // 예약 가능 여부 확인
      Reservation reservation = reservationRepository.findByDateAndTime(
          reservationRequest.getDate(), reservationRequest.getTime());
      if (reservation != null) {
        return ResponseEntity.badRequest().body("예약 가능한 시간이 아닙니다.");
      }

      // 예약 정보 저장
      reservationRepository.save(reservationRequest.toEntity());

      return ResponseEntity.ok("예약 성공!");
    }
  }
*/

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.gym.Reservation;
import com.example.gym.reservationRepository;

@RestController
public class ReservationController {

    @PostMapping("/reservation")
    public Reservation createReservation(@RequestBody Reservation reservation) {
        return reservationRepository.save(reservation);
    }

}