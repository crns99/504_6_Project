<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>

<head>
	<title>시큐리티 테스트</title>
</head>
<body>
	<h1>인덱스 화면입니다.</h1>
	<sec:authorize access="!isAuthenticated()"> 
		login<br>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()"> 
		logout<br>
	</sec:authorize>
</body>
</html>

