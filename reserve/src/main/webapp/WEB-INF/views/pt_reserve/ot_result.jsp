<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/reserve/style8.css">
</head>
<body>
	<div class="back">
	<img src="images/list.png" alt="리스트이미지" width="220" height="220" /><br>
		<br>${msg }
		<div class="btn-group2">
				<button type="button" id="time-btn"
					onclick="location.href='ot_reserve'">ot예약 페이지로 돌아가기</button>
			</div>
	</div>
	

<!-- 			<script> -->
<!-- // 			document.querySelector(".btn-group2 .time-btn").onclick = function () { -->
<!-- // 	 			this.style.backgroundColor = "#4682b4"; -->
<!-- // 		 			this.style.color = "#ffffff"; -->
<!-- // 		 		} -->
<!-- 			</script> -->
		
</body>
</html>
	