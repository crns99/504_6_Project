<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/reserve/style6.css">
</head>
<body>
<br>${msg }
		<div class="btn-group2">
		<button type="button" class="time-btn" onclick="location.href='ot_reserve'">ot예약 페이지로 돌아가기</button>
	</div>
		
		<script>
		document.querySelector(".btn-group2 .time-btn").onclick = function () {
			this.style.backgroundColor = "#4682b4";
			this.style.color = "#ffffff";
		};
	</script>
</body>
</html>