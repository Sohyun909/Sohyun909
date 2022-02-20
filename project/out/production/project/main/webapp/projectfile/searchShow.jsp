<%@page import="vo.ShowVO"%>
<%@page import="dao.ShowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String searchName = request.getParameter("searchShow");

	if (searchName !=null ){
		ShowDAO dao = new ShowDAO();
		
		int showNo = dao.getShowNo(searchName);
		// 검색 후 리턴값이 0이 아니면 실행

		out.println(showNo);
		
	}
	
%>

			
	

		
	
		
	