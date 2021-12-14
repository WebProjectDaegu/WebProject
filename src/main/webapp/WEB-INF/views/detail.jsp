<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판</title>
<link rel="stylesheet" href="resources/css/style.css">
<script src="resources/js/jquery.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	border-radius: 5px;
	box-sizing: border-box;
	font-family: "Noto Sans KR", sans-serif;
}

.review, .review th, .review td {
	border: 0;
	margin-left: 240px;
}

.review a {
	color: #383838;
	text-decoration: none;
}

.review {
	width: 70%;
	border-bottom: 1px solid #999999;
	color: #666;
	font-size: 12px;
	table-layout: fixed;
}

.review caption {
	display: none;
}

.review th {
	padding: 5px 0 6px;
	border-top: solid 1px #999;
	border-bottom: solid 1px #b2b2b2;
	background-color: #f1f1f4;
	color: #333;
	font-weight: bold;
	line-height: 20px;
	vertical-align: top;
}

.review td {
	padding: 8px 0 9px;
	border-bottom: 1px solid #d2d2d2;
	text-align: center;
	line-height: 18px;
}

.review .date, .review .hit {
	padding: 0;
	font-family: Tahoma;
	font-size: 11px;
	line-height: normal;
}

.review .title {
	text-align: left;
	padding-left: 15px;
	font-size: 13px;
}

.review .title .pic, .review .title .new {
	margin: 0 0 2px;
	vertical-align: middle;
}

.review .title a.comment {
	padding: 0;
	background: none;
	color: #f00;
	font-size: 12px;
	font-weight: bold;
}

.review tr.reviewreview .title a {
	padding-left: 16px;
	background: url(images/ic_reply.png) 0 1px no-repeat;
}

button {
	width: 50px;
	height: 30px;
	border: 0;
	outline: 0;
	background-color: brown;
	color: white;
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
		var keywordsave = $("#keywordsave");
		$("#back").on("click", function() {
			keywordsave.submit();
		})
	});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<br>
	<h2>
		<c:choose>
			<c:when test="${board0.type =='자유'}">자유 게시판</c:when>
			<c:when test="${board0.type =='공지'}">공지 게시판</c:when>
			<c:when test="${board0.type =='리뷰'}">${board0.location} 리뷰 게시판</c:when>
		</c:choose>
		</h1>
		<br>
		<table class="review" border="1" cellspacing="0">
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
				<tr>
					<td class="title" style="text-align: center;">자유게시판</td>
					<td class="name">${board.writer }</td>
					<td class="date">${board.writedate }</td>
					<td class="hit">${board.visiter }</td>
				</tr>
				<tr style="min-width: 50px">
					<td class="textArea" colspan="4" style="font-size: 15px;"><img
						href="images/ㄹㅇㄹ.jpg" alt="자유게시판"> <br>
						<p>${board.content }</p></td>
				</tr>
				<c:forEach var="reply" items="${replys}">
					<tr>
						<td class="comment" colspan="3" style="font-size: 13px;">${reply.content}</td>
						<td style="width: 30%;">${reply.writer }</td>
					</tr>
				</c:forEach>
				<tr>
					<td class="comment" colspan="3" style="font-size: 13px;"><textarea
							name="" id="" cols="140" rows="5"></textarea></td>
					<td style="width: 30%;"><button>확인</button></td>
				</tr>
			</tbody>
		</table>
		<button id="back">목록으로</button>
		<br>
		</div>
		<c:choose>
			<c:when test="${board0.type=='자유' }">
				<form action="free" id="keywordsave">
			</c:when>
			<c:when test="${board0.type=='공지' }">
				<form action="notice" id="keywordsave">
			</c:when>
			<c:when test="${board0.type=='리뷰' }">
				<form action="reviewlist" id="keywordsave">
			</c:when>
		</c:choose>
		<input type="hidden" name="pageNum" value="${page.pageNum}"> <input
			type="hidden" name="searchtype" value="${page.searchtype}"> <input
			type="hidden" name="keyword" value="${page.keyword}"> <input
			type="hidden" name="type" value="${board0.type }">
		<c:if test="${board0.type =='리뷰' }">
			<input type="hidden" name="location" value="${board0.location }">
		</c:if>
		</form>
		<div id="wrap">
			<footer>footer</footer>
		</div>
</body>
</html>

</script>
<body>



	<form action="reply/register" method="post">
		<input type="text" name="content"> <input type="hidden"
			name="brno" value="${board.bbno}">


		<c:if test="${login == null }">
			<input type="hidden" name="mrno" value="-1">
			<input type="hidden" name="writer" value="익명">
		</c:if>
		<c:if test="${login != null }">
			<input type="hidden" name="mrno" value="${login.membern }">
			<input type="hidden" name="writer" value="${login.nickname}">
		</c:if>
		<input type="hidden" name="bbno" value="${board.bbno}"> <input
			type="submit">
	</form>
</body>
</html>