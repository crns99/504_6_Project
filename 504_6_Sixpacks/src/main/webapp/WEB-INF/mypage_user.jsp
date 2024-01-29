<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>mypage_user</title>
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
            flex-direction: column; /* 수직으로 배치 */
            align-items: center;
        }

        table {
            border-collapse: collapse;
            width: 300%;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 0px; /* 테이블 간격 조절 */
        }

        th, td {
            border: 1px solid #ddd;
            padding: 15px;
            text-align: left;
        }

        input[type="button"] {
            padding: 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .button {
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 50px;
        }

        .button:hover {
            background-color: #2078af;
        }

        .additional-table{
            background-color: #f2f2f2;
            border-collapse: collapse;
            width: 300%;
            border-radius: 10px;
            overflow: hidden;
        }

        .additional-th, .additional-td{
            padding: 15px;
            text-align: center;
            display: flex; /* h2 태그를 수평으로 정렬하기 위한 설정 */
            justify-content: space-between; /* 각 h2 태그 사이의 간격을 최대화 */
        }

        .additional-td h2{
            display: inline-block;
        }
        
        .reservation-table, .reservationHistory-table{
        	background-color: #ffffff;
            border-collapse: collapse;
            width: 300%;
            border-radius: 10px;
            overflow: hidden;
        }
        
        
         /* 예약 내역 테이블 내용 왼쪽 정렬 */
        .reservation-td {
            text-align: center;
        }

        /* 예약이 없습니다 메시지 가운데 정렬 */
        .reservation {
            text-align: left;
            width: 300%;
        }
       
    </style>
</head>
<body>
    <div class="container">
        <table>
            <tr>
                <td>
                    <h2>${userId}</h2>

                    <a href="fix_info">
                        <input type="button" class="button" value="정보수정">
                    </a>

                    <a href="delete" class="withdraw-button">
                        <input type="button" class="button" value="회원탈퇴">
                    </a>
                </td>
            </tr>
        </table>

        <!-- 추가된 테이블 -->
		<table class="additional-table">
			<thead>
				<tr>
					<th>헬스장</th>
					<th>PT</th>
					<th>락커</th>
					<th>회원복</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="buyInfo" items="${buyInfoList}">
			<tr>
			<td>${remainingDaysList[0]}일 남음</td>
			<td>${buyInfo.PTcount} 회</td>
			<td>${buyInfo.lockernumber} 번</td>
			<td>${buyInfo.uniform}</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>

		<!-- 예약 내역 테이블 -->
        <h4 class=reservation>예약 내역</h4>
        <table class="reservation-table">
            <tr>
                <td class="reservation-td">
                   	 <a href="calform">- 예약이 없습니다 -</a>
                </td>
            </tr>
        </table>
        
        <!-- 예약 히스토리 테이블 -->
        <h4 class=reservation>예약 히스토리</h4>
        <table class="reservationHistory-table">
            <tr>
                <td class="reservation-td">
                   	 
                </td>
            </tr>
        </table>
    </div>
    

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
  
    </script>
</body>
</html>
