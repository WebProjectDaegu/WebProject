<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<link href="/resources/css/style.css" rel="stylesheet">
<script src="/resources/js/jquery.js"></script>
<script>
	$(function() {
		var trigger = $("#trigger");
		var menu = $("nav ul");
		$(trigger).click(function(e) {
			e.preventDefault();
			menu.slideToggle();
		});

		$(window).resize(function() {
			var w = $(window).width();
			if (w >= 764 && menu.is(":hidden")) {
				menu.removeAttr('style');
			}
		});
	});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<section>
		<div id="notice">
			<h1>공지사항</h1>
        	 <ul>
				<li>내용<span>날짜</span></li>
			<c:forEach var="board" items="${board }">
				<li><a href="/noticedetail?nno=<c:out value ="${board.nno }"/>"><c:out value ="${board.title }"/></a><span><c:out value ="${board.writedate }"/></span></li>
        
        
        
        
        </c:forEach>
			</ul>
			
			

			<c:if test="${login != null }">
				<c:if test="${login.permission >=4 }">
					<a href="#"><h1>공지작성</h1></a>
				</c:if>

			</c:if>
		</div>

	</section>
	<div id="wrap">
		<footer>footer</footer>
	</div>
</body>
</html>