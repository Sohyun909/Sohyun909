<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="mainShow">
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="3" aria-label="Slide 4"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="4" aria-label="Slide 5"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="../images/main1.png" class="d-block w-90" alt="..." onclick="location.href='showDetail.jsp?showNo=9'">
			</div>
			<div class="carousel-item">
				<img src="../images/main2.png" class="d-block w-90" alt="..." onclick="location.href='showDetail.jsp?showNo=5'">
			</div>
			<div class="carousel-item">
				<img src="../images/main4.png" class="d-block w-90" alt="..." onclick="location.href='showDetail.jsp?showNo=6'">
			</div>
			<div class="carousel-item">
				<img src="../images/main3.png" class="d-block w-90" alt="..." onclick="location.href='showDetail.jsp?showNo=8'">
			</div>
			<div class="carousel-item">
				<img src="../images/main5.png" class="d-block w-90" alt="..." onclick="location.href='showDetail.jsp?showNo=4'">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<div class="timeInfo">
		<img src="../images/clock.png" alt="" />
		<p>관람시간 &nbsp;&nbsp; 월/화/목/금/일 10:00 - 18:00 &nbsp;&nbsp; 수/토
			10:00 - 21:00</p>
	</div>
</div>