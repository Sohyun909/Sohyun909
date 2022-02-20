<%@page import="vo.ShowVO"%>
<%@page import="vo.ShowMemVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.BookingVO"%>
<%@page import="dao.BookingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/header.css?after" />
<link rel="stylesheet" href="../css/footer.css" />
<link rel="stylesheet" href="../css/mainSection.css" />
<title>Insert title here</title>
<style>
.check {
	border: 1px solid red;
    width:100%;
    height: 30%;
    box-sizing: border-box;
}

.check2 {
	width: 200px;
	height: 300px;
	border: 1px solid black;
	margin: 5px;
	padding: 5px;
}

.middle{
	border: 1px solid red;
    width:100%;
    height: 30%;
    box-sizing: border-box;
}

.middle2 {
	width: 200px;
	height: 300px;
	border: 1px solid black;
	margin: 5px;
	padding: 5px;
}

.bottom{
	border: 1px solid red;
    width:100%;
    height: 30%;
    box-sizing: border-box;
}

.bottom2 {
	width: 200px;
	height: 300px;
	border: 1px solid black;
	margin: 5px;
	padding: 5px;
}
#btn {
	margin-bottom: 1px;
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
	<h4>나의 예약내역</h4>
		<% 
		
			BookingDAO dao = new BookingDAO();
		
			int showmem_no = dao.sessionID(vo.getId());
			
			int book_no = dao.bookingNo(showmem_no);
			
		/* 	ArrayList<BookingVO> list = dao.CheckAll(); */
		 	
			ArrayList<BookingVO> list = dao.CheckAll(showmem_no); 
		
			
			for(BookingVO bvo : list ){  
			ShowVO svo = dao.showJoin(bvo.getShow_no());
				
		%>
			<form action="reservationCancel.jsp">
			<div class="check2" style="float: left;" >
			<p>전시명 : <%= svo.getShowName()  %></p>
			<p>전시실 :<%= svo.getShowPlace() %></p>
			<p>연령 : <%= svo.getShowAgelimit() %></p>
			<p>금액 : <%= bvo.getBook_price() %></p>
			<p>일자 : <%= bvo.getBook_date() %></p>
			<p>인원 : <%= bvo.getPax() %> </p>
			<input type="hidden" name="book_no" value="<%= bvo.getBook_no() %>" />
			<input type="hidden" name="card_no" value="<%= bvo.getCard_no() %>" />
			<input type="submit" value="취소하기" id="btn" />
		</div>
		</form>
		<%
			}
		%>
		
		<div style="clear: both;"></div>
		
			<h4>지난 예매내역</h4>
		<%
			ArrayList<BookingVO> list2 = dao.middleAll(showmem_no);
			for (BookingVO bvo : list2){
			ShowVO svo = dao.showJoin(bvo.getShow_no());
		%>

		<div class="middle2" style="float: left;">
			<p>전시명 : <%= svo.getShowName()  %></p>
			<p>전시실 :<%= svo.getShowPlace() %></p>
			<p>연령 : <%= svo.getShowAgelimit() %></p>
			<p>금액 : <%= bvo.getBook_price() %></p>
			<p>일자 : <%= bvo.getBook_date() %></p>
			<p>인원 : <%= bvo.getPax() %> </p>
		</div>
		<%
    	}
		%>
		
		<div style="clear: both;"></div>
	
			<h4>취소한 내역</h4>
		<%
			ArrayList<BookingVO> list3 = dao.pastAll(showmem_no);
			for (BookingVO bvo : list3){
			ShowVO svo = dao.showJoin(bvo.getShow_no());
		%>

			<div class="bottom2" style="float: left;">
			<p>전시명 : <%= svo.getShowName()  %></p>
			<p>전시실 :<%= svo.getShowPlace() %></p>
			<p>연령 : <%= svo.getShowAgelimit() %></p>
			<p>금액 : <%= bvo.getBook_price() %></p>
			<p>일자 : <%= bvo.getBook_date() %></p>
			<p>인원 : <%= bvo.getPax() %> </p>
		</div>
		<%
			}
    	}else{
    		out.println("<script>alert('로그인 후 조회해주세요'); location.href='login.jsp';</script>");
    	}
  
		%>
		</div>
		
		<div style="clear: both;"></div>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>