// 메인페이지 전시목록 자동슬라이드 js


	var showList;
	var showImg;
	var currentIdx;
	var slideMargin;
	var slideWidth;
	var slideCount;
	var preBtn;
	var nextBtn;
	
	
	window.addEventListener('DOMContentLoaded', function(){
		showList = document.querySelector(".showList");
		showImg = document.querySelectorAll(".showList li");
		currentIdx = 0;
		slideMargin = 35;
		slideWidth = 270;
		slideCount = showImg.length;
		preBtn = document.querySelector(".previous");
		nextBtn = document.querySelector(".next");
		
		makeClone();
		
		// 다음 버튼 클릭시 슬라이드 왼쪽이동
		nextBtn.onclick = function() {
			moveSlide(currentIdx +1);
			
		}
		// 이전 버튼 클릭시 슬라이드 오른쪽 이동
		preBtn.onclick = function() {
			moveSlide(currentIdx -1);
			
			
		}
		
		
	
	


	// showImg 무한반복 슬라이드 생성을 위해 원본이미지 앞뒤로 사진 복사
	function makeClone() {
		
		// 원본이미지 뒤쪽으로 복사
		for (var i = 0; i < slideCount; i++) {
			var cloneSlide = showImg[i].cloneNode(true);
			cloneSlide.classList.add("clone");
			showList.appendChild(cloneSlide);
		}
		// 원본이미지 앞쪽으로 복사
		for (var i = slideCount - 1; i >= 0; i--) {
			var cloneSlide = showImg[i].cloneNode(true);
			cloneSlide.classList.add("clone");
			showList.prepend(cloneSlide);
		}
		
		updateWidth();
		setInitialPos();
		
		setTimeout(function(){ 
			showList.classList.add('animated');
			
		},100);

	}
	
	// 전체 슬라이드 길이 구하기
	function updateWidth() {
		 var currentSlides = document.querySelectorAll(".showList li");
		 var newSlideCount = currentSlides.length;
		 
		 var newWidth = (slideWidth + slideMargin)*newSlideCount-slideMargin+"px";
		 showList.style.width = newWidth;
	 } 

	 	
	// 복사 슬라이더 중 중간 슬라이드로 위치 지정
	function setInitialPos(){
		
		
		var initialTranslateValue = -(slideWidth + slideMargin)*slideCount;
			showList.style.transform="translateX("+initialTranslateValue+"px)";
		}
		
	
	// 슬라이드 움직이기	
	function moveSlide(num){
		
		showList.style.left =-num*(slideWidth + slideMargin)+"px";
			currentIdx=num;
			// console.log(currentIdx, slideCount);
			
			if(currentIdx==slideCount || currentIdx==-slideCount){
				
				setTimeout(function(){
					showList.classList.remove("animated");
					showList.style.left="0px";
					currentIdx = 0;
				},500);
				
				setTimeout(function(){
					showList.classList.add("animated");
				},600);
			}
		}	
	
		
	var timer = undefined;
	
	// 자동 슬라이드 
	function autoSlide(){
		if(timer == undefined){
			timer = setInterval(function(){
				moveSlide(currentIdx +1);
			},3000);
		}
		
	}
	autoSlide();
	
	// 슬라이드 멈추기
	function stopSlide(){
		clearInterval(timer);
		timer = undefined;
	}
	
	// 마우스가 올라오면 오토 슬라이드 멈추기
	showList.addEventListener("mouseenter", function(){
		stopSlide();
	});
	showList.addEventListener("mouseleave", function(){
		autoSlide();
	});
	
	
	})
	