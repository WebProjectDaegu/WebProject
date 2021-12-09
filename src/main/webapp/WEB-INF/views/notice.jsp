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
    <link rel="stylesheet" href="css/style.css">
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
        border-bottom:solid 1px #b2b2b2;
        background-color: #f1f1f4;
        color:#333;
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
    .review .title a.comment{
        padding: 0;
        background: none;
        color: #f00;
        font-size: 12px;
        font-weight: bold;
    }
    .review tr.reviewreview .title a {
        padding-left: 16px;
        background:url(images/ic_reply.png) 0 1px no-repeat;
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
</style>
<script>
     $(function(){
        var trigger = $("#trigger");
        var menu = $("nav ul");
        $(trigger).click(function(e){
            e.preventDefault();
            menu.slideToggle();
        });

        $(window).resize(function(){
            var w = $(window).width();
            if(w >= 764 && menu.is(":hidden")){
                menu.removeAttr('style');
            }
        });
    });
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<br>
<h1>공지사항</h1>
<br>
<table class="review" border="1" cellspacing="0">
    <caption>공지사항</caption>
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
            <td class="title">
                <a href="#<c:out value ='${board.nno }'/>"><c:out value ='${board.title }'/></a>
                <c:if test="${board.replyer > 0}">
				<a class="comment" href="#">[<c:out value="${board.replyer }"/>]</a> 
				</c:if>
                <img src="images/ic_new.gif" width="10" height="9" class="new" alt="새글">
            </td>
            <td class="name"><c:out value ='${board.writer }'/></td>
            <td class="date"><c:out value ='${board.writedate}'/></td>
            <td class="hit"><c:out value ='${board.visiter}'/></td>
        </tr>
</c:forEach>

    </tbody>
</table>
<div id="search">
    <form>
        <select name="category">
            <option value="title">제목</option>
            <option value="name">글쓴이</option>
            <option value="content">내용</option>
        </select>
        <input type="text" name="search" size="40" required="required">
        <button class="btn button">검색</button>
    </form>
</div>
<br>
</section>
    <div id="wrap">
        <footer>footer</footer>
    </div>
</body>
</html>