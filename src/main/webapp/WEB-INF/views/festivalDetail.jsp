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
<p>	${board.name }:축제명</p>
<p>	${board.opar}:개최장소</p>
<p>	${board.fstvlCo}:축제내용</p>
<p>	${board.phone}:전화번호</p>
<p>	${board.homepage}:홈페이지</p>
<p>	${board.auspcInstt}:주최지</p>
<p>	${board.latitude}:위도</p>
<p>	${board.hardness}:경도</p>
<p>	${board.rdnmadr}:도로명주소</p>
<p>${board.lnmadr}:지번 주소</p>
<p>	${board.location}:지역분류</p>
<p>	${board.visiter}:방문자</p>
<p>	${board.startdate}:시작날짜</p>
<p>	${board.enddate}:종료날짜</p>
</body>
</html>