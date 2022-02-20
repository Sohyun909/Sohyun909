<%@page import="vo.NoticeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Joonga ArtMuseum</title>
<link rel="stylesheet" href="../css/header.css?after" />
<link rel="stylesheet" href="../css/footer.css?after" />
<link rel="stylesheet" href="../css/mainSection.css" />
<link rel="stylesheet" href="../css/bootstrap.css" />
<script src="../js/mainSection.js"></script>
</head>
<body>

	<div class="bodyContainer">
		<jsp:include page="header.jsp" />
	<div class="container">
	
		<section>
			<jsp:include page="mainShow.jsp" />	
				<h4>전시목록</h4>
				<div class="moveShowImg">
					<img src="../images/previous.png" alt="" class="previous"/> <img src="../images/next.png" alt="" class="next"/>
				</div>
				<div class="subShow">
					<div class="subShowContainer">
					<ul class="showList">
						<li><img src="../images/botteMain.png" alt="" onclick="location.href='showDetail.jsp?showNo=1'"/></li>
						<li><img src="../images/cleemain.png" alt="" onclick="location.href='showDetail.jsp?showNo=3'"/></li>
						<li><img src="../images/projectimg1.png" alt="" onclick="location.href='showDetail.jsp?showNo=7'"/></li>
						<li><img src="../images/88citytour_main.png" alt="" onclick="location.href='showDetail.jsp?showNo=2'"/></li>
						<li><img src="../images/playingMain.png" alt="" onclick="location.href='showDetail.jsp?showNo=5'"/></li>
						<li><img src="../images/sujanggoMain.png" alt="" onclick="location.href='showDetail.jsp?showNo=10'"/></li>
						<li><img src="../images/ourMain.png" alt="" onclick="location.href='showDetail.jsp?showNo=6'"/></li>
						<li><img src="../images/yosigoMain.png" alt="" onclick="location.href='showDetail.jsp?showNo=8'"/></li>
						<li><img src="../images/projectimg6.png" alt="" onclick="location.href='showDetail.jsp?showNo=4'"/></li>
						<li><img src="../images/flowermain.png" alt="" onclick="location.href='showDetail.jsp?showNo=9'"/></li>
					</ul>
					</div>
				</div>
			<jsp:include page="mainNotice.jsp"></jsp:include>
		</section>
	</div>
	</div>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>