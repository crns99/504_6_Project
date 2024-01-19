<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>pt_reserve</title>
	<link rel="stylesheet" href="style.css3">
</head>

<script type="text/javascript">
	var today = new Date();

	// 선택된 날짜를 저장할 변수
	var selectedDate;

	function buildCalendar() {
		var row = null
		var cnt = 0;
		var calendarTable = document.getElementById("calendar");
		var calendarTableTitle = document.getElementById("calendarTitle");
		calendarTableTitle.innerHTML = today.getFullYear() + "년" + (today.getMonth() + 1) + "월";

		var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
		while (calendarTable.rows.length > 2) {
			calendarTable.deleteRow(calendarTable.rows.length - 1);
		}

		row = calendarTable.insertRow();
		for (i = 0; i < firstDate.getDay(); i++) {
			cell = row.insertCell();
			cnt += 1;
		}

		row1 = calendarTable.insertRow();

		for (i = 1; i <= lastDate.getDate(); i++) {
			cell = row.insertCell();
			cnt += 1;

			cell.setAttribute('id', i);
			cell.innerHTML = i;
			cell.align = "center";


			cell.onclick = function () {
				// 다중 선택 방지
				if (this === selectedDate) {
					this.style.backgroundColor = ""; // 선택 해제
					selectedDate = null;
				} else {
					selectedDate = this;
				}

				// 선택된 날짜의 칸을 파란색으로 표시
				this.style.backgroundColor = "#4682b4";

				// 선택된 날짜의 칸의 글씨색을 흰색으로 변경
				this.style.color = "#ffffff";



				// 선택된 날짜를 다시 클릭하면 색상 초기화
				if (this === selectedDate) {
					this.style.backgroundColor = "#ffffff";
					this.style.color = "#000000";
				}
			};


			if (cnt % 7 == 1) {
				cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
			}

			if (cnt % 7 == 0) {
				cell.innerHTML = "<font color=skyblue>" + i + "</font>";
				row = calendar.insertRow();
			}
		}

		if (cnt % 7 != 0) {
			for (i = 0; i < 7 - (cnt % 7); i++) {
				cell = row.insertCell();
			}
		}
	}

	function prevCalendar() {
		today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
		buildCalendar();
	}

	function nextCalendar() {
		today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
		buildCalendar();
	}
</script>

<body>

	<div class="btn-group">
		<button type="button" class="btn btn-default" onclick="location.href='ot_reserve.jsp'">OT / 상담</button>
		<button type="button" class="btn btn-default">1:1 PT</button>
		<button type="button" class="btn btn-default" onclick="location.href='../gx_reserve/gx_reserve.jsp'">GX</button>
	</div>

	<script>
		document.querySelectorAll(".btn-group button").forEach(function (btn) {
			if (btn.textContent === "1:1 PT") {
				btn.style.backgroundColor = "steelblue";
				btn.style.color = "white";
			}
		});
		
		// ot예약 페이지
		function goToot_reserve() {
			location.href = "ot_reserve.jsp";
		}	
		
		
		// gx예약 페이지
		function goTogx_reserve() {
			location.href = "../gx_reserve/gx_serve.jsp";
		}		
	</script>

	<hr />

	<section class="main-section">

		<section class="left-section">


			<table id="calendar" align="center">
				<tr>
					<td align="center"><label onclick="prevCalendar()"> ◀ </label></td>
					<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
					<td align="center"><label onclick="nextCalendar()"> ▶ </label></td>
				</tr>
				<tr>
					<td align="center">
						<font color="#F79DC2">일
					</td>
					<td align="center">월</td>
					<td align="center">화</td>
					<td align="center">수</td>
					<td align="center">목</td>
					<td align="center">금</td>
					<td align="center">
						<font color="skyblue">토
					</td>
				</tr>
				<script type="text/javascript">buildCalendar();</script>
			</table>

		</section>


		<section class="right-section">
			<div class="btn-group2">
				<button type="button" class="time-btn">10:00</button>
				<button type="button" class="time-btn">11:00</button>
				<button type="button" class="time-btn">13:00</button><br>
				<button type="button" class="time-btn">14:00</button>
				<button type="button" class="time-btn">15:00</button>
				<button type="button" class="time-btn">16:00</button><br>
				<button type="button" class="time-btn">17:00</button>
				<button type="button" class="time-btn">18:00</button>
				<button type="button" class="time-btn">19:00</button><br>
				<button type="button" class="time-btn">20:00</button>
				<button type="button" class="time-btn">21:00</button>
				<button type="button" class="time-btn">.</button>
				<br><br><br><br><br><br><br>

				<button type="button" class="time-btn" style="width: 500px; height: 50px;">예약하기</button>
			</div>

		</section>

		<script>
			// time-btn 클래스를 가진 모든 버튼에 이벤트 리스너를 추가
			document.querySelectorAll(".time-btn").forEach(function (btn) {

				let clickCount = 0;

				// 버튼을 클릭하면 색상을 변경
				btn.addEventListener("click", function () {

					clickCount++;

					// 버튼의 색상을 변경
					btn.style.backgroundColor = clickCount % 2 === 0 ? "lightgray" : "steelblue";

					// 버튼의 색상이 회색이면 글자색을 검은색으로 변경
					if (btn.style.backgroundColor === "lightgray") {
						btn.style.color = "black";
					} else {
						btn.style.color = "white";
					}
				});
			});
		</script>



	</section>
</body>

</html>