<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="/resources/js/jquery.js"></script>
<script>
	$(function(){
		var keywordsave = $("#keywordsave");
		$("#back").on("click",function(){
			keywordsave.submit();
		})
	})
</script>
<body>
		<p>${board.bbno }</p>
		<p>${board.title }</p>
		<p>${board.writer }</p>
		<p>${board.content }</p>
		<p>${board.writedate }</p>
		<p>${board.visiter }</p>
		<p>${board.type }</p>
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
			<input type="hidden" name ="pageNum" value="${page.pageNum}">
			<input type="hidden" name ="searchtype" value="${page.searchtype}">
			<input type="hidden" name ="keyword" value="${page.keyword}">
			<input type="hidden" name ="type" value = "${board0.type }"> 
			<c:if test="${board0.type =='리뷰' }">
				<input type="hidden" name ="location" value = "${board0.location }"> 
			</c:if>
		</form>
		<button id="back">목록으로</button>
		<form action="reply/register" method="post">
			<input type="text" name ="content">
			<input type="hidden" name="brno" value="${board.bbno}">
			
			
			<c:if test="${login == null }">
			<input type="hidden" name="mrno" value="-1">
			<input type="hidden" name="writer" value="익명">
			</c:if>
			<c:if test="${login != null }">
			<input type="hidden" name="mrno" value="${login.membern }">
			<input type="hidden" name="writer" value="${login.nickname}">
			</c:if>
			<input type="hidden" name="bbno" value="${board.bbno}">
			
			<input type="submit">
		</form>
		<table border="1">
		<c:forEach var="reply" items="${replys}">
		<tr>
			<td>${reply.writer}</td>
			<td>${reply.content }</td>
		</tr>
		</c:forEach>
		
		
		</table>

</body>
</html>