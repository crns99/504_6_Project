<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>트레이너 회원가입</title>
<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

#input, #result {
	display: none;
}

.error {
	color: red;
}

h3 {
	text-align: center;
	margin-top: 0;
}

form {
	width: 500px;
	margin-top: 20px; /* h3와 간격 조절 */
}

.form-group {
	margin-bottom: 10px;
	display: flex;
	align-items: center;
}

.form-group label {
	display: block;
	margin-bottom: 10px;
}

.form-group input[type="radio"] {
	margin-right: 10px;
}

.form-group input[type="text"], .form-group input[type="password"], .form-group input[type="tel"], .form-group input[type="email"] {
	width: 100%;
	padding: 8px;
	box-sizing: border-box;
}

.form-group input[type="submit"] {
	display: block;
	margin: 0 auto;
	width: 80%;
	padding: 10px;
}

.form-group .button-group {
	margin-left: 8px;
}

.form-group .button-group input {
	margin-left: 3px;
}
</style>
</head>
<body>

	<form action="insert" method="post" id="joinform">
		<h3>회원 가입</h3>

		<div class="form-group">
			<label for="gender">성별</label> 
			<input type="radio" id="male" name="gender" value="male"> <label for="male">남성</label> 
			<input type="radio" id="female" name="gender" value="female"> <label for="female">여성</label>
		</div>

		<div class="form-group">
			<label for="name">이름</label> <input name="name" id="name" type="text">
		</div>

		<div class="form-group">
			<label for="id">아이디</label> <input name="id" id="id" type="text"> <span id="id_msg"></span>
		</div>

		<div class="form-group button-group">
			<input type="button" id="id_check" value="중복 확인">
		</div>

		<div class="form-group">
			<label for="password">비밀번호</label> <input name="password" id="password" type="password">
		</div>

		<div class="form-group">
			<label for="confirmPassword">비밀번호 확인</label> <input type="password" id="confirmPassword" name="confirmPassword">
		</div>

		<div class="form-group">
			<label for="address">주소</label> <input name="address" id="address" type="text">

		</div>

		<div class="form-group button-group">
			<input type="button" id="addbtn" value="우편번호 검색" onclick="addPost()">
		</div>

		<div class="form-group">
			<label for="phoneNumber">전화번호</label> <input type="tel" id="phoneNumber" name="phoneNumber">
		</div>

		<div class="form-group">
			<label for="email">이메일</label> <input name="email" id="email" type="email">
		</div>

		<div class="form-group">
			<input type="submit" value="가입" onclick="return validatePassword()">
		</div>
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
	
	function validatePassword() {
		var password = document.getElementById("password").value;
		var confirmPassword = document.getElementById("confirmPassword").value;
			// 정규표현식을 사용하여 영어와 숫자만 허용
		var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d).{8,20}$/;
			if (!password.match(passwordRegex)) {
				alert("비밀번호는 영어와 숫자를 모두 포함하고 8에서 20자 사이여야 합니다.");
				return false;
		}
			if (password != confirmPassword) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
		}
		return true;
	}
		
	function validateForm() {
		var id = $("#id").val();
		var name = $("#name").val();
		var password = $("#password").val();
		var confirmPassword = $("#confirmPassword").val();
		var address = $("#address").val();
		var phoneNumber = $("#phoneNumber").val();
		var email = $("#email").val();
			// 각 필수 항목을 체크하고 빈 경우 alert 창을 띄우고 폼 전송을 막음
		if (!id || !name || !password || !confirmPassword || !address
				|| !phoneNumber || !email) {
			alert("입력되지 않은 항목이 있습니다.");
			return false;
		}
			// 나머지 유효성 검사 로직 추가
			return true;
	}
	
	$(function() {
		$("#id_check").click(function() {
			let id = $("#id").val();
			if (!id) {
				$("#id_msg").html("아이디를 입력하세요.")
				return false;
			}
			$.ajax({
				url : "/idCheck",
				data : "id=" + id,
				datatype : "text"
			}).done(function(data) {
				//alert(data);
				if (data == "") {
				$("#id_msg").html("사용할 수 있는 아이디 입니다.");
				$("#id_msg").append("<input type='hidden' id='id_ck' value='1'>");
				} else {
					$("#id_msg").html("이미 사용중인 아이디 입니다.");
				}
			});
		});//아이디 중복 확인 click
		
		$("#joinform").submit(function() {
			if ($("#id_ck").val() != 1) {
				$("#id_msg").html("아이디 중복 체크 하셔야 합니다.")
				return false;
			}
			if (!$("#password").val()) {
				alert("비밀번호를 입력해야 합니다.");
				return false;
			}
				return validateForm();
		});
	})//ready
</script>
</body>
</html>