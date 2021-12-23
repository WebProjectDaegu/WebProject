<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
    <script>
	function checkForm() {
		var form = document.loginForm;
		if (!form.email.value) {
			alert("아이디를 입력해주에요");
			return false;
		}
		if (!form.password.value) {
			alert("비밀번호를 입력해주에요");
			return false;
		}

	}
</script>
</head>
<body>
    <div class="login-form">
    <form action="/member/loginProcess" method="post" name="loginForm" onsubmit="return checkForm()">
        로그인
        
        <input type="text" id="email"  name="email" class="text-field"  placeholder="아이디">
        <input type="password" id="password"  name="password" class="text-field" placeholder="비밀번호">
        <input type="submit" value="로그인" class="submit-btn">
    </form>
     
    <div class="links">
        <a href="#">비밀번호를 잊어버리셨나요?</a>
    </div>
    </div>
</body>

</html>