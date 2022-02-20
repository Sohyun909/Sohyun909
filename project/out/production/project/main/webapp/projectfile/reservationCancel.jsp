<%@page import="vo.CardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.BookingVO"%>
<%@page import="dao.BookingDAO"%>
<%@page import="vo.ShowMemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <%
	Object obj = session.getAttribute("vo");
	ShowMemVO vo = (ShowMemVO)obj;
	
	if(vo!=null){
		
		BookingDAO dao = new BookingDAO();
	  	
	  	// 회원번호 가져오기
	  	int showmem_no = dao.sessionID(vo.getId());
	  	
	 	// 예약번호 가져오기
	 	
	 	int book_no = Integer.parseInt(request.getParameter("book_no"));
	
	 	BookingVO bvo = dao.bookNoOne(book_no);
	 	// 카드번호 가져오기
	 	
	 	String card_no = request.getParameter("card_no"); 
	 	
	 	CardVO cvo = new CardVO();
	 	
		 // 카드 잔액 구해오기
	  	int card_cash = dao.cardlimit(card_no);
		 
		int cardrefund = card_cash + bvo.getBook_price();
		
	 	dao.updateOne(book_no);
	 	
	 	cvo.setCard_cash(cardrefund);
	 	cvo.setCard_no(card_no);
	 	
	 	dao.refundOne(cvo);
		
	 	/* response.sendRedirect("reservationCheck.jsp"); */
	 	out.println("<script>alert('정상 환불처리 되었습니다.'); location.href='reservationCheck.jsp';</script>");
		}
		
		%>