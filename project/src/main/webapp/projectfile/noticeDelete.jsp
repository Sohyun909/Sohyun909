<%@page import="dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		String[] cList = request.getParameterValues("ck");
		
		if(cList != null){
			NoticeDAO dao = new NoticeDAO();
			dao.deleteList(cList);
		}
	%>
	<script>
		window.onload = function(){
			alert("삭제가 완료되었습니다.");
			location.href = "notice.jsp";
		}
	</script>