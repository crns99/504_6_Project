<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>정보 수정</title>
</head>
<body>
<h3>${user.id}</h3>
<form action="update" method="post" id="updateform">
<input type="hidden" name="_method" value="put">
	<table>
		<tr><td><input type="button" value="정보 수정">
			<input type="button" value="내 이용권"></td></tr>
			
			
		<tr><td>헬스장<input name="name" id="name" value="${user.name}"></td>
		<td>PT<input name="name" id="name" value="${user.name}"></td>
		<td>락커<input name="name" id="name" value="${user.name}"></td>
		<td>옷<input name="name" id="name" value="${user.name}"></td></tr>
		
		
		
		<tr><td>예약 내역</td></tr>
		<tr><td><input name="birth" 
			value='<fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/>'>
		<td><input name="name" id="name" value="${user.name}"></td>
			<td><input type="submit" value="변경">
				<input type="submit" value="취소"></td></tr>
				
		<tr><td>예약 히스토리</td></tr>
		<tr><td><input name="birth" 
			value='<fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/>'>
		<td><input name="name" id="name" value="${user.name}"></td>	
	</table>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function addPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            	document.querySelector("#address").value = data.address;
            	alert("나머지 주소도 입력하세요.");
        }
    }).open();
}    

$(function(){
	$("#updateform").submit(function(){
		if(!$("#password").val()){
			alert("비밀번호를 입력해야 합니다.");
			return false;
		}
	});
})//ready

</script>

</body>
</html>