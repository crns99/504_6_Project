<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>정보 수정</title>
</head>
<style>
body {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	margin: 0;
}

table {
	width: 100%; /* 원하는 너비로 조절 */
}

input[id="currentPassword"], input[id="newPassword"], input[id="phoneNumber"], input[id="email"] {
	width: 62%; /* 원하는 너비로 조절 */
	height: 40% /* 원하는 여백으로 조절 */ 
	 box-sizing: border-box; /* 패딩과 테두리를 요소의 총 폭과 높이에 포함합니다. */
}

input[type="submit"], input[id="cancelButton"] {
	padding: 5px 30px;
	font-size: 16px; /* 원하는 글꼴 크기로 조절 */
	background-color: #3498db;
	color: #fff;
	border-radius: 5px;
	border: none;
}

input[id="addbtn"] {
	padding: 5px 10px;
	font-size: 12px; /* 원하는 글꼴 크기로 조절 */
	background-color: #3498db;
	color: #fff;
	border-radius: 5px;
	border: none;
}
</style>
<body>

	<form action="update" method="post" id="updateform">
		<input type="hidden" name="_method" value="put">
		<table>
			<h3>${user.id}님의정보를수정합니다.</h3>
			<tr>
				<td>변경하실 비밀번호</td>
				<td><input name="password" type="password" id="newPassword"></td>
			</tr>

			<tr>
				<td>주소</td>
				<td><input name="address" id="address" value="${user.address}"> <input type="button" id="addbtn" value="우편번호 검색" onclick="addPost()"></td>
			</tr>

			<tr>
				<td>전화번호</td>
				<td><input type="tel" id="phoneNumber" name="phoneNumber" value="${user.tel}"></td>
			</tr>

			<tr>
				<td>이메일</td>
				<td><input name="email" id="email" value="${user.email}"></td>
			</tr>

		</table>
		<table>
			<tr>
				<td><input type="submit" value="변경" id="changeButton"></td>
				<td><input type="button" value="취소" id="cancelButton"></td>
			</tr>
		</table>
	</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function addPost() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.querySelector("#address").value = data.address;
				alert("나머지 주소도 입력하세요.");
			}
		}).open();
	}
	
	$(function() {
		$("#cancelButton").click(function() {
			var isConfirmed = confirm("변경된 내용을 저장하지 않고 나가시겠습니까?");
			if (isConfirmed) {
				history.back();
			}
		});
		$("#changeButton").click(function() {
			var isConfirmed = confirm("변경된 내용을 저장하시겠습니까?");
			if (isConfirmed) {
				$("#updateform").submit();
			}
		});
	});//ready
</script>

</body>
</html>