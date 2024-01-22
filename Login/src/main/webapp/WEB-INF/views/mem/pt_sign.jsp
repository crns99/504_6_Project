<%@ page contentType="text/html; charset=UTF-8" %>
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

h3 {
    text-align: center;
    margin-top: 0;
}

form {
    width: 20%;
    margin-top: 20px;
}

.form-group {
    margin-bottom: 10px;
    display: flex;
    align-items: center;
    text-align: center;
}

.form-group div {
    display: flex;
    align-items: center;
    width: 100%;
}

.form-group label {
    display: inline-block;
    margin-right: 10px;
    vertical-align: middle;
}

.form-group input[type="radio"] {
    margin-right: 10px;
    vertical-align: middle;
}

.form-group input[type="text"],
.form-group input[type="password"],
.form-group input[type="tel"],
.form-group input[type="email"] {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    border-radius: 7px; /* 버튼에 모서리 곡선 추가 */
}

/* 스타일을 적용할 버튼과 버튼 그룹에 스타일 지정 */

.form-group input[type="submit"] {
    display: block;
    margin: 0 auto;
    width: 100%;
    padding: 10px;
    background-color: #3498db;
    color: #fff;
    border: none;
    cursor: pointer;
    border-radius: 7px; /* 버튼에 모서리 곡선 추가 */
}

.form-group .button-group input[type="button"] {
    margin-left: 3px;
}
</style> 
</head>
<body>

<form action="insertTrainer" method="post" id="pt_sign">
        <h3>트레이너 회원가입</h3>

        <div class="form-group">
            <label for="gender">성별</label>
            <input type="radio" id="male" name="gender" value="m">
            <label for="male">남성</label>
            <input type="radio" id="female" name="gender" value="f">
            <label for="female">여성</label>
        </div>

        <div class="form-group">
            <input name="name" id="name" type="text" placeholder="이름">
            <input name="type" value="${type }" type="hidden">
        </div>

        <div class="form-group">
            <input name="id" id="id" type="text" placeholder="아이디">
            <span id="id_msg"></span>
        </div>
        
        <div class="form-group button-group">
        	<input type="button" id="id_check" value="중복 확인" >
    	</div>
    	
        <div class="form-group">
            <input name="password" id="password" type="password" placeholder="비밀번호">
        </div>

        <div class="form-group">
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인">
        </div>

        <div class="form-group">
            <input name="address" id="address" type="text" placeholder="주소">
        </div>
        
        <div class="form-group button-group">
        	<input type="button" id="addbtn" value="우편번호 검색" onclick="addPost()">
    	</div>

        <div class="form-group">
            
            <input type="tel" id="phoneNumber" name="tel" placeholder="전화번호">
        </div>

        <div class="form-group">
            <input name="email" id="email" type="email" placeholder="이메일">
        </div>

        <div class="form-group">
            <input type="submit" value="가입" onclick="return validatePassword()">
        </div>
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
}//addPost    

function validatePassword() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
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
}//validatePassword

function validateForm() {
    var id = $("#id").val();
    var name = $("#name").val();
    var password = $("#password").val();
    var confirmPassword = $("#confirmPassword").val();
    var address = $("#address").val();
    var phoneNumber = $("#phoneNumber").val();
    var email = $("#email").val();

    if (!id || !name || !password || !confirmPassword || !address || !phoneNumber || !email) {
        alert("입력되지 않은 항목이 있습니다.");
        return false;
    }
    return true;
}//validateForm

$(function(){
	$("#id_check").click(function(){
		let id = $("#id").val();
		if(!id){
			alert("아이디를 입력하세요.")
			return false;
		}
		$.ajax({
			url:"/idCheck", 
			data:"id="+id, 
			datatype:"text"
		}).done(function(data){
			if(data == ""){
				alert("사용할 수 있는 아이디 입니다.");
				$("#id_msg").append("<input type='hidden' id='id_ck' value='1'>");
			}else{
				alert("이미 사용중인 아이디 입니다.");
			}
		});
	});//id_check
	
	$("#pt_sign").submit(function(){
		if($("#id_ck").val() != 1){
			alert("아이디 중복 체크 하셔야 합니다.");	
			return false;
		}
		if(!$("#password").val()){
			alert("비밀번호를 입력해야 합니다.");
			return false;
		}
		
		return validateForm();

	});//joinform
	
})//ready

</script>
</body>
</html>