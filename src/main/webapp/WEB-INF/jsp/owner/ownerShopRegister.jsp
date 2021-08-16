<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 | 식당등록</title>
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">
</head>
<body>
<div class="container">
	<h3>가게등록신청</h3>
	<form action="/result" method="post">
		<input type="text" name="memberNo" autofocus="autofocus" placeholder="회원번호"/>
		<input type="text" name="shopName" autofocus="autofocus" placeholder="가게명"/>
		<input type="text" name="shopMobile" required="required" placeholder="가게 전화번호"/>
		<input type="text" name="shopSite" required="required" placeholder="가게 사이트" />
		<input type="text" name="shopCategory" required="required" placeholder="분류" />
		<input type="text" name="shopSeat" required="required" placeholder="좌석수"/>
		<input type="text" name="shopAddress" required="required" placeholder="가게 주소"/>
		<input type="text" name="businessNo" required="required" placeholder="사업자번호"/>
		<input type="submit" value="등록" />
		<input type="reset" value="취소" />
	</form>
</div>
</body>
</html>