<%@page import="java.util.ArrayList"%>
<%@page import="vo.NoticeVO"%>
<%@page import="dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<div id="noti">
					<h4>공지사항</h4>
					<div class="notiDetail">
					<%
						NoticeDAO dao = new NoticeDAO();
						ArrayList<NoticeVO> list = dao.selectAll(1, 4);
						
						for (NoticeVO vo : list) {
							
					%>
						<ul>
							<li id="notiCategory"><%=vo.getCategory()%></li>&nbsp;&nbsp;&nbsp;&nbsp;
							<li><a href="noticeDetail.jsp?noticeNo=<%=vo.getNoticeNo()%>"><%=vo.getNoticeTitle() %></a></li>
						</ul>
					<%
						}
					%>					
					</div>
				</div>