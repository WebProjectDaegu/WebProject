<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유 게시판</title>
<link rel="stylesheet" href="/resources/css/style.css">
<script src="/resources/js/jquery.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	border-radius: 5px;
	box-sizing: border-box;
	font-family: "Noto Sans KR", sans-serif;
}

.free, .free th, .free td {
	border: 0;
	margin-left: 240px;
}

.free a {
	color: #383838;
	text-decoration: none;
}

.free {
	width: 70%;
	border-bottom: 1px solid #999999;
	color: #666;
	font-size: 12px;
	table-layout: fixed;
}

.free caption {
	display: none;
}

.free th {
	padding: 5px 0 6px;
	border-top: solid 1px #999;
	border-bottom: solid 1px #b2b2b2;
	background-color: #f1f1f4;
	color: #333;
	font-weight: bold;
	line-height: 20px;
	vertical-align: top;
}

.free td {
	padding: 8px 0 9px;
	border-bottom: 1px solid #d2d2d2;
	text-align: center;
	line-height: 18px;
}

.free .date, .free .hit {
	padding: 0;
	font-family: Tahoma;
	font-size: 11px;
	line-height: normal;
}

.free .title {
	text-align: left;
	padding-left: 15px;
	font-size: 13px;
}

.free .title .pic, .free .title .new {
	margin: 0 0 2px;
	vertical-align: middle;
}

.free .title a.comment {
	padding: 0;
	background: none;
	color: #f00;
	font-size: 12px;
	font-weight: bold;
}

.free tr.freefree .title a {
	padding-left: 16px;
	background: url(images/ic_reply.png) 0 1px no-repeat;
}

#write_btn {
	border: 0;
	outline: 0;
	float: right;
	width: 80px;
	height: 25px;
	background-color: #f1ddc5;
	color: black;
	margin-right: 220px;
}
</style>
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
	<br>
	<h1>자유 게시판</h1>
	<br>
	<div id="write">
		<button type="button" id="write_btn"
			onclick="location.href='/freewrite'">작성하기</button>
	</div>
	<br>
	<br>
	<table class="free" border="1" cellspacing="0">
		<caption>자유 게시판</caption>
		<colgroup>
			<col>
			<col width="110">
			<col width="100">
			<col width="80">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">제목</th>
				<th scope="col">글쓴이</th>
				<th scope="col">날짜</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${board }">
				<tr>
					<td class="title"><a
						href="/getlist?bbno=<c:out value = "${board.bbno}"/>"><c:out
								value="${board.title }" /></a> <img
						src="/resources/images/ic_pic.gif" alt="첨부이미지" width="13"
						height="12" class="pic"> 
						<c:if test="${board.replyer > 0}">
							<a class="comment" href="#">[<c:out value="${board.replyer }" />]
							</a>
						</c:if> <img src="/resources/images/ic_new.gif" width="10" height="9"
						class="new" alt="새글"></td>
					<td class="name"><c:out value="${board.writer }" /></td>
					<td class="date"><c:out value="${board.writedate}" /></td>
					<td class="hit"><c:out value="${board.visiter }" /></td>
				</tr>




			</c:forEach>

		</tbody>
	</table>
	<br>
	</section>
	<div id="wrap">
		<footer>footer</footer>
	</div>
</body>
</html>