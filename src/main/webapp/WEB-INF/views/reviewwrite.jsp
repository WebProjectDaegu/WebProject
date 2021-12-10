<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 작성하기</title>
<link rel="stylesheet" href="/resources/css/style.css">
<script src="/resources/js/jquery.js"></script>
<style>
table {
	text-align: center;
	width: 80%;
	margin-left: 200px;
}

th, td {
	background-color: rgb(209, 206, 206);
}

td {
	text-align: left;
	width: 50%;
}

.btn {
	text-align: center;
	margin-top: 15px;
	width: 120px;
	height: 35px;
	font-size: 17px;
	background-color: #f1ddc5;
	color: black;
	outline: 0;
	border: 0;
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
<script>
	function checkForm() {
		var form = document.baordform;
		if (!form.title.value) {
			alert("제목을 입력해주에요");
			return false;
		}
		if (!form.content.value) {
			alert("내용을 입력해주에요");
			return false;
		}

	}
</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<br>
	<div id="write">
		<h2>리뷰 작성하기</h2>
		<br> <br>
		<form action="write/reviewConfirm" method="post" name="baordform"
			onsubmit="return checkForm()">
			<input type="hidden" value="board_write" name="command">
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" id="title"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="100" rows="30" name="content" id="content"></textarea></td>
				</tr>
			</table>
			<input type="hidden" value="리뷰" name="type"> <input
				type="hidden" value="<c:out value = '${board.location }'/>"
				name="location"> <input class="btn" type="submit" value="등록">
			<c:if test="${login == null }">
				<input type="hidden" value="익명" name="writer">
			</c:if>
			<c:if test="${login != null }">
				<input type="hidden" value="${login.nickname }" name="writer">
				<input type="hidden" value="${login.membern }" name="membern">
			</c:if>
			<input class="btn" type="reset" value="다시작성하기"> <input
				class="btn" type="button" value="취소"
				onclick="javascript:history.back()">
		</form>
	</div>
	<br>
	<div id="wrap" style="float: left;">
		<footer>footer</footer>
	</div>
</body>
</html>