<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    <section>
        <div id="notice">
            <h1>공지사항</h1>
            <ul>
                <li>내용<span>날짜</span></li>
                <li><a href="#">내영내용내용냐용냐용내용ㄴ용</a><span>2021-12-24</span></li>
                <li><a href="#">내영내용내용냐용냐용내용ㄴ용</a><span>2021-12-24</span></li>
                <li><a href="#">내영내용내용냐용냐용내용ㄴ용</a><span>2021-12-24</span></li>
                <li><a href="#">내영내용내용냐용냐용내용ㄴ용</a><span>2021-12-24</span></li>
                <li><a href="#">내영내용내용냐용냐용내용ㄴ용</a><span>2021-12-24</span></li>
                <li><a href="#">내영내용내용냐용냐용내용ㄴ용</a><span>2021-12-24</span></li>
                <li><a href="#">내영내용내용냐용냐용내용ㄴ용</a><span>2021-12-24</span></li>
                <li><a href="#">내영내용내용냐용냐용내용ㄴ용</a><span>2021-12-24</span></li>
                <li><a href="#">내영내용내용냐용냐용내용ㄴ용</a><span>2021-12-24</span></li>
                <li><a href="#">내영내용내용냐용냐용내용ㄴ용</a><span>2021-12-24</span></li>
                <li><a href="#">내영내용내용냐용냐용내용ㄴ용</a><span>2021-12-24</span></li>
                <li><a href="#">내영내용내용냐용냐용내용ㄴ용</a><span>2021-12-24</span></li>
                <li><a href="#">내영내용내용냐용냐용내용ㄴ용</a><span>2021-12-24</span></li>
                <li><a href="#">내영내용내용냐용냐용내용ㄴ용</a><span>2021-12-24</span></li>
            </ul>
        </div>
        
    </section>
    <div id="wrap">
        <footer>footer</footer>
    </div>
</body>
</html>