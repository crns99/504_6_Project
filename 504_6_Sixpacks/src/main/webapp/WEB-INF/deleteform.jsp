<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 탈퇴</title>
<style>
  body {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
    margin: 0;
  }

  .container {
    text-align: center;
  }

  table {
    margin: auto;
  }

  input[type="password"] {
    width: 100%;
  }

  input[type="submit"] {
    margin-top: 10px;
    background-color: #3498db;
	color: #fff;
    border: none;
    border-radius: 5px;
    padding: 10px 50px;
  }
  
 

	input[type="submit"]:hover {
		background-color: #2078af;
	}
</style>
</head>
<body>
<div class="container">
  <h3>회원 탈퇴</h3>

  <c:if test="${result == false}">
    <script>
      // 비밀번호가 틀렸을 때 알림창 띄우기
      alert("입력하신 비밀번호는 틀렸습니다.");
    </script>
  </c:if>

  <form method="post" onsubmit="return checkVal()" action="delete">
    <input type="hidden" name="_method" value="delete">
    <table>
      <tr>
        <td>password</td>
        <td>
          <input type="password" name="formpw" id="password">
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" value="탈퇴">
        </td>
      </tr>
    </table>
  </form>
</div>

<script>
  function checkVal() {
    let pw = document.querySelector("#password").value;
    if (!pw) {
      alert("비밀번호를 입력하세요");
      return false;
    }

    // 정말로 탈퇴할 것인지 다시 한 번 확인
    let confirmWithdrawal = confirm("정말로 탈퇴하시겠습니까?");
    return confirmWithdrawal;
  }
</script>

</body>
</html>
