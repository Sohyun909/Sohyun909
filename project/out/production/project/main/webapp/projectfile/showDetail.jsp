<%@page import="vo.ShowVO"%>
<%@page import="dao.ShowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="widtd=device-widtd, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/footer.css" />
<style>

	#conatiner {
		margin-top: 2rem;
	}

	table {
		margin: auto;
		margin-top: 5rem;
	}
	
	#table-div {
		margin:auto;
		width:700px;
	}
	
	#showDetail-div {
		margin:auto;
		width:1000px;
		margin-top: 3rem;
	}

	h3 {
		text-align: center;
		padding-top: 3rem;
   		padding-bottom: 2rem;
	}
	
	.img-transform {
		width:445px!important;
		height:520px!important;
		margin: 0px auto;
	}
	
	.button-transform {
		width: 3rem;
		height: 3rem;
	}
	
	#slide-button {
		bottom:-50px;
	}
	
body{
		background-image: url("../images/bgh9.svg");
		background-size:100%;
		background-repeat: no-repeat;
	}


</style>

</head>
<body>
	<jsp:include page="header.jsp" />
	<%
	
		String n = request.getParameter("showNo");
		// out.println(n);
		String startDate = null;
		String endDate = null;
	
		if (n!=null && !n.equals("")){

			int showNo = Integer.parseInt(n);
			ShowDAO dao = new ShowDAO();
			ShowVO vo = dao.getOne(showNo);
		
			startDate = vo.getStartDate().substring(0, 10);
			endDate = vo.getEndDate().substring(0, 10);
	
	%>
	<div id = "container">
		<h3><%= vo.getShowName() %></h3>
	
		<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
		  <div class="carousel-indicators" id = "slide-button">
		    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
		    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="3" aria-label="Slide 4"></button>
		    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="4" aria-label="Slide 5"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active" data-bs-interval="2000">
		      <img src="<%= vo.getMainImg() %>" class="d-block img-transform" alt="...">
		    </div>
		    <div class="carousel-item" data-bs-interval="2000">
		      <img src="<%= vo.getSubImg1() %>" class="d-block img-transform" alt="...">
		    </div>
		    <div class="carousel-item" data-bs-interval="2000">
		      <img src="<%= vo.getSubImg2() %>" class="d-block img-transform" alt="...">
		    </div>
		    <div class="carousel-item" data-bs-interval="2000">
		      <img src="<%= vo.getSubImg3() %>" class="d-block img-transform" alt="...">
		    </div>
		   	<div class="carousel-item" data-bs-interval="2000">
		      <img src="<%= vo.getSubImg4() %>" class="d-block img-transform" alt="...">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon button-transform" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
		    <span class="carousel-control-next-icon button-transform" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>

		<div id = "table-div">
			<table class = "table">
				<tr>
					<th scope = "row">전시 기간</th>
					<td><%= startDate %> ~ <%= endDate %></td>
				</tr>	
				<tr>
					<th scope = "row">전시 장소</th>
					<td><%= vo.getShowPlace() %></td>
				</tr>
				<tr>	
					<th scope = "row">참여 작가</th>
					<td><%= vo.getShowWriter() %></td>
				</tr>
				
				<tr>	
					<th scope = "row">관람료</th>
					<td><%= vo.getShowPrice() %></td>
				</tr>
				<tr>
					<th scope = "row">관람연령</th>
					<td><%=vo.getShowAgelimit() %></td>
				</tr>	
			</table>
		</div>	
		<div id = "showDetail-div">	
			<p><%= vo.getShowDetail() %></p>
		</div>	
	</div>
	
	<%
		}
	%>
		<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>