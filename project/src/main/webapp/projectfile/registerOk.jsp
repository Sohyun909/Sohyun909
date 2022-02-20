<%@page import="vo.ShowMemVO"%>
<%@page import="dao.ShowMemDAO"%>
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
	
		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		String b = request.getParameter("birth");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email")+"@"+request.getParameter("domain");
		String phone = request.getParameter("phone");
		String addrs = request.getParameter("full-addrs");
		
		String replace = b.replaceAll("-", "");
		String birth = replace.substring(2, 8);
		
		ShowMemDAO dao = new ShowMemDAO();
		ShowMemVO vo = new ShowMemVO(0, birth, id, pwd, gender, email, phone, addrs, name);
		
		dao.insertOne(vo);
		
		response.sendRedirect("login.jsp");
	%>

</body>
</html>