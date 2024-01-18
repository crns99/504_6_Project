<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<div>
	<input type="hidden" value="${MemDto.name  }" readonly="readonly">
</div>
	<tr>
		<th scope="row">예약자</th>
		<td>${MemDto.id }</td>
	</tr>
</body>
</html>