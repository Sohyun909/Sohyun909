<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {margin:0; padding: 0;}

li {list-style: none;}

.slide_Wrapper {
	position:relative;
	width: 800px;
	margin: 0 auto;
	height: 200px;
	overflow: hidden;
}

.slides{
	position: absolute;
	left:0;
	top: 0;
}

.slides.animated {
	transition: 0.5s ease-out;
}

.slides li{
	width: 200px;
	height: 200px;
	background: tan;
	float: left;
}

.slides li:not(:last-child){
	margin-right: 30px;
}

.controls{
	text-align: center;
	margin-top: 50px;
}

.controls span {
	background: black;
	color: white;
}
</style>
<script type="text/javascript">
	window.onload=function(){
		var slides = document.querySelector(".slides"),
			slide = document.querySelectorAll(".slides li"),
			currentIdx = 0,
			slideCount = slide.length,
			slideWidth = 200,
			slideMargin = 30,
			preBtn = document.querySelector(".prev"),
			nextBtn = document.querySelector(".next");
		
	makeClone();
	
	function makeClone(){
		for (var i=0; i<slideCount; i++){
			var cloneSlide = slide[i].cloneNode(true);
			cloneSlide.classList.add("clone");
			slides.appendChild(cloneSlide);
		}
		
		for (var i = slideCount-1; i>=0; i--){
			var cloneSlide = slide[i].cloneNode(true);
			cloneSlide.classList.add("clone");
			slides.prepend(cloneSlide);
		}
		updateWidth();
		setInitialPos();
		
		setTimeout(function(){ 
			slides.classList.add('animated');
			
		},100);
	}
	
	// 전체 슬라이드 길이 구하기
	function updateWidth(){
		var currentSlides = document.querySelectorAll(".slides li");
		var newSlideCount = currentSlides.lentgh;
		
		var newWidth = (slideWidth + slideMargin)*newSlideCount-slideMargin+"px";
		slides.style.width = newWidth;
	
	}
	
	// 복사 슬라이더 중 중간 슬라이드로 위치 지정
	function setInitialPos(){
		var initialTranslateValue = -(slideWidth + slideMargin)*slideCount;
		slides.style.transform="translateX("+initialTranslateValue+"px)";
	}
	
	nextBtn.addEventListener("click", function(){
		moveSlide(currentIdx +1);
	});
	preBtn.addEventListener("click", function(){
		moveSlide(currentIdx -1);
	});
		
	function moveSlide(num){
		slides.style.left =-num*(slideWidth + slideMargin)+"px";
		currentIdx=num;
		console.log(currentIdx, slideCount);
		
		if(currentIdx==slideCount || currentIdx==-slideCount){
			setTimeout(function(){
				
				slides.classList.remove("animated");
				slides.style.left="0px";
				currentIdx = 0;
			},500);
			setTimeout(function(){
				slides.style.add("animated");
			})
		}
	}		
	}
</script>
</head>
<body>
	
	<div class="slide_Wrapper">
		<ul class="slides">
			<li><img src="../" alt="" /></li>
			<li>silde2</li>
			<li>silde3</li>
			<li>silde4</li>
			<li>silde5</li>
		</ul>
	</div>
	
	<p class="controls">
		<span class="prev">prev</span>
		<span class="next">next</span>
	</p>

</body>
</html>