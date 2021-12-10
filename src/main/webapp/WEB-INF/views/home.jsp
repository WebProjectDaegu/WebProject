<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>festival_index</title>
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/jquery.bxslider.min.css" rel="stylesheet">
    <script src="/resources/js/jquery.js"></script>
    <script src="/resources/js/jquery.bxslider.min.js"></script>
    <style type="text/css">
    
    
    
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
            $(".bxslider").bxSlider({
                auto:true,
                autoHover:true
            });
        });
    </script>
</head>

<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
    <br>
    <br>
    <h1>우리지역 문화축제</h1>
    <section id="bxslider_section">
        <div class="wrapper">
            <div class="banner">
                <div class="bxslider">
                    <div><img src="/resources/images/image1.jpg"></div>
                    <div><img src="/resources/images/image2.jpg"></div>
                    <div><img src="/resources/images/image3.jpg"></div>
                </div>
            </div>
        </div>
    </section>

    <section id="info">
        <div id="div1">
            <button type="button" id="notice_btn" onclick="location.href='notice'">
                공지사항
            </button>
        </div>
        <div id="div2">
            <button type="button" id="local_btn" onclick="location.href='festival'">
                전국 문화축제
            </button>
        </div>
        <div id="div3">
            <button type="button" id="review_btn" onclick="location.href='review'">
                리뷰 게시판
            </button>
        </div>
        <div id="div4">
            <button type="button" id="free_btn" onclick="location.href='free'">
                자유 게시판
            </button>
        </div>
    </section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>