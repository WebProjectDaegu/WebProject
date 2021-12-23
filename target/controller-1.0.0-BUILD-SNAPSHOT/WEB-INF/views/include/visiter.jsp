<%@page import="com.spring.mapper.BoardMapper"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import ="javax.servlet.http.Cookie"%>
<%@ page import ="javax.servlet.http.Cookie"%>
<%@ page import ="javax.servlet.http.HttpServletRequest"%>
<%@ page import ="javax.servlet.http.HttpServletResponse"%>
<%@ page import ="com.spring.domain.BoardDTO"%>
<%@ page import ="com.spring.service.BoardService"%>
<%
		String bbno = request.getParameter("bbno");
		BoardMapper boardService = null;
		BoardDTO visiter = new BoardDTO();
		
		visiter.setBbno(Integer.parseInt(bbno));
		boolean havecookie = false;
		Cookie[] getCookie = request.getCookies(); 
		if (getCookie != null){ 
			for (int i = 0; i < getCookie.length; i++) {
				Cookie c = getCookie[i]; // 객체 생성
				if (c.getName() == bbno){
					havecookie = true;
					break;
				}
			}
		} 
		else {
			Cookie setCookie = new Cookie(bbno, bbno); // 쿠키
			setCookie.setMaxAge(60 * 60 * 24); // 기간을 하루로 지정(60초 * 60분 * 24시간)
			response.addCookie(setCookie); // response에 Cookie 추가
			havecookie = true;
			boardService.PlusVisitor(visiter);
		}
		if (!havecookie) {
			boardService.PlusVisitor(visiter);
			
		}

%>