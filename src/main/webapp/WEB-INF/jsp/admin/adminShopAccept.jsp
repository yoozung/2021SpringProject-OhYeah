<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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