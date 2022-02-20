<%@page import="java.util.ArrayList"%>
<%@page import="dao.ReviewDAO"%>
<%@page import="vo.ShowMemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지글 작성</title>
</head>
<style>
	*{
		font-family: "G마켓 산스 TTF";
	}
	#container{
		background : skyblue;
		width : 1000px;
		height : 1000px;
		background-color: white;
		margin : 0 485px;
		margin-top: 150px;
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
		width : 850px;
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
		width: 100px;
		height : 30px;
	}
	.button:hover{
		background: #CAA7C7;
	}
	#sub, #cancel{
		padding: 0px;
	}
	body{
		background-image: url("../images/bgh9.svg");
		background-size: 100%;
		background-repeat: no-repeat;
	}
</style>
<script>
	window.addEventListener('DOMContentLoaded',function(){
		var cancel = document.getElementById("cancel");
		cancel.onclick = function(){
			if(confirm("작성을 취소하시겠습니까? 내용은 저장되지 않습니다.")==true){
				location.href = "notice.jsp";
			}else{
				return false;
			}
		}
		
		var sub = document.getElementById("sub");
		sub.onclick = function(){
			
			if(document.getElementById("categoryBox").value == ''){
				alert("카테고리를 선택하세요.");
				return;
			}else if(document.getElementById("nTitle").value == ''){
				alert("제목을 입력하세요.");
				return;
			}else if(document.getElementById("nDetail").value == ''){
				alert("내용을 입력하세요.");
				return;
			}else{
				document.getElementById("frm").submit();
			}
		}
		
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
					알림글 작성
				</figcaption>
			</figure>
		<form action="noticeWriteOk.jsp" method="GET" id="frm">
		<input type="hidden" name="admin_no" value="<%=vo2.getShowmemNo()%>"/>
			<table>
				<tr>
					<td><strong>작성자</strong></td>
					<td><input type="text" name="writer" id="nWriter" value="<%=vo2.getName()%>" readonly="readonly" style="border: none;" /></td>
				</tr>
			
				<tr>
					<td><strong>구분</strong></td>
					<td>
						<select name="category" id="categoryBox">
							<option value="">선택</option>
							<option value="소식">소식</option>
							<option value="행사">행사</option>
							<option value="전시">전시</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><strong>제목</strong></td>
					<td><input type="text" name="title" id="nTitle" size="40" style="font-size: 30px;" /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><textarea name="detail" id="nDetail" cols="75" rows="20" style="font-size: 20px; resize: none;"  ></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="btn">
							<input type="button" value="작성완료" id="sub" class="button"/>
							<input type="button" value="작성취소" id="cancel" class="button"/>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%
		}else{
			response.sendRedirect("notice.jsp");
		}
	%>
	<jsp:include page="footer.jsp"/>
</body>
	
</html>