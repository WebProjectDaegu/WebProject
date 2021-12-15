<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>동두천 락 페스티벌</title>
<link rel="stylesheet" href="resources/css/style.css">
<style>
* {
	text-align: center;
}
#info td{
	text-align: left;

}
</style>
<script>
	$(function() {
		var trigger = $("#trigger");
		var menu = $("nav ul");
		$(trigger).click(function(e) {
			e.preventDefault();
			menu.slideToggle();
		});

		$(window).resize(function() {
			var w = $(window).width();
			if (w >= 764 && menu.is(":hidden")) {
				menu.removeAttr('style');
			}
		});
	});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<section>
		<br> <br>
		<h1>${board.name }</h1>
		<br><br> <br>
		<table id="info"style="margin:0 auto; margin-top:20px; text-align:left;">
		<tr><td>축제명 </td><td>${board.name }</td></tr>
		<tr><td>개최장소 </td><td>${board.opar}</td></tr>
		<tr><td>축제내용 </td><td>${board.fstvlCo}</td></tr>
		<tr><td>전화번호 </td><td>${board.phone}</td></tr>
		<tr><td>홈페이지 </td><td><a href="${board.homepage}" target="_blank">${board.homepage}</a></td></tr>
		<tr><td>주최지 </td><td>${board.auspcInstt}</td></tr>
		<tr><td>도로명주소 </td><td>${board.rdnmadr}</td></tr>
		<tr><td>지번주소 </td><td>${board.lnmadr}</td></tr>
		<tr><td>지역분류 </td><td>${board.location}</td></tr>
		<tr><td>기간 </td><td>${board.startdate} ~ ${board.enddate}</td></tr>
	</table>
		<br>
		<Hr>
		<br>
		<h3>위치</h3>
		<br>
		<div id="map" style="width: 500px; height: 400px; margin: 0 auto;"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c767926408eb0beb68ef7d564b983fc2"></script>
		<script>
			var mapContainer = document.getElementById('map'), mapOption = {
				center : new kakao.maps.LatLng(${board.latitude}, ${board.hardness}),
			};

			var map = new kakao.maps.Map(mapContainer, mapOption);
			var geocoder = new kakao.maps.services.Geocoder();

			geocoder
					.addressSearch(
							<c:choose>
								<c:when test='${board.lnmadr !=""}'>"${board.lnmadr}"</c:when>
								<c:when test='${board.lnmadr =""}'>"${board.rdnmadr}"</c:when>
							</c:choose>,
							function(result, status) {

								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);
									map.setCenter(coords);
									var marker = new kakao.maps.Marker({
										position : coords
									});
									marker.setMap(map);
							        
								}
							});
		</script>


		<br> <br>
	</section>
	<div id="wrap">
		<footer>footer</footer>
	</div>
</body>
</html>

