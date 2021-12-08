<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/style.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<c:if test="${login == null }">
		<button type="button" onclick="location.href='/member/memberRegister'">회원가입</button>
		<button type="button" onclick="location.href='/member/Login'">로그인</button>

	</c:if>
	<c:if test="${login != null }">
		<span><c:out value="${login.nickname }" />님 어서오세요</span>
		<button type="submit" onclick="location.href='/member/logout'">로그아웃</button>
		<button type="button" onclick="location.href='/member/MemberInfo'">회원정보</button>
	</c:if>
</header>

<nav>
	<ul>
		<li><a href="/notice">공지사항</a></li>
		<li><a href="/festival">전국 문화축제</a></li>
		<li><a href="/review">리뷰 게시판</a></li>
		<li><a href="/free">자유 게시판</a></li>
	</ul>
	<a href="#" id="trigger">MENU</a>
</nav>