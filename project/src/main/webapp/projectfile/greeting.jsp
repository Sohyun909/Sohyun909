<%@page import="vo.ShowMemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>인사말</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/introInfo.css" />
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/footer.css" />
<link rel="stylesheet" href="../css/bootstrap.css" />
<style>
* {font-family:"G마켓 산스 TTF"}

.bodyContainer {background-image: url("../images/bgh9.svg");
		background-size:100%;
		background-repeat: no-repeat;
} 

.title_area {
	text-align: center;
}

.sub_title span {
	display: inline-block;
	border-top: 1px solid #0a1923;
	padding: 15px 1px 0;
}

.intro_text {
	font-size: 1.5em;
	font-weight: bold;
	margin: 0;
	padding: 0;
}

@media ( min-width : 1024px) {
.intro_text span:before {
	top:10px ;
	height:20px ;}
}

.intro_text span:before {
	content: '';
	position: absolute;
	display: block;
	height: 12px;
	top: 6px;
	left: -10px;
	width: 2px;
	background-color: #e94040;
}

.intro_text_row:before {
	content: '';
	position: absolute;
	display: block;
	height: calc(100% - 4px);
	top: 4px;
	left: 0;
	width: 1px;
	background-color: #e1e1e1;
}

.intro_text span {
	position: relative;
}

.intro_text_row {
	position: relatvie;
	padding-left: 150px;
}

.intro_text em {
	color: #e94040;
}

.main_area {
	font-weight: bold;
	position: relatvie;
	padding-left: 150px;
	background-color: light-grey;
}

</style>
</head>

<body>
		<div class="bodyContainer">
		<jsp:include page="header.jsp" />
		<div class="grid-container">
		<div class="main">
			<div class="title_area">
				<h3 class="sub_title">
					<span>인사말</span>
				</h3>
				<br> <br> <br>
			</div>
			<div class="intro_text_row">
				<div class="intro_text">
					<em>중아미술관</em> 홈페이지를<br><span> 방문해주셔서 감사합니다.</span>
				</div>
			</div>
			<div class="main_area">
				<br> <br> <br> 
				<p>안녕하십니까</p>
				<br>
				<p>중아미술관은 2000년 개관 이래 한국 현대미술의 역사와 자취를 함께하며 대한민국을 대표하는 문화공간으로 자리
					잡아 왔습니다.</p>
				<br>
				<p>중아미술관은 2000년 1-2관, 2005년 3-4관, 2010년 5-6관, 2015년 7-8관, 2020년
					9-10관 개관으로 10관 체계를 만들었으며, 10관은 유기적이면서도 각각의 색깔을 지니고 있습니다.</p>
				<br>
				<p>
					서예, 문학 등 영역 확장을 통한 한국 근대미술의 전문 1-2관, 한국 현대미술의 얼굴이자, 동시대 미술의 종합관인
					3-4관, <br> 건축, 공예, 판화, 디자인에 이르는 미술사의 지평 확장과 어린이미술관 강화를 통한 연구중심·가족중심 미술관
					5-6관, <br> 미술관 소장품 생애 주기로서 수장, 연구, 보존, 전시에 이르는 선순환 체계를 만드는
					7-8관, 특별전시회를 위한 모듈식 전시공간 9-10관까지.
				</p>
				<br>
				<p>중아미술관은 지난 20년 축적된 역사를 바탕으로 미술계의 의견을 두루 모아서, 2021년 ‘더 새로운 도약의
					10년’을 기약하겠습니다.</p>
				<br>
				<p>전문가 눈높이에서는 미술계 담론을 생산하는 본거지 역할을 하는 동시에 국민들에게는 미술사를 바탕으로 흥미롭고
					의미있는 전시와 창의적 교육의 산실이 되겠습니다.</p>
				<br>
				<p>이웃집 같은 친근한 미술관! 친근하고, 개방적인 미술관! 체계적이고 신바람 나는 미술관으로 여러분을
					만나겠습니다.</p>
				<br>
				<p>감사합니다.</p>

				<p>중아미술관 H T A</p>
			</div>
		</div>
	</div>
	</div>
	<br><br><br><br><br><br>
	<jsp:include page="footer.jsp"></jsp:include>
				
</body>
</html>