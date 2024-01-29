<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>ot_reserve</title>
<link rel="stylesheet" href="/css/reserve/style3.css">
</head>


<!-- 달력 -->
<script type="text/javascript">

	var today = new Date();

	// 선택된 날짜를 저장할 변수
	var selectedDate;

	function buildCalendar() {
		var row = null
		var cnt = 0;
		var calendarTable = document.getElementById("calendar");
		var calendarTableTitle = document.getElementById("calendarTitle");
		calendarTableTitle.innerHTML = today.getFullYear() + "/" + (today.getMonth() + 1);

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
				document.getElementById("selectedDate").value = calendarTableTitle.innerHTML +"/"+this.innerHTML;
				
				
				// 다중 선택 방지
				if (this === selectedDate) {
					
					
					this.style.backgroundColor = ""; // 선택 해제
					selectedDate = null;
				} else {
					if (selectedDate) {
						selectedDate.style.backgroundColor = "";
						selectedDate.style.color = "#000000";
					}
					selectedDate = this;
				}

				// 선택된 날짜의 칸을 파란색으로 표시
				this.style.backgroundColor = "#4682b4";

				// 선택된 날짜의 칸의 글씨색을 흰색으로 변경
				this.style.color = "#ffffff";
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
		<button type="button" class="btn btn-default">OT / 상담</button>

			<button type="button" class="btn btn-default"
			onclick="location.href='pt_reserve'">1:1 PT</button>


<!-- 		<button type="button" class="btn btn-default" -->
<!-- 			onclick="location.href='gx_reserve'">GX</button> -->

	</div>

	<script>
		document.querySelectorAll(".btn-group button").forEach(function (btn) {
			if (btn.textContent === "OT / 상담") {
				btn.style.backgroundColor = "steelblue";
				btn.style.color = "white";
			}
		});

		/* // pt예약 페이지
		function goTopt_reserve() {
			location.href = "pt_reserve.jsp";
		}  */

// 		// gx예약 페이지
// 		function goTogx_reserve() {
// 			location.href = "../gx_reserve/gx_reserve.jsp";
// 		}
	</script>

	<hr />

	<section class="main-section">
		<form id="calendarForm" method="get" action="/cal">
			<section class="left-section">

				<!-- 달력 -->

				<table id="calendar" align="center">
					<tr>
						<td align="center"><label onclick="prevCalendar()"> ◀
						</label></td>
						<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
						<td align="center"><label onclick="nextCalendar()"> ▶
						</label></td>
					</tr>
					<tr>
						<td align="center"><font color="#F79DC2">일 </td>
						<td align="center">월</td>
						<td align="center">화</td>
						<td align="center">수</td>
						<td align="center">목</td>
						<td align="center">금</td>
						<td align="center"><font color="skyblue">토 </td>
					</tr>
					<script type="text/javascript">buildCalendar();</script>
				</table>
				<input type="hidden" id="selectedDate" name="selectedDate" value="">

			</section>


			<section class="right-section">
				<div class="btn-group2">
					<button type="button" class="time-btn">10:00</button>
					<button type="button" class="time-btn">11:00</button>
					<button type="button" class="time-btn">13:00</button>
					<br>
					<button type="button" class="time-btn">14:00</button>
					<button type="button" class="time-btn">15:00</button>
					<button type="button" class="time-btn">16:00</button>
					<br>
					<button type="button" class="time-btn">17:00</button>
					<button type="button" class="time-btn">18:00</button>
					<button type="button" class="time-btn">19:00</button>
					<br>
					<button type="button" class="time-btn">20:00</button>
					<button type="button" class="time-btn">21:00</button>
					<button type="button" class="time-btn">.</button>
					<input type="hidden" name="time" value="" id="time"> <br>
					<br> <br> <br> <br> <br> <br>

					<button type="button" class="time-btn-res"
						style="width: 500px; height: 50px;">예약하기</button>
				</div>

			</section>
		</form>
		<script>
			// time-btn 클래스를 가진 모든 버튼에 이벤트 리스너를 추가
			document.querySelectorAll(".time-btn").forEach(function (btn) {

				let clickCount = 0;

				// 버튼을 클릭하면 색상을 변경
				btn.addEventListener("click", function () {
					document.getElementById("time").value = this.innerText;
					
					clickCount++;

					// 예약하기 버튼은 다중 선택 허용
					if (btn.id === "예약하기") {
						// 다중 선택 방지 코드를 실행하지 않음
					} else {
						// 다중 선택 방지
						for (const otherBtn of document.querySelectorAll(".time-btn")) {
							if (otherBtn !== btn) {
								otherBtn.style.backgroundColor = "lightgray";
								otherBtn.style.color = "black";
							}
						}
					}

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


		<!-- confirm 코드 -->
		<script>
			const leftSection = document.querySelector(".left-section");
			const rightSection = document.querySelector(".right-section");
			const confirmBtn = document.querySelector(".time-btn-res[style='width: 500px; height: 50px;']");

			let leftClicked = false;
			let rightClicked = false;

			leftSection.addEventListener("click", () => {
				leftClicked = true;
			});

			rightSection.addEventListener("click", () => {
				rightClicked = true;
			});

			confirmBtn.addEventListener("click", () => {
				if (leftClicked && rightClicked) {
					let selectedDate = document.getElementById("selectedDate").value;
					let time = document.getElementById("time").value;
					alert(selectedDate + " : " + time);
					 if (confirm("예약하시겠습니까?")) {
					        document.getElementById("calendarForm").submit();
				/* 		// 예약 처리 코드
						alert("예약성공"); */
					}
				} else {
					alert("날짜와 시간을 모두선택해주세요");
				}
			});
	
		</script>

	</section>

</body>

</html>