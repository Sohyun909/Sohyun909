<%@page import="vo.ShowVO"%>
<%@page import="dao.ShowDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 전시</title>
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/footer.css" />
<style>

	#container {
		width: 1000px;
		margin: auto;
		margin-top: 2rem;
	}
	
	#bottom-page-div {
 		margin-bottom: 0px;
		margin-top: 60px; 
		text-align: center;
	}
	
	img{
		width: 270px;
		height: 330px;
	}

	#date {
		/* text-align: center; */
		margin-top: 5px;
		margin-bottom: 2px;
		font-weight: 300;
	}
	
	.info {
		width: 270px;
		height: 400px;
		padding: 0px;	
		margin: 25px;
		display: inline-block;
	}
	
	.show-name {
		font-size: 18px;
		font-weight: 500;
		height: 54px;
		margin-top: 10px;
	}
	
	.page-button {
	    border: 1px solid black;
	    padding: 14px 20px;
	    text-decoration: none;
	    color: black;
	    font-size: 15px;
	}
	
	h1 {
		text-align: center;
		padding-bottom: 1rem;

	}
	
body{
		background-image: url("../images/bgh9.svg");
		background-size:100%;
		background-repeat: no-repeat;
	}

	
	.current-page {
		color: white;
		background: black;
	}
	
	
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="container">
		<h1>현재 전시</h1>
		<div>
			<%
				// 전시정보 출력
				ShowDAO dao = new ShowDAO();
		
				// 총 게시물수 
				int totalCount = dao.getTotal();
			
				// 한 페이지당 게시물 건수
				int perPage = 9;
			
				int totalPage = (totalCount % perPage==0)? totalCount/perPage : totalCount/perPage+1;
				int currentPage = 0;
			
				// 현재 페이지
				String cp = request.getParameter("cp");
				if(cp == null){
					currentPage = 1;
				} else {
					currentPage = Integer.parseInt(cp);
				}
			
			
				int startNo = (currentPage -1) * perPage +1;
				int endNo = currentPage * perPage;
				
				ArrayList<ShowVO> list = dao.getAll(startNo, endNo);
				
				
				for (ShowVO vo : list){
					String startDate = null;
					String endDate = null;
					String mainImg = "../images/error.png";
					String showName = null;
					
					try {
						startDate = vo.getStartDate().substring(0, 10);
						endDate = vo.getEndDate().substring(0, 10);
						if(vo.getMainImg().equals("null")) {
							mainImg = "../images/error.png";
						}
						else {
							mainImg = vo.getMainImg();
						}
						showName = vo.getShowName();
						
					} catch(NullPointerException e) {}
				
			%>
			
			<div class="info">
				<a href="showDetail.jsp?showNo=<%=vo.getShowNo()%>"><img src="<%=mainImg %>" alt="<%=showName %>" /></a>
				<p class = "show-name"><%=showName %></p>
				<p id = "date"><%=startDate %> ~ <%=endDate %></p>
			</div>
				<%
					
					}
				%>		
		</div>
		<div id="bottom-page-div">
			<div>
				<%
					for(int i = 1; i<= totalPage; i++){
						if(i == currentPage) {
							%>
							<a class="page-button current-page" href = "now.jsp?cp=<%=i %>"><%=i %></a>
						<%
						}
						else {
							%>
							<a class="page-button" href = "now.jsp?cp=<%=i %>"><%=i %></a>
							<%
						}
					}
						%>
			
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>