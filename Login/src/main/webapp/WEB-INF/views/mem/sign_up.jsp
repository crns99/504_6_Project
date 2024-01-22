<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	margin: 0;
	background-color: #fff; /* 기본 배경색 설정 */
}

/* 폼 컨테이너에 대한 스타일 설정 */
.form-container {
	text-align: center; /* 가운데 정렬을 위한 스타일 */
}

/* 사용자 정의 라디오 버튼에 대한 스타일 설정 */
.custom-radio {
	display: inline-block;
	position: relative;
	padding: 50px 70px;
	margin: 10px;
	cursor: pointer;
	border: 2px solid #3498db;
	border-radius: 20px; /* 곡선 처리된 모서리 */
	overflow: hidden;
	transition: background-color 0.3s, color 0.3s;
	background-color: #fff; /* 여백의 배경색을 변경합니다. */
}

/* 라디오 버튼의 실제 input 요소는 화면에서 보이지 않도록 설정 */
.custom-radio input {
	display: none;
}

/* 라디오 버튼 레이블에 대한 스타일 설정 */
.custom-radio label {
	display: block;
	position: relative;
	z-index: 1;
	color: #3498db;
	font-weight: bold;
}

/* 라디오 버튼이 선택된 경우, 레이블의 색상과 배경색 변경 */
.custom-radio input:checked+label {
	color: #fff;
	background-color: #3498db;
}

/* 선택된 라디오 버튼이 전체 배경색을 변경하도록 설정 */
.custom-radio:checked {
	background-color: #ddd;
}

/* 가운데 정렬을 위한 스타일 설정 */
.centered-button-container {
	text-align: center;
}

/* 가운데 정렬된 버튼에 대한 스타일 설정 */
.centered-button {
	display: inline-block;
	padding: 10px 50px;
	margin: 10px;
	cursor: pointer;
	border: none;
	border-radius: 5px;
	background-color: #3498db;
	color: #fff;
	font-weight: bold;
	transition: background-color 0.3s, color 0.3s;
}

/* 버튼에 호버 효과를 적용하여 배경색과 글자색 변경 */
.centered-button:hover {
	background-color: #2078af;
}
</style>
<title>회원 유형 선택</title>
</head>
<body>

	<div class="form-container">
		<form>
			<!-- 일반회원 라디오 버튼 -->
			<div class="custom-radio" id="normalMemberRadio" onclick="toggleSelection('normalMemberRadio')">
				<input type="radio" id="normalMember" name="memberType" value="normal"> 일반회원
			</div>

			<!-- 트레이너 라디오 버튼 -->
			<div class="custom-radio" id="trainerRadio" onclick="toggleSelection('trainerRadio')">
				<input type="radio" id="trainer" name="memberType" value="trainer"> 트레이너
			</div>

			<!-- 다음 버튼 -->
			<div class="centered-button-container">
				<button type="button" class="centered-button" onclick="nextButtonClick()">다음</button>
			</div>
		</form>
	</div>

	<script>
		function toggleSelection(radioId) {
			var radio = document.getElementById(radioId);
			var input = radio.querySelector('input[type="radio"]');
			var isChecked = input.checked;

			// 다른 라디오 버튼의 선택 상태 해제
			var allRadios = document.querySelectorAll('.custom-radio');
			allRadios
					.forEach(function(otherRadio) {
						if (otherRadio !== radio) {
							otherRadio.querySelector('input[type="radio"]').checked = false;
							updateBackground(otherRadio);
						}
					});

			// 현재 라디오 버튼의 선택 상태 업데이트
			input.checked = !isChecked;
			updateBackground(radio);
		}

		function updateBackground(radio) {
			var isChecked = radio.querySelector('input[type="radio"]').checked;
			radio.style.backgroundColor = isChecked ? '#ddd' : '#fff';
		}

		function nextButtonClick() {
			// 여기에 다음 버튼 클릭 시 동작할 JavaScript 코드 추가
			// 예: 페이지 이동, 데이터 처리 등
			var selectedType = document
					.querySelector('input[name="memberType"]:checked');

			if (selectedType) {
				// 일반회원이 선택되었다면
				if (selectedType.value === 'normal') {
					window.location.href = 'member_sign?type=일반회원';
				}
				// 트레이너가 선택되었다면    
				else if (selectedType.value === 'trainer') {
					window.location.href =  'pt_sign?type=트레이너';
				}
			} else {
				alert('회원 유형을 선택해주세요.');
			}
		}
	</script>

</body>
</html>
