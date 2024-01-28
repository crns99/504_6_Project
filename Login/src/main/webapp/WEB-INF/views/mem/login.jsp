<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
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
	flex-direction: row; /* 가로 정렬을 위해 추가 */
}

.slider-container {
	width: 300px;
	overflow: hidden;
	position: relative;
}

.slider-container img {
	width: auto;
	height: auto;
}

.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	margin-top: -25px;
	padding: 16px;
	color: white;
	font-weight: bold;
	font-size: 20px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
}

.prev {
	left: 0;
}

.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

.login-form {
	width: 400px;
}

table {
	width: 100%;
	border-collapse: collapse; /* 테두리 없애기 */
}

table td {
	padding: 10px;
}

input[type="text"], input[type="password"], input[type="submit"] {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	border-radius: 5px;
}

input[type="submit"] {
	background-color: #3498db;
	color: #fff;
	border: none;
	padding: 15px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
}

a {
	text-decoration: none;
	color: #2078af;
	margin-right: 10px;
}

.links {
	text-align: center;
	margin-top: 10px; /* 여기에 간격 추가 */
}

a:hover {
	text-decoration: underline;
}

.oauth-link {
	margin-top: 10px;
}

.logo {
	text-align: center;
	margin-bottom: 20px; /* 원하는 간격으로 조정하세요 */
}

.logo h2 {
	color: #333; /* 텍스트 색상 */
	font-size: 24px; /* 폰트 크기 */
	margin: 0; /* 기본 마진 제거 */
}

.img{
	width: auto; /* 원하는 너비로 조절 */
    height: 200px ; /* 비율에 맞게 높이 자동 조절 */
}
</style>
</head>
<body>
	<div class="container">

		<!-- Image slider container -->
		<div class="slider-container">
			<div class="logo">
				<h2>식스팩스</h2>
			</div>

			<div class="mySlides">
				<img src="images/2_1.jpg" alt="이미지 1" class="img">
			</div>
			<div class="mySlides">
				<img src="images/2_2.jpg" alt="이미지 2" class="img">
			</div>
			<div class="mySlides">
				<img src="images/2_3.jpg" alt="이미지 3" class="img">
			</div>
			<div class="mySlides">
				<img src="images/2_4.jpg" alt="이미지 4" class="img">
			</div>

		</div>

		<!-- Login form -->
		<div class="login-form">
			<h1>로그인</h1>
			<form:form action="login" method="post" modelAttribute="command">
				<form:errors element="div" />
				<table>
					<tr>
						<td><input name="id" type="text" placeholder="아이디"> <form:errors path="id" /></td>
					</tr>
					<tr>
						<td><input name="password" type="password" placeholder="비밀번호"> <form:errors path="password" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="로그인"></td>
					</tr>
					<tr>
						<td>
							<div class="links">
								<a href="find_idpw">아이디/비밀번호 찾기</a> <a href="insert">회원 가입</a>
							</div>
						</td>
					</tr>
					
				</table>
			</form:form>
		</div>
	</div>            
		
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	var slideIndex = 1;

	function showSlides(n) {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		if (n > slides.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slides[slideIndex - 1].style.display = "block";
	}

	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	function currentSlide(n) {
		showSlides(slideIndex = n);
	}

	setInterval(function() {
		plusSlides(1);
	}, 2000);
	

</script>
</body>

</html>
