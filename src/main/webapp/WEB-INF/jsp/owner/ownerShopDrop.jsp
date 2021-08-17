<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">
<title>사업자 | 식당등록</title>
</head> 
<body>
<div class="container">
	<h4>가게삭제</h4>
	<table>
		<tr>
			<th>번호</th>
			<th>사업자의번호</th>
			<th>가게번호</th>
			<th>가게명</th>
			<th>전화번호</th>
			<th>분류</th>
			<th>사이트</th>
			<th>좌석수</th>
			<th>주소</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
		<tr>
			<th>${status.count}</th>
			<th>${dto.MEMBERNO}</th>
			<th>${dto.SHOPNO}</th>
			<th><a href="ownerShopUpdate?ShopName=${dto.SHOPNAME}">${dto.SHOPNAME}</a></th>
			<th>${dto.SHOPMOBILE}</th>
			<th>${dto.SHOPCATEGORY}</th>
			<th>${dto.SHOPSITE}</th>
			<th>${dto.SHOPSEAT}</th>
			<th>${dto.SHOPADDRESS}</th>
		</tr>
		</c:forEach>
	</table>
	
	<div>
	<h4>삭제할 가게명을 입력하세요.</h4>
	<form action="/shopDrop" method="post">
	<input type="text" name="shopNo" autofocus="autofocus" placeholder="가게번호">
	<input type="submit" value="삭제" />
	<input type="reset" value="취소" />
	
	</form>
	</div>
</div>
</body>
</html>