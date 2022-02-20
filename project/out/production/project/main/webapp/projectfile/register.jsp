<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" href="../css/header.css?after" />
<link rel="stylesheet" href="../css/footer.css" />
<style type="text/css">
	* {
		font-family: "G마켓 산스 TTF";
	}

	body{
		background-image: url("../images/bgh9.svg");
		background-size:100%;
		background-repeat: no-repeat;
	}
	
	.regiContainer {
		width: 70%;
		margin: 0px auto;
		padding-left: 300px;
		padding-top: 50px;
	
	}
	
	.info {
		text-align: left;
		margin: 50px auto;
		padding-left: 10vw;
	}
	
	h1 {
		margin-bottom: 50px;
		padding-bottom: 50px;
		padding: 10px 5px;
		padding-right: 150px;
		
	}
	
	
	label{
		padding: 7px 5px;
		font-weight: bold;
	}
	
	
	
	input[type="text"], input[type="password"], input[type="date"] {
	 	width: 390px; 
		height: 35px;
		padding: 5px 15px;
		margin-bottom: 30px;
		margin-top: 10px;
		border: 1px solid darkgrey;
		border-radius: 5px;
		font-family: "고딕체";
	}
	
	input[name="email"], input[name="domain"]  {
		width: 130px;
		height: 35px;
		margin-top: 10px;
		padding: 5px 10px;
	}
	
	input[name="addrs"]{
		height: 35px;
		width: 130px;
		padding: 5px 10px;
		margin-bottom: 10px;
	}
	
	select {
		height: 30px;
		margin-top: 5px;
		border: 1px solid darkgrey;
		border-radius: 5px;
	}
	
	.info input[type="button"] {
		padding: 5px 10px;
		margin-left: 10px;
		border: none;
		border-radius: 5px;
		color: white;
		font-weight: bold;
		background: black;
		cursor: pointer;
	}
	
	input[type="radio"]{
		margin-bottom: 30px;
		margin-top: 15px;
		margin-right: 10px
	}
	
	.complete input[type="button"] {
		padding: 15px 20px;
		margin-left: 20px;
		border: none;
		border-radius: 5px;
		color: white;
		font-weight: bold;
		background: black;
	}
	
	.complete {
		padding-left: 300px;
		padding-bottom: 100px;
	}
	
	#alertPw , #alertId{
		font-size: x-small;
		color: red;
		width: 100px;
		background-repeat: no-repeat;
		background-size: 20px 20px;
		background-position: 10px 5px;
		padding-left: 50px;
		padding-bottom: 18px;
		
	}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	
	var selection;
	var rePwd;
	var id;
	
	// 윈도우
	 window.addEventListener('DOMContentLoaded', function(){
		 id = document.getElementById("registerId");
		 selection = document.getElementById("selection");
		 rePwd = document.getElementById("re-pwd");
		
		 
		 // id 입력 시 id중복 확인 함수 호출
		 id.onkeyup = checkId;
		 // 이메일 도메인을 선택할 때 함수 호출
		 selection.onchange = getDomain;
		 // pwd 확인 입력시 함수 호출 
		 rePwd.onkeyup = checkPwd;
		 // 카카오 우편번호 함수 호출
		 document.getElementById("searchPost").onclick=getKaKaoAddress;
		 
		 
		 // 회원 가입 버튼을 누르면 폼 채워졌는지 검사
		 document.getElementById("registerDone").onclick = checkBlank;
			 
	 
		 var cancel = document.getElementById("registerCancel");
			cancel.onclick = function(){
				if(confirm("가입을 취소하시겠습니까? 내용은 저장되지 않습니다.")==true){
					location.href = "main.jsp";
				}else{
					return false;
				}
			}
	 })
	 
	 // ajax 아이디 중복확인
	 function checkId(){
		 
		 var txt = id.value.trim();
		 var params = "id="+txt;
		 sendRequest("idCheck.jsp", params, idCallback, "GET");
		 
	 }
	 
	 function idCallback(){
		 
		 if(xhr.readyState== 4 && xhr.status==200){
			 var existedId = xhr.responseText.trim();
			 var alertId = document.getElementById("alertId");
			 
			 // callback 결과 값이 true면 존재, false면 사용 가능한 아이디
			 if (existedId=='true'){
				 alertId.style.backgroundImage="url('../images/close.png')"
			 }else if (existedId=='false'){
				 alertId.style.backgroundImage="url('../images/check.png')"
				
			 }
		 }
	 }

	 // 이메일 도메인 값 선택
	 function getDomain() {
		
		 var domain = document.getElementById("domain");
		 var selectedIdx = document.getElementById("selection").options.selectedIndex; 
		
		 // 도메인 직접입력을 선택하면 입력란에 포커스
		 if (selectedIdx==0){
			 domain.value="";
			 domain.readOnly="";
			 domain.focus();
		// 도메인을 선택하면 입력란 readOnly
		 }else if(selectedIdx !=0) {
			 domain.value = selection.options[selectedIdx].innerText;
			 domain.readOnly="true";
		 }

	 }

	 // 비밀번호 확인
	 function checkPwd() {
		 
		 var pwd = document.getElementById("registerPwd");
		 var alertPw = document.getElementById("alertPw");
		 
		 // 비밀번호가 일치하면 
		 if(pwd.value==rePwd.value){
			alertPw.style.backgroundImage = "url('../images/check.png')";
		// 비밀번호가 일치하지 않으면
		 }else if(pwd.value!=rePwd.value){
			alertPw.style.backgroundImage = "url('../images/close.png')"; 
			
		 }
	 }
	 
	 // 카카오 우편번호 
	 function getKaKaoAddress(){
		 new daum.Postcode({
		        oncomplete: function(data) {
		            document.getElementsByName("addrs")[0].value=data.zonecode;
		            document.getElementsByName("full-addrs")[0].value=data.roadAddress;
		        }
		    }).open();
	 }
	 
	 // 빈칸 검사
	 function checkBlank(){

		 var name = document.getElementsByName("name")[0];
		 var birth = document.getElementsByName("birth")[0];
		 var id = document.getElementsByName("id")[0];
		 var pwd = document.getElementsByName("pwd")[0];
		 var re_pwd = document.getElementsByName("re-pwd")[0];
		 var phone = document.getElementsByName("phone")[0];
		 
		 if (name.value == "" ) {
			 alert("이름을 입력해주세요");
			 return;
		 }else if (birth.value == "" ){
			 alert("생년월일을 입력해주세요");
			 return;
		 }else if (id.value == ""){
			 alert("아이디를 입력해주세요");
			 return;
		 }else if (pwd.value == "" ){
			 alert("비밀번호를 입력해주세요");
			 return;
		 }else if (re_pwd.value == "" ){
			 alert("비밀번호를 확인해주세요");
			 return;
		 }else if (phone.value == "" ){
			 alert("전화번호를 확인해주세요");
			 return;
		 }else{
				 alert("가입을 환영합니다!");
			 var frm = document.getElementById("frm");
			 	 frm.action = "registerOk.jsp";
			 	 frm.method = "post";
			 	 frm.submit();
			
		 }
	 }
	 
</script>
</head>
<body>
	<div class="totalContainer" >
	<jsp:include page="header.jsp"></jsp:include> 
	<div class="regiContainer">

		<form action="registerOk.jsp" method="post" id="frm">
		<div class="info">
			<h1>회원가입</h1>
			<label for="name">이름 *</label><br>
			<input type="text" name="name"  /><br>
			<label for="birth">생년월일 *</label><br>
			<input type="date" name="birth" /><br>
			<label for="id">아이디 *</label><label for="id" id="alertId"></label><br>
			<input type="text" name="id" id="registerId" /><br>
			<label for="pwd">비밀번호 *</label><br>
			<input type="password" name="pwd" id="registerPwd" /><br>
			<label for="re-pwd">비밀번호 확인 *</label><label for="re-pwd" id="alertPw"></label> <br>
			<input type="password" name="re-pwd" id="re-pwd" /><br>
			<label for="radio">성별</label><br>
			<input type="radio" name="gender" value="남"/>남&nbsp;&nbsp;&nbsp;
			<input type="radio" name="gender" value="여"/>여 <br>
			<label for="email">이메일</label><br>
			<input type="text" name="email"  /> @ <input type="text" name="domain" id="domain"/>
			<select name="selection" id="selection">
				<option value="own">직접입력</option>
				<option value="naver">naver.com</option>
				<option value="google">gmail.com</option>
				<option value="daum">daum.net</option>
			</select><br>
			<label for="phone">전화번호 (-제외) *</label><br>
			<input type="text" name="phone" /> <br>
			<label for="addrs">주소</label><br>
			<input type="text" name="addrs" />
			<input type="button" value="검색" id="searchPost" /><br>
			<input type="text" name="full-addrs" /><br>
			</div>
			<div class="complete">
				<input type="button" value="가입완료" id="registerDone"/>
				<input type="button" value="가입취소" id="registerCancel"/>
			</div>
		
		
		</form>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>