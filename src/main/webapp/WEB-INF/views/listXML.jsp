<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전국 문화축제</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
    <style type="text/css">
    	li{
            list-style: none;
    		
    	
    	}
    
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <section>
        <h1>문화축제.</h1>
    </section>
    <div id="wrap">
    <c:forEach  var = "festival" items="${XML}">
	<li><a href="detail?name=${festival.name}"><c:out value = "${festival.bno }"/>||<c:out value = "${festival.name }"/>||<c:out value = "${festival.startdate }"/></a></li>
</c:forEach>
        <footer>footer</footer>
    </div>
</body>
</html>
