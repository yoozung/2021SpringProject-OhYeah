<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<!-- end bootstrap -->
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">

</head>
<body>
<%@ include file="../Fragment/inc/topBefore.jsp" %>
<table>
	<tr>
		<th>번호</th>
		<th>가게번호</th>
		<th>가게명</th>
		<th>전화번호</th>
		<th>사이트</th>
		<th>분류1</th>
		<th>분류2</th>
		<th>좌석수</th>
		<th>사장번호</th>
		<th>주소</th>
		<th>등록일</th>
	</tr>
	
	<!-- 검색조건에 해당하는 결과가 없는 경우 메세지 출력 -->
	<c:if test="${not empty message}">
		<tr>
			<th colspan=10>${message}</th>
		</tr>
	</c:if>
	
	<c:forEach var="dto" items="${list}" varStatus="status">
		<tr>
			<th>${status.count}</th>
			<th>${dto.shopNo}</th>
			<th>${dto.shopName}</th>
			<th>${dto.shopMobile}</th>
			<th>${dto.shopAddress}</th>
			<th>${dto.businessNumber}</th>
			<th>${dto.shopSite}</th>
			<th>${dto.category1}</th>
			<th>${dto.category2}</th>
			<th>${dto.shopSeat}</th>
			<th>${dto.registerDate}</th>
		</tr>
	</c:forEach>
</table>
<input type="submit" value="승인" />
<input type="reset" value="취소" />
<%@ include file="../Fragment/inc/footer.jsp"%>
</body>
</html>