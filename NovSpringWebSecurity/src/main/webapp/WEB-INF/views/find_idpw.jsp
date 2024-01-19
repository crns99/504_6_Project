<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<style>
body {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	margin: 0;
}

.container {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 80%;
	text-align: center;
}

.form-container {
	width: 400px;
	margin: auto;
}

.form-group {
	margin-bottom: 15px;
	
}

#result-container-id,
#result-container-pw  {
	margin-top: 20px;
	padding-top: 20px;
}

.divider {
	width: 5px;
	height: 200px;
	background-color: #ccc;
	margin: 0 20px;
}

button {
    background-color: #3498db; /* 기본 버튼 배경색 */
    color: #fff; /* 기본 버튼 글자색 */
    border: none;
    border-radius: 5px;
    padding: 10px 50px;
}

button:hover {
    background-color: #2078af; /* 호버 시 버튼 배경색 변경 */
}

.form-group input {
    width: 50%; /* 100% 폭으로 설정하여 전체 폭을 사용합니다. */
    padding: 10px; /* 더 나은 간격을 위해 패딩을 추가합니다. */
    box-sizing: border-box; /* 패딩과 테두리를 요소의 총 폭과 높이에 포함합니다. */
    border-radius: 5px;
    border: 1;
}
</style>
</head>

<body>
<div class="container">
	<div class="form-container">
		<form id="findid" action="${contextPath}/member/findid" method="post">
			<h3>아이디 찾기</h3>
			<div class="form-group">
				<input type="text" name="name" id="name" placeholder="이름">
			</div>
			<div class="form-group">
				<input type="email" name="email" id="email" placeholder="이메일">
			</div>
			<button type="submit" id="findid">아이디 찾기</button>
			<div id="result-container-id"></div>
		</form>
	</div>

	<div class="divider"></div><!-- 중간에 선 -->
	
	<div class="form-container">
		<form id="finpw" action="${contextPath}/member/findpw" method="post">
			<h3>비밀번호 찾기</h3>
			<div class="form-group">
				<input type="text" name="name_pw" id="name_pw" placeholder="이름">
			</div>
			<div class="form-group">
				<input type="text" name="id_pw" id="id_pw" placeholder="아이디">
			</div>
			<div class="form-group">
				<input type="email" name="email_pw" id="email_pw" placeholder="이메일">
			</div>
			<button type="submit" id="findpw">비밀번호 찾기</button>
			<div id="result-container-pw"></div>
		</form>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		// 아이디 찾기 버튼 클릭 시
		$("#findid").submit(function(event) {
			event.preventDefault();
			var name = $("#name").val();
			var email = $("#email").val();
			// 값이 입력되었는지 확인
            if (!name || !email) {
				alert("입력된 값이 없습니다.");
				return;
			}
			// 서버로 데이터 전송
			$.ajax({
				url : "/findId",
				type : "POST",
				data : {
					name : name,
					email : email
				},success : function(data) {
					if (!data.trim()) {
						alert("입력하신 이름/이메일로 등록된 아이디가 없습니다.");
					} else {
						alert("등록된 아이디는 " + data + " 입니다.");
						$("#result-container-id").text(data);
					}
				},error : function() {
					alert("서버와의 통신 중 오류가 발생했습니다.");
				}
			});
		});//findid

		// 비밀번호 찾기 버튼 클릭 시
		$("#findpw").submit(function(event) {
			event.preventDefault();
			var name = $("#name_pw").val();
			var id = $("#id_pw").val();
			var email = $("#email_pw").val();
			// 값이 입력되었는지 확인
			if (!name || !id || !email) {
				alert("입력된 값이 없습니다.");
				return;
			}
			// 서버로 데이터 전송
			$.ajax({
				url : "/findPw",
				type : "POST",
				data : {
					name : name,
					id : id,
					email : email
				},success : function(data) {
					if (!data.trim()) {
						alert("입력하신 아이디/이름/이메일로 등록된 비밀번호가 없습니다.");
					} 
					alert("등록된 비밀번호는 " + data + " 입니다.");
					$("#result-container-pw").text(data);
				},error : function() {
					alert("서버와의 통신 중 오류가 발생했습니다.");
				}
			});
		});//findpw
	});//ready
	</script>
</body>
</html>
