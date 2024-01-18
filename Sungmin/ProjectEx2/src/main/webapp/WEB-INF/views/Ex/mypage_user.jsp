<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>정보 수정</title>
</head>
<body>
<h3>${user.id}</h3> 
<a href="delete"><input type="button" value="회원 탈퇴"></a>
<form action="update" method="post" id="updateform">
<input type="hidden" name="_method" value="put">
	<table>
	
		<tr><td><a href="update"><input type="button" value="정보 수정"></a>
			<a href="update"><input type="button" value="내 이용권"></a></td></tr>
			
			
		<tr><td>헬스장 PT 락커 옷</td></tr>
		<td><input type="text" value="${user.name}일 남음">
			<input type="button" value="${user.name}회 남음">
			<input type="button" value="${user.name}번">
			<input type="button" value="${user.name}일 남음">
		
		
		
		<tr><td>예약 내역</td></tr>
		<tr><td><input name="birth" 
			value='<fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/> 
				   <fmt:formatDate value="${user.birth}" pattern="hh:mm"/>
				   ${user.name} ${user.id}'></td>
		
			<!-- 변경 클릭 => 예약 페이지로 이동 -->
			<td><a href="update"><input type="button" value="변경"></a>
			<!--  취소 클릭 => 예약을 취소하시겠습니까? 팝업 -->
				<button onclick="cancel()">취소</button></td></tr>
				
		<tr><td>예약 히스토리</td></tr>
		<tr><td><input name="birth" 
			value='<fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/> 
				   <fmt:formatDate value="${user.birth}" pattern="hh:mm"/>
				   ${user.name} ${user.id}'></td></tr>
		<td><input name="name" id="name" value="${user.name}"></td>	
		
		
		
		
	</table>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function cancel() {
    if (!confirm("예약을 취소하시겠습니까?")) {
        alert("예");
    } else {
        alert("아니오");
    }
}

</script>

</body>
</html>