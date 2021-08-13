<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 회원조회</title>
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">
<link type="text/css" rel="stylesheet" href="/resource/css/adminPage.css">

</head>
<body>
<%@ include file="../Fragment/inc/topBefore.jsp" %>
<!-- start middle menu-->
	<div class="container admin">
		<div class="row middleMenu">
			<div class="row col-12">
				<div class="row col-8 tab_bar">
					<div class="col-6" onclick="go_manage();">SHOP MANAGE</div>
					<div class="col-6 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MEMBER MANAGE</div>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/admin/adminMemberList">LIST</a>
						<a class="dropdown-item" href="#">DROP</a>
						
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- end middle menu-->
<div class="container adminMemberList">
<h4>Member List</h4>
<table>
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>이메일</th>
		<th>비밀번호</th>
		<th>휴대폰</th>
		<th>가입일</th>
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
			<th>${dto.name}</th>
			<th>${dto.email}</th>
			<th>${fn:substring(dto.password, 0, 2)}<c:forEach begin="2" end="${fn:length(dto.password)}" step="1">*</c:forEach> 
			</th>
			<th>${dto.mobile}</th>
			<th>${dto.entryDate}</th>
		</tr>
	</c:forEach>
</table>

</div>
<%@ include file="../Fragment/inc/footer.jsp"%>
</body>
</html>