<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>gx_reserve</title>
<link rel="stylesheet" href="/css/reserve/style5.css">


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

	
	
<form id="gxreserveform" method="get" action="gxcal">
    <!-- Datepicker를 위한 입력 -->
    <input class="datepicker" type="text" name="selected_date" placeholder="날짜 선택">
    
    <!-- 표와 관련된 데이터 입력 -->
    <input type="hidden" name="time" value="" id="time">
    <input type="hidden" name="activity" value="" id="activity">
    
    <!-- 표 데이터 입력 -->
    <table class="reservationTable">
    <input type="hidden" name="time" value="" id="time">
    <input type="hidden" name="activity" value="" id="activity">
    <tr id="table_title">
        <th colspan="2">시간/요일</th>
        <th>월</th>
        <th>수</th>
        <th>금</th>
    </tr>
    <tr>
        <th id="col1" class="center" rowspan="3">오후<br>(PM)</th>
        <td id="col2">6:30</td>
        <td class="reserve" data-day="월" data-time="6:30" data-activity="스피닝">스피닝</td>
        <td class="reserve" data-day="수" data-time="6:30" data-activity="에어로빅">에어로빅</td>
        <td class="reserve" data-day="금" data-time="6:30" data-activity="필라테스">필라테스</td>
    </tr>
    <tr>
        <td class="center">7:30</td>
        <td class="reserve" data-day="월" data-time="7:30" data-activity="스핀닝">스피닝</td>
        <td class="reserve" data-day="수" data-time="7:30" data-activity="에어로빅">에어로빅</td>
        <td class="reserve" data-day="금" data-time="7:30" data-activity="필라테스">필라테스</td>
    </tr>
    <tr>
        <td class="center">8:30</td>
        <td class="reserve" data-day="월" data-time="8:30" data-activity="스핀닝">스피닝</td>
        <td class="reserve" data-day="수" data-time="8:30" data-activity="에어로빅">에어로빅</td>
        <td class="reserve" data-day="금" data-time="8:30" data-activity="필라테스">필라테스</td>
    </tr>
</table>    

    
    <!-- 예약하기 버튼 -->
    <div class="btn-group2">
        <button type="button" class="time-btn" onclick="submitForm()">예약하기</button>
    </div>
</form>

<script>
    let selectedDay = '';
    let selectedTime = '';
    let selectedActivity = '';

    // Datepicker 설정
    $(function() {
        $('.datepicker').datepicker({
            dateFormat: 'yy-mm-dd', // 날짜 형식 설정
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
    });

    document.querySelectorAll('.reserve').forEach(function(cell) {
        cell.addEventListener('click', function() {
            selectedDay = this.getAttribute('data-day');
            selectedTime = this.getAttribute('data-time');
            selectedActivity = this.getAttribute('data-activity');
            alert('요일 : ' + selectedDay + '\n' + '시간 : ' + selectedTime + '\n' + '종류 : ' + selectedActivity);
        });
    });

    function submitForm() {
        const selectedDate = $('.datepicker').val();
        if (!selectedDate || !selectedDay || !selectedTime || !selectedActivity) {
            alert('예약할 시간과 활동, 날짜를 선택하세요.');
            return;
        }

        document.getElementById('time').value = selectedDay + ' ' + selectedTime;
        document.getElementById('activity').value = selectedActivity;
        document.getElementById('gxreserveform').submit();
    }
</script>


</body>

</html>