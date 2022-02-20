<%@page import="dao.ShowMemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		boolean result = false;
		
		if(id!=null){
		ShowMemDAO dao = new ShowMemDAO();
		result = dao.checkingId(id);
			
		}
		
		out.println(result);

		
%>