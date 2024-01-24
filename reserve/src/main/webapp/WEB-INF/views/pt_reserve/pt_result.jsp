<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/reserve/style6.css">
</head>
<body>

	<c:if test="${date != null }"> <img src="list.png" alt="예약성공" width="50" height="50" /><br>
	${user.id }님 
	<fmt:formatDate value="${date }" pattern="yy년 MM월 dd일" /> 
	<br> ${time } 예약되셨습니다.
</c:if>
	<c:if test="${date == null }"> <img src=".png" alt="reserveX.png" width="50" height="50" />

		<div class = "msg">${msg }</div>
	
		
			<div class="btn-group2">
		<button type="button" id="time-btn" onclick="location.href='ot_reserve'">pt예약 페이지로 돌아가기</button>
	</div>
		
		<script>
		document.querySelector(".btn-group2 .time-btn").onclick = function () {
			this.style.backgroundColor = "#4682b4";
			this.style.color = "#ffffff";
		};
	</script>


	</c:if>

</body>
</html>