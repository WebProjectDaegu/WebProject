<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전국 문화축제</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        img {
            width: 100%;
            height: auto;
            }

            .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            grid-gap: 1em;
            }


            /* hover styles */
            .location-listing {
            position: relative;
            }

            .location-image {
            line-height: 0;
            overflow: hidden;
            }

            .location-image img {
            filter: blur(0px);
            transition: filter 0.3s ease-in;
            transform: scale(1.1);
            }

            .location-title {
            font-size: 1.5em;
            font-weight: bold;
            text-decoration: none;
            z-index: 1;
            position: absolute;
            height: 100%;
            width: 100%;
            top: 0;
            left: 0;
            opacity: 0;
            transition: opacity .5s;
            color: white;
            background: rgba(221, 210, 213, 0.4);
            
            /* position the text in t’ middle*/
            display: flex;
            align-items: center;
            justify-content: center;
            }

            .location-listing:hover .location-title {
            opacity: 1;
            }

            .location-listing:hover .location-image img {
            filter: blur(2px);
            }


            /* for touch screen devices */
            @media (hover: none) { 
            .location-title {
                opacity: 1;
            }
            .location-image img {
                filter: blur(2px);
            }
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
    <section>

        <div class="child-page-listing" style="padding: 20px;">
            <h2>전국 문화축제 게시판</h2>
            <br>
            <div class="grid-container">
              <article id="3685" class="location-listing">
                <a class="location-title" href="festivallist?location=경기도">
                    경기도
                </a>
                <div class="location-image">
                  <a href="#">
                      <img width="300" height="169" src="/resources/images/gyeongido.jpg" alt="경기도"></a>
                </div>
              </article>
          
              <article id="3688" class="location-listing">
                <a class="location-title" href="festivallist?location=강원도">
                    강원도
                </a>
                <div class="location-image">
                  <a href="#">
                      <img width="300" height="169" src="/resources/images/gangwondo.jpg" alt="강원도">  </a>
                </div>
              </article>
          
              <article id="3691" class="location-listing">
                <a class="location-title" href="festivallist?location=충청북도">
                    충청북도
                </a>
                <div class="location-image">
                  <a href="#">
                      <img width="300" height="169" src="/resources/images/chungbuk.jpg" alt="충청북도">  </a>
                </div>
              </article>
          
              <article id="3694" class="location-listing">
                <a class="location-title" href="festivallist?location=충청남도">
                    충청남도
                </a>
                <div class="location-image">
                  <a href="#">
                      <img width="300" height="169" src="/resources/images/chungnam.jpg" alt="충청남도">  </a>
                </div>
              </article>
          
              <article id="3697" class="location-listing">
                <a class="location-title" href="festivallist?location=경상북도">
                    경상북도
                </a>
                <div class="location-image">
                  <a href="#">
                      <img width="300" height="169" src="/resources/images/gyeongbuk.jpg" alt="경상북도">    </a>
                </div>
              </article>
          
              <article id="3700" class="location-listing">
                <a class="location-title" href="festivallist?location=경상남도">
                    경상남도
                </a>
                <div class="location-image">
                  <a href="#">
                      <img width="300" height="169" src="/resources/images/gyeongnam.jpg" alt="경상남도">          
                    </a>
                </div>
              </article>

              <article id="3697" class="location-listing">
                <a class="location-title" href="festivallist?location=전라북도">
                    전라북도
                </a>
                <div class="location-image">
                  <a href="#">
                      <img width="300" height="169" src="/resources/images/jeonbuk.jpg" alt="전라북도">    </a>
                </div>
              </article>
          
              <article id="3700" class="location-listing">
                <a class="location-title" href="festivallist?location=전라남도">
                    전라남도
                </a>
                <div class="location-image">
                  <a href="#">
                      <img width="300" height="169" src="/resources/images/jeonnam.jpg" alt="전라남도">          
                    </a>
                </div>
              </article>
            </div>
          </div>
    </section>
    <div id="wrap">
        <footer>footer</footer>
    </div>
</body>
</html>