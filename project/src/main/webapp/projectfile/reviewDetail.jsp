<%@page import="vo.ShowMemVO"%>
<%@page import="vo.ReviewVO"%>
<%@page import="dao.ReviewDAO"%>
<%@page import="vo.NoticeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관람후기</title>
<style>
	*{
		font-family: "G마켓 산스 TTF";
	}
	#container{
		width : 55%;
		margin : 0 auto;
	}
	#notice{
		width :250px;
		height : 150px;
		margin-top: 100px;
	}
	#title{
		font-size: 40px;
		color : black;
	}
	table, td{
		width : 800px;
		height : 500px;
		border-bottom : 1px solid black; 
	}
	img{
		width : 200px;
		height : 300px;
	}
	
	#top1{
		height : 50px;
		border-bottom : 2px solid black;
	}
	.top2{
		margin-right: 20px;
		color : #6F666F;
	}
	figcaption{
		font-size : 30px;
		padding : 20px;
	}
	#detail{
		vertical-align: top;
	}
	#image{
		width : 30%;
		height : 400px;
		display: inline;
	}
	
	#list{
		width : 800px;
		text-align: right;
		margin-bottom: 80px;
	}
	.list2{
		text-decoration: none;
		font-size: 25px;
		margin-left : 20px;
	}
	.list2:link{
		color : #3F0B9F;
	}
	.list2:visited{
		color : #3F0B9F;
	}
	.list2:hover{
		color : white;
		background : #3F0B9F;
	}
	.starImg{
		width : 20px;
		height : 20px;
	}
	#imgCol{
		width : 30%;
		border-right: 1px solid #C8C8C8;
	}
	#reviewCol{
		width : 70%;
		vertical-align: top;
	}
	#show_name{
		font-size: 12px;
		padding : 0;
		font-weight: bold;
		text-align: center;
	}
	#review{
		width : 500px;
		height : 450px;
		margin : 20px;
		font-weight: bold;
	}
	#comment{
		height : 300px;
	}
	.star{
		width: 17px;
		height: 17px;
		background : silver;
	}
	input[type=radio]{
		display: none;
	}
	#review2{
		width : 35px;
		height : 35px;
	}
	body{
		background-image: url("../images/bgh9.svg");
		background-size: 100%;
		background-repeat: no-repeat;
	}
	#showImg{
		width : 80%;
		margin-left: 24px;
	}
</style>
<script>
	function reviewDelete(){
		if(confirm("정말 게시글을 삭제하시겠습니까?")==true){
			document.getElementById("frm").submit();
		}else{
			return false;
		}
	}
</script>
</head>
<body>
	<%
		String n = request.getParameter("review_no");
		
		
		if(n==null){
			response.sendRedirect("review.jsp");
		}else{
			int review_no = Integer.parseInt(n);
			ReviewDAO dao = new ReviewDAO();
			//조회수증가
			dao.raiseHits(review_no);
			ArrayList<ReviewVO> list = dao.getOne(review_no);
			ReviewVO vo = list.get(0);
			// 전시회 이미지에 해당하는 전시회명
			String show_name = dao.getShowName(vo.getMain_img());
			
	%>
	<jsp:include page="header.jsp" />
	<div id="container">
	<div id="notice"><img src="../images/review.png" alt="" id="review2" /><span id="title">관람후기</span></div>
		<figure>
			<figcaption>
				<%=vo.getReview_title() %>
			</figcaption>
		<table>
			<tr>
				<td id="top1" colspan="2">
				<span class="top2">작성일 <%=vo.getReview_date() %></span>
				<span class="top2">작성자 <%=vo.getReview_writer() %></span>
				<span class="top2">조회수 <%=vo.getReview_hits() %></span>
				<span class="top2">별점</span>
				
					<%
					if(vo.getReview_rate()==1){
				%>
							<label><input type="radio" name="rating" id="star1" value="1"/><img src="../images/star.png" alt="" class="star" id="s1" style="background:#DCD551"/></label>
							<label><input type="radio" name="rating" id="star2" value="2"/><img src="../images/star.png" alt="" class="star" id="s2" style="background: silver"/></label>
							<label><input type="radio" name="rating" id="star3" value="3"/><img src="../images/star.png" alt="" class="star" id="s3" style="background: silver"/></label>
							<label><input type="radio" name="rating" id="star4" value="4"/><img src="../images/star.png" alt="" class="star" id="s4" style="background: silver"/></label>
							<label><input type="radio" name="rating" id="star5" value="5"/><img src="../images/star.png" alt="" class="star" id="s5" style="background: silver"/></label>
				<%		
					}else if(vo.getReview_rate()==2){
				%>		
							<label><input type="radio" name="rating" id="star1" value="1"/><img src="../images/star.png" alt="" class="star" id="s1" style="background:#DCD551"/></label>
							<label><input type="radio" name="rating" id="star2" value="2"/><img src="../images/star.png" alt="" class="star" id="s2" style="background:#DCD551"/></label>
							<label><input type="radio" name="rating" id="star3" value="3"/><img src="../images/star.png" alt="" class="star" id="s3" style="background: silver"/></label>
							<label><input type="radio" name="rating" id="star4" value="4"/><img src="../images/star.png" alt="" class="star" id="s4" style="background: silver"/></label>
							<label><input type="radio" name="rating" id="star5" value="5"/><img src="../images/star.png" alt="" class="star" id="s5" style="background: silver"/></label>
				<% 		
					}else if(vo.getReview_rate()==3){
				%>		
							<label><input type="radio" name="rating" id="star1" value="1"/><img src="../images/star.png" alt="" class="star" id="s1" style="background:#DCD551"/></label>
							<label><input type="radio" name="rating" id="star2" value="2"/><img src="../images/star.png" alt="" class="star" id="s2" style="background:#DCD551"/></label>
							<label><input type="radio" name="rating" id="star3" value="3"/><img src="../images/star.png" alt="" class="star" id="s3" style="background:#DCD551"/></label>
							<label><input type="radio" name="rating" id="star4" value="4"/><img src="../images/star.png" alt="" class="star" id="s4" style="background: silver"/></label>
							<label><input type="radio" name="rating" id="star5" value="5"/><img src="../images/star.png" alt="" class="star" id="s5" style="background: silver"/></label>
				<%		
					}else if(vo.getReview_rate()==4){
				%>		
							<label><input type="radio" name="rating" id="star1" value="1"/><img src="../images/star.png" alt="" class="star" id="s1" style="background:#DCD551"/></label>
							<label><input type="radio" name="rating" id="star2" value="2"/><img src="../images/star.png" alt="" class="star" id="s2" style="background:#DCD551"/></label>
							<label><input type="radio" name="rating" id="star3" value="3"/><img src="../images/star.png" alt="" class="star" id="s3" style="background:#DCD551"/></label>
							<label><input type="radio" name="rating" id="star4" value="4"/><img src="../images/star.png" alt="" class="star" id="s4" style="background:#DCD551"/></label>
							<label><input type="radio" name="rating" id="star5" value="5"/><img src="../images/star.png" alt="" class="star" id="s5" style="background: silver"/></label>
				<%		
					}else if(vo.getReview_rate() == 5){
				%>		
							<label><input type="radio" name="rating" id="star1" value="1"/><img src="../images/star.png" alt="" class="star" id="s1" style="background:#DCD551"/></label>
							<label><input type="radio" name="rating" id="star2" value="2"/><img src="../images/star.png" alt="" class="star" id="s2" style="background:#DCD551"/></label>
							<label><input type="radio" name="rating" id="star3" value="3"/><img src="../images/star.png" alt="" class="star" id="s3" style="background:#DCD551"/></label>
							<label><input type="radio" name="rating" id="star4" value="4"/><img src="../images/star.png" alt="" class="star" id="s4" style="background:#DCD551"/></label>
							<label><input type="radio" name="rating" id="star5" value="5"/><img src="../images/star.png" alt="" class="star" id="s5" style="background:#DCD551"/></label>
				<%		
					}
				%>		
				</td>
			</tr>
			 <tr>
			 	<td id="imgCol">
			 		<figure>
			 			<img src="../images/<%=vo.getMain_img() %>" alt="" id="showImg"/>
			 			<figcaption id="show_name"><%=show_name %></figcaption>
			 		</figure>
			 	</td>
			 	<td id="reviewCol"><div id="review"><%=vo.getReview_detail() %></div></td>
			 </tr>
		</table>
		</figure>
		<form action="reviewDeleteOk.jsp" method="GET" id="frm">
		<input type="hidden" name="reviewNo" value="<%=vo.getReview_no() %>" />
			<div id="list">
			<%
				ShowMemVO vo2 = (ShowMemVO)session.getAttribute("vo");
				
				
				if(vo2!=null){
					ArrayList<ShowMemVO> list2 = dao.getMemeberInfo(vo2.getId());
					ShowMemVO vo3 = list2.get(0);
					if(!vo2.getId().equals("admin")&& vo3.getShowmemNo() == vo.getShowmem_no()){
			%>
				<a href="reviewUpdate.jsp?review_no=<%=vo.getReview_no() %>" class="list2">수정</a>
				<a href="javascript:reviewDelete()" class="list2">삭제</a>
			<%
					}
				}
			%>
				<a href="review.jsp" class="list2">목록</a>
			</div>
		</form>
	</div>	
	<%	
		}
	%>
	<jsp:include page="footer.jsp" />
</body>
</html>