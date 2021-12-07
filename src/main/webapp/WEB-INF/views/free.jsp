<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유 게시판</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <script src="/resoueces/js/jquery.js"></script>
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
        <h1>자유게시판.</h1>
    </section>
    <div id="wrap">
        <footer>footer</footer>
    </div>
</body>
</html>