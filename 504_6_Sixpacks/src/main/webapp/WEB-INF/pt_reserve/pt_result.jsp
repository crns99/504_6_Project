<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/reserve/style8.css">
</head>
<body>

	<div class = "back">
		<c:if test="${date != null }">
			<img src="images/list.png" alt="리스트이미지" width="220" height="220" />
			<br>
	${user.id }님 
	<fmt:formatDate value="${date }" pattern="yy년 MM월 dd일" /><br>
			<br> ${time } 예약되셨습니다.
</c:if>
		<c:if test="${date == null }">
			<img src="images/cross.png" alt="reserveX.png" width="100" height="100" />
			<br><br>
			<div class="msg"><b>${msg }</b></div>

			<br>
			<div class="btn-group3">
				<button type="button" id="time-btn"
					onclick="location.href='pt_reserve'">pt예약 페이지로 돌아가기</button>
			</div>

		</c:if>
	</div>
</body>
</html>