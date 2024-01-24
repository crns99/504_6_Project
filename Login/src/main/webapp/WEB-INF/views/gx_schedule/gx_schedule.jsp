<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Gx_스케줄</title>
<link rel="stylesheet" href="/css/reserve/style2.css">
</head>

<body>

<!-- select 박스 -->
	<div class="select">
		<div class="selected">
			<div class="selected-value">종목 선택</div>
			<div class="arrow"></div>
		</div>
		<ul>
			<li class="option">스피닝</li>
			<li class="option">필라테스</li>
			<li class="option">에어로빅</li>
		</ul>
	</div>

	<!-- select 박스 -->
	<div class="select">
		<div class="selected">
			<div class="selected-value">월 선택</div>
			<div class="arrow"></div>
		</div>
		<ul>
			<li class="option">1월</li>
			<li class="option">2월</li>
			<li class="option">3월</li>
			<li class="option">4월</li>
			<li class="option">5월</li>
			<li class="option">6월</li>
			<li class="option">7월</li>
			<li class="option">8월</li>
			<li class="option">9월</li>
			<li class="option">10월</li>
			<li class="option">11월</li>
			<li class="option">12월</li>
		</ul>
	</div>

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
	<br>
	<br>
	<br>


	<!-- 테이블 -->

	<table class="reservationTable">
		<tr id="table_title">
			<th colspan="2">시간/요일</th>
			<th>월</th>
			<th>수</th>
			<th>금</th>
		</tr>
		<tr>
			<th id="col1" class="center" rowspan="3">오후<br>(PM)
			</th>
			<td id="col2">6:30</td>
			<td id="col3" onclick=""><input type="number" id="col3"
				name="col3" value="${col3}"></td>
			<td id="col4" onclick=""><input type="number" id="col4"
				name="col4" value="${col4}"></td>
			<td id="col5" onclick=""><input type="number" id="col5"
				name="col5" value="${col5}"></td>
		</tr>
		<tr>
			<td class="center">7:30</td>
			<td onclick=""><input type="number" id="col6" name="col6"
				value="${col6}"></td>
			<td onclick=""><input type="number" id="col7" name="col7"
				value="${col7}"></td>
			<td onclick=""><input type="number" id="col8" name="col8"
				value="${col8}"></td>
		</tr>
		<tr>
			<td class="center">8:30</td>
			<td onclick=""><input type="number" id="col9" name="col9"
				value="${col9}"></td>
			<td onclick=""><input type="number" id="col10" name="col10"
				value="${col10}"></td>
			<td onclick=""><input type="number" id="col11" name="col11"
				value="${col11}"></td>
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


</body>

</html>