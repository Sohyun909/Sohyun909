<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회등록</title>
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
body{
		background-image: url("../images/bgh9.svg");
		background-size: 100%;
		background-repeat: no-repeat;
	} 

.main{
text-align: left;
padding-left: 410px;}
}

#btn1 {
padding:20px;}

</style>
<script>
	function cancel(){
		location.href = "showDelete.jsp";
	}
</script>
</head>
<body>
	<form action="showUploadOK.jsp" method="post" enctype="multipart/form-data">
		<div class="grid-container">
		<div class="header">
		<jsp:include page="header.jsp" />
		</div>
		<div class="main">
		<table>
			<tr>
				<th>전시명</th>
				<td><input type="text" name="show_name" id="" /></td>
			</tr>
			<tr>
				<th>작가</th>
				<td><input type="text" name="show_writer" id="" /></td>
			</tr>
			<tr>
				<th>전시시작일</th>
				<td><input type="date" name="startday" id="" /></td>
			</tr>
			<tr>
				<th>전시종료일</th>
				<td><input type="date" name="endday" id="" /></td>
			</tr>
			<tr>
				<th>전시실</th>
				<td><input type="text" name="show_place" id="" /></td>
			</tr>
			<tr>
				<th>관람료</th>
				<td><input type="text" name="show_price" id="" /></td>
			</tr>
			<tr>
				<th>상세설명</th>
				<td><textarea name="show_detail" id="" cols="50" rows="30"></textarea></td>
			</tr>
			<tr>
				<th>연령</th>
				<td><input type="text" name="show_agelimit" id="" /></td>
			</tr>

			<tr>
				<th>메인이미지</th>
				<td><input type="file" name="main_img" id="" /></td>
			</tr>
			<tr>
				<th>서브이미지1</th>
				<td><input type="file" name="sub_img1" id="" /></td>
			</tr>
			<tr>
				<th>서브이미지2</th>
				<td><input type="file" name="sub_img2" id="" /></td>
			</tr>
			<tr>
				<th>서브이미지3</th>
				<td><input type="file" name="sub_img3" id="" /></td>
			</tr>
			<tr>
				<th>서브이미지4</th>
				<td><input type="file" name="sub_img4" id="" /></td>
			</tr>
			<tr>
				<td colspan="7"><input type="submit" id="btn1" value="전송" /></td>
				<td colspan="7"><input type="button" id="btn2" value="취소" onclick="cancel()"  style="border: 1px solid black; border-radius: 3px; width : 35px; height: 33px; padding : 0px; font-size: 16px; font-weight: normal;"/></td>
			</tr>
		</table>
		</div>
		</div>
	</form>
	<br><br><br>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>