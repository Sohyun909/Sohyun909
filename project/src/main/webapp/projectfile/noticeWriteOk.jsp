<%@page import="dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String detail = request.getParameter("detail");
		String writer = request.getParameter("writer");
		String no = request.getParameter("admin_no");
		
		if(category !="" && title !="" && detail !=""){
			NoticeDAO dao = new NoticeDAO();
			int showmem_no = Integer.parseInt(no);
			String detail2 = detail.replaceAll("\r\n", "<br>");
			dao.insertOne(category, title, detail2, writer, showmem_no);
		}
			
	%>
		<script>
			window.onload = function(){
				alert("공지가 등록되었습니다.");
				location.href = "notice.jsp";
			}
		</script>
	
