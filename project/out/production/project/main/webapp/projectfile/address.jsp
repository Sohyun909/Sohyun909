<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오시는 길</title>
<link rel="stylesheet" href="../css/introInfo.css" />
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/footer.css" />
<link rel="stylesheet" href="../css/bootstrap.css" />

<style>
* {font-family:"G마켓 산스 TTF"}

.bodyContainer {background-image: url("../images/bgh9.svg");
		background-size:100%;
		background-repeat: no-repeat;
} 

.main {
	position: relatvie;
	padding-left: 240px;}

</style>
</head>
<body>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e030c3d30c10b4148c480eb287f28499"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
		
		
		<div class="bodyContainer">
		<jsp:include page="header.jsp" />
		<div class="grid-container">
		<div class="main">
			<div id="map"
				style="width: 1000px; height: 450px; margin: 50px 50px 50px 0px; border: 1px solid silver"></div>
			<script>
				var container = document.getElementById('map');
				var options = {
					center : new kakao.maps.LatLng(37.572932, 126.992236),
					level : 3
				};
				var map = new kakao.maps.Map(container, options);
			</script>
			<a href="https://map.kakao.com/link/to/중아미술관,37.572932, 126.992236"
				target="_blank" class="arr_right_red" style="color: silver">다음 지도로 보기</a> <br> <a
				href="https://map.naver.com/v5/directions/-/14136713.740150873,4519281.083260864,%EC%A4%91%EC%95%99HTA,11535352,PLACE_POI/-/transit?c=14136247.9571375,4519281.0832609,15,0,0,0,dh"
				target="_blank" class="arr_right_red" style="color: silver">네이버 지도로 보기</a> <br>
			<br>
			<br>
			<p>주 소 : 서울특별시 종로구 율곡로10길 105 디아망 4층 (봉익동 10-1)</p>
			<p>전화번호 : 070-8240-3211</p>
			<br>
			<br>
			<p>오시는 길 :종로3가역 1,3,5호선 8번출구로 나오셔서 좌측 건너편 공영주차장 정산소에서 좌측골목 진입(도보 1분)</p>
			<br>
			<br>
			<p>버스 : 101, 103, 143, 150, 160번 등</p>
			<br>
			<br>
			<p>주차 : 교육센터 주차는 불가하오며 필요시 공영주차장 이용(10분당 1,000원)</p>
			</div>
			</div>
			</div>
		<br><br><br><br><br><br><br>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>