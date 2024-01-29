<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/reserve/style7.css">
</head>
<body>

	<br>
<%-- 	<h4>${user.id }님</h4>  selectedDate --%>

<div class = "back">
<br>
<img src="images/list.png" alt="리스트이미지" width="220" height="220" />

<div>
	<p>
	<c:forEach items="${selectedDate}" var="date" > 
	<fmt:formatDate value="${date }" pattern="yy년 MM월 dd일" /> <br>
	</c:forEach>
	<br>휴일처리가 되었습니다.
	</p>
	
	</div>

	<div class="btn-group2">
		<button type="button" id="time-btn"
			onclick="location.href='/ptschform'">pt스케줄 페이지로 돌아가기</button>
	</div>
</div>

</body>
</html>