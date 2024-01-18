<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>정보 수정</title>
</head>
<body>
<h3>${user.id} PT트레이너</h3> 
<a href="delete"><input type="button" value="회원 탈퇴"></a>
<form action="update" method="post" id="updateform">
<input type="hidden" name="_method" value="put">
	<table>
	
		<tr><td><a href="update"><input type="button" value="정보 수정"></a>
			<a href="update"><input type="button" value="스케쥴 관리"></a></td></tr>
			
			
		<tr><td>관리 회원 수 PT예약자 수 OT예약자 수</td></tr>
		<td><input type="button" value="${user.name}명">
			<input type="button" value="${user.name}명">
			<input type="button" value="${user.name}명">
		
		
		
		<tr><td>PT 예약 내역</td></tr>
		<tr><td><input name="birth" 
			value='<fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/> 
				   <fmt:formatDate value="${user.birth}" pattern="hh:mm"/>
				   ${user.name} ${user.id}'></td>
			
				
		<tr><td>OT 예약 내역</td></tr>
		<tr><td><input name="birth" 
			value='<fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/> 
				   <fmt:formatDate value="${user.birth}" pattern="hh:mm"/>
				   ${user.name} ${user.id}'></td>
		
		<tr><td>회원 리스트</td></tr>
		<tr><td><input name="birth" 
			value='<fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/> 
				   <fmt:formatDate value="${user.birth}" pattern="hh:mm"/>
				   ${user.name} ${user.id}'></td>
		
		<tr><td>PT 예약 내역</td></tr>
		<tr><td><input name="birth" 
			value='<fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/> 
				   <fmt:formatDate value="${user.birth}" pattern="hh:mm"/>
				   ${user.name} ${user.id}'></td>
				   
				   
	</table>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>



</script>

</body>
</html>