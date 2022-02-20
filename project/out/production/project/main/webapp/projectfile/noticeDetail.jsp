<%@page import="vo.NoticeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
		margin : 0 auto;
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
	table{
		width : 800px;
		height : 500px;
		border-bottom : 1px solid black;
	}

	
	#top1{
		height : 50px;
		border-bottom : 2px solid black;
	}
	.top2{
		margin-right: 20px;
		color : #6F666F;
	}
	figcaption{
		font-size : 30px;
		padding : 20px;
	}
	#detail{
		vertical-align: top;
	}
	#noticeDetail{
		height : 438px;
		margin-top : 30px;
		font-size: 20px;
	}
	#list{
		width : 800px;
		text-align: right;
		margin-bottom: 80px;
	}
	#list2{
		text-decoration: none;
		font-size: 25px;
	}
	#list2:visited{
		color : #3F0B9F;
	}
	#list2:hover{
		color : white;
		background : #3F0B9F;
	}
	#nImg{
		width : 45px;
		height : 45px;
	}
	body{
		background-image: url("../images/bgh9.svg");
		background-size: 100%;
		background-repeat: no-repeat;
	}
</style>
</head>
<body>
	<%
		String n = request.getParameter("noticeNo");
		
		
		if(n==null){
			response.sendRedirect("notice.jsp");
		}else{
			int noticeNo = Integer.parseInt(n);
			NoticeDAO dao = new NoticeDAO();
			//조회수증가
			dao.raiseHits(noticeNo);
			ArrayList<NoticeVO> list = dao.getOne(noticeNo);
			NoticeVO vo = list.get(0);
			
	%>
	<jsp:include page="header.jsp" />
	<div id="container">
	<div id="notice"><span id="title"><img src="../images/clipboard.png" alt="" id="nImg"/>알림</span></div>
		<figure>
			<figcaption>
				<%=vo.getNoticeTitle() %>
			</figcaption>
		<table>
			<tr>
				<td id="top1">
				<span class="top2">작성일 <%=vo.getNoticeDate() %></span>
				<span class="top2">담당자 <%=vo.getNoticeWriter() %></span>
				<span class="top2">조회수 <%=vo.getNoticeHits() %></span>
				</td>
			</tr>
			 <tr>
			 	<td colspan="3" id="detail"><div id="noticeDetail"><%=vo.getNoticeDetail() %></div></td>
			 </tr>
		</table>
		</figure>
		<div id="list"><a href="notice.jsp" id="list2">목록</a></div>
	</div>	
	<%	
		}
	%>
	<jsp:include page="footer.jsp" />
</body>
</html>