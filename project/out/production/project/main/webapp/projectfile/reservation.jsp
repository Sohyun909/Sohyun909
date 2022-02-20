<%@page import="vo.ShowMemVO"%>
<%@page import="vo.BookingVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BookingDAO"%>
<%@page import="vo.ShowVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/header.css?after" />
<link rel="stylesheet" href="../css/footer.css" />
<link rel="stylesheet" href="../css/mainSection.css" />

<style>
.table {
	font-size: 16px;
	font-weight: bold;
}

tr , td {
	width: 140px;
}

body{
		background-image: url("../images/bgh9.svg");
		background-size:100%;
		background-repeat: no-repeat;
	}




</style>
</head>
<body>
	<%
		Object obj = session.getAttribute("vo");
		ShowMemVO vo = (ShowMemVO)obj;
		
		if(vo!=null){
	%>

	<jsp:include page="header.jsp" />
	<div class="container" style="margin-top: 180px; font-family: 'G마켓 산스 TTF'; ">
		<h1>예약하기</h1>
		<table class="table">
			<thead>
				</thead>
				<tbody>
					<tr>
						<th colspan="2" style="text-align: center;">전시명</th>
						<th width="140">작가</th>
						<th width="140">전시시작일</th>
						<th width="140">전시종료일</th>
						<th width="140">전시실</th>
						<th width="140">관람료</th>
						<th width="140">연령</th>
					</tr>
				</tbody>
		</table>
		<%
		BookingDAO dao = new BookingDAO();
		ArrayList<ShowVO> list = dao.OnExhibitionAll();

		for (ShowVO svo : list) {
		%>
		<div class="container">
			<table border="0" cellpadding="0" cellspacing="0" class="table">
				<tr>
					<td class="RKthumb">
					<a href="reservationDo.jsp?ShowNo=<%= svo.getShowNo()%>"> 
					<img src="<%= svo.getMainImg() %>" alt="<%= svo.getShowName() %>" style="width: 100px; height: 150px;" />
					</a>
					</td>
					<td colspan="2" class="RKtxt"><span class="fw_bold"><%=svo.getShowName()%></span><br /></td>
					<td class="Rkdate"><%=svo.getShowWriter()%></td>
					<td class="Rkdate"><%=svo.getStartDate()%></td>
					<td class="Rkper"><%=svo.getEndDate()%></td>
					<td><%=svo.getShowPlace()%></td>
					<td><%=svo.getShowPrice()%></td>
					<td><%=svo.getShowAgelimit()%></td>
				</tr>
			</table>
		</div>
		<%
		}
		}else{
			out.println("<script>alert('로그인 후 예약이 가능합니다.'); location.href='login.jsp';</script>");
		}
		%>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>