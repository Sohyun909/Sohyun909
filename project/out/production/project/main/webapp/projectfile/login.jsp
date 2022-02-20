<%@page import="vo.ShowMemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/login.css?after" />
<script src="../js/httpRequest.js"></script>
<script type="text/javascript">
 	window.onload = function(){
		document.getElementById("login").onclick = checkUser; 
		document.onkeydown = function(e){
			if (e.code=='Enter') checkUser();
		}	
	}
	
	
	// ajax이용해 id 유효성 검사
	function checkUser() {
		var id = document.getElementById("id");
		var pwd = document.getElementById("pwd");
		var txt1=id.value.trim();
		var txt2=pwd.value.trim();
		
		var params = "id="+txt1+"&pwd="+txt2;
		
		sendRequest("loginOk.jsp", params, callback, "GET");
		
	}  
		
	function callback(){
	
		if(xhr.readyState==4 && xhr.status==200){
			var existedUser = xhr.responseText.trim();
			console.log(existedUser);
			if (existedUser == 'true'){
				location.href = "main.jsp";
			}else if(existedUser == 'false'){
				alert("아이디 또는 비밀번호를 다시 확인해주세요");
			}
		}
	} 

</script>
</head>
<body>
	
	<div class="container">
		<img src="../images/logoCut.jpg" alt="logoImg" onclick="location.href='main.jsp'" />
		
		<h1>Login</h1>
		
		<form action="loginOk.jsp" method="post" id="frm">
			<input type="text" name="id" id="id" placeholder="아이디"/><br />
			<input type="password" name="pwd" id="pwd" placeholder="비밀번호" /><br />
			
			
			<input type="button" value="로그인" id="login"/>
			<input type="button" value="회원가입" onclick="location.href='registerTerms.jsp'" /> 
		</form>
	</div>
	
</body>
</html>