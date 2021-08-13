<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<c:set var="userName" value="${member.getName()}"/>
<c:set var="authorities" value="${member.getRole()}"/>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">
<title>ADMIN PAGE</title>
</head>
<body>
<%@ include file="../Fragment/inc/topBefore.jsp" %>
<c:choose>
<!-- --------------------------------------------------비회원--------------------------------------------------- -->
<c:if test="${role eq null}">
<!-- start middle menu-->
	<div class="container consumer">
		<div class="row middleMenu">
			<div class="row col-12">
				<div class="row col-8 tab_bar">
					<div class="col-6 tab_line" onclick="#">SHOP SEARCH</div>
					<div class="col-6 tab_line" onclick="map();">MAP</div>
				</div>
			</div>
		</div>
	</div>
<!-- end middle menu-->
</c:if>
<!-- --------------------------------------------------관리자--------------------------------------------------- -->
<c:if test="${role eq 'ROLE_ADMIN'}">
<!-- start middle menu-->
	<div class="container admin">
		<div class="row middleMenu">
			<div class="row col-12">
				<div class="row col-8 tab_bar">
					<div class="col-6 asd1 tab_line">
						<div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">SHOP MANAGE</div>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="/admin/adminShopAccept">등록신청관리</a>
							<a class="dropdown-item" href="/admin/adminShopList">식당조회</a>
							<a class="dropdown-item" href="/admin/adminShopList">수정관리</a>
							<a class="dropdown-item" href="/admin/adminShopList">삭제관리</a>
						</div>
					</div>
					<div class="col-6 asd2 tab_line">
						<div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MEMBER MANAGE</div>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="/admin/adminMemberList">회원조회</a>
							<a class="dropdown-item" href="/admin/adminMemberDrop">회원삭제</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- end middle menu-->
</c:if>
<!-- --------------------------------------------------소비자--------------------------------------------------- -->
<c:if test="${role eq 'ROLE_CONSUMER'}">
<!-- start middle menu-->
	<div class="container consumer">
		<div class="row middleMenu">
			<div class="row col-12">
				<div class="row col-8 tab_bar">
					<div class="col-4 tab_line" onclick="go_manage();">SHOP SEARCH</div>
					<div class="col-4 tab_line" onclick="map();">MAP</div>
					<div class="col-4 tab_line dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">WAIT</div>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/waitList/WaitListMySelect">대기조회</a>
						<a class="dropdown-item" href="#">대기조회</a>
						<a class="dropdown-item" href="#">대기변경</a>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- end middle menu-->
</c:if>
<!-- --------------------------------------------------사업자--------------------------------------------------- -->
<c:if test="${role eq 'ROLE_OWNER'}">
<!-- start middle menu-->
	<div class="container admin">
		<div class="row middleMenu">
			<div class="row col-12">
				<div class="row col-8 tab_bar">
					<div class="col-6 asd1 tab_line">
						<div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">SHOP MANAGE</div>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">등록신청</a>
							<a class="dropdown-item" href="#">내 식당 조회</a>
							<a class="dropdown-item" href="#">식당 정보 수정 신청</a>
							<a class="dropdown-item" href="#">식당 정보 삭제 신청</a>
						</div>
					</div>
					<div class="col-6 asd2 tab_line">
						<div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">WAIT MANAGE</div>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">식당 상황 알리기</a>
							<a class="dropdown-item" href="#">대기자 호출</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- end middle menu-->
</c:if>
</c:choose>
<%@ include file="../Fragment/inc/carousel.jsp" %>
<%@ include file="../Fragment/inc/footer.jsp"%>
</body>
<script type="text/javascript" src="/resource/js/common.js"></script>
</html>