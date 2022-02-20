<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발자취</title>
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

.history_wrap {
    margin: 0;
    background: url(../images/sub/bg_history_line.png) repeat-y center top;
}

.history_wrap ul li.left .wrap:after {
	left: -18px;}

.history_wrap ul li.left .wrap:after {
	content: '';
	display: inline-block;
	width: 36px;
	height: 36px;
	position: absolute;
	left: 890px;
	right: initial;
	top: 50%;
	margin-top: -18px;
	background: url(../images/bg_history_round.png) no-repeat;
	z-index: 2;
}

.history_wrap ul li .wrap div
{margin:0 50px 0 0; padding:0 40px 45px 50px;}
.history_wrap ul li.left .wrap div{margin: 100px 1050px 150px 250px ;} 
.history_wrap ul li.right .wrap div{margin: 0 0 0 -10px;}

.history_wrap ul li .wrap div {
	position: relative;
	background: #f5f5f5;
	margin: 0 0 0 37px;
	padding:0 40px 45px 50px;;
}

.history_wrap ul li.left .wrap:after{left:100px;}

.history_wrap {
	overflow: auto;
	position: relative;
	margin-right: 30px;
	margin-left: 90px;
	background: url(../images/bg_history_line.png) repeat-y 30px top;
}

.history_wrap ul li.left .wrap:after {
	content: '';
	display: inline-block;
	width: 36px;
	height: 36px;
	position: absolute;
	left: 885px;
	top: 50%;
	margin-top: -9px;
	background: url(../images/bg_history_round.png) no-repeat;
	background-size: 36px 36px;
	z-index: 2;
}

.history_wrap ul li.right .wrap div:before{
content:'';
display: inline-block;
position: absolute;
left:-8px; 
top:50%;
width:36px;
height:36px;
margin-top: -4px;
background: url(../images/bg_history_round.png) no-repeat;
background-size: 18px 18px;} 

.history_wrap ul li.right .wrap div:before{
width:36px; 
height:36px; 
left:-60px; 
background: url("../images/bg_history_round.png") no-repeat;}


} /* media all and end  */


.history_wrap {
	overflow: hidden;
	position: relative;
	margin: 0 auto;
	background: url(../images/bg_history_line.png) repeat-y 30px top;
}

.history_wrap ul li.right .wrap div:after, .history_wrap ul li .wrap div:after {
content: '';
display: block;
width: 100%;
clear: both;
overflow : hidden;}

div {
	display: block;
	margin: 0;
	padding: 0;
	vertical-align: baseline;
}



ul {
	display: block; 
	list-style-type : disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.history_wrap:after {
	content: '';
	position: absolute;
	left: 10px;
	bottom: 5px;
	margin-left: -5px;
	display: inline-block;
	width: 10px;
	height: 70px;
	background: #fff;
	z-index: 1;
}

.history_wrap>ul>li {
	position: relative;
	display: block;
	margin-top: 21px;
}

ul, li {
	list-style: none outside none;
	padding: 0;
	margin: 0;
}

.title_area {
	text-align: center;
}

.sub_title span {
	display: inline-block;
	border-top: 1px solid #0a1923;
	padding: 15px 1px 0;
}


.history_wrap ul li.right .wrap div:after, .history_wrap ul li.wrap div:after
{content:'';
 display:block;
 width:100%;
 clear:both;
 overflow:hidden;}	
.history_wrap ul li.right .wrap{float:right; position: relative; width:50%;}
.history_wrap ul li.2000 .wrap{margin-top:-150px;}
.history_wrap ul li.2005 .wrap{margin-top:100px;}
.history_wrap ul li.2010 .wrap{margin-top:-10px;}
.history_wrap ul li.2015 .wrap{margin-top:100px;}
.history_wrap ul li.2020 .wrap{margin-top:-20px;}
.history_wrap ul li strong{padding: 33px 0 0 0; font-size:1.875em;}
.history_wrap ul li em{padding: 20px 0 10px 0; font-size:100%;}
.history_wrap ul li em + em {padding-top:0;}

.history_text {
	color: black;
	font-weight: bold;
	position: relatvie;
	padding-left: 210px;}	
	
</style>
</head>
<body>
	<div class="bodyContainer">
	<jsp:include page="header.jsp" />
	<div class="grid-container">
		<div class="main">
			<div class="title_area">
				<h3 class="sub_title">
					<span>연혁</span>
				</h3>
			</div>
			<br><br>
			<div class="history_text">
			<p>2000년 종로3가에서 개관한 중아미술관은 국제적 규모의 시설과 야외조각장을 겸비한 미술관을 완공, 개관함으로써 한국 미술문화의 새로운 장을 열게 되었습니다.</p> 
			<p>2005년 근대미술관으로서 특화된 역할을 수행하고자 전시실을 비롯한 프로젝트갤러리, 영화관, 다목적홀 등 복합적인 시설을 완공함으로써 다양한 활동을 통해 한국의 과거, 현재, 미래의 문화적 가치를 구현하고 있습니다. </p>
			<p>2020년 개관 20주년을 맞이하여 기념식을 개최하고 미술문화를 나누는 세계 속 열린 미술관으로 발돋움하고 있습니다. 보다 더 나은 전시와 서비스로 나아갈 것을 약속드립니다. 감사합니다.        <p>
			</div>
			<br><br><br>
			<div class="history_wrap">
				<ul>
					<li class="right 2000">
						<div class="wrap">
							<div>
								<strong>2000</strong><br><em>중아미술관 1-2관 개관
								</em>
							</div>
						</div>
					</li>
					<br>
					<li class="left 2005">
						<div class="wrap">
							<div>
								<strong>2005</strong><br><em>중아미술관 3-4관 개관<br>
									프로젝트 갤러리, 영화관, 다목적 홀 등 복합시설 완공</em>
							</div>
						</div>
					</li>

					<br>
					<li class="right 2010">
						<div class="wrap">
							<div>
								<strong>2010</strong><br><em>중아미술관 5-6관 개관<br> 개관 10주년 행사 '중아미술관
									10년을 돌아보며'</em>
							</div>
						</div>
					</li>
					<br>
					<li class="left 2015">
						<div class="wrap">
							<div>
								<strong>2015</strong><br><em>중아미술관 7-8관 개관</em>
							</div>
						</div>
					</li>
					<br>
					<li class="right 2020">
						<div class="wrap">
							<div>
								<strong>2020</strong><br><em>중아미술관 9-10관 개관<br> 
								개관 20주년 행사 '지금까지 20년, 앞으로 20년'</em>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	</div>
	<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
	<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>