<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>gx_reserve</title>
<link rel="stylesheet" href="/css/reserve/style5.css">

</head>

<body>
	<div class="btn-group">
		<button type="button" class="btn btn-default"
			onclick="location.href='/ot_reserve'">OT / 상담</button>
		<button type="button" class="btn btn-default"
			onclick="location.href='/pt_reserve'">1:1 PT</button>
		<button type="button" class="btn btn-default">GX</button>
	</div>

	<script>
		document.querySelectorAll(".btn-group button").forEach(function(btn) {
			if (btn.textContent === "GX") {
				btn.style.backgroundColor = "steelblue";
				btn.style.color = "white";
			}
		});

	</script>

	<hr />

	<!-- 제이쿼리 ui-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
		integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
		integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />


	<form id="gxreserveform" method="get" action="gxcal">

		<input class="datepicker">
		<input type="hidden" id="selectedDate" name="selectedDate" value="">
		<script>
			$(function() {
				$('.datepicker').datepicker();
			})
		</script>

		<script>
			$.datepicker.setDefaults({
				dateFormat : 'yy-mm-dd',
				prevText : '이전 달',
				nextText : '다음 달',
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
						'8월', '9월', '10월', '11월', '12월' ],
				dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				showMonthAfterYear : true,
				yearSuffix : '년'
			});

			$(function() {
				$('.datepicker').datepicker();
			});
		</script>

		<br> <br> <br>
	
		<table class="reservationTable">
		<input type="hidden" name="time" value="" id="time">
			<tr id="table_title">
				<th colspan="2">시간/요일</th>
				<th>월</th>
				<th>수</th>
				<th>금</th>
			</tr>
			<tr>
				<th id="col1" class="center" rowspan="3">오후<br>(PM)</th>
				<td id="col2">6:30</td>
				<td id="col3" onclick="reserve(this)">스피닝</td>
				<td id="col4" onclick="reserve(this)">에어로빅</td>
				<td id="col7" onclick="reserve(this)">필라테스</td>
			</tr>
			<tr>
				<td class="center">7:30</td>
				<td onclick="reserve(this)">스피닝</td>
				<td onclick="reserve(this)">에어로빅</td>
				<td onclick="reserve(this)">필라테스</td>
			</tr>
			<tr>
				<td class="center">8:30</td>
				<td onclick="reserve(this)">스피닝</td>
				<td onclick="reserve(this)">에어로빅</td>
				<td onclick="reserve(this)">필라테스</td>
			</tr>
			
		</table>

		<div class="btn-group2">
			<button type="button" class="time-btn">예약하기</button>
		</div>

	</form>

	<script>
		document.querySelector(".btn-group2 .time-btn").onclick = function() {
			this.style.backgroundColor = "#4682b4";
			this.style.color = "#ffffff";
		};

		function reserve(element) {

			const time = element.textContent;

			const day = element.parentElement.children[1].textContent;

			const confirm = window.confirm(`${time} ${day} 예약하시겠습니까?`);

		
			if (confirm) {
				// 예약 처리
			}
		}
	</script>


	<!-- 예약완료 팝업 -->

	<!-- <script>
		function openReservationPopup(activity) {
			// 예약 confirm 창을 표시합니다.
			var popup = window.open("reservation.html", "예약",
					"width=500, height=500");
			// 예약 confirm 창에 활동 정보를 설정합니다.
			popup.document.getElementById("activity").value = activity;
		}
	</script>
 -->


</body>

</html>