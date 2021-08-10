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
<label for="shopName">업소명</label>
<input type="text" name="shopName" value=""/>
</br>
<label for="mobile">전화번호</label>
<input type="text" name="mobile" value=""/>
</br>
<label for="shopNo">가게번호</label>
<input type="text" name="shopNo" value=""/>
</br>
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