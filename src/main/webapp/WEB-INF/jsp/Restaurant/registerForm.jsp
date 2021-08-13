<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록신청페이지</title>
</head>
<body>
<%@ include file="../Fragment/TopNav/topNav.jsp" %>
<form action="/regiForm" method="POST">
<label for="shopName">매장명</label>
<input type="text" name="shopName" value=""/>
</br>
<label for="mobile">전화번호</label>
<input type="text" name="mobile" value=""/>
</br>
<form method="get" action="SelectServlet">
		<label for="category1">분류1</label> 
		<select id="cate" name="cate" size="1" onchage="menuList(this.value);">
			<option value="">선택하세요.</option>
			<option value="한식">한식</option>
			<option value="양식">양식</option>
			<option value="일식">일식</option>
			<option value="중식">중식</option>
			<option value="뷔페식">뷔페식</option>
			<option value="기타">기타</option>
		</select> 
		<button id="adder">선택</button>
		<br> <br>

<label for="shopAddress">가게주소</label>
<input type="text" name="shopAdress" value=""/>
</br>
<label for="shopSite">사이트주소</label>
<input type="text" name="shopSite" value=""/>
</br>
<label for="shopSeat">가게좌석수</label>
<input type="text" name="shopSeat" value=""/>
</br>
<input type="submit" name="register" value="등록신청" />
</form>
</body>
</html>