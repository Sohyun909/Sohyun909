<%@page import="dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<%
		String reviewNo = request.getParameter("reviewNo");
		if(reviewNo != null){
			int review_no = Integer.parseInt(reviewNo);
			ReviewDAO dao = new ReviewDAO();
			dao.deleteReview(review_no);
		}
	%>
		<script>
			window.onload = function(){
				alert("삭제가 완료되었습니다.");
				location.href = "review.jsp";
			}
		</script>