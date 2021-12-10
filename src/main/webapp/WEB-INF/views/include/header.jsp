<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#join_btn{
		color:black
	}
</style>
<header>
	<c:if test="${login == null }">
		<button type="button" id="join_btn" onclick="location.href='/member/memberRegister'">회원가입</button>
		<button type="button" id="join_btn" onclick="location.href='/member/Login'">로그인</button>

	</c:if>
	<c:if test="${login != null }">
		<button type="submit" id="join_btn" onclick="location.href='/member/logout'">로그아웃</button>
		<button type="button" id="join_btn" onclick="location.href='/member/MemberInfo'">회원정보</button>
		<button id = "join_btn" style="width: fit-content;"><c:out value="${login.nickname }" />님 어서오세요</button>
	</c:if>
	<h2 style="text-align:center"><a href="/">홈 로고</a></h2>
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