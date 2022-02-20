<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// upload 디렉토리의 실제 파일 경로 얻어오기
	
	out.println(request);
	
	String saveDir = request.getRealPath("/upload");
	out.println(saveDir);
	
	int maxFileSize = 1024 * 1024 * 10;
	
	// MultipartRequest
	// new MultipartRequest(요청 객체, 저장디렉토리, 최대파일크기, 인코딩타입, 동명파일처리규정객체)
	MultipartRequest mr = new MultipartRequest(request, saveDir, maxFileSize, "UTF-8", new DefaultFileRenamePolicy());
	
	String show_name = mr.getParameter("show_name");
	String show_writer = mr.getParameter("show_writer");
	String startday = mr.getParameter("startday");
	String endday = mr.getParameter("endday");
	String show_place = mr.getParameter("show_place");
	String show_price = mr.getParameter("show_price");
	String show_detail = mr.getParameter("show_detail");
	String agelimit = mr.getParameter("show_agelimit");
	String main_img = mr.getParameter("main_img");
	String sub_img1 = mr.getParameter("sub_img1");
	String sub_img2 = mr.getParameter("sub_img2");
	String sub_img3 = mr.getParameter("sub_img3");
	String sub_img4 = mr.getParameter("sub_img4");
	
	// 파일의 원래 이름
	String f = mr.getOriginalFileName("filename");

	
	// 1. 변수 설정
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@mydb.cpdg3ism84pj.ap-northeast-2.rds.amazonaws.com:1521:orcl";
	String user = "scott";
	String password = "tigertiger1";
	Connection conn = null;
	PreparedStatement pstmt = null;
	// SQL문 담기
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;

	// 2. 드라이버 로딩
	Class.forName(driver);

	// 3. connection
	conn = DriverManager.getConnection(url, user, password);
	out.println(" conn : " + conn);
	
	// 4. sql 문장
	sb.append("INSERT INTO SHOW ");
	sb.append("values (show_no_seq.nextval , ? , ? , ? , ? , ? , ?, ?, ?, ?, ?, ?, ?, ? )");
	
	// 5. 문장 객체
	pstmt = conn.prepareStatement(sb.toString());
	
	// 부분의 값 채우기
	pstmt.setString(1,show_name);
	pstmt.setString(2,show_writer);
	pstmt.setString(3,startday);
	pstmt.setString(4,endday);
	pstmt.setString(5,show_place);
	pstmt.setString(6,show_price);
	pstmt.setString(7,show_detail);
	pstmt.setString(8,agelimit);
	pstmt.setString(9,main_img);
	pstmt.setString(10,sub_img1);
	pstmt.setString(11,sub_img2);
	pstmt.setString(12,sub_img3);
	pstmt.setString(13,sub_img4);
	
	// 6. 실행
	
	pstmt.executeQuery();
	
	// 자원반납
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	%>
	
	<h2><%=show_name %> 게시물 업로드를 축하합니다.</h2>
	
	<!--  java script code(3초 후에 어떤 함수를 호출)를 넣어 3초 후에 main.jsp로 이동 -->
	
	<script>
	
	// 특정 시간 이후에 함수 호출
	window.setTimeout(function(){
		location.href="main.jsp";
	}, 3000)
	</script>
</body>
</html>