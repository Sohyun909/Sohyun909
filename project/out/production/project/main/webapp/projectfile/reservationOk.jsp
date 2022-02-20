<%@page import="vo.CardVO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page import="vo.ShowMemVO"%>
<%@page import="vo.ShowVO"%>
<%@page import="vo.BookingVO"%>
<%@page import="dao.BookingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
	Object obj = session.getAttribute("vo");
	ShowMemVO vo = (ShowMemVO)obj;
	
	if(vo!=null){
  
  	BookingDAO dao = new BookingDAO();
  	BookingVO bvo = new BookingVO();
  	
  	
  	// 회원번호 가져오기
  	int showmem_no = dao.sessionID(vo.getId());
  	
  	
  	// 전시번호
  	int ShowNo =Integer.parseInt(request.getParameter("ShowNo"));
  	
  	/* out.println(ShowNo); */
  
  	// 전시회 금액 가져오기
  	 int show_price = dao.ShowPri(ShowNo); 
  	
  	// 날짜
  	String book_date = request.getParameter("book_date");
  	
  	/* out.println(book_date); */
  	
	
   // 어린이 할인 10%
  	int child = Integer.parseInt(request.getParameter("child"));
 	int cp = child * (int)(Math.round((show_price*(1-10*0.01))/100)*100);

  	// 경로 할인 금액 20%
  	int old = Integer.parseInt(request.getParameter("old"));
  	int op = old * (int)(Math.round((show_price*(1-20*0.01))/100)*100);
  	
  	// 성인 금액
  	int pax = Integer.parseInt(request.getParameter("pax"));
 	int pp = show_price * pax ; 
 	
 	// 토탈 금액
 	int book_price = cp + op + pp ;
  	
  	// 총 인원 
  	int paxsum = child + old + pax;
	
  	String cardno1 = request.getParameter("cardno1");
  	String cardno2 = request.getParameter("cardno2");
  	String cardno3 = request.getParameter("cardno3");
  	String cardno4 = request.getParameter("cardno4");
  	String cardsum = cardno1 +   cardno2  + cardno3 + cardno4;
  	
  	bvo.setBook_price(book_price);
	bvo.setBook_date(book_date);
	bvo.setPax(paxsum);
	bvo.setStatus(1);
	bvo.setShow_no(ShowNo);
	bvo.setShowmem_no(showmem_no);
	bvo.setCard_no(cardsum);
	
  	dao.insertOne(bvo);
  	
  	
  	CardVO cvo = new CardVO();
	
  	// 카드 잔액 구해오기
  	int card_cash = dao.cardlimit(cardsum);
  	
  	int cashminus =  card_cash - book_price;
  	int cvc = Integer.parseInt(request.getParameter("cvc"));
  	
  	String cardpw = request.getParameter("cardpw");
  	
  	if(card_cash >= book_price){
  		
  		cvo.setCard_cash(cashminus);
  		cvo.setCard_no(cardsum);
  		cvo.setCard_pw(cardpw);
  		cvo.setCvc(cvc);
  	
  		dao.updateOne(cvo);
   %>
   		out.println("<script>alert('<%= book_price %>원 결제가완료되었습니다.'); location.href='main.jsp';</script>");
   <%
  	}else {
  	%>
  		out.println("<script>alert('잔액이부족합니다'); location.href='reservation.jsp';</script>");
   	<%
  	}

  	dao.close();
 
	}
  %>
</body>
</html>
  