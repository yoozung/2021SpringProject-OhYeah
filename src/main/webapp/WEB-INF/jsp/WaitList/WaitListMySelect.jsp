<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 줄 서기 목록</title>
<link type="text/css" rel="stylesheet" href="/resource/css/WaitList/WaitListMySelect.css">
<link type="text/css" rel="stylesheet"
	href="/resource/css/adminPage.css">
</head>
<c:set var="userName" value="${member.getName()}"/>
<c:set var="authorities" value="${member.getRole()}"/>
<body>
<%@ include file="../Fragment/inc/topBefore.jsp"%>
<div class="container">
	<div class="MySelect">
		<table class="table">
			<tr>
				<th>예약번호</th>
				<th>예약식당</th>
				<th>인원수</th>
				<th>예약날</th>
				<th>이용상태</th>
				<th></th>
			</tr>
			<c:forEach var="dto" items="${list}" varStatus="status">
				<tr>
					<td class="waitNo">${dto.waitNo}</td>
					<td>${dto.shopName}</td>
					<td>${dto.headCount}</td>
					<td>${dto.waitDate}</td>
					<td>${dto.waitState}</td>
					<td><a id="${status.count}" class="cancleBtn" href="/waitList/RequestCancle/${dto.waitNo}">취소하기</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>		
<%@ include file="../Fragment/inc/footer.jsp"%>
</body>
<script type="text/javascript" src="/resource/js/WaitList/WaitListMySelect.js"></script>
</html>