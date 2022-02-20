<%@page import="dao.ReviewDAO"%>
<%@page import="dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		// 이미지파일경로
		String main_img = request.getParameter("mainImg").trim();
		
		// 제목
		String title = request.getParameter("title");
		
		// 상세설명
		String detail = request.getParameter("detail");
		
		// 작성자
		String writer = request.getParameter("writerId");
		
		// 별점
		String rating = request.getParameter("rating");
		
		// 회원번호
		String no = request.getParameter("showMem_no");
		
		if(writer != null){
			int rate = Integer.parseInt(rating);
			int showMem_no = Integer.parseInt(no);
			String detail2 = detail.replaceAll("\r\n","<br>");
			ReviewDAO dao = new ReviewDAO();
			dao.insertReview(main_img, title, detail2, writer, rate, showMem_no);
		}
	%>
		<script>
			window.onload = function(){
				alert("후기 등록이 완료되었습니다.");
				location.href = "review.jsp";
			}
		</script>