<%@page import="dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	request.setCharacterEncoding("UTF-8");
    
    	String show_name = request.getParameter("opt");
    	if(show_name != null){
    		ReviewDAO dao = new ReviewDAO();
    		String main_img = dao.getShowImg(show_name);
    		
    		out.println(main_img);
    	}
    %>