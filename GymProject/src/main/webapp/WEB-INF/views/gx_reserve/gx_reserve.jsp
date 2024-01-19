<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>gx_reserve</title>
	<link rel="stylesheet" href="style.css">

</head>

<body>
	<div class="btn-group">
		<button type="button" class="btn btn-default" onclick="location.href='../pt_reserve/ot_reserve.jsp'">OT /
			상담</button>
		<button type="button" class="btn btn-default" onclick="location.href='../pt_reserve/pt_reserve.jsp'">1:1
			PT</button>
		<button type="button" class="btn btn-default">GX</button>
	</div>

	<script>
		document.querySelectorAll(".btn-group button").forEach(function (btn) {
			if (btn.textContent === "GX") {
				btn.style.backgroundColor = "steelblue";
				btn.style.color = "white";
			}
		});

		// ot예약 페이지
		function goToot_reserve() {
			location.href = "../pt_reserve/ot_reserve.jsp";
		}

		// pt예약 페이지
		function goTopt_reserve() {
			location.href = "../pt_reserve/pt_reserve.jsp";
		}	
	</script>

	<hr />

	<!-- 제이쿼리 ui-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
		integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
		integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />


	<input class="datepicker">
	<script>
		$(function () {
			$('.datepicker').datepicker();
		})
	</script>

	<script>
		$.datepicker.setDefaults({
			dateFormat: 'yy-mm-dd',
			prevText: '이전 달',
			nextText: '다음 달',
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			showMonthAfterYear: true,
			yearSuffix: '년'
		});

		$(function () {
			$('.datepicker').datepicker();
		});
	</script>

	<br><br><br>


	<table class="reservationTable">
		<tr id="table_title">
			<th colspan="2">시간/요일</th>
			<th>월</th>
			<th>수</th>
			<th>금</th>
		</tr>
		<tr>
			<th id="col1" class="center" rowspan="3">오후<br>(PM)</th>
			<td id="col2">6:30</td>
			<td id="col3" onclick="openReservationPopup('스피닝')">스피닝</td>
			<td id="col4" onclick="openReservationPopup('에어로빅')">에어로빅</td>
			<td id="col7" onclick="openReservationPopup('필라테스')">필라테스</td>
		</tr>
		<tr>
			<td class="center">7:30</td>
			<td onclick="openReservationPopup('스피닝')">스피닝</td>
			<td onclick="openReservationPopup('에어로빅')">에어로빅</td>
			<td onclick="openReservationPopup('필라테스')">필라테스</td>
		</tr>
		<tr>
			<td class="center">8:30</td>
			<td onclick="openReservationPopup('스피닝')">스피닝</td>
			<td onclick="openReservationPopup('에어로빅')">에어로빅</td>
			<td onclick="openReservationPopup('필라테스')">필라테스</td>
		</tr>
	</table>

	<script>
		function openReservationPopup(activity) {
			// 예약 confirm 창을 표시합니다.
			var popup = window.open("reservation.html", "예약", "width=500, height=500");
			// 예약 confirm 창에 활동 정보를 설정합니다.
			popup.document.getElementById("activity").value = activity;
		}
	</script>


</body>

</html>