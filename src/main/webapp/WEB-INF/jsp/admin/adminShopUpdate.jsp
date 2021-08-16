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
							<a class="dropdown-item" href="/admin/adminShopUpdate">수정관리</a>
							<a class="dropdown-item" href="/admin/adminShopDrop">삭제관리</a>
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
<div class="container adminShopAccept">
<table>
	<tr>
		<th>번호</th>
		<th>가게번호</th>
		<th>가게명</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>사장번호</th>
		<th>사이트</th>
		<th>분류</th>
		<th>좌석수</th>
		<th>등록일</th>
		<th>선택</th>
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
			<th>${dto.shopCategory}</th>
			<th>${dto.shopSeat}</th>
			<th>${dto.registerDate}</th>
			<th><input type="checkbox" id="shopNo">${dto.shopNo}</th>
		</tr>
	</c:forEach>
</table>

<input type="submit" value="승인" id="btn"/>
<input type="reset" value="취소" id="btn" />
</div>
<%@ include file="../Fragment/inc/footer.jsp"%>
</body>
</html>