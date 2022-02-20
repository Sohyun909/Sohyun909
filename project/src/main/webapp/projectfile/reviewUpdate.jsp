<%@page import="vo.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관람후기 수정</title>
<style>
	*{
		font-family: "G마켓 산스 TTF";
	}
	#container{
		width : 45%;
		margin : 0 auto;
		margin-top : 100px;
		
	}
	#notice{
		width :300px;
		height : 150px;
		
	}
	#title{
		font-size: 40px;
		color : black;
	}
	table, td{
		width : 800px;
		height : 600px;
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
		width: 30px;
		height: 30px;
		background : silver;
	}
	input[type=radio]{
		display: none;
	}
	textarea{
		font-size: 20px;
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	function cancel(){
		if(confirm("수정을 취소하시겠습니까? 변경내용은 저장되지 않습니다.")==true){
			location.href = "review.jsp";
		}else{
			return false;
		}
	}
	function update(){
		if(document.getElementById("ut").value == ''){
			alert("제목을 입력하세요.");
			return;
		}else if(document.getElementById("ud").value == ''){
			alert("내용을 입력하세요.");
			return;
		}else if($('input[name=rating]:checked').val() == null){
			alert("별점을 선택해주세요.");
			return;
		}else if(confirm("수정을 완료하시겠습니까?")==true){
			document.getElementById("frm").submit();
		}else{
			return false;
		}
	}
$(function(){
	$("#star1").on("change", function(){
		$("#s1").css("background-color", "#DCD551");
		$("#s2").css("background-color", "silver");
		$("#s3").css("background-color", "silver");
		$("#s4").css("background-color", "silver");
		$("#s5").css("background-color", "silver");
	})
	$("#star2").on("change", function(){
		$("#s1").css("background-color", "#DCD551");
		$("#s2").css("background-color", "#DCD551");
		$("#s3").css("background-color", "silver");
		$("#s4").css("background-color", "silver");
		$("#s5").css("background-color", "silver");
	})
	$("#star3").on("change", function(){
		$("#s1").css("background-color", "#DCD551");
		$("#s2").css("background-color", "#DCD551");
		$("#s3").css("background-color", "#DCD551");
		$("#s4").css("background-color", "silver");
		$("#s5").css("background-color", "silver");
	})
	$("#star4").on("change", function(){
		$("#s1").css("background-color", "#DCD551");
		$("#s2").css("background-color", "#DCD551");
		$("#s3").css("background-color", "#DCD551");
		$("#s4").css("background-color", "#DCD551");
		$("#s5").css("background-color", "silver");
	})
	$("#star5").on("change", function(){
		$("#s1").css("background-color", "#DCD551");
		$("#s2").css("background-color", "#DCD551");
		$("#s3").css("background-color", "#DCD551");
		$("#s4").css("background-color", "#DCD551");
		$("#s5").css("background-color", "#DCD551");
	})
})
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
		<form action="reviewUpdateOk.jsp" method="GET" id="frm">
		<input type="hidden" name="reviewNo" value="<%=vo.getReview_no()%>"/>
			<div id="notice"><img src="../images/review.png" alt="" id="review2" /><span id="title">관람후기수정</span></div>
				<figure>
					<figcaption>
						<input type="text" name="updatedTitle" id="ut" value="<%=vo.getReview_title() %>" style="font-size: 1em;"/>
					</figcaption>
				<table>
					<tr>
						<td id="top1" colspan="2">
						<span class="top2">작성일 <%=vo.getReview_date() %></span>
						<span class="top2">작성자 <%=vo.getReview_writer() %></span>
						</td>
					</tr>
					 <tr>
					 	<td id="imgCol">
					 		<figure>
					 			<img src="../images/<%=vo.getMain_img() %>" alt="" id="showImg"/>
					 			<figcaption id="show_name"><%=show_name %></figcaption>
					 		</figure>
					 	</td>
					 	<td id="reviewCol">
						 	<div id="review">
								<textarea rows="17" cols="49" style="resize: none;" name="updatedDetail" id="ud"><%=vo.getReview_detail() %></textarea>
								<h3 style="margin: 5px">별점</h3>
									<label><input type="radio" name="rating" id="star1" value="1"/><img src="../images/star.png" alt="" class="star" id="s1"/></label>
									<label><input type="radio" name="rating" id="star2" value="2"/><img src="../images/star.png" alt="" class="star" id="s2"/></label>
									<label><input type="radio" name="rating" id="star3" value="3"/><img src="../images/star.png" alt="" class="star" id="s3"/></label>
									<label><input type="radio" name="rating" id="star4" value="4"/><img src="../images/star.png" alt="" class="star" id="s4"/></label>
									<label><input type="radio" name="rating" id="star5" value="5" /><img src="../images/star.png" alt="" class="star" id="s5"/></label>
							</div>
						</td>
					 </tr>
				</table>
				</figure>
				<div id="list">
				<a href="javascript:update()" class="list2">수정완료</a>
				<a href="javascript:cancel()" class="list2">취소</a>
			</div>
		</form>
	</div>	
	<%	
		}
	%>
	<jsp:include page="footer.jsp" />
</body>
</html>