<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당목록조회</title>
</head>
<body>
<table>
	<tr>
		<th>매장명</th></br>
		<th>전화번호</th></br>
		<th>분류</th></br>
		<th>사이트</th></br>
		<th>좌석수</th></br>
		<th>주소</th></br>
	</tr>
	
	<c:forEach var="dto" items="${list}" varStatus="status">
		<tr>
		<th>${status.count}</th>
		<th><a href="RestaurantDetail?shopNo=${dto.shopNo}"></a></th>
		<th>${dto.shopName}</th>
		<th>${dto.shopMobile}</th>
		<th>${dto.shopCategory}</th>
		<th>${dto.shopSite}</th>
		<th>${dto.shopSeat}</th>
		<th>${dto.shopAddress}</th> 
	</tr>
	</c:forEach>
	</table>
</body>
</html>