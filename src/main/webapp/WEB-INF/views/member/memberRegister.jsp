<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
</head>
<body>
    <div class="join-form">
    <form>
        <p>회원가입</p>
        <input type="text" name="email" class="text-field" placeholder="아이디">
        <input type="password" name="password" class="text-field" placeholder="비밀번호">
        <input type="password" name ="password_check" class="text-field" placeholder="비밀번호 확인">
        <input type="text" name="name" class="text-field" placeholder="이름">
        성별 <input style="margin-left:65px; margin-bottom: 12px;" type="radio" name="gender" value="female">여성 
                <input type="radio" name="gender" value="male">남성
        <input type="text" name="nickname" class="text-field" placeholder="별명">
        <input type="text" name="birth" class="text-field" placeholder="생년월일(yyyy/mm/dd)">
        <input type="text" name="phone" class="text-field" placeholder="전화번호">
        <input type="submit" value="회원가입하기" class="submit-btn">
        <input type="reset" value="취소" class="reset-btn">
    </form>
    </div>
</body>

</html>