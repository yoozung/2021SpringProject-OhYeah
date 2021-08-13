<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 줄 서기 목록</title>
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">
<link type="text/css" rel="stylesheet"
	href="/resource/css/adminPage.css">
</head>
<c:set var="userName" value="${member.getName()}"/>
<c:set var="authorities" value="${member.getRole()}"/>
<body>
	<%@ include file="../Fragment/inc/topBefore.jsp"%>
	<!-- start middle menu-->
	<div class="container admin">
		<div class="row middleMenu">
			<div class="row col-12">
				<div class="row col-8 tab_bar">
					<div class="col-4" onclick="#">SHOP SEARCH</div>
					<div class="col-4" onclick="map()">MAP</div>
					<div class="col-4 dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">WAIT</div>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/admin/adminMemberList">대기조회</a> <a
							class="dropdown-item" href="#">대기변경</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<h4>Member List</h4>
		<table>
			<tr>
				<th>예약번호</th>
				<th>예약식당</th>
				<th>인원수</th>
				<th>예약날</th>
				<th>이용상태</th>
			</tr>
			<!-- 검색조건에 해당하는 결과가 없는 경우 메세지 출력 -->
			<c:forEach var="dto" items="${list}" varStatus="status">
				<tr>
					<th>${dto.waitNo}</th>
					<th>${dto.shopName}</th>
					<th>${dto.headCount}</th>
					<th>${dto.waitDate}</th>
					<th>${dto.waitState}</th>
				</tr>
			</c:forEach>
		</table>

	</div>
	<%@ include file="../Fragment/inc/footer.jsp"%>
</body>
</html>