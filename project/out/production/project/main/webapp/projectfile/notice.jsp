<%@page import="vo.ShowMemVO"%>
<%@page import="vo.NoticeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>알림</title>
<style>
	*{
		font-family: "G마켓 산스 TTF";
	}
	#container{
		width : 55%;
		border-radius: 20px;
		margin : 0 auto;
	}
	body{
		background-image: url("../images/bgh9.svg");
		background-size: 100%;
		background-repeat: no-repeat;
	}
	
	#notice{
		width :150px;
		height : 150px;
		margin-top: 100px;
	}
	#title{
		font-size: 40px;
		color : black;
	}
	span{
		color: #970119;
	}
	table{ 
		width : 1000px; 
		border-top : 1px solid black;
		border-bottom : 1px solid #C8C8C8;
		
	}
	table, th, td{
		border-collapse : collapse;
		padding : 5px;
		border-bottom : 1px solid #C8C8C8;
	}
	th{
		padding : 5px;
		text-align: center;
	}
	td{
		text-align : center;
		border-top : 1px solid #EFEFEF;
		
	}
	#col1{ width : 7% }
	#col2{ width : 7% }
	#col3{ width : 55% }
	#col4{ width : 8% }
	#col5{ width : 15% }
	#col6{ width : 13% }
	
	.pageImg{
		width : 20px;
		height : 20px;
	}
	
	#pageMove{
		text-align : center;
		padding : 20px;
	}
	
	a:link{
		text-decoration: none;
		color : black;
		font-size: 25px;
		padding : 5px;
	}
	
	#page:visited{
		color : black;
	}
	#page:hover{
		color : red;
	}
	#nowPage{
		width : 150px;
		height : 30px;
		background : #EFEFEF;
	}
	#totalPage{
		margin-left : 5px;
		color : #737373;
	}
	#detail{
		font-size: 15px;
	}
	#detail:hover{
		color : black;
		text-decoration: underline;
	}
	#detail:visited{
		color: black;
	}
	#btn{
		text-align: right;
	}
	.btn2{
		background : #EFEFEF;
		margin-right: 15px;
		border : 1px solid #EFEFEF;
		border-radius: 3px;
	}
	.btn2:hover{
		background: #CAA7C7;
	}
	#pg{
		padding-left: 18px;
	}
	#nImg{
		width : 45px;
		height : 45px;
	}
	.bor{
		text-align : center;
		border-bottom: 1px solid #EFEFEF;
		padding: 10px;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

	function noticeWrite(){
		
		var write = document.getElementById("write");
			location.href = "noticeWrite.jsp";
		}
	
	function deleteNotice(){
		var del = document.getElementById("del");
			if($('input[name=ck]:checked').val() == null){
				alert("삭제할 공지를 선택해주세요.");
			}else if(confirm("선택한 공지를 삭제하시겠습니까?")==true){
				document.getElementById("frm").submit();
			}else{
				return false;
			}
		}
	
	function check(){
		var checkAll = document.getElementById("checkAll");
			var ck = document.getElementsByName("ck");
			for(var i=0; i<ck.length; i++){
				ck[i].checked = checkAll.checked;
			}
		}
	
</script>
</head>
<body>
	
	<%
		NoticeDAO dao = new NoticeDAO();
		int totalCount = dao.getTotal();
	
		// 페이지당 보여줄 게시글 개수를 5개로 지정
		int perPage = 5;
		
		// 총 페이지 개수는 총 게시글갯수를 10으로 나누어서 딱 떨어지면 그대로 나누고 나머지가 있으면 1을 더한다.
		// ex) 160/10 = 16페이지, 161/10 = 16.1 -> 17페이지
		int totalPage = (totalCount % perPage == 0) ? totalCount/perPage : totalCount/perPage+1;
	
		int currentPage;
		
		// 시작페이지를 1, 끝페이지를 5로 초기화
		int startPage = 1;
		int endPage = 5;
		
		// 현재 페이지?
		String cp = request.getParameter("cp");
		if(cp == null){
			currentPage = 1;
		}else{
			currentPage = Integer.parseInt(cp);
		}
		
		
		
		// <<, >> 맨 앞, 맨 뒤로가기 기능
		if(currentPage <= 0){
			currentPage = 1;
		}
		
		if(currentPage <= 5){
			startPage = 1;
			endPage = 5;
		}
		
		
		// <, > 페이지 이동 기능(1~5페이지에서 6~10페이지로 이동 구현)
		int num1 = 5;
		int num2 = 10;
		int sp = 6;
		int ep = 10;
		for(int i = 1; i <= totalPage/4; i++){
			// 현재 페이지가 6~10 사이면(6클릭 또는 7클릭 또는 8클릭 ....또는 10클릭할 시), 시작페이지를 6, 끝페이지를 10으로 설정 -> for문으로 반복
			if(currentPage > num1 && currentPage <=num2){
				startPage = sp;
				endPage = ep;
			}
			// num1이 11, num2가 16이됨 -> 현재페이지가 11~16사이면
			num1 = num1+5;
			num2 = num2+5;
			// sp(시작페이지)를 11, ep(끝페이지)를 16으로 지정 -> 반복
			sp = sp+5;
			ep = ep+5;
			// 페이지 이동 중 끝페이지가 총 페이지를 넘어서면 끝페이지를 총페이지로 지정.
			if(endPage > totalPage){
				endPage = totalPage;
			}
			// 시작페이지가 끝페이지를 넘어서면 현재페이지를 끝페이지로 지정 후 시작페이지에서 5를 뺀 것을 시작페이지로 지정
			if(startPage > endPage){
			 currentPage = endPage;
			 startPage = startPage-5;
		 	}  
		}
	
		
		// 현재 페이지에 따라 검색할 시작번호, 끝번호
		// 1페이지일때 1~5, 2페이지일때 6~10
		int startNo = (currentPage -1) * perPage +1;
		int endNo = currentPage * perPage;
		
		ArrayList<NoticeVO> list = dao.selectAll(startNo, endNo);
		 

		%>
		<jsp:include page="header.jsp" />
		<div id="container">
		<div id="notice"><span id="title"><img src="../images/clipboard.png" alt="" id="nImg"/>알림</span></div>
		<h3>총 <span><%=totalCount%></span>건이 검색되었습니다.</h3>
			<form action="noticeDelete.jsp" method="GET" id="frm">
					<table>
						<tr>
					<%
						// admin 계정인지 아닌지 테스트
						ShowMemVO vo2 = (ShowMemVO)session.getAttribute("vo");
					
						if(vo2!=null){
							if(vo2.getId().equals("admin")){
					%>
							<th class="bor"><input type="checkbox" name="" id="checkAll" onclick="check()" /></th>
					<%		
							}
						}
					%>
							<th id="col1" class="bor">번호</th>
							<th id="col2" class="bor">구분</th>
							<th id="col3" class="bor">제목</th>
							<th id="col4" class="bor">작성자</th>
							<th id="col5" class="bor">작성일</th>
							<th id="col6" class="bor">조회수</th>
						</tr>
						<%
							for(NoticeVO vo : list){
						%>	
						
						<tr>
						<%
							if(vo2!=null){
								if(vo2.getId().equals("admin")){
						%>
							<td class="bor"><input type="checkbox" name="ck" value="<%=vo.getNoticeNo()%>"/></td>
						<%	
								}
							}
						%>
							<td class="bor"><%=vo.getNoticeNo() %></td>
							<td class="bor"><%=vo.getCategory() %></td>
							<td class="bor"><a href="noticeDetail.jsp?noticeNo=<%=vo.getNoticeNo()%>" id="detail"><%=vo.getNoticeTitle() %></a></td>
							<td class="bor"><%=vo.getNoticeWriter() %></td>
							<td class="bor"><%=vo.getNoticeDate() %></td>
							<td class="bor"><%=vo.getNoticeHits() %></td>
						</tr>
						<%
							}
						
						%>
						<tr>
							<td colspan = "6" id="pageMove">
									<div id="nowPage"><h4 id="pg">페이지<%=currentPage%>/<span id="totalPage"><%=totalPage%></span></h4></div>
									<a href="notice.jsp?cp=1"><img src="../images/left2.png" class="pageImg" alt="" /></a>
									<a href="notice.jsp?cp=<%=startPage-5%>"><img src="../images/left1.png" class="pageImg" alt="" /></a>
								<%
								
									for(int i = startPage; i <= endPage; i++){	
								%>						
									<a href="notice.jsp?cp=<%=i%>" id="page"><%=i %></a>
									<%
									}
									%>
									<a href="notice.jsp?cp=<%=startPage+5%>"><img src="../images/right1.png" class="pageImg" alt="" /></a>
									<a href="notice.jsp?cp=<%=totalPage%>"><img src="../images/right2.png" class="pageImg" alt="" /></a>
								<%
									if(vo2!=null){
										if(vo2.getId().equals("admin")){
								%>
									<div id="btn"><input type="button" value="공지등록" class="btn2" id="write" onclick="noticeWrite()" /><input type="button" value="공지삭제" class="btn2" id="del" onclick="deleteNotice()"/></div>
								<%
										}
									}
								%>
							</td>
						</tr>
					</table>
			</form>
		</div>
		<jsp:include page="footer.jsp" />
</body>
</html>