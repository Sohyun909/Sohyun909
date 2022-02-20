<%@page import="dao.UploadDAO"%>
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
	String[] clist = request.getParameterValues("ck");
	
	// dao 객체 생성
	UploadDAO dao = new UploadDAO();
	
	// dao.deleteList(clist);
	dao.deleteList(clist);
	
	// 자원반납
	dao.close();
	
	response.sendRedirect("showDelete.jsp");
	%>
</body>
</html>