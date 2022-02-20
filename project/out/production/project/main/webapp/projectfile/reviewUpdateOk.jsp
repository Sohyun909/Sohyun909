<%@page import="dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
	<%
		String updatedTitle = request.getParameter("updatedTitle");
	
		String updatedDetail = request.getParameter("updatedDetail");
		
		String rating = request.getParameter("rating");
		
		String no = request.getParameter("reviewNo");
		
		
		if(no != null){
			int updatedRating = Integer.parseInt(rating);
			int reviewNo = Integer.parseInt(no);
			String detail = updatedDetail.replaceAll("\r\n", "<br>");
		ReviewDAO dao = new ReviewDAO();
		dao.updateReview(updatedTitle, detail, updatedRating, reviewNo);
		}
	%>
		<script>
			window.onload = function(){
				alert("수정이 완료되었습니다.");
				location.href = "review.jsp";
			}
		</script>