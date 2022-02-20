<%@page import="vo.ShowMemVO"%>
<%@page import="vo.UploadVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UploadDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<link rel="stylesheet" href="../css/introInfo.css" />
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/footer.css" />
<style>
* {font-family:"G마켓 산스 TTF"}
.grid-container {
    display: grid;
    width: 90%;
    margin: 40px auto;
    height: 100%;
    grid-gap: 30px;
    grid-template-rows: 0% 100% 0%;
    grid-template-areas:
        "header header header"
        "main main main "
        "footer footer footer";
    place-content: start space-evenly;
}

.bodyContainer {background-image: url("../images/bgh10.svg");
		background-size:100%;
		background-repeat: no-repeat;
} 

img {
	width: 100px;
	hegiht: 100px;
}

table {
  width: 100%;
}

table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: justify:
} 

</style>
<script type="text/javascript">
	function checkAll(){
		var ck = document.getElementById("check");
		// 체크된 checkbox를 ck로 받아 클릭하면 익명 함수 실행
			var items = document.getElementsByName('ck');
			console.dir(items);
			for (var i = 0; i < items.length; i++) {
				var box = items[i];
				console.dir(box);
				box.checked = ck.checked;
			}
		}
	
	function register(){
		location.href = "showUpload.jsp";
		
	}	

</script>
</head>
<body>
	<%
	UploadDAO dao = new UploadDAO();
	ArrayList<UploadVO> list = dao.getAll();
	dao.close();
	Object obj = session.getAttribute("vo");
	String id = "";
	if (obj != null) {
		// 로그인 되어 있는 상태
		ShowMemVO m = (ShowMemVO) obj;
		id = m.getId();
	}
	%>
	<form action="showDeleteList.jsp" method="get">
		<div class="bodyContainer">
		<jsp:include page="header.jsp" />
		<br><br><br><br><br><br>
		<div class="grid-container">
		<div class="main">
				<input type="button" value="등록" onclick="register()" style="border: 1px solid black; border-radius: 3px; width : 35px; height: 33px; padding : 0px; font-size: 16px; font-weight: normal;"  />
				<input type="submit" value="삭제">
				<table>
					<tr>
						<%
						if (id.equals("admin")) {
						%>
						<th><input type="checkbox" name="" id="check" onclick="checkAll()"></th>
						<%
						}
						%>
						<th>전시번호</th>
						<th>전시명</th>
						<th>작가</th>
						<th>전시시작일</th>
						<th>전시종료일</th>
						<th>전시실</th>
						<th>관람료</th>
						<th>연령</th>
					
					<%
					/* out.println(list); */
					for (UploadVO vo : list) {
					%>

					<tr>
						<%
						if (id.equals("admin")) {
						%>

						<td><input type="checkbox" name="ck"
							value="<%=vo.getShow_no()%>"></td>
						<%
						}
						%>
						<td><%=vo.getShow_no()%></td>
						<td><%=vo.getShow_name()%></td>
						<td><%=vo.getShow_writer()%></td>
						<td><%=vo.getStartday()%></td>
						<td><%=vo.getEndday()%></td>
						<td><%=vo.getShow_place()%></td>
						<td><%=vo.getShow_price()%></td>
						
						<td><%=vo.getShow_agelimit()%></td>
					
					</tr>

					<%
					}
					%>
				</table>
				</div>
				</div>
				</div>
				</form>	
			<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>