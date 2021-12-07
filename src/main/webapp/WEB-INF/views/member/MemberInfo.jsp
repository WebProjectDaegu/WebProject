<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>멤버번호 : <c:out value="${login.membern }" /></h1>
<h3>아이디 : <c:out value="${login.id }" /></h1>
<h3>비밀번호 : <c:out value="${login.password}" /></h1>
<h3>이름 : <c:out value="${login.name}" /></h1>
<h3>성별 : <c:out value="${login.gender}" /></h1>
<h3>닉네임 : <c:out value="${login.nickname }" /></h1>
<h3>생년월일 : <c:out value="${login.birth}" /></h1>
<h3>전화번호 : <c:out value="${login.phone}" /></h1>
<h3>권한 : <c:out value="${login.permission}" /></h1>
</body>
</html>