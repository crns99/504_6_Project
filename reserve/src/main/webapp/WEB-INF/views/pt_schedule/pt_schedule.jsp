<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>pt_schedule</title>
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
				
				//document.getElementById("selectedDate").value = calendarTableTitle.innerHTML +"/"+this.innerHTML;
				
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
				this.class = "blue";
				// 선택된 날짜의 칸의 글씨색을 흰색으로 변경
				this.style.color = "#ffffff";
				
				let sdate =  calendarTableTitle.innerHTML +"/"+this.innerHTML;
				 const box = document.getElementById("dateall");
				 const newP = document.createElement('input');
				 newP.type="hidden";
				 newP.value = calendarTableTitle.innerHTML +"/"+this.innerHTML;
				 newP.name = "selectedDate";
	            
				 box.appendChild(newP);
				
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
	<form id="calendarForm2" action="/schcal" method="get">
		<!-- select 박스 -->
		<div class="select">
			<div class="selected">
				<div class="selected-value">트레이너 이름 선택</div>
				<div class="arrow"></div>
			</div>
			<ul>
				<c:forEach items="${tlist}" var="t">
					<li class="option" id="${t.id}">${t.id }</li>
				</c:forEach>
			</ul>
			<input type="hidden" name="id" value="" id="id">
		</div>
		<br> <br> <br>

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
				document.getElementById("id").value = this.innerText;
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
		</div>
		<br>

		<!-- 저장 버튼 -->
		<button type="button" class="time-btn-res"
			style="width: 300px; height: 50px;">저장하기</button>
		</div>

		<script>
		document.querySelector("time-btn-res").onclick = function () {
			this.style.backgroundColor = "#4682b4";
			this.style.color = "#ffffff";
			document.getElementById("time").value = this.innerText;
		};
	</script>
		<div id="dateall">
			<!-- <input type="hidden" id="selectedDate" name="selectedDate" value=""> -->
		</div>
	</form>

	<!-- 저장 confirm 코드 -->
	<script>
		const select = document.querySelector(".select");
		const calendar = document.querySelector("#calendar");
		const confirmBtn = document.querySelector(".time-btn-res[style='width: 300px; height: 50px;']");

		let selectClicked = false;
		let calendarClicked = false;

		calendar.addEventListener("click", () => {
			calendarClicked = true;
			
		});

		select.addEventListener("click", () => {
			selectClicked = true;
		});
		
		let selectedDates = [];

		document.querySelectorAll(".selectedDate").forEach((el) => {
		  selectedDates.push(el.value);
		});
		
		confirmBtn.addEventListener("click", () => {
			if (calendarClicked && selectClicked) {
				
				//let selectedDate = document.getElementById("selectedDate").value;
				//let name = document.getElementById("id").value;
				//alert(selectedDates);
				if (confirm("휴일로 처리하시겠습니까?")) {
					 document.getElementById("calendarForm2").submit();
/* 					alert("예약성공"); */
				}
			} else {
				alert("다시 선택해주세요");
			}
		});
	</script>

</body>

</html>