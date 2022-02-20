<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관람안내</title>
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

</style>
</head>
<body>
		<div class="bodyContainer">
		<jsp:include page="header.jsp" />
		<div class="grid-container">
		<div class="main">
			<br> <br> <br>
			<p>관람시간 : 월/화/목/금/일 10:00 - 18:00 <br>수/토 10:00 - 21:00</p>
			<br> <br> <br>
			<p>휴관일 : 법정공휴일</p>
			<br> <br> <br>
			<p>
				관람료 <br> 일반 : 12,000원 <br> 청소년(만 24세 이하) 및 어린이, 노약자(만 65세
				이상) : 20% 할인
			</p>
			<br> <br> <br>
		</div>
		</div>
		</div>
	    <jsp:include page="footer.jsp"></jsp:include>		
</body>
</html>