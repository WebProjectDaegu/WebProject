<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>축제정보</title>
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

#video {
	text-align: center
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
	/* search */ # search { text-align : center;
	padding-top: 50px;
}
/* search */
#search {
	text-align: center;
	padding-top: 50px;
}

button {
	color: white;
	background-color: black;
	border: 0;
	outline: 0;
	width: 50px;
	height: 20px;
}
/* 작성하기 버튼 */
#write_btn {
	float: right;
	width: 80px;
	height: 25px;
	background-color: #f1ddc5;
	color: black;
	margin-right: 220px;
}
/* 하단 페이징 */
.wrap_paging {
	padding: 0;
	border: 0;
	list-style: none;
	font-size: 16px;
	text-align: center;
}

.wrap_paging a.on {
	color: #ff0000;
	font-weight: bold;
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
		$('.wrap_paging a').on("click", function(e) {
			console.log("click");
			e.preventDefault();
			keywordsave.find('input[name="pageNum"]').val($(this).attr('href'));
			keywordsave.submit();
		});
	});
	
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<br>
	<h1>
		<c:out value="${board0.location}" />
		홍보영상
	</h1>
	<br>
	<div id="video">
		<c:choose>
			<c:when test="${board0.location=='경기도' }">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/EeLPX7r7iic"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen> </iframe>
			</c:when>
			<c:when test="${board0.location=='강원도' }">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/0czu3sGpQCQ"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				</iframe>
			</c:when>
			<c:when test="${board0.location=='충청북도' }">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/s1EzVfxaOaA"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</c:when>
			<c:when test="${board0.location=='충청남도' }">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/aTIZY8zy1bY"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				</iframe>
			</c:when>
			<c:when test="${board0.location=='경상북도' }">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/V74PRN1gE0s"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				</iframe>
			</c:when>
			<c:when test="${board0.location=='경상남도' }">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/uMVewNwVBis"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				</iframe>
			</c:when>
			<c:when test="${board0.location=='전라남도' }">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/jR93T1Q36sw"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				</iframe>
			</c:when>
			<c:when test="${board0.location=='전라북도' }">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/Qox-xzeHCcI"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				</iframe>
			</c:when>
		</c:choose>
	</div>
	</iframe>
	<br>
	<br>
	<hr>
	<br>
	<br>
	<h1>
		<c:out value="${board0.location}" />
		축제 리스트
	</h1>
	<br>
	<table class="review" border="1" cellspacing="0"
		summary="게시판의 글 제목 리스트">
		<colgroup>
			<col>
			<col width="200">
			<col width="80">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">제목</th>
				<th scope="col">날짜</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="festival" items="${boards}">
				<tr>
					<td class="title"><a href="fesDetail?bno=${festival.bno}">${festival.name}</a></td>
					<td>${festival.startdate}-${festival.enddate}</td>
					<td>${festival.visiter}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="search">
		<form action="festivallist">
			<select name="searchtype">
				<option value="T">제목</option>
				<option value="W">글쓴이</option>
				<option value="C">내용</option>
			</select> <input type="text" name="keyword" size="40" required="required">
			<input type="hidden" value="${board0.location}" name="location">
			<button type="submit" class="btn button">검색</button>
		</form>
	</div>
	<br>
	<br>
	<div class="wrap_paging">
		<c:if test="${page.startPage >10 }">
			<a href="1" class="first"
				style="border: 1px solid black">맨처음</a>
		</c:if>
		<c:if test="${page.prev}">
			<a
				href="${page.startPage-1 }"
				class="prev" style="border: 1px solid black">이전</a>
		</c:if>
		<c:forEach var="pageN" begin="${page.startPage }"
			end="${page.endPage }">
			<a href="${pageN}"
				class="<c:if test ='${pageN == page.pageNum }'>on</c:if> view">[${pageN}]</a>
		</c:forEach>
		<c:if test="${page.next}">
			<a
				href="${page.endPage+1 }"
				class="next" style="border: 1px solid black">다음</a>
		</c:if>
		<c:if test="${page.endPage <page.realEnd}">
			<a
				href="${page.realEnd }"
				class="last" style="border: 1px solid black">마지막</a>
		</c:if>
	</div>
	<br>
	<form id = "keywordsave"action="festivallist" name="pagesave">
		<input type="hidden" name="keyword" value="${page.keyword}"> <input
			type="hidden" name="searchtype" value="${page.searchtype}">
			<input type="hidden" name="pageNum"	value="${page.pageNum}"> 
			<input type="hidden" name="location"	value="${board0.location}"> 
	</form>
	<br>
	<div id="wrap">
		<footer>footer</footer>
	</div>
</body>
</html>