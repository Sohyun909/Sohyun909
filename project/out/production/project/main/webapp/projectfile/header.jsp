<%@page import="vo.ShowVO"%>
<%@page import="dao.ShowDAO"%>
<%@page import="vo.ShowMemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/bootstrap.css" />
<link rel="stylesheet" href="../css/header.css?after" />
<meta name = "viewport" content="width=device-width, initial-scale=1">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/2f2d0fd028.js"
	crossorigin="anonymous"></script>
	
<header>
	<div class="logo">
		<img src="../images/logo_transparent.png" alt="logoImg"
			onclick="location.href='main.jsp'" />
	</div>
	<div class="menu">
		<ul id="nav">
			<li class="navItem"><a href="greeting.jsp">미술관 소개</a>
				<ul class="dropdown">
					<li><a href="greeting.jsp" id="dd1">인사말</a></li>
					<li><a href="history.jsp" id="dd2">발자취</a></li>
				</ul></li>
			<li class="navItem"><a href="visitInfo.jsp">관람정보</a>
				<ul class="dropdown">
					<li><a href="visitInfo.jsp" id="dd3">관람안내</a></li>
					<li><a href="address.jsp" id="dd4">오시는 길</a></li>
				</ul></li>
			<li class="navItem"><a href="now.jsp">전시</a>
				<ul class="dropdown">
					<li><a href="now.jsp" id="dd5">현재전시</a></li>
					
				</ul></li>
			<li class="navItem"><a href="notice.jsp">소식&참여</a>
				<ul class="dropdown">
					<li><a href="notice.jsp" id="dd8">알림</a></li>
					<li><a href="review.jsp" id="dd9">관람후기</a></li>
				</ul></li>
			<li class="navItem"><a href="reservation.jsp">예약</a>
				<ul class="dropdown">
					<li><a href="reservation.jsp" id="dd10">예약하기</a></li>
					<li style="display: none" id="reservationView"><a href="reservationCheck.jsp" id="dd11">예약조회</a></li>
				</ul></li>
			<li class="navItem" style="display: none" id="showManagement"><a href="showUpload.jsp">전시회 관리</a>
				<ul class="dropdown">
					<li style="display: none" id="showUpload"><a href="showUpload.jsp" id="dd12">등록</a></li>
					<li style="display: none" id="showDelete"><a href="showDelete.jsp" id="dd13">삭제</a></li>
				</ul></li>
		</ul>
	</div>
	
	<%
	Object obj = session.getAttribute("vo");
	ShowMemVO vo = (ShowMemVO) obj;

	if (vo != null) {
	%>
	
	<div class="join">
		<img src="../images/search_grey.png" alt="searchIcon" href="#foo"
			class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#exampleModal" /> <input type="button" value="로그아웃"
			onclick="location.href='logout.jsp'" />
	</div>
	
	<%
	if (vo.getId().equals("admin")) {
	%>
	
	<script type="text/javascript">
		document.getElementById("showManagement").style.display = "block";
		document.getElementById("reservationView").style.display = "block";
		document.getElementById("showUpload").style.display = "block";
		document.getElementById("showDelete").style.display = "block";
	</script>
	<%
	}
	} else if (vo == null) {
	%>
	<div class="join">
		<img src="../images/search_grey.png" alt="searchIcon"
			class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#exampleModal" /> 
		<input type="button" value="로그인"
			onclick="location.href='login.jsp'" /> 
		<input type="button"
			value="회원가입" onclick="location.href='registerTerms.jsp'" />
	</div>
	<%
	}
	%>
</header>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">전시회 검색</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<!-- 전시회명 검색시 form submit -->
			<div class="modal-body">
				<input type="text" name="searchShow" id="searchShow" /> <input
					type="button" value="검색" id="myModal" />
			</div>
		</div>
	</div>
</div>

<script src="../js/httpRequest.js"></script>
<script type="text/javascript">
	window.onload = function() {
		
		// 검색을 누르거나 엔터누르면 ajax함수 실행
		document.getElementById("myModal").onclick = searchShow;
		document.getElementById("searchShow").onkeydown = function(e) {

			if (e.keyCode == 13) {
				searchShow();
			}
		}
	};

	// ajax로 검색 결과값 가져오기
	function searchShow() {
		
		var params = "searchShow="
				+ document.getElementById("searchShow").value.trim();
		sendRequest("searchShow.jsp", params, callback, "GET");
	}

	function callback() {
		
		if (xhr.readyState == 4 && xhr.status == 200) {

			var result = xhr.responseText.trim();
			console.log(result);
			if (result != 0) {
				document.location.href = "showDetail.jsp?showNo=" + result;
			} else if (result == 0) {
				alert("해당 검색어의 결과를 찾을 수 없습니다");
			}
		}

	}
</script>




