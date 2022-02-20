<%@page import="dao.UploadDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%> 
<% response.setContentType("text/html; charset=UTF-8");%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	String b = request.getParameter("show_no");
	
	out.println(b);
	if( b != null) {
	int show_no = Integer.parseInt(b);
	
	
	// dao 객체 생성
	
	UploadDAO dao = new UploadDAO();
	
	dao.deleteOne(show_no);
	
	// dao.close
	dao.close();
	
	}
	
	response.sendRedirect("showDelete.jsp");
	
	%>
	
</body>
</html>