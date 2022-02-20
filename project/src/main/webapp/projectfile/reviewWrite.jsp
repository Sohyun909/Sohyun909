<%@page import="java.util.HashSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ReviewDAO"%>
<%@page import="vo.ShowMemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관람후기 작성</title>
</head>
<style>
	*{
		font-family: "G마켓 산스 TTF";
	}
	#container{
		/* background : skyblue; */
		width : 35%;
		margin : 0 auto;
		margin-top : 100px;
	}
	figure{
		margin : 0;
		padding : 10px;
	}
	figcaption{
		font-size : 30px;
		font-weight: bold;
	}
	table, th, td{
		border-collapse : collapse;
	}
	td{
		padding : 10px;
	}
	table{
		width : 600px;
		border-top: 1px solid black;
		border-bottom: 1px solid #C8C8C8;
	}
	#btn{
		text-align: center;
	}
	.button{
		background : #EFEFEF;
		margin-right: 15px;
		border : 1px solid #EFEFEF;
		border-radius: 3px;
	}
	.button:hover{
		background: #CAA7C7;
	}
	.star{
		width: 30px;
		height: 30px;
		background : silver;
	}
	#showImg{
		width : 200px;
		height : 300px;
		border-left: 1px solid #C8C8C8;
	}
	#show{
		width : 200px;
		height : 200px;
		margin-left: 10px;
	}
	#t1{
		border-top: 1px solid #C8C8C8;
		border-bottom: 1px solid #C8C8C8;
	}
	#t2{
		border-bottom: 1px solid #C8C8C8;
	}
	#wr{
		border: none;
	}
	input[type=radio]{
		display: none;
	}
	body{
		background-image: url("../images/bgh9.svg");
		background-size: 100%;
		background-repeat: no-repeat;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
		function writeCancel(){
		var cancel = document.getElementById("cancel");
			if(confirm("작성을 취소하시겠습니까?")==true){
				location.href = "review.jsp";
			}else{
				return false;
			}
		}
		
		
		function writeReview(){
			console.log("Test");
				if(document.getElementById("selectBox").value == ''){
					alert("관람평을 작성할 전시회를 선택하세요.");
					return;
				}else if($('input[name=rating]:checked').val() == null){
					alert("별점을 선택해주세요.");
					return;
				}else if(document.getElementsByName("title").value == ''){
					alert("제목을 입력하세요.");
					return;
				}else if(document.getElementById("det").value == ''){
					alert("내용을 입력하세요.");
					return;
				}else{
					document.getElementById("frm").submit();
				}
		}
		
		
		
	
	
	$(function(){
		$("#selectBox").on("change", function(){
			var opt = $("#selectBox option:selected").val();
			
			
			$.ajax({
				type : "GET",
				async : true,
				url : "getImage.jsp",
				dataType : "html",
				data : {"opt" : opt },
				success : function(response, status, request){
					$("#show").attr("src", response)
							  .css("width", "200px")
							  .css("height", "300px");
					$("#hid").val(response);
					
				},
				error : function(response, status, request){
					
				}
			})
		})
		
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
<body>
<%
	
	ShowMemVO vo = (ShowMemVO)session.getAttribute("vo");
	if(vo != null){
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ShowMemVO> list = dao.getMemeberInfo(vo.getId());
		ShowMemVO vo2 = list.get(0);
	
%>
	<jsp:include page="header.jsp" />
	<div id="container">
			<figure>
				<figcaption>
					관람후기 작성
				</figcaption>
			</figure>
		<form action="reviewWriteOk.jsp" method="GET" id="frm">
			<table>
				<tr>
					<td><strong>작성자</strong></td>
					<td><input type="text" name="writerId" value="<%=vo2.getId()%>" id="wr" readonly="readonly" size="10" /></td>
					<td rowspan="3" id="showImg">
						<img src="../images/exhibition.png" alt="" id="show"/>
						<input type="hidden" name="mainImg" value="" id="hid"/>
						<input type="hidden" name="showMem_no" value="<%=vo2.getShowmemNo()%>" />
					</td>
				</tr>
			
				<tr>
					<!--  목록(배열에 담은 후 for문 돌려서 콤보박스에 출력) -->
					<td colspan="2" id="t1"><strong>내가관람한 전시회</strong>
					
						<select name="showList" id="selectBox">
							<option value="">선택</option>
						<%
							// 현재 접속해있는 회원의 회원번호로 회원이 감상한 전시회번호를 얻어오고(booking 테이블에서) 그 얻어온 전시회번호로 전시회명을 얻어오는 코드
							ArrayList<String> list2 = dao.getShowName(dao.getShowNo(vo2.getShowmemNo()));
						
							// 중복제거
							HashSet<String> set = new HashSet<String>(list2);
							for(String x : set){
						%>
							<option value="<%=x%>"><%=x%></option>
						<%		
							}
						%>
							
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="3" id="t2">
						<div id="rate">
							<h3>별점</h3>
							<label><input type="radio" name="rating" id="star1" value="1"/><img src="../images/star.png" alt="" class="star" id="s1" /></label>
							<label><input type="radio" name="rating" id="star2" value="2"/><img src="../images/star.png" alt="" class="star" id="s2" /></label>
							<label><input type="radio" name="rating" id="star3" value="3"/><img src="../images/star.png" alt="" class="star" id="s3" /></label>
							<label><input type="radio" name="rating" id="star4" value="4"/><img src="../images/star.png" alt="" class="star" id="s4" /></label>
							<label><input type="radio" name="rating" id="star5" value="5"/><img src="../images/star.png" alt="" class="star" id="s5" /></label>
						</div>
					</td>
				</tr>
				<tr>
					<td><strong>제목</strong></td>
					<td colspan="2"><input type="text" name="title" id="" size="35" style="font-size: 25px" /></td>
				</tr>
				<tr>
					<td colspan="3"><textarea name="detail" id="det" cols="60" rows="20" style="font-size: 20px; resize: none"  ></textarea></td>
					
				</tr>
				<tr>
					<td colspan="3">
						
						<div id="btn">
							<input type="button" value="작성완료" id="sub" class="button" onclick="writeReview()"/>
							<input type="button" value="작성취소" id="cancel" class="button" onclick="writeCancel()"/>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%
		}else{
			response.sendRedirect("review.jsp");
		}
	%>
	<jsp:include page="footer.jsp" />
</body>
	
</html>