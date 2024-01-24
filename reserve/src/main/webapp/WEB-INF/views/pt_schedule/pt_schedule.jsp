<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/reserve/style4.css">
</head>

<!-- 달력 -->
<script type="text/javascript">

	var today = new Date();

	// 선택된 날짜를 저장할 변수
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

				if (this === selectedDate) {
					this.style.backgroundColor = ""; // 선택 해제
					selectedDate = null;
				} else {
					if (selectedDate) {
						selectedDate.style.backgroundColor = "";
						selectedDate.style.color = "#000000";
					}
					selectedDate = this;
				}

				// 선택된 날짜의 칸을 파란색으로 표시
				this.style.backgroundColor = "#4682b4";
				
				// 선택된 날짜의 칸의 글씨색을 흰색으로 변경
				this.style.color = "#ffffff";

				// 선택된 날짜의 칸을 클릭했을 때, 이전에 선택된 날짜의 칸의 색상을 원래대로 되돌린다.
				if (selectedDate && selectedDate.id === this.id) {
					selectedDate.style.backgroundColor = "";
					selectedDate.style.color = "#000000";
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

	<!-- select 박스 -->
	<div class="select">
		<div class="selected">
			<div class="selected-value">트레이너 이름 선택</div>
			<div class="arrow"></div>
		</div>
		<ul>
			<li class="option">이름1</li>
			<li class="option">이름2</li>
			<li class="option">이름3</li>
			<li class="option">이름4</li>
			<li class="option">이름5</li>
		</ul>
	</div>
	<br><br><br>

	<!-- select 박스 -->
	<script>
		const selectBoxElements = document.querySelectorAll(".select");

		function toggleSelectBox(selectBox) {
			selectBox.classList.toggle("active");
		}

		function selectOption(optionElement) {
			const selectBox = optionElement.closest(".select");
			const selectedElement = selectBox.querySelector(".selected-value");
			selectedElement.textContent = optionElement.textContent;
		}

		selectBoxElements.forEach(selectBoxElement => {
			selectBoxElement.addEventListener("click", function (e) {
				const targetElement = e.target;
				const isOptionElement = targetElement.classList.contains("option");

				if (isOptionElement) {
					selectOption(targetElement);
				}

				toggleSelectBox(selectBoxElement);
			});
		});

		document.addEventListener("click", function (e) {
			const targetElement = e.target;
			const isSelect = targetElement.classList.contains("select") || targetElement.closest(".select");

			if (isSelect) {
				return;
			}

			const allSelectBoxElements = document.querySelectorAll(".select");

			allSelectBoxElements.forEach(boxElement => {
				boxElement.classList.remove("active");
			});
		});
	</script>


	<!-- 달력 -->
	<div>
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
	</div><br>


	<!-- 저장 버튼 -->
	<div class="btn-group2">
		<button type="button" class="time-btn">저장</button>
	</div>

	<script>
		document.querySelector(".btn-group2 .time-btn").onclick = function () {
			this.style.backgroundColor = "#4682b4";
			this.style.color = "#ffffff";
		};
	</script>


	<!-- 저장 confirm 코드 -->
	<script>
		const select = document.querySelector(".select");
		const calendar = document.querySelector("#calendar");
		const confirmBtn = document.querySelector(".time-btn");

		let selectClicked = false;
		let calendarClicked = false;

		calendar.addEventListener("click", () => {
			calendarClicked = true;
		});

		select.addEventListener("click", () => {
			selectClicked = true;
		});

		confirmBtn.addEventListener("click", () => {
			if (calendarClicked && selectClicked) {
				if (confirm("예약하시겠습니까?")) {
					// 예약 처리 코드
					alert("예약성공");
				}
			} else {
				alert("다시 선택해주세요");
			}
		});
	</script>

</body>

</body>

</html>