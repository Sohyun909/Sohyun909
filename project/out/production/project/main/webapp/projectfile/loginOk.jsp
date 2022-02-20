<%@page import="vo.ShowMemVO"%>
<%@page import="dao.ShowMemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%
		
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		ShowMemDAO dao = new ShowMemDAO();
		ShowMemVO vo = dao.checkingUser(id, pwd);
		boolean result = false;
		
		if (vo!=null){
			session.setAttribute("vo", vo);
			result=true;
			
		}else if (vo==null){
			result=false;
		}
			out.println(result);
	%>
