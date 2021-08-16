<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">
<title>사업자 | 식당등록</title>
</head>
<body>
	<div class="container">
		<form action="/ownerShopUpdate" method="post">
			<c:forEach var="dto" items="${list}">
				<div>사업자의번호</div>
				<input type="text" name="memberNo" value="${dto.MEMBERNO}" readonly="readonly">

				<div>가게번호</div>
				<input type="text" name="shopNo" value="${dto.SHOPNO}" readonly="readonly">

				<div>가게명</div>
				<input type="text" name="shopName" value="${dto.SHOPNAME}">

				<div>전화번호</div>
				<input type="text" name="shopMobile" value="${dto.SHOPMOBILE}">

				<div>사이트</div>
				<input type="text" name="shopSite" value="${dto.SHOPSITE}">

				<div>분류</div>
				<input type="text" name="shopCategory" value="${dto.SHOPCATEGORY}">

				<div>좌석수</div>
				<input type="text" name="shopSeat" value="${dto.SHOPSEAT}">

				<div>주소</div>
				<input type="text" name="shopAddress" value="${dto.SHOPADDRESS}">

				<div>등록일</div>
				<input type="text" name="registerDate" value="${dto.REGISTERDATE}" readonly="readonly">

				<div>
					<input type="submit" value="가게정보변경"> 
					<input type="reset" value="취소">
				</div>
			</c:forEach>
		</form>
	</div>
</body>
</html>